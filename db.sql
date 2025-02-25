CREATE TABLE common_user (
    id_user INTEGER PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    birth DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    profile_image VARCHAR(255),
    cpf VARCHAR(11) UNIQUE NOT NULL,
    fk_address INTEGER,
    contact VARCHAR(15),
    gender VARCHAR(10),
    emergency_contact VARCHAR(15),
    FOREIGN KEY (fk_address) REFERENCES address(id_address)
);

insert into common_user (id_user, username, email, password, birth, profile_image, cpf, Fk_address, contact, gender, emergency_contact)
values (1, 'Arthur', 'arthurtavarescontatos@gmail.com', '123445', '2007-06-07', 'url_.img', '14222233344', 1, '124762143', 'Masculino', '981436932432');
 
select * from common_user

insert into patient (id_user) values(1);

select common_user.username, common_user.email from common_user join patient on patient.id_user = common_user.id_user

CREATE OR REPLACE FUNCTION update_timestamp()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_update_common_user
BEFORE UPDATE ON common_user
FOR EACH ROW EXECUTE FUNCTION update_timestamp();


CREATE TABLE address (
    id_address INTEGER PRIMARY KEY,
    street VARCHAR(255),
    number INTEGER,
    cep VARCHAR(8),
    state VARCHAR(50),
    city VARCHAR(100)
);

insert into address (id_address, street, number, cep, state, city) 
values (1, 'Rua Guimaroes', 123, 93054000, 'Rio Grande do Sul', 'São Leopoldo')

select * from address


CREATE TABLE professional (
    id_user INTEGER PRIMARY KEY,
    crm VARCHAR(20) UNIQUE NOT NULL,
    specialty VARCHAR(255),
    qualification TEXT,
    contact VARCHAR(15),
    workload INTEGER,
    FOREIGN KEY (id_user) REFERENCES common_user(id_user) ON DELETE CASCADE
);


CREATE TABLE patient (
    id_user INTEGER PRIMARY KEY,
    FOREIGN KEY (id_user) REFERENCES common_user(id_user) ON DELETE CASCADE
);


CREATE TABLE message (
    id_message INTEGER PRIMARY KEY,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    content TEXT NOT NULL
);


CREATE TABLE message_exchange (
    id_exchange INTEGER PRIMARY KEY,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fk_message INTEGER NOT NULL,
    fk_doctor INTEGER NOT NULL,
    fk_patient INTEGER NOT NULL,
    FOREIGN KEY (fk_message) REFERENCES message(id_message) ON DELETE CASCADE,
    FOREIGN KEY (fk_doctor) REFERENCES professional(id_user) ON DELETE CASCADE,
    FOREIGN KEY (fk_patient) REFERENCES patient(id_user) ON DELETE CASCADE
);


CREATE TABLE note (
    id_note INTEGER PRIMARY KEY,
    content TEXT NOT NULL,
    fk_patient INTEGER NOT NULL,
    FOREIGN KEY (fk_patient) REFERENCES patient(id_user) ON DELETE CASCADE
);


CREATE TABLE medical_record (
    id_record INTEGER PRIMARY KEY,
    content TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    appraisal TEXT,
    fk_doctor INTEGER NOT NULL,
    fk_patient INTEGER NOT NULL,
    mood VARCHAR(50),
    FOREIGN KEY (fk_doctor) REFERENCES professional(id_user) ON DELETE CASCADE,
    FOREIGN KEY (fk_patient) REFERENCES patient(id_user) ON DELETE CASCADE
);


CREATE TABLE consult (
    id_consult INTEGER PRIMARY KEY,
    fk_professional INTEGER NOT NULL,
    consult_date DATE NOT NULL,
    consult_time TIME NOT NULL,
    duration INTERVAL NOT NULL,
    type VARCHAR(50),
    summary TEXT,
    observation TEXT,
    FOREIGN KEY (fk_professional) REFERENCES professional(id_user) ON DELETE CASCADE
);


CREATE TABLE video_lesson (
    id_video_lesson INTEGER PRIMARY KEY,
    content TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fk_professional INTEGER NOT NULL,
    status VARCHAR(50),
    duration INTERVAL NOT NULL,
    FOREIGN KEY (fk_professional) REFERENCES professional(id_user) ON DELETE CASCADE
);


CREATE TABLE meditation (
    id_meditation INTEGER PRIMARY KEY,
    title VARCHAR(255),
    duration INTERVAL,
    description TEXT,
    type VARCHAR(50),
    fk_patient INTEGER NOT NULL,
    FOREIGN KEY (fk_patient) REFERENCES patient(id_user) ON DELETE CASCADE
);

-- Selecionando todos os usuarios do sistema;
select * from common_user
-- Selecionando todos os Pacientes;
select username, email ,password from common_user join patient on common_user.id_user  = patient.id_user
-- Selecionando todos os Profisionais;
select  username, email ,password, specialty, qualification from common_user join professional on common_user.id_user  = professional.id_user

-- Selecionando todos os endereços
select * from address

insert into patient (id_user) values(3)

insert into address(id_address, street, number, cep, state, city) values(3,'Odilo silva', 74, '9540454', 'Santa Catarina', 'Itajai')

insert into common_user(id_user, username, email, password, birth, profile_image, cpf, fk_address, contact, gender, emergency_contact) values(2, 'Arthur', 'arthur@gmail.com', 'imj465', '2007-08-7', 'img_url', '16233300099', 2, '51335456', 'Masculino', '519393944')

insert into common_user(id_user, username, email, password, birth, profile_image, cpf, fk_address, contact, gender, emergency_contact) values(3, 'Vitor', 'vitor@gmail.com', 'i5', '2003-02-01', 'img_url', '1676500099', 3, '51335456', 'Masculino', '519393944')



update common_user set username = 'Vitoria' where id_user = 2
update common_user set email = 'vitoria@gmail.com' where id_user = 2


insert into professional(id_user, crm, specialty, qualification, contact, workload) values(2, '123456', 'Urologista', 'Graduado', '46521152', 30 )

alter table message add column id_user integer;

alter table message add column id_user integer references common_user(id_user)

alter table message drop column id_user

select * from message


CREATE TABLE message_exchange_user (
    id_exchange INTEGER PRIMARY KEY,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fk_message INTEGER NOT NULL,
    fk_patient1 INTEGER NOT NULL,
    fk_patient2 INTEGER NOT NULL,
    FOREIGN KEY (fk_message) REFERENCES message(id_message) ON DELETE CASCADE,
    FOREIGN KEY (fk_patient1) REFERENCES patient(id_user) ON DELETE CASCADE,
    FOREIGN KEY (fk_patient2) REFERENCES patient(id_user) ON DELETE CASCADE
);


insert into message (id_message, content, id_user) values (1, 'oii bruxo', 1)
insert into message	(id_message, content, id_user) values (2, 'fala tu cabaço', 3)

insert into message_exchange_user(id_exchange, fk_message, fk_patient1, fk_patient2) values (1, 1, 1, 3)
insert into message_exchange_user(id_exchange, fk_message, fk_patient1, fk_patient2) values (2, 2, 1, 3)

select * from message




create or replace view all_messages_between_users  as
SELECT message.content AS msg, p1.id_user AS patient_1, p2.id_user AS patient_2, 
c1.username as username_1, c2.username as username_2 , message.id_user as owner
FROM message
JOIN message_exchange_user AS m1 ON m1.fk_message = message.id_message
JOIN patient AS p1 ON m1.fk_patient1 = p1.id_user
JOIN patient AS p2 ON m1.fk_patient2 = p2.id_user
join common_user AS c1 on c1.id_user = p1.id_user
join common_user AS c2 on c2.id_user = p2.id_user


select * from all_messages_between_users 




select * from message_exchange 

insert into message (id_message, content, id_user) values (3, 'Meu, tu ta mal afu', 2)
insert into message_exchange (id_exchange, fk_message, fk_patient, fk_doctor) values (3, 3, 1, 2)

create or replace view all_messages_between_doctor_and_user AS
Select message.content as msg, p1.id_user as patient, d1.id_user as doctor, 
c1.username as patient_name, c2.username as doctor_name, message.id_user as owner
from message 
join message_exchange as m1 on m1.fk_message = message.id_message
join patient as p1 on m1.fk_patient = p1.id_user 
join professional as d1 on m1.fk_doctor = d1.id_user
join common_user as c1 on c1.id_user = p1.id_user
join common_user as c2 on c2.id_user = d1.id_user

select * from all_messages_between_doctor_and_user 

alter view  all_messages_between_doctor_and_user rename column patient to patient_id
alter view  all_messages_between_doctor_and_user rename column doctor to doctor_id

insert into consult (id_consult, fk_professional, consult_date, consult_time, type, summary, observation, fk_patient, duration) 
values(1, 2, '2025-02-20', '19:30:10', 'Consulta', 'Paciente nao tava tão tri assim', 'Fazer mais Exercício físico', 3, 5  )

select * from consult

alter table consult drop column duration
alter table consult add column duration integer

alter table consult add column fk_patient integer references patient(id_user)

select content from medical_record


insert into medical_record(id_record, content, appraisal, fk_doctor, fk_patient, mood) 
values (1, 'Paciente não apresenta melhora nas últimas duas semanas. Relata ter cefaleia grave,
resultado pelo acumulo de estresse e ansiedade. Recomendado assistir vídeos da plataforma,
prática de exercícios físicos e realizar "hobbies" que o agradem.', 'Ta puto', 2, 3, 'Irritado' )

select * from meditation

alter table meditation drop column duration
alter table meditation add column duration integer 

insert into meditation(id_meditation, title, description, type, fk_patient,  duration)
values(1, 'Meditação para ansiedade', 'Meditação para o vitor que tem ansiedade', 'Meditação/respiração', 3, 8);

alter table note add column updated_at date default now()

select * from note

insert into note(id_note, content, fk_patient) values(1, 'A escrever...', 3)


CREATE OR REPLACE FUNCTION update_video_lesson()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_update_video_lesson
BEFORE UPDATE ON video_lesson
FOR EACH ROW EXECUTE FUNCTION update_video_lesson();

select * from video_lesson

alter table video_lesson drop column duration
alter table video_lesson add column duration integer

insert into video_lesson(id_video_lesson, content, fk_professional, status, duration )
values(1, 'file.video', 2, 'public', 20)