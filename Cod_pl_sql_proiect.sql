Exectiul 4:
Implementați în Oracle diagrama conceptuală realizată: definiți toate tabelele, implementând toate
constrângerile de integritate necesare (chei primare, cheile externe etc).


create table ECHIPA (
  echipa_id number(4) constraint pk_echipa_id   primary key, 
  denumire varchar2(30) constraint null_nume    not null, 
  an_infiintare date default sysdate constraint null_an not null
    );
    
create table TIP_MECI(
    tip_meci_id number(4) constraint pk_tip_meci_id primary key,
    tip_meci varchar2(30) constraint null_tip_meci not null
    );
    
create table TARA(
    tara_id NUMBER(4) constraint pk_tara primary key,
    denumire varchar2(20) constraint null_denumire not null
    );
    
create table LOCATIE(
    locatie_id number(4) constraint pk_locatie_id primary key,
    strada varchar2(40),
    oras varchar2(20),
    tara_id number(4),
    constraint fk_tara_id foreign key(tara_id) references TARA(tara_id)
    );
    
create table MECI(
    meci_id number(4) constraint pk_meci_id primary key,
    echipa_adversa varchar2(30) constraint null_echipa_adversa not null,
    data_joc date default sysdate constraint null_data_joc not null,
    scor varchar2(10) constraint null_scor not null,
    echipa_id number(4),
    tip_meci_id number(4),
    locatie_id number(4),
    constraint fk_echipa_id foreign key(echipa_id) references ECHIPA(echipa_id),
    constraint fk_tip_meci_id foreign key(tip_meci_id) references TIP_MECI(tip_meci_id),
    constraint fk_locatie_id foreign key(locatie_id) references LOCATIE(locatie_id)
    );

create table JUCATOR(
    jucator_id number(4) constraint pk_jucator_id primary key,
    echipa_id number(4),
    nume varchar2(30) constraint null_num not null,
    prenume varchar2(30) constraint null_prenume not null,
    telefon varchar2(11) constraint null_telefon not null,
    varsta number(2) constraint null_varsta not null,
    post_ocupat varchar2(20),
    salariu number(8,2) constraint null_salariu not null,
    mail varchar2(20),
    constraint unq_telefon unique(telefon),
    constraint unq_mail unique(mail),
    constraint fk_echipa_id_jucator foreign key(echipa_id) references ECHIPA(echipa_id)
    );
    
create table STAFF(
    staff_id number(4) constraint pk_staff_id primary key,
    nume varchar2(30) constraint null_nume_staff not null,
    prenume varchar2(30) constraint null_prenume_staff not null,
    varsat number(2) constraint null_varsta_staff not null,
    telefon varchar2(11) constraint null_telefon_staff not null,
    email varchar2(30),
    salariu number(8,2),
    constraint unq_telefon_staff unique(telefon),
    constraint unq_email unique(email)
    );
    
create TABLE ANTRENAMENT(
    antrenement_id number(4) constraint pk_antrenemant_id primary key,
    jucator_id number(4),
    staff_id number(4),
    zi varchar2(30) constraint null_zi not null,
    ora_inceput varchar2(15) constraint null_ora_inceput not null,
    ora_sfarsit varchar2(15),
    data_antrenament date default sysdate constraint null_data_antrenament not null,
    constraint fk_jucator_id foreign key(jucator_id) references JUCATOR(jucator_id),
    constraint fk_staff_id foreign key(staff_id) references STAFF(staff_id)
    );
    
create table SPONSOR (
    sponsor_id number(4) constraint pk_sponsor_id primary key,
    denumire varchar2(30)
    );
    
create table CONTRACT (
    contract_id number(4) constraint pk_contract_id primary key,
    echipa_id number(4),
    sponsor_id number(4),
    nume_contract varchar2(30) constraint null_nume_contract not null,
    data_inceput date default sysdate constraint null_data_inceput_contract not null,
    data_expirare date default sysdate constraint null_data_expirare_contract not null,
    valoare number(8,2),
    constraint fk_echipa_id_contract foreign key(echipa_id) references ECHIPA(echipa_id),
    constraint fk_sponsor_id_contract foreign key(sponsor_id) references SPONSOR(sponsor_id)
    );




Exercitiul 5: 
Adăugați informații coerente în tabelele create (minim 5 înregistrări pentru fiecare entitate
independentă; minim 10 înregistrări pentru tabela asociativă). 



	ECHIPA :

	insert into ECHIPA
	values (1 ,'Manchester United', to_date('01-05-1878', 'dd-mm-yyyy'));

	insert into echipa
	values (2, 'Manchester United U23',to_date('23-07-1975', 'dd-mm-yyyy'));

	insert into echipa
	values(3,'Manchester United U18', to_date('21-09-1890', 'dd-mm-yyyy'));

	insert into echipa
	values(4,'Manchester United U17', to_date('01-07-1891', 'dd-mm-yyyy'));

	insert into echipa
	values(5,'Manchester United Women', to_date('08-03-2000', 'dd-mm-yyyy'));




	TIP_MECI:

	insert into tip_meci
	values(1,'Premier League');

	insert into tip_meci
	values(2,'FA CUP');

	insert into tip_meci
	values(3,'League Cup');

	insert into tip_meci
	values(4,'Champions League');

	insert into tip_meci
	values(5,'Super Cup');


	

	--TARA:

	insert into tara
	values(1,'UK');

	insert into tara
	values(2,'Spania');

	insert into tara
	values(3,'Germania');

	insert into tara
	values(4,'Turcia');

	insert into tara
	values(5,'Franta');




	LOCATIE:

	insert into locatie
	values(1,'Old Trafford','Manchester',1);

	insert into locatie
	values(2,'Anfield','Liverpool',1);

	insert into locatie
	values(3,'Emirates','Londra',1);

	insert into locatie
	values(4,'Wembley','Londra',1);

	insert into locatie
	values(5,'Camp Nou','Barcelona',2);

	insert into locatie
	values(6,'Allianz','Dortmund',3);

	insert into locatie
	values(7,'Basakesir','Istanbul',4);

	insert into locatie
	values(8,'Parc des Princes','Paris',5);

	



	MECI:

	insert into meci
	values(1, 'Spurs', to_date('30-07-2020', 'dd-mm-yyyy'), '5-1', 1, 1, 1);

	insert into meci
	values(2, 'Liverpool', to_date('09-08-2020', 'dd-mm-yyyy'), '2-2', 1, 1, 2);

	insert into meci
	values(3, 'Manchester City', to_date('16-08-2020', 'dd-mm-yyyy'), '0-3', 1, 2, 1);

	insert into meci
	values(4, 'New Castle', to_date('20-08-2020', 'dd-mm-yyyy'), '1-0', 1, 3, 4);

	insert into meci
	values(5, 'Barcelona', to_date('15-09-2020', 'dd-mm-yyyy'), '2-1', 1, 4, 5);

	insert into meci
	values(6, 'Bayern Munchen', to_date('29-09-2020', 'dd-mm-yyyy'), '0-2', 1, 4, 6);

	insert into meci
	values(7, 'BB Istambul', to_date('13-10-2020', 'dd-mm-yyyy'), '5-0', 1, 4, 7);

	insert into meci
	values(8, 'PSG', to_date('27-10-2020', 'dd-mm-yyyy'), '1-1', 1, 4, 8);

	insert into meci
	values(9, 'Arsenal', to_date('20-09-2020', 'dd-mm-yyyy'), '1-0', 1, 5, 1);

	insert into meci
	values(10, 'West Ham United', to_date('27-09-2020', 'dd-mm-yyyy'), '2-1', 1, 2, 1);


	


	JUCATOR:

	insert into jucator
	values(10,1,'de Gea','David','077394109',30,'GK',15000,'davd_gea@yahoo.com');

	insert into jucator
	values(11,1,'Henderson','Dean','0743983487',24,'GK',6000,'dean_hend@yahoo.com');

	insert into jucator
	values(12,1,'Maguire','Harry','0773942009',28,'fundas',12000,'harry5@yahoo.com');

	insert into jucator
	values(13,1,'Lindelof','Victor','077394100',26,'fundas',7500,'victorlind@yahoo.com');

	insert into jucator
	values(14,1,'Pogba','Paul','0773941234',28,'mijlocas',16000,'paullabile@yahoo.com');

	insert into jucator
	values(15,1,'Fernandes','Bruno','077394209',24,'mijlocas',3000,'brunof@yahoo.com');

	insert into jucator
	values(16,1,'Rashford','Marcus','072394109',24,'atacant',14000,'marcusrsh@yahoo.com');

	insert into jucator
	values(17,1,'Cavani','Edison','073394109',35,'atacant',14000,'cavani09@yahoo.com');

	insert into jucator
	values(18,1,'Martial','Anthony','0747234109',23,'atacant',3000,'martialath@yahoo.com');

	insert into jucator 
	values(20,1,'Greenwood','Mason','072456330',33,null,9000,'greenmason@yahoo.com');

	insert into jucator 
	values(22,1,'McTominay','Scott','0724783343',22,null,9000,null);




	

	STAFF:

	insert into staff
	values(1,'Neubert','Thomas', 53, '0778453692',null,9000);

	insert into staff
	values(2,'Davis','Michael', 47, '0778453609','davidmih@yahoo.com',7000);

	insert into staff
	values(3,'Blank','Leurant', 60, '0748453692','Blank_united@yahoo.com',10000);

	insert into staff
	values(4,'Rodriguez','James', 39, '0778345692','jamesrodri@yahoo.com',7800);

	insert into staff
	values(5,’Velasquez’, ’Francois’, 42, '0778453690',null,8000);





	ANTRENAMENT:

	insert into antrenament
	values(1,10,1,'antrenment fizic','09:00','11:00',to_date('29-09-2020', 'dd-mm-yyyy'));

	insert into antrenament
	values(2,11,1,'antrenment fizic','09:00','11:00',to_date('29-09-2020', 'dd-mm-yyyy'));

	insert into antrenament
	values(3,12,1,'antrenment fizic','09:00','11:00',to_date('29-09-2020', 'dd-mm-yyyy'));

	insert into antrenament
	values(4,13,2,'antrenament rezistenta','14:00','15:30',to_date('29-09-2020', 'dd-mm-yyyy'));

	insert into antrenament
	values(5,14,2,'antrenment fizic','14:00','15:30',to_date('01-10-2020', 'dd-mm-yyyy'));

	insert into antrenament
	values(6,15,3,'fizicul cu mingea','18:00','20:00',to_date('02-10-2020', 'dd-mm-yyyy'));

	insert into antrenament
	values(7,16,3,'fizicul cu mingea','18:00','20:00',to_date('03-10-2020', 'dd-mm-yyyy'));

	insert into antrenament
	values(8,17,4,'coordonare si finalizare','18:00','20:00',to_date('04-10-2020', 'dd-mm-yyyy'));

	insert into antrenament
	values(9,18,4,'coordonare si finalizare','18:00','20:00',to_date('04-10-2020', 'dd-mm-yyyy'));

	insert into antrenament
	values(10,10,5,'recuperare','15:00','16:00',to_date('05-10-2020', 'dd-mm-yyyy'));

	insert into antrenament
	values(11,11,5,'recuperare','15:00','16:00',to_date('05-10-2020', 'dd-mm-yyyy'));


	insert into antrenament
	values(12,12,5,'recuperare','15:00','16:00',to_date('05-10-2020', 'dd-mm-yyyy'));


	insert into antrenament
	values(13,13,5,'recuperare','15:00','16:00',to_date('05-10-2020', 'dd-mm-yyyy'));


	insert into antrenament
	values(14,14,5,'recuperare','15:00','16:00',to_date('05-10-2020', 'dd-mm-yyyy'));


	insert into antrenament
	values(15,15,5,'recuperare','15:00','16:00',to_date('05-10-2020', 'dd-mm-yyyy'));


	insert into antrenament
	values(16,16,5,'recuperare','15:00','16:00',to_date('05-10-2020', 'dd-mm-yyyy'));


	insert into antrenament
	values(17,17,5,'recuperare','15:00','16:00',to_date('05-10-2020', 'dd-mm-yyyy'));


	insert into antrenament
	values(18,18,5,'recuperare','15:00','16:00',to_date('05-10-2020', 'dd-mm-yyyy'));


	



	SPONSOR:

	insert into sponsor
	values (1,'Chevrolet');

	insert into sponsor
	values (2,'Adidas');

	insert into sponsor
	values (3,'SportingBet');

	insert into sponsor
	values (4,'AON');

	insert into sponsor
	values (5,'Canon');





	CONTRACT:
	insert into contract
	values(1,1,1,'Principal Partner of ManUnited',to_date('14-05-2014', 'dd-mm-yyyy'),to_date('14-05-2025', 'dd-mm-yyyy'),500000);

	insert into contract
	values(2,1,2,'Official Carrier of ManUnited',to_date('14-05-2019', 'dd-mm-yyyy'),to_date('14-05-2022', 'dd-mm-yyyy'),300000);

	insert into contract
	values(4,1,2,'Official Kit Supplier',to_date('09-04-2015', 'dd-mm-yyyy'),to_date('18-05-2024', 'dd-mm-yyyy'),500000);

	insert into contract
	values(5,1,3,'Official Tyre Partner',to_date('23-09-2018', 'dd-mm-yyyy'),to_date('20-10-2021', 'dd-mm-yyyy'),650000);

	insert into contract
	values(6,1,4,'Principal Partner',to_date('10-12-2013', 'dd-mm-yyyy'),to_date('04-11-2022', 'dd-mm-yyyy'),650000);

	insert into contract
	values(7,1,5,'Official MedicalSystem Partner',to_date('02-01-2017', 'dd-mm-yyyy'),to_date('24-12-2021', 'dd-mm-yyyy'),240000);

	insert into contract
	values(8,1,4,'Official Logistics Partner',to_date('06-06-2019', 'dd-mm-yyyy'),to_date('14-10-2026', 'dd-mm-yyyy'),500000);

	insert into contract
	values(9,1,1,'Official Sport Car Partner',to_date('06-06-2015', 'dd-mm-yyyy'),to_date('14-10-2024', 'dd-mm-yyyy'),650000);

	insert into contract
	values(10,1,5,'Official Spirits Partner',to_date('06-08-2020', 'dd-mm-yyyy'),to_date('14-06-2022', 'dd-mm-yyyy'),150000);



Exercitiul 6:
Formulați în limbaj natural o problemă pe care să o rezolvați folosind un subprogram stocat care să utilizeze două
tipuri de colecție studiate. Apelați subprogramul. 

Creez un subprogram stocat care sa retina in doua tipuri de colectii diferite salariul jucatorilor care sunt
atacanti si numele lor. Afisez cu ajutorul colectiilor, numele si salariul atacantilor cu majorare de 15%.




create or replace procedure ex6
IS

    type tablou_indexat is table of jucator.salariu%type index by pls_integer;
    t_salarii tablou_indexat;--salariu atacant
    
    type tablou_imbricat is table of jucator.nume%type;
    t_nume tablou_imbricat;--nume atacant

begin

    select salariu
    bulk collect into t_salarii
    from jucator
    where post_ocupat = 'atacant';
    
    
    select (nume || ' ' || prenume) as nume_jucator
    bulk collect into t_nume
    from jucator
    where post_ocupat = 'atacant';
    
    dbms_output.put_line('Salariu atacantilor : ');
    for i in t_salarii.first..t_salarii.last loop
        dbms_output.put_line(t_nume(i) || ' : ' || (0.15*t_salarii(i) + t_salarii(i)));
    end loop;
end ex6;






Exercitul 7:
Formulați în limbaj natural o problemă pe care să o rezolvați folosind un subprogram stocat care să utilizeze un
tip de cursor studiat. Apelați subprogramul. 

Creem un subprogram stocat care sa contina un cursor ce realizeaza cresterea  valoarii contractule cu 50000 pentru
cele care expira dupa 2023 cu un sponsor, blocand liniile inainte de actualizare.


select nume_contract, data_expirare, valoare
from contract
where to_char(data_expirare, 'YYYY') >= '2023';

    
create or replace procedure ex7
is
    cursor c is
        select * 
        from contract
        where to_char(data_expirare, 'YYYY') >= '2023'
        for update of valoare nowait;
        
begin

    for i in c loop
        update contract
        set valoare = valoare + 50000
        where current of c;
    end loop;

end ex7;
/


begin
    ex7;
END;

select nume_contract, data_expirare, valoare
from contract
where to_char(data_expirare, 'YYYY') >= '2023';

rollback;











Exercitul 8:
Formulați în limbaj natural o problemă pe care să o rezolvați folosind un subprogram stocat de tip funcție care să
utilizeze într-o singură comandă SQL 3 dintre tabelele definite. Tratați toate excepțiile care pot apărea. Apelați
subprogramul astfel încât să evidențiați toate cazurile tratate. 

O functie care returneaza cati fundasi si mijlocasi participa la antrenamentele unui anumit membru din staff ale
carui nume si prenume sunt date ca parametrii. (Erorile pot aparea in cazul in care este dat ca parametru o persoana
care nu exista in baza de date a staff-ului sau daca se introduc datele unui membru din staff la care nu participa
nici un jucator).




create or replace function totalFundasiMijlocasi
    (s_nume staff.nume%type, s_prenume staff.prenume%type)
return number IS
    nr number(2) := 0;
    type tablou_indexat is table of jucator.nume%type index by pls_integer;
    t tablou_indexat;
    
begin
    
    select j.nume Nume_Jucator
    bulk collect into t
    from antrenament a, staff s, jucator j
    where j.jucator_id = a.jucator_id
    and s.staff_id = a.staff_id
    and s.nume = s_nume and s.prenume = s_prenume
    and j.post_ocupat in ('fundas', 'mijlocas'); 
    
    nr := t.count;
    
    if nr = 0 then
        raise_application_error(-20001, 'Aceasta persoana nu face parte din membrii stafului sau nu exista jucatori przenti la antrenamentul acestui membru din staff');
    else 
        return nr;
        
    end if;
end totalFundasiMijlocasi;

begin
    dbms_output.put_line(totalFundasiMijlocasi('Neuber', 'Thoma'));
end;







Exerctiul 9:
Formulați în limbaj natural o problemă pe care să o rezolvați folosind un subprogram stocat de tip procedură care
să utilizeze într-o singură comandă SQL 5 dintre tabelele definite. Tratați toate excepțiile care pot apărea,
incluzând excepțiile NO_DATA_FOUND și TOO_MANY_ROWS. Apelați subprogramul astfel încât să evidențiați toate cazurile
tratate. 

Sa se creeze o functie care primeste ca parametru o tara, si pentru echipa noastra cu numele de ‘Manchester United’
, sa se spuna echipa adversa cu care disputam meciul in tara respectiva si tipul de meci, daca sunt mai multe
meciuri cu aceeasi echipa dar in competitii diferite, se va afisa doar primul. Vom trata erorile urmatoare, cazul
in care se da o tara in care se disputa mai multe meciuri cu echipe diferite si daca se da o tara in care nu s-a
disputant nici un meci.




create or replace procedure tari
    (v_denumire_tara tara.denumire%type)
is

    type tablou_meci is table of tip_meci.tip_meci%type;--lista de tipuri de meciuri disputate cu echipa adversa
    v_tip_meci tablou_meci;
    
    echipa_unica_adversa meci.echipa_adversa%type;
    tip_meci_unic_disputat tip_meci.tip_meci%type;
    
begin
    --aflam echipa adversa cu care am jucat in tara data
    select m.echipa_adversa into echipa_unica_adversa
    from echipa e, meci m, locatie l, tara t
    where e.echipa_id = m.echipa_id
        and m.locatie_id = l.locatie_id
        and l.tara_id = t.tara_id
        and e.denumire = 'Manchester United'
        and t.denumire = v_denumire_tara;
            
    select t.tip_meci --into tip_meci_unic_disputat
    bulk collect into v_tip_meci
    from echipa e, meci m, tip_meci t
    where e.echipa_id = m.echipa_id
        and m.tip_meci_id = t.tip_meci_id
        and e.denumire = 'Manchester United'
        and m.echipa_adversa = echipa_unica_adversa;
        
    tip_meci_unic_disputat := v_tip_meci(v_tip_meci.first);     
    dbms_output.put_line(echipa_unica_adversa || ', ' || tip_meci_unic_disputat);
    
    exception
        when no_data_found then
            dbms_output.put_line('Nu exista meciuri disputate in aceasta tara');
        when too_many_rows then
            dbms_output.put_line('Exista multe meciuri disputate in aceasta tara');
end tari;

execute tari('UK');





Exercitul 10:
Definiți un trigger de tip LMD la nivel de comandă. Declanșați trigger-ul. 

Definim un declansator care sa permita actualizari asupra tabelului tip_meci tot timpul intre orele 07:00 – 23:00,
in afara de zilele de joi si duminica.



create or replace trigger trigger_ex10
    before insert or update or delete on tip_meci
begin
    if (to_char(sysdate, 'D') = 5 or to_char(sysdate, 'D') = 1 or to_char(sysdate, 'HH24') not between 7 and 23) then
    
        raise_application_error(-20009, 'tabelul nu poate fi modificat in aceasta perioada');
    end if;
end;

insert into tip_meci values(10,'PremierShip');




Exercitul 11:
Definiți un trigger de tip LMD la nivel de linie. Declanșați trigger-ul. 

Definim un declansator la nivel de linie prin care sa nu se permita cresterea salariului atacantilor cu mai mult de
10% si micsorarea salariului fundasiilor cu mai mult de 15%.




create or replace trigger trigger_ex11
    before update of salariu, post_ocupat on jucator
    for each row
begin
    
    if(:new.salariu > :old.salariu + 0.10 * :old.salariu and :old.post_ocupat = 'atacant') then
        raise_application_error(-20010, 'Salariul atacantilor nu poate fin crescut');
    elsif(:new.salariu - 0.15 * :new.salariu < :old.salariu and :old.post_ocupat = 'fundas') then
        raise_application_error(-20011, 'Salariul fundasilor nu poate fi micsorat');
    end if;
end;



Exercitul 12:
Definiți un trigger de tip LDD. Declanșați trigger-ul. 

Definim un declansator care sa introduca date in tabelul stuff dupa ce utilizatorul a folosit o comanda LDD.



create table stuff(
    stuff_id varchar2(30) ,
    nume varchar2(30) ,
    data_eveniment date ,
    eveniment varchar2(30)
);


create or replace trigger trigger_ex12
    after create or drop or alter on schema
begin
    insert into stuff values(sys.login_user, sys.database_name, sysdate, sys.sysevent);
end;


create table ceva as (select * from tip_meci);

select* from stuff;
drop table ceva;




Exercitul 13:
Definiți un pachet care să conțină toate obiectele definite în cadrul proiectului. 



create or replace package pack_ex13 as
    procedure ex6;
    procedure ex7;
    function totalFundasiMijlocasi (s_nume staff.nume%type, s_prenume staff.prenume%type)
        return number;
    procedure tari (v_denumire_tara tara.denumire%type);
end pack_ex13;



create or replace package body pack_ex13 as

    function totalFundasiMijlocasi (s_nume staff.nume%type, s_prenume staff.prenume%type)
        return number IS
        nr number(2) := 0;
        type tablou_indexat is table of jucator.nume%type index by pls_integer;
        t tablou_indexat;
    begin
    
        select j.nume Nume_Jucator
        bulk collect into t
        from antrenament a, staff s, jucator j
        where j.jucator_id = a.jucator_id
        and s.staff_id = a.staff_id
        and s.nume = s_nume and s.prenume = s_prenume
        and j.post_ocupat in ('fundas', 'mijlocas'); 
    
        nr := t.count;
    
        if nr = 0 then
            raise_application_error(-20001, 'Aceasta persoana nu face parte din membrii stafului sau nu exista jucatori przenti la antrenamentul acestui membru din staff');
        else 
            return nr;
        end if;

    end totalFundasiMijlocasi;
    
    
    procedure ex6 IS
        type tablou_indexat is table of jucator.salariu%type index by pls_integer;
        t_salarii tablou_indexat;--salariu atacant
        type tablou_imbricat is table of jucator.nume%type;
        t_nume tablou_imbricat;--nume atacant

    begin
        select salariu
        bulk collect into t_salarii
        from jucator
        where post_ocupat = 'atacant';
    
    
        select (nume || ' ' || prenume) as nume_jucator
        bulk collect into t_nume
        from jucator
        where post_ocupat = 'atacant';
    
        dbms_output.put_line('Salariu atacantilor : ');
        for i in t_salarii.first..t_salarii.last loop
            dbms_output.put_line(t_nume(i) || ' : ' || (0.15*t_salarii(i) + t_salarii(i)));
        end loop;
    end ex6;

    
    procedure ex7 is
        cursor c is
            select * 
            from contract
            where to_char(data_expirare, 'YYYY') >= '2023'
            for update of valoare nowait;
    begin
        for i in c loop
            update contract
            set valoare = valoare + 50000
            where current of c;
        end loop;

    end ex7;
    

    procedure tari (v_denumire_tara tara.denumire%type) is

        type tablou_meci is table of tip_meci.tip_meci%type;--lista de tipuri de meciuri disputate cu echipa adversa
        v_tip_meci tablou_meci;
    
        echipa_unica_adversa meci.echipa_adversa%type;
        tip_meci_unic_disputat tip_meci.tip_meci%type;
    
    begin
        --aflam echipa adversa cu care am jucat in tara data
        select m.echipa_adversa into echipa_unica_adversa
        from echipa e, meci m, locatie l, tara t
        where e.echipa_id = m.echipa_id
            and m.locatie_id = l.locatie_id
            and l.tara_id = t.tara_id
            and e.denumire = 'Manchester United'
            and t.denumire = v_denumire_tara;
            
        select t.tip_meci --into tip_meci_unic_disputat
        bulk collect into v_tip_meci
        from echipa e, meci m, tip_meci t
        where e.echipa_id = m.echipa_id
            and m.tip_meci_id = t.tip_meci_id
            and e.denumire = 'Manchester United'
            and m.echipa_adversa = echipa_unica_adversa;
        
        tip_meci_unic_disputat := v_tip_meci(v_tip_meci.first);     
        dbms_output.put_line(echipa_unica_adversa || ', ' || tip_meci_unic_disputat);
    
        exception
            when no_data_found then
                dbms_output.put_line('Nu exista meciuri disputate in aceasta tara');
            when too_many_rows then
                dbms_output.put_line('Exista multe meciuri disputate in aceasta tara');
    end tari;

end pack_ex13;




begin
    pack_ex13.ex6;
end;

begin
    pack_ex13.ex7;
end;

begin
    pack_ex13.tari('Turcia');
end;

begin
    dbms_output.put_line(totalFundasiMijlocasi('Neubert', 'Thomas'));
end;




Exercitiul 14:
Definiți un pachet care să includă tipuri de date complexe și obiecte necesare unui flux de acțiuni integrate,
specifice bazei de date definite (minim 2 tipuri de date, minim 2 funcții, minim 2 proceduri). 

Functia nr_antrenam_jucator, primeste ca parametru un jucator_id si returneaza nr de antrenamente la care a
participat printr-un record care retine o variabila de tip number.

Functia lista_jucatori_by_tip_antrenam, primeste ca parametru un tip de antrenament si returneaza un tablou
imbricat de id-uri de jucatori care au participat la acest antrenament.

Procedura1 primeste ca parametru un tip de antrenament si apoi apeleaza functia lista_jucatori_by_tip_antrenam,
ca sa afle id-urile jucatorilor care participa la antrenament. Apoi apelam pentru fiecare jucator_id sa vedem la
cate antrenament participa acesta in total. Vom afisa si numarul total de antrenamente pentru fiecare serie.

Procedura2 apeleaza procedura1 pentru fiecare tip de antrenament cu ajutorul unui cursor




create or replace package ex14 as
    type nr_total_antr is record(nr_antr number(2));
    type v_jucatori_id is table of jucator.jucator_id%type;
    function nr_antrenam_jucator(id_j jucator.jucator_id%type) return nr_total_antr;
    function lista_jucatori_by_tip_antrenam(tip_antr antrenament.zi%type) return v_jucatori_id;
    procedure procedura1 (tip_antr antrenament.zi%type);
    procedure procedura2;
end ex14;





create or replace package body ex14 as 

    function nr_antrenam_jucator(id_j jucator.jucator_id%type) return nr_total_antr is 
            nta nr_total_antr;
        begin
            select distinct count(a.zi)
            into nta.nr_antr
            from jucator j, antrenament a
            where j.jucator_id = a.jucator_id
            and j.jucator_id = id_j;
            return nta;
            exception
                when no_data_found then
                    dbms_output.put_line('Jucatorul acesta nu exista sau nu a participat la nici un antrenament');            
    end nr_antrenam_jucator;
    
    function lista_jucatori_by_tip_antrenam(tip_antr antrenament.zi%type) return v_jucatori_id is
        v v_jucatori_id := v_jucatori_id();    
        begin
            select distinct j.jucator_id
            bulk collect into v
            from jucator j, antrenament a
            where j.jucator_id = a.jucator_id
            and a.zi = tip_antr;
            return v;
    end lista_jucatori_by_tip_antrenam;
    
    procedure procedura1 (tip_antr antrenament.zi%type) is
        nta nr_total_antr;
        v v_jucatori_id;
        nr number(2) := 0;
        begin
            v := lista_jucatori_by_tip_antrenam(tip_antr);
            for i in v.first..v.last loop
                nta := nr_antrenam_jucator(v(i));
                nr := nr + nta.nr_antr;
                dbms_output.put_line('Jucatorul cu id-ul ' || v(i) || ' a participat la ' || nta.nr_antr || ' antrenamente');
            end loop;
            dbms_output.put_line('Nr total de antrenamente de la care participa toti jucatorii la aceasta serie este de : ' || nr);
    end procedura1;
  
    procedure procedura2 is
    
        cursor c is
            select distinct zi z 
            from antrenament;
        begin
            for i in c loop
                procedura1(i.z);
            end loop;
    end procedura2;
end ex14;



begin
    ex14.procedura2; 
end;

























