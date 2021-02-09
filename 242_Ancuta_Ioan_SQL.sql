--4
DROP TABLE task;
DROP TABLE project;
DROP TABLE member;
DROP TABLE team;
DROP TABLE employee;
DROP TABLE company;




CREATE TABLE company (
    company_id  NUMBER,
    company_name VARCHAR(100) NOT NULL,
    owner_name VARCHAR(100) NOT NULL,
    owner_mail VARCHAR(100) NOT NULL,
    CONSTRAINT company_pk PRIMARY KEY(company_id)
    
    );
CREATE TABLE employee (
    employee_id  NUMBER,
    lName VARCHAR(100) NOT NULL ,
    fName VARCHAR(100) NOT NULL,
    mail VARCHAR(100) NOT NULL UNIQUE,
    salary NUMBER NOT NULL,
    company_id NUMBER NOT NULL,
    CONSTRAINT employee_pk PRIMARY KEY(employee_id),
    CONSTRAINT employee_company_fk FOREIGN KEY(company_id) REFERENCES company (company_id)
    ON DELETE CASCADE
    
);
CREATE TABLE team (
    team_id  NUMBER,
    leader_id NUMBER,
    team_name VARCHAR(100),
    CONSTRAINT team_pk PRIMARY KEY(team_id),
    CONSTRAINT team_employee_fk FOREIGN KEY(leader_id) REFERENCES employee (employee_id)
    ON DELETE SET NULL

);
CREATE TABLE member (
    member_id  NUMBER,
    employee_id NUMBER,
    team_id NUMBER,
    CONSTRAINT member_pk PRIMARY KEY(member_id),
    CONSTRAINT member_company_fk FOREIGN KEY(employee_id) REFERENCES employee (employee_id)
    ON DELETE CASCADE,
    CONSTRAINT member_team_fk FOREIGN KEY(team_id) REFERENCES team (team_id)
    ON DELETE CASCADE
    
);


CREATE TABLE project(
    project_id NUMBER,
    project_name VARCHAR(100) NOT NULL,
    project_start DATE NOT NULL,
    project_deadline DATE,
    team_id NUMBER,
    CONSTRAINT project_pk PRIMARY KEY (project_id),
    CONSTRAINT project_team_fk FOREIGN KEY(team_id) REFERENCES team (team_id)
    ON DELETE CASCADE
    );
CREATE TABLE task(
    task_id NUMBER,
    task_name VARCHAR(100) NOT NULL,
    task_deadline DATE,
    worker_id NUMBER,
    project_id NUMBER,
    CONSTRAINT task_pk PRIMARY KEY(task_id),
    CONSTRAINT task_project_fk FOREIGN KEY(project_id) REFERENCES project (project_id)
    ON DELETE CASCADE,
    CONSTRAINT project_employee_fk FOREIGN KEY(worker_id) REFERENCES employee (employee_id)
    ON DELETE SET NULL
    );
    
select * from company;
select * from employee;
select * from team;
select * from member;
select * from project;
select * from task;
/
--5
INSERT INTO company( company_id, company_name, owner_name, owner_mail) VALUES (1,'ALCATRA', 'Adrian Faptura', 'adrianfaketaxes@gmail.com');
INSERT INTO company( company_id, company_name, owner_name, owner_mail) VALUES (2,'GAZURO', 'Mugurel Murel', '123mugurelu@gmail.com');
INSERT INTO company( company_id, company_name, owner_name, owner_mail) VALUES (3,'BMWsmalld', 'Mircea Mistuitoru', 'gariantu@gmail.com');
INSERT INTO company( company_id, company_name, owner_name, owner_mail) VALUES (4,'LAGAR', 'Gogea Cliptukluu', 'larabatie@gmail.com');
INSERT INTO company( company_id, company_name, owner_name, owner_mail) VALUES (5,'COM', 'Andreea Ancuta', 'lbae@gmail.com');



INSERT INTO employee( employee_id, lName, fName, mail,salary, company_id) 
VALUES (1,'Marius','Ovidiu','marius@gmail',1200,1);

INSERT INTO employee( employee_id, lName, fName, mail,salary, company_id) 
VALUES (2,'Inglesia','Ovidiu','mipu@gmail',2400,1);

INSERT INTO employee( employee_id, lName, fName, mail,salary, company_id) 
VALUES (3,'Jumi','Daniel','dancila@gmail',13000,1);

INSERT INTO employee( employee_id, lName, fName, mail,salary, company_id) 
VALUES (4,'Samuel','Samule','sam@gmail',7300,2);

INSERT INTO employee( employee_id, lName, fName, mail,salary, company_id) 
VALUES (5,'Sami','Ovidiu','movid@gmail',2345,3);

INSERT INTO employee( employee_id, lName, fName, mail,salary, company_id) 
VALUES (6,'Gustavo','Olips','gusti@gmail',24344,2);

INSERT INTO employee( employee_id, lName, fName, mail,salary, company_id) 
VALUES (7,'Gabrie','Oles','olesie@gmail',2333,5);

INSERT INTO employee( employee_id, lName, fName, mail,salary, company_id) 
VALUES (8,'Maghere','Ovidiu','mag@gmail',5894,5);

INSERT INTO employee( employee_id, lName, fName, mail,salary, company_id) 
VALUES (9,'Lapita','Olimpia','fatatati@gmail',1230,4);

INSERT INTO employee( employee_id, lName, fName, mail,salary, company_id) 
VALUES (10,'Lapita','Garcea','baiatutati@gmail',980,3);

INSERT INTO employee( employee_id, lName, fName, mail,salary, company_id) 
VALUES (11,'Crinu','Olita','crini@gmail',5000,4);


INSERT INTO team(team_id,leader_id,team_name)
VALUES (101,11,'Exotica');
INSERT INTO team(team_id,leader_id,team_name)
VALUES (102,2,'Echias');
INSERT INTO team(team_id,leader_id,team_name)
VALUES (103,2,'Perenia');
INSERT INTO team(team_id,leader_id,team_name)
VALUES (104,8,'lagar');
INSERT INTO team(team_id,leader_id,team_name)
VALUES (111,5,'Extensia');
INSERT INTO team(team_id,leader_id,team_name)
VALUES (158,1,'Sublagar');
select * from member;


INSERT INTO member(member_id, employee_id, team_id) VALUES(1,11,101);
INSERT INTO member(member_id, employee_id, team_id) VALUES(2,2,102);
INSERT INTO member(member_id, employee_id, team_id) VALUES(16,2,103);
INSERT INTO member(member_id, employee_id, team_id) VALUES(17,8,104);

INSERT INTO member(member_id, employee_id, team_id) VALUES(3,8,104);
INSERT INTO member(member_id, employee_id, team_id) VALUES(4,5,111);
INSERT INTO member(member_id, employee_id, team_id) VALUES(5,1,158);

INSERT INTO member(member_id, employee_id, team_id) VALUES(6,2,101);
INSERT INTO member(member_id, employee_id, team_id) VALUES(7,11,102);
INSERT INTO member(member_id, employee_id, team_id) VALUES(8,1,104);
INSERT INTO member(member_id, employee_id, team_id) VALUES(9,7,111);
INSERT INTO member(member_id, employee_id, team_id) VALUES(10,5,158);

INSERT INTO member(member_id, employee_id, team_id) VALUES(11,4,101);
INSERT INTO member(member_id, employee_id, team_id) VALUES(12,10,102);
INSERT INTO member(member_id, employee_id, team_id) VALUES(13,3,104);
INSERT INTO member(member_id, employee_id, team_id) VALUES(14,6,111);
INSERT INTO member(member_id, employee_id, team_id) VALUES(15,10,158);

    
INSERT INTO project(project_id, project_name,project_start,project_deadline,team_id)
VALUES(1001, 'Cerberos',TO_DATE('2015-Jan-01','yy-mm-dd'),TO_DATE('2015-Apr-01','yy-mm-dd'),103);
INSERT INTO project(project_id, project_name,project_start,project_deadline,team_id)
VALUES(1023, 'Ignatius',TO_DATE('2016-Sep-01','yy-mm-dd'),TO_DATE('2023-Feb-01','yy-mm-dd'),101);
INSERT INTO project(project_id, project_name,project_start,project_deadline,team_id)
VALUES(1041, 'Xerxes',TO_DATE('2010-Dec-01','yy-mm-dd'),TO_DATE('2020-Jul-01','yy-mm-dd'),101);
INSERT INTO project(project_id, project_name,project_start,project_deadline,team_id)
VALUES(1301, 'Biggie',TO_DATE('2011-Nov-01','yy-mm-dd'),TO_DATE('2025-May-01','yy-mm-dd'),103);
INSERT INTO project(project_id, project_name,project_start,project_deadline,team_id)
VALUES(2001, 'Pikachu',TO_DATE('2013-Jun-01','yy-mm-dd'),TO_DATE('2015-Apr-03','yy-mm-dd'),102);

INSERT INTO task(task_id, task_name, task_deadline,worker_id,project_id)
VALUES(1322,'LOGIN',TO_DATE('2015-Mar-04','yy-mm-dd'),NULL,1001);

INSERT INTO task(task_id, task_name, task_deadline,worker_id,project_id)
VALUES(2232,'BackEndBugSolver',TO_DATE('2019-Mar-04','yy-mm-dd'),2,1041);


INSERT INTO task(task_id, task_name, task_deadline,worker_id,project_id)
VALUES(1002,'CurrencyProb',TO_DATE('2018-Apr-04','yy-mm-dd'),11,1041);

INSERT INTO task(task_id, task_name, task_deadline,worker_id,project_id)
VALUES(7952,'Mobile',TO_DATE('2015-Mar-04','yy-mm-dd'),4,1023);

INSERT INTO task(task_id, task_name, task_deadline,worker_id,project_id)
VALUES(8232,'DataLeak',TO_DATE('2015-Mar-04','yy-mm-dd'),2,1023);


INSERT INTO task(task_id, task_name, task_deadline,worker_id,project_id)
VALUES(9322,'shopingcartproblem',TO_DATE('2017-Mar-04','yy-mm-dd'),4,1023);

INSERT INTO task(task_id, task_name, task_deadline,worker_id,project_id)
VALUES(3322,'backdoorhack',TO_DATE('2015-Feb-04','yy-mm-dd'),null,1001);


INSERT INTO task(task_id, task_name, task_deadline,worker_id,project_id)
VALUES(9999,'login issues',TO_DATE('2014-Mar-04','yy-mm-dd'),10,2001);

INSERT INTO task(task_id, task_name, task_deadline,worker_id,project_id)
VALUES(1000,'edit',TO_DATE('2012-Mar-04','yy-mm-dd'),NULL,1301);
/
--6
CREATE OR REPLACE FUNCTION EXE6_ANC
	(nume_companie company.company_name%TYPE DEFAULT 'COM')
    RETURN NUMBER IS
		TYPE tab_id IS TABLE OF employee.employee_id%TYPE;
		TYPE tab_lName IS TABLE OF employee.lName%TYPE;
		TYPE tab_fName IS TABLE OF employee.fName%TYPE;
		TYPE tab_salary IS TABLE OF employee.salary%TYPE;
		t_id tab_id;
		t_lName tab_lName;
		t_fName tab_fName;
		t_salary tab_salary;
		total NUMBER:=0;
		CURSOR c IS
			SELECT employee_id,lName,fName,salary
			from employee
			where company_id IN (select company_id
								from company
								where company_name=nume_companie);
BEGIN
	OPEN c;
	FETCH c  BULK COLLECT INTO t_id, t_lName, t_fName,t_salary;
	CLOSE c;
	DBMS_OUTPUT.PUT_LINE('In cadrul ' || nume_companie || ' aveti angajatii : ');
	DBMS_OUTPUT.PUT_LINE('====================================================');
	FOR i in t_id.FIRST..t_id.LAST LOOP
		DBMS_OUTPUT.PUT_LINE('Angajatul :' || t_lName(i) || ' ' || t_fName(i));
        DBMS_OUTPUT.PUT_LINE('Salariu :' || t_salary(i));
        IF (i<t_id.LAST) THEN DBMS_OUTPUT.PUT_LINE('------------------------------------------------');
        END IF;
	total:=total+t_salary(i);
	END LOOP;
    DBMS_OUTPUT.PUT_LINE('====================================================');
	DBMS_OUTPUT.PUT_LINE('Total de plata pe luna : ' || total);
RETURN 0;
END EXE6_ANC;
/
--7
CREATE OR REPLACE FUNCTION EXE7_ANC
    RETURN NUMBER IS
		v_nr number(4);
        v_nume company.company_name%TYPE;
		CURSOR c IS
            SELECT c.company_name, (select count(*)
                                from employee e
                                where e.company_id=c.company_id)
            from company c;
            
BEGIN
	OPEN c;
    LOOP 
        FETCH c INTO v_nume,v_nr;
        EXIT WHEN C%NOTFOUND;
        IF v_nr=0 THEN 
        DBMS_OUTPUT.PUT_LINE('In cadrul companiei ' || v_nume || ' nu avem angajati');
        ELSIF V_nr=1 THEN
                    DBMS_OUTPUT.PUT_LINE('In cadrul companiei ' || v_nume || ' avem un angajat');
        ELSE
              DBMS_OUTPUT.PUT_LINE('In cadrul companiei ' || v_nume || ' avem ' || v_nr || ' angajati');

    
        END IF;
     END LOOP;
    
	CLOSE c;
RETURN 0;
END EXE7_ANC;
/
BEGIN
DBMS_OUTPUT.PUT_LINE(EXE7_ANC);
END;
/
--8
CREATE OR REPLACE FUNCTION EXE8_ANC
	(teamname team.team_name%TYPE DEFAULT 'Exotica')
    RETURN NUMBER IS
		TYPE tab_id IS TABLE OF task.task_id%TYPE;
		TYPE tab_task_name IS TABLE OF task.task_name%TYPE;
		TYPE tab_task_deadline IS TABLE OF task.task_deadline%TYPE;
		TYPE tab_worker IS TABLE OF task.worker_id%TYPE;
		TYPE tab_project_id IS TABLE OF task.project_id%TYPE;
        tNamet VARCHAR(200);
        teid NUMBER;
        is_found_rec boolean := false;    
        exception_name1 exception;
		t_id tab_id;
		t_name tab_task_name;
		t_dl tab_task_deadline;
		t_worker tab_worker;
		t_pid tab_project_id;
		
		total NUMBER:=0;
		tid employee.employee_id%TYPE;
		CURSOR c IS
			SELECT * 
			FROM task t
			where t.project_id in (
								select project_id 
								from project p 
								where p.team_id in(select team_id
													from team te
													where te.team_name=teamname));
BEGIN
        SELECT team_id into teid
        from team
        where team_name=teamname;
	OPEN c;
	FETCH c  BULK COLLECT INTO t_id, t_name , t_dl ,t_worker,t_pid;
	CLOSE c;
        
	DBMS_OUTPUT.PUT_LINE('In cadrul echipe ' || teamname || ' aveti task-urile urmatoare : ');
	DBMS_OUTPUT.PUT_LINE('====================================================');
	FOR i in t_id.FIRST..t_id.LAST LOOP
         is_found_rec := true;

		DBMS_OUTPUT.PUT_LINE('Nume task : ' || t_name(i));
		DBMS_OUTPUT.PUT_LINE('Cu deadline-ul :' || t_dl(i));
        select lName into tNamet
            from employee
            where employee_id=t_worker(i);
		DBMS_OUTPUT.PUT_LINE('Realizat de : ' || tNamet);
        
		DBMS_OUTPUT.PUT_LINE('In cadrul proiectului cu id-ul: ' || t_pid(i));
        IF (i<t_id.LAST) THEN DBMS_OUTPUT.PUT_LINE('------------------------------------------------');
        END IF;
	END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('====================================================');
     if not is_found_rec then 
        RAISE exception_name1; 
     end if;

RETURN teid;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20000,'Nu exista echipa!');
    WHEN exception_name1 THEN
        RAISE_APPLICATION_ERROR(-20000,'Echipa nu are nimic la activ!');
    WHEN OTHERS THEN
                RAISE_APPLICATION_ERROR(-20001,'Alta eroare!');

END EXE8_ANC;
/


BEGIN
DBMS_OUTPUT.PUT_LINE(EXE8_ANC('basd'));
END;
/
--9
CREATE OR REPLACE PROCEDURE p9_anc
	(c_nume company.company_name%TYPE)
	IS
		cid company.company_id%TYPE;
--		select company_id into cid
--            from company
--            where company_name=c_nume;
		
		
		TYPE tab_id IS TABLE OF project.project_id%TYPE;
		TYPE tab_project_name IS TABLE OF project.project_name%TYPE;
		TYPE tab_project_start IS TABLE OF project.project_start%TYPE;
		TYPE tab_project_deadline IS TABLE OF project.project_deadline%TYPE;
		TYPE tab_teamid IS TABLE OF project.team_id%TYPE;
        is_found_rec boolean := false;    
        exception_name1 EXCEPTION; 

		t_id tab_id;
		t_name tab_project_name;
		t_s tab_project_start;
		t_dl tab_project_deadline;
		t_tid tab_teamid;
		
		nrtask NUMBER;
		teamname team.team_name%TYPE;
		
		
		CURSOR c IS
		SELECT *
		FROM project p
		where p.team_id in(
			SELECT team_id
			FROM member m
			where m.employee_id in ( SELECT employee_id
										FROM employee e
										where e.company_id=(select company_id
                                                                from company
                                                                where UPPER(company_name)=UPPER(c_nume))));
	BEGIN
		OPEN c;
		FETCH c  BULK COLLECT INTO t_id,t_name,t_s ,t_dl,t_tid;
		CLOSE c;
		
		FOR i in t_id.FIRST..t_id.LAST LOOP
                is_found_rec := true;
                
                DBMS_OUTPUT.PUT_LINE('Nume Proiect : ' || t_name(i));
                DBMS_OUTPUT.PUT_LINE('Inceput in :' || t_s(i));
                DBMS_OUTPUT.PUT_LINE('Cu deadline-ul :' || t_s(i));
        
                select count(*) into nrtask
                    from task t
                    where t.project_id=t_id(i);
                SELECT te.team_name into teamname
                from team te
                where te.team_id=t_tid(i);
                DBMS_OUTPUT.PUT_LINE('Are ' || nrtask || ' la activ.');
                DBMS_OUTPUT.PUT_LINE('Apartine echipe ' || teamname);
                
                IF (i<t_id.LAST) THEN DBMS_OUTPUT.PUT_LINE('------------------------------------------------');
                END IF;
        END LOOP;
         if not is_found_rec then 
        RAISE exception_name1; 
        end if;
    DBMS_OUTPUT.PUT_LINE('====================================================');
    EXCEPTION
     WHEN exception_name1 THEN
        RAISE_APPLICATION_ERROR(-20000,'Compania nu are nimic la activ!');
    WHEN OTHERS THEN
                RAISE_APPLICATION_ERROR(-20001,'Nu exista compania!');
END p9_anc;
/

select * from project;
                                        
BEGIN
 p9_anc('LAGAR');
END;
/
/
--10
CREATE OR REPLACE TRIGGER trig10
    BEFORE INSERT OR UPDATE OR DELETE ON company
BEGIN 
    IF(TO_CHAR(SYSDATE,'D')=2)
        OR (TO_CHAR(SYSDATE,'HH24') NOT BETWEEN 1 AND 8)
    THEN 
    RAISE_APPLICATION_ERROR(-20001,'tabelul nu poate fi actualizat');
END IF;
END;

/
INSERT INTO company( company_id, company_name, owner_name, owner_mail) VALUES (6,'test', 'Andreea Ancuta', 'lbae@gmail.com');
select * from employee;
/
--11
CREATE OR REPLACE TRIGGER trig11
    BEFORE UPDATE OF salary on employee
    FOR EACH ROW
BEGIN 
    IF(:NEW.salary>:OLD.salary) THEN
    RAISE_APPLICATION_ERROR(-20002,'salariul nu poate fi marit');
    END IF;
END;
/
UPDATE employee
SET salary=salary+100;
--12
drop table audit_ianc;
CREATE TABLE audit_ianc
(utilizator VARCHAR2(30),
nume_bd    VARCHAR2(50),
eveniment VARCHAR2(20),
nume_obiect VARCHAR2(30),
data           DATE);
/
CREATE OR REPLACE TRIGGER trigg12_ianc
    AFTER CREATE OR DROP OR ALTER ON SCHEMA
BEGIN
    INSERT INTO audit_ianc
    VALUES  (SYS.LOGIN_USER, SYS.DATABASE_NAME, SYS.SYSEVENT, SYS.DICTIONARY_OBJ_NAME, SYSDATE);
END;
/

--13
CREATE OR REPLACE PACKAGE pack_ex13
IS
 PROCEDURE p9_anc
	(c_nume company.company_name%TYPE);
   FUNCTION EXE8_ANC
	(teamname team.team_name%TYPE DEFAULT 'Exotica') 
     RETURN NUMBER;
FUNCTION EXE7_ANC
    RETURN NUMBER;
   FUNCTION EXE6_ANC
	(nume_companie company.company_name%TYPE DEFAULT 'COM')
    RETURN NUMBER;
END pack_ex13;  

/ 
CREATE OR REPLACE PACKAGE pack_ex13
IS
 PROCEDURE p9_anc
	(c_nume company.company_name%TYPE);
   FUNCTION EXE8_ANC
	(teamname team.team_name%TYPE DEFAULT 'Exotica') 
     RETURN NUMBER;
  FUNCTION EXE7_ANC
    RETURN NUMBER;
   FUNCTION EXE6_ANC
	(nume_companie company.company_name%TYPE DEFAULT 'COM')
    RETURN NUMBER;
END pack_ex13;  

/ 
CREATE OR REPLACE PACKAGE BODY pack_ex13
IS
FUNCTION EXE8_ANC
	(teamname team.team_name%TYPE DEFAULT 'Exotica')
    RETURN NUMBER IS
		TYPE tab_id IS TABLE OF task.task_id%TYPE;
		TYPE tab_task_name IS TABLE OF task.task_name%TYPE;
		TYPE tab_task_deadline IS TABLE OF task.task_deadline%TYPE;
		TYPE tab_worker IS TABLE OF task.worker_id%TYPE;
		TYPE tab_project_id IS TABLE OF task.project_id%TYPE;
        tNamet VARCHAR(200);
        teid NUMBER;
        is_found_rec boolean := false;    
        exception_name1 exception;
		t_id tab_id;
		t_name tab_task_name;
		t_dl tab_task_deadline;
		t_worker tab_worker;
		t_pid tab_project_id;
		
		total NUMBER:=0;
		tid employee.employee_id%TYPE;
		CURSOR c IS
			SELECT * 
			FROM task t
			where t.project_id in (
								select project_id 
								from project p 
								where p.team_id in(select team_id
													from team te
													where te.team_name=teamname));
BEGIN
        SELECT team_id into teid
        from team
        where team_name=teamname;
	OPEN c;
	FETCH c  BULK COLLECT INTO t_id, t_name , t_dl ,t_worker,t_pid;
	CLOSE c;
        
	DBMS_OUTPUT.PUT_LINE('In cadrul echipe ' || teamname || ' aveti task-urile urmatoare : ');
	DBMS_OUTPUT.PUT_LINE('====================================================');
	FOR i in t_id.FIRST..t_id.LAST LOOP
         is_found_rec := true;

		DBMS_OUTPUT.PUT_LINE('Nume task : ' || t_name(i));
		DBMS_OUTPUT.PUT_LINE('Cu deadline-ul :' || t_dl(i));
        select lName into tNamet
            from employee
            where employee_id=t_worker(i);
		DBMS_OUTPUT.PUT_LINE('Realizat de : ' || tNamet);
        
		DBMS_OUTPUT.PUT_LINE('In cadrul proiectului cu id-ul: ' || t_pid(i));
        IF (i<t_id.LAST) THEN DBMS_OUTPUT.PUT_LINE('------------------------------------------------');
        END IF;
	END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('====================================================');
     if not is_found_rec then 
        RAISE exception_name1; 
     end if;

RETURN teid;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20000,'Nu exista echipa!');
    WHEN exception_name1 THEN
        RAISE_APPLICATION_ERROR(-20000,'Echipa nu are nimic la activ!');
    WHEN OTHERS THEN
                RAISE_APPLICATION_ERROR(-20001,'Alta eroare!');

END EXE8_ANC;
--9
PROCEDURE p9_anc
	(c_nume company.company_name%TYPE)
	IS
		cid company.company_id%TYPE;
--		select company_id into cid
--            from company
--            where company_name=c_nume;
		
		
		TYPE tab_id IS TABLE OF project.project_id%TYPE;
		TYPE tab_project_name IS TABLE OF project.project_name%TYPE;
		TYPE tab_project_start IS TABLE OF project.project_start%TYPE;
		TYPE tab_project_deadline IS TABLE OF project.project_deadline%TYPE;
		TYPE tab_teamid IS TABLE OF project.team_id%TYPE;
        is_found_rec boolean := false;    
        exception_name1 EXCEPTION; 

		t_id tab_id;
		t_name tab_project_name;
		t_s tab_project_start;
		t_dl tab_project_deadline;
		t_tid tab_teamid;
		
		nrtask NUMBER;
		teamname team.team_name%TYPE;
		
		
		CURSOR c IS
		SELECT *
		FROM project p
		where p.team_id in(
			SELECT team_id
			FROM member m
			where m.employee_id in ( SELECT employee_id
										FROM employee e
										where e.company_id=(select company_id
                                                                from company
                                                                where UPPER(company_name)=UPPER(c_nume))));
	BEGIN
		OPEN c;
		FETCH c  BULK COLLECT INTO t_id,t_name,t_s ,t_dl,t_tid;
		CLOSE c;
		
		FOR i in t_id.FIRST..t_id.LAST LOOP
                is_found_rec := true;
                
                DBMS_OUTPUT.PUT_LINE('Nume Proiect : ' || t_name(i));
                DBMS_OUTPUT.PUT_LINE('Inceput in :' || t_s(i));
                DBMS_OUTPUT.PUT_LINE('Cu deadline-ul :' || t_s(i));
        
                select count(*) into nrtask
                    from task t
                    where t.project_id=t_id(i);
                SELECT te.team_name into teamname
                from team te
                where te.team_id=t_tid(i);
                DBMS_OUTPUT.PUT_LINE('Are ' || nrtask || ' la activ.');
                DBMS_OUTPUT.PUT_LINE('Apartine echipe ' || teamname);
                
                IF (i<t_id.LAST) THEN DBMS_OUTPUT.PUT_LINE('------------------------------------------------');
                END IF;
        END LOOP;
        
    DBMS_OUTPUT.PUT_LINE('====================================================');
    EXCEPTION
     WHEN exception_name1 THEN
        RAISE_APPLICATION_ERROR(-20000,'Compania nu are nimic la activ!');
    WHEN OTHERS THEN
                RAISE_APPLICATION_ERROR(-20001,'Nu exista compania!');
END p9_anc;

 FUNCTION EXE7_ANC
    RETURN NUMBER IS
		v_nr number(4);
        v_nume company.company_name%TYPE;
		CURSOR c IS
            (SELECT c.company_name, (select count(*)
                                from employee e
                                where e.company_id=c.company_id)
            from company c);
BEGIN
	OPEN c;
    LOOP 
        FETCH c into v_nume,v_nr;
        EXIT WHEN C%NOTFOUND;
        IF v_nr=0 THEN 
        DBMS_OUTPUT.PUT_LINE('In cadrul companiei ' || v_nume || ' nu avem angajati');
        ELSE IF V_nr=1 THEN
                    DBMS_OUTPUT.PUT_LINE('In cadrul companiei ' || v_nume || ' avem un angajat');
            
        ELSE
              DBMS_OUTPUT.PUT_LINE('In cadrul companiei ' || v_nume || ' avem ' || v_nr || ' angajati');

    END IF;
        END IF;
     END LOOP;
    
	CLOSE c;
RETURN 0;
END EXE7_ANC;


FUNCTION EXE6_ANC
	(nume_companie company.company_name%TYPE DEFAULT 'COM')
    RETURN NUMBER IS
		TYPE tab_id IS TABLE OF employee.employee_id%TYPE;
		TYPE tab_lName IS TABLE OF employee.lName%TYPE;
		TYPE tab_fName IS TABLE OF employee.fName%TYPE;
		TYPE tab_salary IS TABLE OF employee.salary%TYPE;
		t_id tab_id;
		t_lName tab_lName;
		t_fName tab_fName;
		t_salary tab_salary;
		total NUMBER:=0;
		CURSOR c IS
			SELECT employee_id,lName,fName,salary
			from employee
			where company_id IN (select company_id
								from company
								where company_name=nume_companie);
BEGIN
	OPEN c;
	FETCH c  BULK COLLECT INTO t_id, t_lName, t_fName,t_salary;
	CLOSE c;
	DBMS_OUTPUT.PUT_LINE('In cadrul ' || nume_companie || ' aveti angajatii : ');
	DBMS_OUTPUT.PUT_LINE('====================================================');
	FOR i in t_id.FIRST..t_id.LAST LOOP
		DBMS_OUTPUT.PUT_LINE('Angajatul :' || t_lName(i) || ' ' || t_fName(i));
        DBMS_OUTPUT.PUT_LINE('Salariu :' || t_salary(i));
        IF (i<t_id.LAST) THEN DBMS_OUTPUT.PUT_LINE('------------------------------------------------');
        END IF;
	total:=total+t_salary(i);
	END LOOP;
    DBMS_OUTPUT.PUT_LINE('====================================================');
	DBMS_OUTPUT.PUT_LINE('Total de plata pe luna : ' || total);
RETURN 0;
END EXE6_ANC;


END pack_ex13;
/


--14

create or replace package pckpct14
AS
--returneaza angajatii cu salariu mai mare de nnr 
CURSOR c_emp(nr NUMBER) RETURN employee%ROWTYPE;
-- returneaza persoanele din comapnia cu id cid si first_name fn
CURSOR c_mailfnamecomp(cid company.company_id%type,fn employee.fname%type) RETURN employee%ROWTYPE;
--returneaza salariul maxim dintr o companie
FUNCTION  f_max(cname company.company_name%type) RETURN NUMBER; 
--afiseaza proiectele din cadrul companiei cu id cid al caror deadline a trecut de ziua curenta
FUNCTION f_deadlinepassed(cid company.company_id%type) RETURN NUMBER;

END pckpct14;
/

CREATE OR REPLACE PACKAGE BODY pckpct14 AS 
CURSOR c_emp(nr NUMBER) RETURN employee%ROWTYPE
    IS
    SELECT *
    FROM  employee
    WHERE SALARY >= nr;
    
CURSOR c_mailfnamecomp(cid company.company_id%type,fn employee.fname%type) RETURN employee%ROWTYPE
    is    
    SELECT *
    from employee e  
    where e.company_id=cid and e.fname=fn;
    
FUNCTION  f_max(cname company.company_name%type) RETURN NUMBER
IS 
maxim NUMBER:=0;
n NUMBER;
BEGIN 
    select d.company_id into n
    from company d
    where UPPER(d.company_name)=UPPER(cname);

    SELECT MAX(e.salary) into maxim
    FROM employee e
    where e.company_id=n;
return maxim;
END f_max;





FUNCTION f_deadlinepassed(cid company.company_id%type) RETURN NUMBER IS
nproj NUMBER:=0;
cursor p is
    select *
    from project
    where team_id in(
        select team_id
        from member
        where employee_id in (select employee_id
                            from employee
                            where company_id=cid))
    and project_deadline<sysdate;
    
BEGIN
for i in p loop
    DBMS_OUTPUT.PUT_LINE(i.project_name);
    end loop;
return nproj;
end f_deadlinepassed;
END pckpct14;
/


BEGIN

    pack_ex13.p9_anc('COM');

END;