PGDMP                      |            jeb_salon_db    16.2    16.2 -    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    57485    jeb_salon_db    DATABASE     �   CREATE DATABASE jeb_salon_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Philippines.1252';
    DROP DATABASE jeb_salon_db;
                postgres    false            �            1259    57711    appointment    TABLE     �   CREATE TABLE public.appointment (
    app_id integer NOT NULL,
    cus_id text NOT NULL,
    ser_id integer NOT NULL,
    emp_id text,
    app_date_time timestamp without time zone NOT NULL
);
    DROP TABLE public.appointment;
       public         heap    postgres    false            �            1259    57710    appointment_app_id_seq    SEQUENCE     �   CREATE SEQUENCE public.appointment_app_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.appointment_app_id_seq;
       public          postgres    false    222            �           0    0    appointment_app_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.appointment_app_id_seq OWNED BY public.appointment.app_id;
          public          postgres    false    221            �            1259    57689    customer    TABLE     a  CREATE TABLE public.customer (
    cus_id text NOT NULL,
    cus_fname character varying(25) NOT NULL,
    cus_minitial character varying(1),
    cus_lname character varying(25) NOT NULL,
    cus_contact_num character varying(20),
    cus_sex character varying(10),
    cus_referred boolean DEFAULT false,
    cus_referrer_name character varying(50)
);
    DROP TABLE public.customer;
       public         heap    postgres    false            �            1259    57666    employee    TABLE     �  CREATE TABLE public.employee (
    emp_id text NOT NULL,
    emp_fname character varying(25) NOT NULL,
    emp_minitial character varying(1),
    emp_lname character varying(25) NOT NULL,
    emp_date_hired date NOT NULL,
    emp_email_address text,
    emp_address text NOT NULL,
    emp_contact_num character varying(20) NOT NULL,
    emp_available boolean DEFAULT true NOT NULL,
    emp_sex character varying(10)
);
    DROP TABLE public.employee;
       public         heap    postgres    false            �            1259    57697    employment_history    TABLE       CREATE TABLE public.employment_history (
    eh_id integer NOT NULL,
    eh_job_description character varying(50) NOT NULL,
    eh_establishment character varying(50) NOT NULL,
    eh_date_started date NOT NULL,
    eh_date_ended date NOT NULL,
    emp_id text NOT NULL
);
 &   DROP TABLE public.employment_history;
       public         heap    postgres    false            �            1259    57696    employment_history_eh_id_seq    SEQUENCE     �   CREATE SEQUENCE public.employment_history_eh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.employment_history_eh_id_seq;
       public          postgres    false    220            �           0    0    employment_history_eh_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.employment_history_eh_id_seq OWNED BY public.employment_history.eh_id;
          public          postgres    false    219            �            1259    57678    service    TABLE     �   CREATE TABLE public.service (
    ser_id integer NOT NULL,
    ser_name text NOT NULL,
    ser_price numeric DEFAULT 0.00 NOT NULL
);
    DROP TABLE public.service;
       public         heap    postgres    false            �            1259    57677    service_ser_id_seq    SEQUENCE     �   CREATE SEQUENCE public.service_ser_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.service_ser_id_seq;
       public          postgres    false    217            �           0    0    service_ser_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.service_ser_id_seq OWNED BY public.service.ser_id;
          public          postgres    false    216            �            1259    57735    transaction_history    TABLE     �  CREATE TABLE public.transaction_history (
    th_id integer NOT NULL,
    th_cus_fname character varying(25) NOT NULL,
    emp_id text NOT NULL,
    th_app_date_time timestamp without time zone NOT NULL,
    th_cus_minitial character varying(1),
    th_cus_lname character varying(25) NOT NULL,
    ser_id integer NOT NULL,
    th_cus_sex character varying,
    th_cus_referred boolean DEFAULT false,
    th_cus_referrer_name character varying(50)
);
 '   DROP TABLE public.transaction_history;
       public         heap    postgres    false            �            1259    57734    transaction_history_th_id_seq    SEQUENCE     �   CREATE SEQUENCE public.transaction_history_th_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.transaction_history_th_id_seq;
       public          postgres    false    224            �           0    0    transaction_history_th_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.transaction_history_th_id_seq OWNED BY public.transaction_history.th_id;
          public          postgres    false    223            6           2604    57714    appointment app_id    DEFAULT     x   ALTER TABLE ONLY public.appointment ALTER COLUMN app_id SET DEFAULT nextval('public.appointment_app_id_seq'::regclass);
 A   ALTER TABLE public.appointment ALTER COLUMN app_id DROP DEFAULT;
       public          postgres    false    222    221    222            5           2604    57700    employment_history eh_id    DEFAULT     �   ALTER TABLE ONLY public.employment_history ALTER COLUMN eh_id SET DEFAULT nextval('public.employment_history_eh_id_seq'::regclass);
 G   ALTER TABLE public.employment_history ALTER COLUMN eh_id DROP DEFAULT;
       public          postgres    false    219    220    220            2           2604    57681    service ser_id    DEFAULT     p   ALTER TABLE ONLY public.service ALTER COLUMN ser_id SET DEFAULT nextval('public.service_ser_id_seq'::regclass);
 =   ALTER TABLE public.service ALTER COLUMN ser_id DROP DEFAULT;
       public          postgres    false    216    217    217            7           2604    57738    transaction_history th_id    DEFAULT     �   ALTER TABLE ONLY public.transaction_history ALTER COLUMN th_id SET DEFAULT nextval('public.transaction_history_th_id_seq'::regclass);
 H   ALTER TABLE public.transaction_history ALTER COLUMN th_id DROP DEFAULT;
       public          postgres    false    224    223    224            �          0    57711    appointment 
   TABLE DATA           T   COPY public.appointment (app_id, cus_id, ser_id, emp_id, app_date_time) FROM stdin;
    public          postgres    false    222   ;       �          0    57689    customer 
   TABLE DATA           �   COPY public.customer (cus_id, cus_fname, cus_minitial, cus_lname, cus_contact_num, cus_sex, cus_referred, cus_referrer_name) FROM stdin;
    public          postgres    false    218   %;       �          0    57666    employee 
   TABLE DATA           �   COPY public.employee (emp_id, emp_fname, emp_minitial, emp_lname, emp_date_hired, emp_email_address, emp_address, emp_contact_num, emp_available, emp_sex) FROM stdin;
    public          postgres    false    215   B;       �          0    57697    employment_history 
   TABLE DATA           �   COPY public.employment_history (eh_id, eh_job_description, eh_establishment, eh_date_started, eh_date_ended, emp_id) FROM stdin;
    public          postgres    false    220   _;       �          0    57678    service 
   TABLE DATA           >   COPY public.service (ser_id, ser_name, ser_price) FROM stdin;
    public          postgres    false    217   |;       �          0    57735    transaction_history 
   TABLE DATA           �   COPY public.transaction_history (th_id, th_cus_fname, emp_id, th_app_date_time, th_cus_minitial, th_cus_lname, ser_id, th_cus_sex, th_cus_referred, th_cus_referrer_name) FROM stdin;
    public          postgres    false    224   �;       �           0    0    appointment_app_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.appointment_app_id_seq', 20, true);
          public          postgres    false    221            �           0    0    employment_history_eh_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.employment_history_eh_id_seq', 1, true);
          public          postgres    false    219            �           0    0    service_ser_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.service_ser_id_seq', 9, true);
          public          postgres    false    216            �           0    0    transaction_history_th_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.transaction_history_th_id_seq', 10, true);
          public          postgres    false    223            D           2606    57718    appointment appointment_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.appointment
    ADD CONSTRAINT appointment_pkey PRIMARY KEY (app_id);
 F   ALTER TABLE ONLY public.appointment DROP CONSTRAINT appointment_pkey;
       public            postgres    false    222            @           2606    57695    customer customer_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (cus_id);
 @   ALTER TABLE ONLY public.customer DROP CONSTRAINT customer_pkey;
       public            postgres    false    218            :           2606    57676    employee employee_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (emp_id);
 @   ALTER TABLE ONLY public.employee DROP CONSTRAINT employee_pkey;
       public            postgres    false    215            B           2606    57704 *   employment_history employment_history_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.employment_history
    ADD CONSTRAINT employment_history_pkey PRIMARY KEY (eh_id);
 T   ALTER TABLE ONLY public.employment_history DROP CONSTRAINT employment_history_pkey;
       public            postgres    false    220            <           2606    57686    service service_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.service
    ADD CONSTRAINT service_pkey PRIMARY KEY (ser_id);
 >   ALTER TABLE ONLY public.service DROP CONSTRAINT service_pkey;
       public            postgres    false    217            >           2606    57688    service service_ser_name_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.service
    ADD CONSTRAINT service_ser_name_key UNIQUE (ser_name);
 F   ALTER TABLE ONLY public.service DROP CONSTRAINT service_ser_name_key;
       public            postgres    false    217            F           2606    57742 ,   transaction_history transaction_history_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.transaction_history
    ADD CONSTRAINT transaction_history_pkey PRIMARY KEY (th_id);
 V   ALTER TABLE ONLY public.transaction_history DROP CONSTRAINT transaction_history_pkey;
       public            postgres    false    224            H           2606    57719 #   appointment appointment_cus_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.appointment
    ADD CONSTRAINT appointment_cus_id_fkey FOREIGN KEY (cus_id) REFERENCES public.customer(cus_id) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.appointment DROP CONSTRAINT appointment_cus_id_fkey;
       public          postgres    false    222    4672    218            I           2606    57724 #   appointment appointment_emp_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.appointment
    ADD CONSTRAINT appointment_emp_id_fkey FOREIGN KEY (emp_id) REFERENCES public.employee(emp_id) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.appointment DROP CONSTRAINT appointment_emp_id_fkey;
       public          postgres    false    222    215    4666            J           2606    57729 #   appointment appointment_ser_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.appointment
    ADD CONSTRAINT appointment_ser_id_fkey FOREIGN KEY (ser_id) REFERENCES public.service(ser_id) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.appointment DROP CONSTRAINT appointment_ser_id_fkey;
       public          postgres    false    4668    222    217            G           2606    57705 1   employment_history employment_history_emp_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.employment_history
    ADD CONSTRAINT employment_history_emp_id_fkey FOREIGN KEY (emp_id) REFERENCES public.employee(emp_id) ON UPDATE CASCADE ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.employment_history DROP CONSTRAINT employment_history_emp_id_fkey;
       public          postgres    false    215    220    4666            K           2606    57743 3   transaction_history transaction_history_emp_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.transaction_history
    ADD CONSTRAINT transaction_history_emp_id_fkey FOREIGN KEY (emp_id) REFERENCES public.employee(emp_id) ON UPDATE CASCADE ON DELETE CASCADE;
 ]   ALTER TABLE ONLY public.transaction_history DROP CONSTRAINT transaction_history_emp_id_fkey;
       public          postgres    false    4666    215    224            L           2606    57748 3   transaction_history transaction_history_ser_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.transaction_history
    ADD CONSTRAINT transaction_history_ser_id_fkey FOREIGN KEY (ser_id) REFERENCES public.service(ser_id) ON UPDATE CASCADE ON DELETE CASCADE;
 ]   ALTER TABLE ONLY public.transaction_history DROP CONSTRAINT transaction_history_ser_id_fkey;
       public          postgres    false    217    224    4668            �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �     