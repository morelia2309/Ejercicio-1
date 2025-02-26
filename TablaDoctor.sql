create table doctors (
  id bigint primary key generated always as identity,
  first_name text not null,
  last_name text not null,
  specialty text not null,
  phone_number text,
  email text unique,
  clinic_address text
);

create table specialties (
  id bigint primary key generated always as identity,
  name text not null unique
);

create table clinic_addresses (
  id bigint primary key generated always as identity,
  address text not null unique
);

alter table specialties
add column difficulty text;

alter table specialties
alter column difficulty type int8 using difficulty::int8;

alter table clinic_addresses
add column name text,
add column number_of_clinics int8;

alter table doctors
add constraint fk_specialty foreign key (specialty) references specialties (name);

alter table doctors
drop constraint fk_specialty;

alter table doctors
add column specialty_id bigint,
add constraint fk_specialty_id foreign key (specialty_id) references specialties (id);

alter table doctors
drop specialty;

alter table doctors
add column clinic_address_id bigint,
add constraint fk_clinic_address_id foreign key (clinic_address_id) references clinic_addresses (id);

alter table doctors
drop clinic_address;