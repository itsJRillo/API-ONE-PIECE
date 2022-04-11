from fastapi import FastAPI, Path, Request, UploadFile, File, Form
from pydantic import BaseModel
from fastapi.templating import Jinja2Templates
from fastapi.responses import HTMLResponse
import os
import pymysql

template = Jinja2Templates(directory="HTML")

# ------------------------------------ BBDD  ------------------------------------

conn = pymysql.connect(
    host="localhost",
    user="root",
    password="Admin123-",
    db="ONE_PIECE")

def getWeapons():
    dictG = {}
    dictW = {}
    
    cursor = conn.cursor()
    cursor.execute("select * from weapons;")
    weapon = cursor.fetchall()
    
    for i in weapon:
        id = i[0]
        name = i[1]
        strength = i[2]
        speed = i[3]
        two_hand = i[4]
        
        dictW = {id: {"name":name,"strength":strength,"speed":speed,"two_hand":two_hand}}
        dictG.update(dictW)
        
    return dictG
def getCategories():
    dict = {}
    
    cursor = conn.cursor()
    cursor.execute("select * from categorys")
    cate = cursor.fetchall()
    
    for i in cate:
        id = i[0]
        name = i[1]
        dict[id] = name
        
    return dict

dictWeapons = getWeapons()
dictCategories = getCategories()

def getCharacters():
    dictG = {}
    dictW = {}
    
    cursor = conn.cursor()
    cursor.execute("select * from characters;")
    characters = cursor.fetchall()
    
    for i in characters:
        id = i[0]
        name = i[1]
        category = dictCategories[i[2]]
        weapon = dictWeapons[i[3]]['name']
        strength = i[4]
        speed = i[5]
        experience = i[6]
        
        dictW = {
            id: {
                "name":name,
                "category":category,
                "weapon":weapon,
                "strength":strength,
                "speed":speed,
                "experience":experience}
            }
        
        dictG.update(dictW)
        
    return dictG
        
dictChar = getCharacters()

def requestChar():
    dict = {}
    
    for i in dictChar.keys():
        dict[dictChar[i]['name'].lower()] = dictChar[i]
        
    return dict

# ------------------------------------ FastAPI  ------------------------------------

app = FastAPI()

@app.get("/home")
def home(request: Request):
    return template.TemplateResponse("index.htm",{"request":request})

@app.get("/characters")
def home(request: Request):
    return template.TemplateResponse("characters.htm",{"request":request,"rqChar":requestChar()})

@app.get("/modifications")
def home(request: Request):
    return template.TemplateResponse("modifications.htm",{"request":request})

@app.get("/characters/{character_id}", response_class=HTMLResponse)
def get_character(*,character_id: int,request: Request):
    return template.TemplateResponse("characters.htm",{"request":request,
    "username":dictChar[character_id]['name'],
    "category":dictChar[character_id]['category'],
    "weapon":dictChar[character_id]['weapon'],
    "strength":dictChar[character_id]['strength'],
    "speed":dictChar[character_id]['speed']
    })

@app.post("/modifications")
async def handleForm(*,nom: str = Form(...), afiliation: str = Form(...), weapon: str = Form(...), strength: int = Form(...), speed: int = Form(...), request: Request):
    
    for i in dictWeapons:
        if dictWeapons[i]['name'] == weapon:
            weapon = i

            
    for i,j in dictCategories.items():
        if j == afiliation:
            afiliation = i
            
    query = f"insert into characters (NAME,CATEGORY,WEAPONS,STRENGTH,SPEED,EXPERIENCE) values ('{nom}','{afiliation}','{weapon}','{strength}','{speed}',0)"
    cursor = conn.cursor()
    cursor.execute(query)
    conn.commit();
    
    return template.TemplateResponse("modifications.htm",{"request":request})

@app.get("/get-character/{character_id}")
def get_character(character_id: int = Path(None, description="The ID of the character you want to view",gt=0,lt=16)):
    return dictChar[character_id]


@app.delete("/delete_character/{character_id}")
def delete_character(character_id: int):
    
    if character_id not in dictChar:
        return {"Error":"Student doesn't exists"}
    
    # Lo elimina del diccionario
    del dictChar[character_id]
    
    # Lo elimina de la BBDD
    deleteCharacter(character_id)
    
    return {"Message":"Character deleted succesfully"}

def deleteCharacter(id: int):
    cursor = conn.cursor()
    cursor.execute("SET FOREIGN_KEY_CHECKS=0;")
    cursor.execute(f"delete from characters where ID_CHARACTER = {id}")
    cursor.execute("SET FOREIGN_KEY_CHECKS=1;")
    conn.commit();
    

