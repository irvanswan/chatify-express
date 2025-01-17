PGDMP     +                    y            chatify_new    13.1    13.1 0    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    57420    chatify_new    DATABASE     n   CREATE DATABASE chatify_new WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Indonesian_Indonesia.1252';
    DROP DATABASE chatify_new;
                postgres    false            �           1247    57488    status_chat    TYPE     E   CREATE TYPE public.status_chat AS ENUM (
    'read',
    'unread'
);
    DROP TYPE public.status_chat;
       public          postgres    false            �           1247    57462    status_chatrooms    TYPE     Z   CREATE TYPE public.status_chatrooms AS ENUM (
    'save',
    'important',
    'basic'
);
 #   DROP TYPE public.status_chatrooms;
       public          postgres    false            �           1247    57494 	   type_chat    TYPE     R   CREATE TYPE public.type_chat AS ENUM (
    'document',
    'image',
    'text'
);
    DROP TYPE public.type_chat;
       public          postgres    false            �           1247    57581 	   type_user    TYPE     C   CREATE TYPE public.type_user AS ENUM (
    'basic',
    'admin'
);
    DROP TYPE public.type_user;
       public          postgres    false            �            1259    57538    call_history    TABLE     �   CREATE TABLE public.call_history (
    id integer NOT NULL,
    id_sender integer NOT NULL,
    "from" time without time zone NOT NULL,
    "to" time without time zone
);
     DROP TABLE public.call_history;
       public         heap    postgres    false            �            1259    57467 	   chatrooms    TABLE     �   CREATE TABLE public.chatrooms (
    id integer NOT NULL,
    status public.status_chatrooms NOT NULL,
    "timestamp" time without time zone NOT NULL
);
    DROP TABLE public.chatrooms;
       public         heap    postgres    false    645            �            1259    57472    chatrooms_id_chat_seq    SEQUENCE     �   ALTER TABLE public.chatrooms ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.chatrooms_id_chat_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
    CYCLE
);
            public          postgres    false    204            �            1259    57431    contacts    TABLE     �   CREATE TABLE public.contacts (
    id integer NOT NULL,
    id_user integer NOT NULL,
    relation integer NOT NULL,
    name character varying NOT NULL
);
    DROP TABLE public.contacts;
       public         heap    postgres    false            �            1259    57439    contacts_id_contact_seq    SEQUENCE     �   ALTER TABLE public.contacts ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.contacts_id_contact_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
    CYCLE
);
            public          postgres    false    202            �            1259    57479    detail_chat    TABLE     �   CREATE TABLE public.detail_chat (
    id integer NOT NULL,
    id_sender integer NOT NULL,
    message text,
    "timestamp" timestamp without time zone NOT NULL,
    status public.status_chat NOT NULL
);
    DROP TABLE public.detail_chat;
       public         heap    postgres    false    656            �            1259    65572    detail_chat_id_seq    SEQUENCE     �   ALTER TABLE public.detail_chat ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.detail_chat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
    CYCLE
);
            public          postgres    false    206            �            1259    65614    files    TABLE     �   CREATE TABLE public.files (
    id integer NOT NULL,
    id_detail integer,
    name_file character varying(100),
    type public.type_chat
);
    DROP TABLE public.files;
       public         heap    postgres    false    670            �            1259    65624    files_id_seq    SEQUENCE     �   ALTER TABLE public.files ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
    CYCLE
);
            public          postgres    false    211            �            1259    57548    participiants    TABLE        CREATE TABLE public.participiants (
    id integer NOT NULL,
    id_user integer NOT NULL,
    id_chatroom integer NOT NULL
);
 !   DROP TABLE public.participiants;
       public         heap    postgres    false            �            1259    57578 !   participiants_id_participiant_seq    SEQUENCE     �   ALTER TABLE public.participiants ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.participiants_id_participiant_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
    CYCLE
);
            public          postgres    false    208            �            1259    57421    users    TABLE     �  CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(50) NOT NULL,
    password character varying(255) NOT NULL,
    username character varying(50),
    bio character varying(50),
    photo character varying(100),
    phone character varying(50),
    isonline boolean NOT NULL,
    type public.type_user NOT NULL,
    "timestamp" time without time zone NOT NULL,
    is_active boolean
);
    DROP TABLE public.users;
       public         heap    postgres    false    667            �            1259    57429    users_id_user_seq    SEQUENCE     �   ALTER TABLE public.users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_id_user_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
    CYCLE
);
            public          postgres    false    200            �          0    57538    call_history 
   TABLE DATA           C   COPY public.call_history (id, id_sender, "from", "to") FROM stdin;
    public          postgres    false    207   q7       �          0    57467 	   chatrooms 
   TABLE DATA           <   COPY public.chatrooms (id, status, "timestamp") FROM stdin;
    public          postgres    false    204   �7       �          0    57431    contacts 
   TABLE DATA           ?   COPY public.contacts (id, id_user, relation, name) FROM stdin;
    public          postgres    false    202   �7       �          0    57479    detail_chat 
   TABLE DATA           R   COPY public.detail_chat (id, id_sender, message, "timestamp", status) FROM stdin;
    public          postgres    false    206   8       �          0    65614    files 
   TABLE DATA           ?   COPY public.files (id, id_detail, name_file, type) FROM stdin;
    public          postgres    false    211   x=       �          0    57548    participiants 
   TABLE DATA           A   COPY public.participiants (id, id_user, id_chatroom) FROM stdin;
    public          postgres    false    208   >       �          0    57421    users 
   TABLE DATA           y   COPY public.users (id, email, password, username, bio, photo, phone, isonline, type, "timestamp", is_active) FROM stdin;
    public          postgres    false    200   I>       �           0    0    chatrooms_id_chat_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.chatrooms_id_chat_seq', 4, true);
          public          postgres    false    205            �           0    0    contacts_id_contact_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.contacts_id_contact_seq', 2, true);
          public          postgres    false    203            �           0    0    detail_chat_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.detail_chat_id_seq', 78, true);
          public          postgres    false    210                        0    0    files_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.files_id_seq', 5, true);
          public          postgres    false    212                       0    0 !   participiants_id_participiant_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.participiants_id_participiant_seq', 9, true);
          public          postgres    false    209                       0    0    users_id_user_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.users_id_user_seq', 8, true);
          public          postgres    false    201            \           2606    57542    call_history call_history_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.call_history
    ADD CONSTRAINT call_history_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.call_history DROP CONSTRAINT call_history_pkey;
       public            postgres    false    207            X           2606    57471    chatrooms chatrooms_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.chatrooms
    ADD CONSTRAINT chatrooms_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.chatrooms DROP CONSTRAINT chatrooms_pkey;
       public            postgres    false    204            V           2606    57438    contacts contacts_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.contacts DROP CONSTRAINT contacts_pkey;
       public            postgres    false    202            Z           2606    57486    detail_chat detail_chat_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.detail_chat
    ADD CONSTRAINT detail_chat_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.detail_chat DROP CONSTRAINT detail_chat_pkey;
       public            postgres    false    206            `           2606    65623    files files_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.files DROP CONSTRAINT files_pkey;
       public            postgres    false    211            ^           2606    57552     participiants participiants_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.participiants
    ADD CONSTRAINT participiants_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.participiants DROP CONSTRAINT participiants_pkey;
       public            postgres    false    208            T           2606    57428    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    200            e           2606    57553    participiants fk_chatroom    FK CONSTRAINT     �   ALTER TABLE ONLY public.participiants
    ADD CONSTRAINT fk_chatroom FOREIGN KEY (id_chatroom) REFERENCES public.chatrooms(id) NOT VALID;
 C   ALTER TABLE ONLY public.participiants DROP CONSTRAINT fk_chatroom;
       public          postgres    false    208    2904    204            g           2606    65617    files fk_detail    FK CONSTRAINT     �   ALTER TABLE ONLY public.files
    ADD CONSTRAINT fk_detail FOREIGN KEY (id_detail) REFERENCES public.detail_chat(id) ON UPDATE CASCADE ON DELETE CASCADE;
 9   ALTER TABLE ONLY public.files DROP CONSTRAINT fk_detail;
       public          postgres    false    206    2906    211            d           2606    57563    call_history fk_participiant    FK CONSTRAINT     �   ALTER TABLE ONLY public.call_history
    ADD CONSTRAINT fk_participiant FOREIGN KEY (id_sender) REFERENCES public.participiants(id) NOT VALID;
 F   ALTER TABLE ONLY public.call_history DROP CONSTRAINT fk_participiant;
       public          postgres    false    207    2910    208            c           2606    57568    detail_chat fk_participiant    FK CONSTRAINT     �   ALTER TABLE ONLY public.detail_chat
    ADD CONSTRAINT fk_participiant FOREIGN KEY (id_sender) REFERENCES public.participiants(id) NOT VALID;
 E   ALTER TABLE ONLY public.detail_chat DROP CONSTRAINT fk_participiant;
       public          postgres    false    2910    206    208            f           2606    57558    participiants fk_user    FK CONSTRAINT     ~   ALTER TABLE ONLY public.participiants
    ADD CONSTRAINT fk_user FOREIGN KEY (id_user) REFERENCES public.users(id) NOT VALID;
 ?   ALTER TABLE ONLY public.participiants DROP CONSTRAINT fk_user;
       public          postgres    false    2900    200    208            a           2606    57441    contacts fk_users    FK CONSTRAINT     z   ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT fk_users FOREIGN KEY (id_user) REFERENCES public.users(id) NOT VALID;
 ;   ALTER TABLE ONLY public.contacts DROP CONSTRAINT fk_users;
       public          postgres    false    202    2900    200            b           2606    57446    contacts fk_users2    FK CONSTRAINT     |   ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT fk_users2 FOREIGN KEY (relation) REFERENCES public.users(id) NOT VALID;
 <   ALTER TABLE ONLY public.contacts DROP CONSTRAINT fk_users2;
       public          postgres    false    2900    202    200            �      x������ � �      �   D   x�5�1� ��{L&w�������������HzzX��]���dKV�TP�Ͻg�[��5�� <���      �      x�3�4�4��,K�K�����  7x      �   ]  x�uW˒�8<{����� _�L��+�F�청�f�~��T$�搩I�э6vs��6�q6F�]�wc�N�Fy���6�pm��-"��m�PG�h������\���h#����N�m�%ϡ�4P%�O.�۵����E��~7��]=���K΃�u��P�7��2���_Ã�����ߺ
&~�ҍIR9+֡�|=����,��ЉvȽ�ڏ�x>�|��}^��Mc�N�zZ@��r⒯8���(�Gy�C	�H���H���j_�	�=r��c��#���FF�*)f�w���Ka�
�S�y���t_����Aj��)��ov�}dQ�N(N�!芴�k'�|z�/,k�K��o�|��t���Ҹ"�%���&�\M�s��Dw��ň�.�!b��1	�Y��!��-��n�z�,�Qc����5���8*����q7�]wi�����VY9nM�%�*.����q��nY �i�b�T�4Һ����U�"sl�"*Mn��]���x�]2��Cu�3`u���e'n_ ����T���U��Ñ�P�C�����X�)&j�a�*���v�R4��/5p�h�
�0K�۴o{��o�U" �T�A���h'�>_�W�=�,UO�T�̣�����"�j��e�]��9��!z�Pgy����.2#&��2w1����m{_�PtMvV����5���y�O��cus
_p�L>v���2�"��Rqbn�֏=3��g��|?�E4̏�t���uiE���d
>��uܥp2�ȶ�e�w��4]�M���:�b�q����C1�!�ɱmO����O�|�"��
;le�}�'��|���7�p;���ͯJec���*�s揌�b�I*R��//���1�1W�?3]�[Ҿz�c�8�'x!W��2�e8r�Jg�/���;t뻦�d	�	�w`\��5�q�R��;6��9�N����������⡎���������:����t�w9n&��U�2�� mۡ������|G|�;��6�z�g�a���A�g'~�dy%@=�QdKkx�֐�������	�~GXn0i�u&{���b/ԍ�*���]�z�(���-�3����t~[C1%�R�����ಐ:��JX	S����pW.��Ma��>�:�����ݱ}TkwF���Z�Κ��
�$�qU&`����q}o	�%0���fq�<0���\B������x\b�I�C�y���gZ�3�W�)��9�tQA����8���5{�	��O�������e��?�����kXp�󕙰X�w���w��p�9q����K�M�Z���d�"�\
FU�q�������#�v"SX�[������o,      �   �   x�}�K
�0Eѱ�;�lY�^
ŴNHIӐ�����4x:\I`m�\�K׏S=��2ԥ�������ʂݭ�}0)���%��d�s���=~0�����F1��H)lDw !Ŭ����R�wrƘj�Ul      �   +   x�3�4�4�2�4��@Ҙˌ�HZp�q�pY�&\1z\\\ i�       �   ?  x�u�Ks�0���Wx�-F�-Y�i(� N�l�-������ɤ-:sw�ι�9W2�:6"�שP��ߢD�X��<������39����D�4��EQ�kxl��"�Y���xR,7�b�6?c��L:M�⠽���e,Π��L�@%"�� Q�L�3�bb�����a�k�kW��>4��k���M�C��2�1	79�T`+J�l�٘�r��z���_�%��D������9�����s�{��'W/�͒=��˷E�
2)��N�}u�3L�3LH?̪�Pw�H�8�C
�����N(��H�)�s��r5�u�]��5u��I������^O�٩Ϳ�ގ�����FV4z���:�*�@}w�~2Pv�Q�B��c0n�?u�P�2 ��6���O�Q�q�E�P��M�s;�61l��-�et�-���$�;ރ���X��j@5�b�:{�n|�;�j\G�� ��<]��Zg6�6�:�X1a������f�3Ϸ�g�q�r>jk7��+'s�Gp�W*W�T���[�*>T���w�J� hC��f!�v���^��'c     