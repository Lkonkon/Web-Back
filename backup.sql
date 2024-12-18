PGDMP  )                
    |            api_marketplace    16.6    16.6 )    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16398    api_marketplace    DATABASE     �   CREATE DATABASE api_marketplace WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE api_marketplace;
                postgres    false            �            1259    16399 
   migrations    TABLE     �   CREATE TABLE public.migrations (
    id integer NOT NULL,
    "timestamp" bigint NOT NULL,
    name character varying NOT NULL
);
    DROP TABLE public.migrations;
       public         heap    postgres    false            �            1259    16404    migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.migrations_id_seq;
       public          postgres    false    215            �           0    0    migrations_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;
          public          postgres    false    216            �            1259    16405    products    TABLE     s  CREATE TABLE public.products (
    id integer NOT NULL,
    datacadastro timestamp without time zone DEFAULT now() NOT NULL,
    dataalteracao timestamp without time zone DEFAULT now() NOT NULL,
    imagemproduto character varying,
    name character varying,
    departamento character varying,
    precounitariocomercial numeric(10,2),
    valorcompra numeric(10,2)
);
    DROP TABLE public.products;
       public         heap    postgres    false            �            1259    16412    products_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.products_id_seq;
       public          postgres    false    217            �           0    0    products_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;
          public          postgres    false    218            �            1259    16413 
   sale_items    TABLE     �   CREATE TABLE public.sale_items (
    id integer NOT NULL,
    sale_id integer,
    product_id integer,
    price numeric(10,2)
);
    DROP TABLE public.sale_items;
       public         heap    postgres    false            �            1259    16416    sale_items_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sale_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.sale_items_id_seq;
       public          postgres    false    219            �           0    0    sale_items_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.sale_items_id_seq OWNED BY public.sale_items.id;
          public          postgres    false    220            �            1259    16417    sales    TABLE     �   CREATE TABLE public.sales (
    id integer NOT NULL,
    payment_method character varying(255) NOT NULL,
    total_price numeric(10,2) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.sales;
       public         heap    postgres    false            �            1259    16421    sales_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.sales_id_seq;
       public          postgres    false    221            �           0    0    sales_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.sales_id_seq OWNED BY public.sales.id;
          public          postgres    false    222            �            1259    16422    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    reset_token text
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    16427    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    223            �           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    224            .           2604    16428    migrations id    DEFAULT     n   ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);
 <   ALTER TABLE public.migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215            /           2604    16429    products id    DEFAULT     j   ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);
 :   ALTER TABLE public.products ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217            2           2604    16430    sale_items id    DEFAULT     n   ALTER TABLE ONLY public.sale_items ALTER COLUMN id SET DEFAULT nextval('public.sale_items_id_seq'::regclass);
 <   ALTER TABLE public.sale_items ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219            3           2604    16431    sales id    DEFAULT     d   ALTER TABLE ONLY public.sales ALTER COLUMN id SET DEFAULT nextval('public.sales_id_seq'::regclass);
 7   ALTER TABLE public.sales ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221            5           2604    16432    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    223            �          0    16399 
   migrations 
   TABLE DATA           ;   COPY public.migrations (id, "timestamp", name) FROM stdin;
    public          postgres    false    215   �,       �          0    16405    products 
   TABLE DATA           �   COPY public.products (id, datacadastro, dataalteracao, imagemproduto, name, departamento, precounitariocomercial, valorcompra) FROM stdin;
    public          postgres    false    217   >-       �          0    16413 
   sale_items 
   TABLE DATA           D   COPY public.sale_items (id, sale_id, product_id, price) FROM stdin;
    public          postgres    false    219   �4       �          0    16417    sales 
   TABLE DATA           L   COPY public.sales (id, payment_method, total_price, created_at) FROM stdin;
    public          postgres    false    221   �4       �          0    16422    users 
   TABLE DATA           G   COPY public.users (id, name, email, password, reset_token) FROM stdin;
    public          postgres    false    223   5       �           0    0    migrations_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.migrations_id_seq', 7, true);
          public          postgres    false    216            �           0    0    products_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.products_id_seq', 35, true);
          public          postgres    false    218            �           0    0    sale_items_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.sale_items_id_seq', 1, false);
          public          postgres    false    220            �           0    0    sales_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.sales_id_seq', 1, false);
          public          postgres    false    222            �           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 10, true);
          public          postgres    false    224            9           2606    16434 '   products PK_0806c755e0aca124e67c0cf6d7d 
   CONSTRAINT     g   ALTER TABLE ONLY public.products
    ADD CONSTRAINT "PK_0806c755e0aca124e67c0cf6d7d" PRIMARY KEY (id);
 S   ALTER TABLE ONLY public.products DROP CONSTRAINT "PK_0806c755e0aca124e67c0cf6d7d";
       public            postgres    false    217            7           2606    16436 )   migrations PK_8c82d7f526340ab734260ea46be 
   CONSTRAINT     i   ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT "PK_8c82d7f526340ab734260ea46be" PRIMARY KEY (id);
 U   ALTER TABLE ONLY public.migrations DROP CONSTRAINT "PK_8c82d7f526340ab734260ea46be";
       public            postgres    false    215            ?           2606    16438 $   users PK_a3ffb1c0c8416b9fc6f907b7433 
   CONSTRAINT     d   ALTER TABLE ONLY public.users
    ADD CONSTRAINT "PK_a3ffb1c0c8416b9fc6f907b7433" PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.users DROP CONSTRAINT "PK_a3ffb1c0c8416b9fc6f907b7433";
       public            postgres    false    223            A           2606    16440 $   users UQ_97672ac88f789774dd47f7c8be3 
   CONSTRAINT     b   ALTER TABLE ONLY public.users
    ADD CONSTRAINT "UQ_97672ac88f789774dd47f7c8be3" UNIQUE (email);
 P   ALTER TABLE ONLY public.users DROP CONSTRAINT "UQ_97672ac88f789774dd47f7c8be3";
       public            postgres    false    223            ;           2606    16442    sale_items sale_items_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.sale_items
    ADD CONSTRAINT sale_items_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.sale_items DROP CONSTRAINT sale_items_pkey;
       public            postgres    false    219            =           2606    16444    sales sales_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.sales DROP CONSTRAINT sales_pkey;
       public            postgres    false    221            B           2606    16445 "   sale_items sale_items_sale_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sale_items
    ADD CONSTRAINT sale_items_sale_id_fkey FOREIGN KEY (sale_id) REFERENCES public.sales(id);
 L   ALTER TABLE ONLY public.sale_items DROP CONSTRAINT sale_items_sale_id_fkey;
       public          postgres    false    221    4669    219            �   Y   x�U�;@@ ��Fvv��chTJ�/b�i_h�FҐYe��m9�� �B�\���҇ ��̩SM��O
�\ҋ`���ZHM�0� p)*�      �   y  x����r�����St6�� ��w�d��eET���T��D��H�! �)��G�ט�R0IU���Tj�<��K��)�`١�c��I@�R�t4)�4�u��0	�2�E���� �R��|����H7�|8/|�a�Dv�tW�3��̌�����.�|�c��Q��"�9�����~ jz�v��m>�"�A�}��~��O��=wr=�뼰E�DN�݁�'�^�a�(�'H@��L�tt8����-%�U�x�F9��#�E����Ia�5��_[�������)*�w���������'|<��g�="%1�OțG�N�^���"���z9�1�>�]z@�/}��?�	�.m�
�FS��*���-2�Jrj^:�xDU��q���B�hj�CC=�śX�~8t���=��&�DWQ
X(J�Ef��{���Z�6$��/FK��3��UZ�*�0k�"㆜.��d�����t����x ���ܣb"�-��@b�i���p�Q�n-�:igD�~�\�/��Z�?�v�������$�i�𭜵����p��М�<̔2��t9³|.Ǎ��_��"���m��(ڞ�
��=��ͣCEQ�b���Y���k9s��G�/~A��ϣ���8OB��p\�f_�zP���J�3~w�'� oM�J�Ў���0�s�Q��bdg3��{�[�$D����d<s�L���+��I�j�$9a��Qa*&6%i<�A�F��6��3?ϊ]U;��z��o��nJ���u��⬽��G��B��������~]���.H���e�5� R�#Ŷ��4VJ�i����@ Ô����'u��PL�A3�=g֞cd��+�y:5��PD+,��8DU�f:���T��J��Ⓡ�a�}��ѫ͓|����i �����3�R�I�g�*˝�Zх�Fl��g�(/���"򼇮��<������l$�zճ�oӈ�c=Cq��KG�a��*֍��ź��n1s��vc�Ԏ��Y�n�* ͕�'WQR�$�~���f;�	�c���;Ð��5Z���o�]O\���9D9`̈́Pd F��ac)� ��C׸�yT%��m��nK�>j���{x�K�h�w`��A*c΢I�'�Gy����he3t����(G��ȵ��]�7G��S֭aʂ��xm,��z��]��ч<�aUd.['~9�6a0n���_�΂R�`��@I^�+�`��n4N�>����!,B�6�l�[�B[KM�b����h��Bt�CD�P�i�(B����N�;|MzT"�� �5�F���Q�ޟ�;�b���aD�IeE ��D؜Ok�i����@�<��O.�U�{���ð	?�YD����$��eR�F��v�N�"*�a[���Pn�?n�.㧒Q�_���Ew�}�Z�ʎme��:[�i4̑��X���q[6�`�Ey����%�YL��O��f	�5�ك��u��V���kA$��a0U&db~�矒�������v���c�1�]���-6V)�[@��f3�d��e����m?@Rem����Ƚ�a�Rrk�2�F��2F�;�P���}n30����l6�˳�k�~�@L�L,��@���`��ƶ�p%�5�^��ӡӎ�]��fS���N6��)m4`����0�㰶�M�zs�yÖ+�W���yD%����ۛ�7_��l;���&��	 �nLi�|���"�=��KkP{�tg��Pl�|�$D��fwh#�b������~7��y�4U0wl�� �'S2^�m6��y�ҟ.��e�\'�m��q��w�������6�TOt�4w�d���/!�[�dVݍn ���7 �����nle��?���'Y�l1,�5��t�'Ŧ�}�nRG�k��͛�K�k�      �      x������ � �      �      x������ � �      �   w   x�34�����"�ļ���̔��̜�����*ˡ21#?_/9?W/��S�(I��@%5��Բ�#��"���%0+��01��$)�1� ��Ϩ(����-���91���%̠��0�3Ə+F��� ��'     