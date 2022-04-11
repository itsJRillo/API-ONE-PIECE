/* CATEGORIES */
insert into categorys(NAME) values('Straw Hat');
insert into categorys(NAME) values('Pirates Buggy');
insert into categorys(NAME) values('Pirates Rocks');
insert into categorys(NAME) values('Admiral');
insert into categorys(NAME) values('ViceAdmiral');
insert into categorys(NAME) values('Lieutenant');

/* WEAPONS */
insert into weapons(NAME,STRENGTH,SPEED,TWO_HAND) values('Sword',3,5,false);
insert into weapons(NAME,STRENGTH,SPEED,TWO_HAND) values('Greatsword',5,3,true);
insert into weapons(NAME,STRENGTH,SPEED,TWO_HAND) values('Gun',2,6,false);
insert into weapons(NAME,STRENGTH,SPEED,TWO_HAND) values('Rifle',3,4,true);
insert into weapons(NAME,STRENGTH,SPEED,TWO_HAND) values('Chuchi',4,4,true);

/* CHARACTERS */
insert into characters(NAME,CATEGORY,WEAPONS,STRENGTH,SPEED,EXPERIENCE) 
values('Luffy',1,1,6,7,0);

insert into characters(NAME,CATEGORY,WEAPONS,STRENGTH,SPEED,EXPERIENCE) 
values('Zoro',1,4,5,6,0);

insert into characters(NAME,CATEGORY,WEAPONS,STRENGTH,SPEED,EXPERIENCE) 
values('Sanji',1,3,4,6,0);

insert into characters(NAME,CATEGORY,WEAPONS,STRENGTH,SPEED,EXPERIENCE) 
values('Tashigi',6,3,4,4,0);

insert into characters(NAME,CATEGORY,WEAPONS,STRENGTH,SPEED,EXPERIENCE) 
values('Buggy',2,5,3,2,0);

insert into characters(NAME,CATEGORY,WEAPONS,STRENGTH,SPEED,EXPERIENCE) 
values('Mr3',2,5,3,2,0);

insert into characters(NAME,CATEGORY,WEAPONS,STRENGTH,SPEED,EXPERIENCE) 
values('Xebec',3,3,6,5,0);

insert into characters(NAME,CATEGORY,WEAPONS,STRENGTH,SPEED,EXPERIENCE) 
values('Kaido',3,4,8,3,0);

insert into characters(NAME,CATEGORY,WEAPONS,STRENGTH,SPEED,EXPERIENCE) 
values('Big Mom',3,5,7,1,0);

insert into characters(NAME,CATEGORY,WEAPONS,STRENGTH,SPEED,EXPERIENCE) 
values('Akainu',4,2,6,4,0);

insert into characters(NAME,CATEGORY,WEAPONS,STRENGTH,SPEED,EXPERIENCE) 
values('Kizaru',4,3,5,8,0);

insert into characters(NAME,CATEGORY,WEAPONS,STRENGTH,SPEED,EXPERIENCE) 
values('Fujitora',4,5,5,4,0);

insert into characters(NAME,CATEGORY,WEAPONS,STRENGTH,SPEED,EXPERIENCE) 
values('Garp',5,2,6,3,0);

insert into characters(NAME,CATEGORY,WEAPONS,STRENGTH,SPEED,EXPERIENCE) 
values('Smoker',5,5,5,5,0);

insert into characters(NAME,CATEGORY,WEAPONS,STRENGTH,SPEED,EXPERIENCE) 
values('Koby',6,4,3,4,0);

/* CREWS */
insert into crews(NAME,MEMBERS) values('Straw Hat',9);
insert into crews(NAME,MEMBERS) values('Straw Hat',7);

insert into crews(NAME,MEMBERS) values('Pirates Buggy',1);
insert into crews(NAME,MEMBERS) values('Pirates Buggy',3);
insert into crews(NAME,MEMBERS) values('Pirates Buggy',6);

insert into crews(NAME,MEMBERS) values('Pirates Rocks',2);
insert into crews(NAME,MEMBERS) values('Pirates Buggy',5);
insert into crews(NAME,MEMBERS) values('Pirates Rocks',8);


/* RANKS */
insert into ranks(NAME,MEMBERS) values('Lieutenant',15);
insert into ranks(NAME,MEMBERS) values('Lieutenant',4);

insert into ranks(NAME,MEMBERS) values('ViceAdmiral',13);
insert into ranks(NAME,MEMBERS) values('ViceAdmiral',14);

insert into ranks(NAME,MEMBERS) values('Admiral',10);
insert into ranks(NAME,MEMBERS) values('Admiral',11);
insert into ranks(NAME,MEMBERS) values('Admiral',12);


