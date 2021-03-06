PGDMP                         y            postgres    13.4    13.4     ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    13442    postgres    DATABASE     l   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE postgres;
                postgres    false            ?           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    3002                        3079    16384 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false            ?           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                        false    2            ?            1259    16395    sales_order    TABLE     ?   CREATE TABLE public.sales_order (
    sales_order_id integer NOT NULL,
    sales_order_desc character varying(50),
    start_date date,
    end_date date
);
    DROP TABLE public.sales_order;
       public         heap    postgres    false            ?            1259    16400 
   work_order    TABLE     	  CREATE TABLE public.work_order (
    work_order_id integer NOT NULL,
    work_order_desc character varying(50),
    start_date date,
    end_date date,
    sales_order_id integer,
    previous_station_id integer,
    current_station_id integer,
    rfid integer
);
    DROP TABLE public.work_order;
       public         heap    postgres    false            ?            1259    16410    work_station    TABLE     x   CREATE TABLE public.work_station (
    work_station_id integer NOT NULL,
    work_station_name character varying(20)
);
     DROP TABLE public.work_station;
       public         heap    postgres    false            ?          0    16395    sales_order 
   TABLE DATA           ]   COPY public.sales_order (sales_order_id, sales_order_desc, start_date, end_date) FROM stdin;
    public          postgres    false    201   P       ?          0    16400 
   work_order 
   TABLE DATA           ?   COPY public.work_order (work_order_id, work_order_desc, start_date, end_date, sales_order_id, previous_station_id, current_station_id, rfid) FROM stdin;
    public          postgres    false    202   m       ?          0    16410    work_station 
   TABLE DATA           J   COPY public.work_station (work_station_id, work_station_name) FROM stdin;
    public          postgres    false    203   ?       *           2606    16399    sales_order sales_order_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.sales_order
    ADD CONSTRAINT sales_order_pkey PRIMARY KEY (sales_order_id);
 F   ALTER TABLE ONLY public.sales_order DROP CONSTRAINT sales_order_pkey;
       public            postgres    false    201            ,           2606    16404    work_order work_order_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.work_order
    ADD CONSTRAINT work_order_pkey PRIMARY KEY (work_order_id);
 D   ALTER TABLE ONLY public.work_order DROP CONSTRAINT work_order_pkey;
       public            postgres    false    202            .           2606    16414    work_station work_station_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.work_station
    ADD CONSTRAINT work_station_pkey PRIMARY KEY (work_station_id);
 H   ALTER TABLE ONLY public.work_station DROP CONSTRAINT work_station_pkey;
       public            postgres    false    203            /           2606    16405 )   work_order work_order_sales_order_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.work_order
    ADD CONSTRAINT work_order_sales_order_id_fkey FOREIGN KEY (sales_order_id) REFERENCES public.sales_order(sales_order_id);
 S   ALTER TABLE ONLY public.work_order DROP CONSTRAINT work_order_sales_order_id_fkey;
       public          postgres    false    202    201    2858            ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?     