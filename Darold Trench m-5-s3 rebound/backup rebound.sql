PGDMP     ,    5                {            m5-s3-rebound    15.2    15.2     (           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            )           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            *           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            +           1262    16782    m5-s3-rebound    DATABASE     �   CREATE DATABASE "m5-s3-rebound" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE "m5-s3-rebound";
                postgres    false            �            1259    16788    clientes    TABLE       CREATE TABLE public.clientes (
    run character varying(10) NOT NULL,
    nombre character varying(120) NOT NULL,
    correo character varying(80) NOT NULL,
    direccion character varying(120) NOT NULL,
    telefono character varying(15) NOT NULL,
    alta character(1) NOT NULL
);
    DROP TABLE public.clientes;
       public         heap    postgres    false            �            1259    16783    empresas    TABLE       CREATE TABLE public.empresas (
    run character varying(10) NOT NULL,
    nombre character varying(120) NOT NULL,
    direccion character varying(120) NOT NULL,
    telefono character varying(15) NOT NULL,
    correo character varying(80) NOT NULL,
    web character varying(50)
);
    DROP TABLE public.empresas;
       public         heap    postgres    false            �            1259    16847    mantenciones    TABLE     �   CREATE TABLE public.mantenciones (
    id numeric(12,2) NOT NULL,
    fecha date DEFAULT now(),
    trabajaos_realizados character varying(1000),
    id_venta numeric(12,2) NOT NULL
);
     DROP TABLE public.mantenciones;
       public         heap    postgres    false            �            1259    16798    marcas    TABLE     j   CREATE TABLE public.marcas (
    id numeric(12,2) NOT NULL,
    nombre character varying(120) NOT NULL
);
    DROP TABLE public.marcas;
       public         heap    postgres    false            �            1259    16803    tipo_vehiculos    TABLE     r   CREATE TABLE public.tipo_vehiculos (
    id numeric(12,2) NOT NULL,
    nombre character varying(120) NOT NULL
);
 "   DROP TABLE public.tipo_vehiculos;
       public         heap    postgres    false            �            1259    16816 	   vehiculos    TABLE     �  CREATE TABLE public.vehiculos (
    id numeric(12,2) NOT NULL,
    patente character varying(10) NOT NULL,
    marca character varying(20) NOT NULL,
    modelo character varying(20) NOT NULL,
    color character varying(15) NOT NULL,
    precio numeric(12,2) NOT NULL,
    frecuencia_matencion numeric(5,2) NOT NULL,
    id_marca numeric(12,2) NOT NULL,
    id_tipovehiculo numeric(12,2) NOT NULL
);
    DROP TABLE public.vehiculos;
       public         heap    postgres    false            �            1259    16831    ventas    TABLE     �   CREATE TABLE public.ventas (
    folio numeric(12,2) NOT NULL,
    fecha date DEFAULT now(),
    monto numeric(12,2) NOT NULL,
    id_vehiculo numeric(12,2) NOT NULL,
    id_cliente character varying(10) NOT NULL
);
    DROP TABLE public.ventas;
       public         heap    postgres    false                       0    16788    clientes 
   TABLE DATA                 public          postgres    false    215   D"                 0    16783    empresas 
   TABLE DATA                 public          postgres    false    214   ^"       %          0    16847    mantenciones 
   TABLE DATA                 public          postgres    false    220   x"       !          0    16798    marcas 
   TABLE DATA                 public          postgres    false    216   �"       "          0    16803    tipo_vehiculos 
   TABLE DATA                 public          postgres    false    217   �"       #          0    16816 	   vehiculos 
   TABLE DATA                 public          postgres    false    218   �"       $          0    16831    ventas 
   TABLE DATA                 public          postgres    false    219   �"       �           2606    16792    clientes clientes_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (run);
 @   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_pkey;
       public            postgres    false    215                       2606    16787    empresas empresas_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.empresas
    ADD CONSTRAINT empresas_pkey PRIMARY KEY (run);
 @   ALTER TABLE ONLY public.empresas DROP CONSTRAINT empresas_pkey;
       public            postgres    false    214            �           2606    16854    mantenciones mantenciones_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.mantenciones
    ADD CONSTRAINT mantenciones_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.mantenciones DROP CONSTRAINT mantenciones_pkey;
       public            postgres    false    220            �           2606    16802    marcas marcas_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.marcas
    ADD CONSTRAINT marcas_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.marcas DROP CONSTRAINT marcas_pkey;
       public            postgres    false    216            �           2606    16807 "   tipo_vehiculos tipo_vehiculos_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.tipo_vehiculos
    ADD CONSTRAINT tipo_vehiculos_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.tipo_vehiculos DROP CONSTRAINT tipo_vehiculos_pkey;
       public            postgres    false    217            �           2606    16820    vehiculos vehiculos_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.vehiculos
    ADD CONSTRAINT vehiculos_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.vehiculos DROP CONSTRAINT vehiculos_pkey;
       public            postgres    false    218            �           2606    16836    ventas ventas_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT ventas_pkey PRIMARY KEY (folio);
 <   ALTER TABLE ONLY public.ventas DROP CONSTRAINT ventas_pkey;
       public            postgres    false    219            �           2606    16855 '   mantenciones mantenciones_id_venta_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.mantenciones
    ADD CONSTRAINT mantenciones_id_venta_fkey FOREIGN KEY (id_venta) REFERENCES public.ventas(folio);
 Q   ALTER TABLE ONLY public.mantenciones DROP CONSTRAINT mantenciones_id_venta_fkey;
       public          postgres    false    219    220    3209            �           2606    16821 !   vehiculos vehiculos_id_marca_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.vehiculos
    ADD CONSTRAINT vehiculos_id_marca_fkey FOREIGN KEY (id_marca) REFERENCES public.marcas(id);
 K   ALTER TABLE ONLY public.vehiculos DROP CONSTRAINT vehiculos_id_marca_fkey;
       public          postgres    false    218    216    3203            �           2606    16826 (   vehiculos vehiculos_id_tipovehiculo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.vehiculos
    ADD CONSTRAINT vehiculos_id_tipovehiculo_fkey FOREIGN KEY (id_tipovehiculo) REFERENCES public.tipo_vehiculos(id);
 R   ALTER TABLE ONLY public.vehiculos DROP CONSTRAINT vehiculos_id_tipovehiculo_fkey;
       public          postgres    false    218    3205    217            �           2606    16842    ventas ventas_id_cliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT ventas_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.clientes(run);
 G   ALTER TABLE ONLY public.ventas DROP CONSTRAINT ventas_id_cliente_fkey;
       public          postgres    false    219    215    3201            �           2606    16837    ventas ventas_id_vehiculo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT ventas_id_vehiculo_fkey FOREIGN KEY (id_vehiculo) REFERENCES public.vehiculos(id);
 H   ALTER TABLE ONLY public.ventas DROP CONSTRAINT ventas_id_vehiculo_fkey;
       public          postgres    false    218    219    3207                
   x���             
   x���          %   
   x���          !   
   x���          "   
   x���          #   
   x���          $   
   x���         