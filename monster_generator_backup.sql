PGDMP  %    
        
        }           monster_generator    17.2 (Postgres.app)    17.2 (Postgres.app) )    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    58385    monster_generator    DATABASE     }   CREATE DATABASE monster_generator WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';
 !   DROP DATABASE monster_generator;
                  
   ziskapants    false            �            1259    66536    game    TABLE     �   CREATE TABLE public.game (
    id integer NOT NULL,
    user_id integer NOT NULL,
    name character varying(255) NOT NULL,
    created date NOT NULL,
    description character varying(255) NOT NULL
);
    DROP TABLE public.game;
       public         heap r    
   ziskapants    false            �            1259    66535    game_id_seq    SEQUENCE     �   CREATE SEQUENCE public.game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.game_id_seq;
       public            
   ziskapants    false    222            �           0    0    game_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.game_id_seq OWNED BY public.game.id;
          public            
   ziskapants    false    221            �            1259    66545    game_monster    TABLE     �   CREATE TABLE public.game_monster (
    id integer NOT NULL,
    monster_id integer NOT NULL,
    game_id integer NOT NULL,
    date date NOT NULL
);
     DROP TABLE public.game_monster;
       public         heap r    
   ziskapants    false            �            1259    66544    game_monster_id_seq    SEQUENCE     �   CREATE SEQUENCE public.game_monster_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.game_monster_id_seq;
       public            
   ziskapants    false    224            �           0    0    game_monster_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.game_monster_id_seq OWNED BY public.game_monster.id;
          public            
   ziskapants    false    223            �            1259    66527    monster    TABLE     �  CREATE TABLE public.monster (
    id integer NOT NULL,
    user_id bigint NOT NULL,
    type character varying(255) NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(1000) NOT NULL,
    hit_points integer NOT NULL,
    strength integer NOT NULL,
    dexterity integer NOT NULL,
    constitution integer NOT NULL,
    intelligence integer NOT NULL,
    wisdom integer NOT NULL,
    charisma integer NOT NULL,
    armor_class integer NOT NULL,
    initiative integer NOT NULL,
    speed character varying(255) NOT NULL,
    actions character varying(1000) NOT NULL,
    legendary_actions character varying(1000) NOT NULL,
    resistances character varying(255) NOT NULL,
    immunities character varying(255) NOT NULL,
    languages character varying(255) NOT NULL,
    skills character varying(255) NOT NULL,
    senses character varying(255) NOT NULL,
    saving_throws character varying(255) NOT NULL,
    challenge_rating character varying(255) NOT NULL,
    size character varying(255) NOT NULL,
    alignment character varying(255) NOT NULL,
    proficiency_bonus integer NOT NULL,
    created timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    modified timestamp(0) without time zone,
    image_url text
);
    DROP TABLE public.monster;
       public         heap r    
   ziskapants    false            �            1259    66526    monster_id_seq    SEQUENCE     �   CREATE SEQUENCE public.monster_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.monster_id_seq;
       public            
   ziskapants    false    220            �           0    0    monster_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.monster_id_seq OWNED BY public.monster.id;
          public            
   ziskapants    false    219            �            1259    66577    session    TABLE     �   CREATE TABLE public.session (
    sid character varying NOT NULL,
    sess json NOT NULL,
    expire timestamp(6) without time zone NOT NULL
);
    DROP TABLE public.session;
       public         heap r    
   ziskapants    false            �            1259    66516    user    TABLE     (  CREATE TABLE public."user" (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    archived boolean DEFAULT false,
    admin boolean DEFAULT false,
    created timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
    DROP TABLE public."user";
       public         heap r    
   ziskapants    false            �            1259    66515    user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public            
   ziskapants    false    218            �           0    0    user_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;
          public            
   ziskapants    false    217            �           2604    66539    game id    DEFAULT     b   ALTER TABLE ONLY public.game ALTER COLUMN id SET DEFAULT nextval('public.game_id_seq'::regclass);
 6   ALTER TABLE public.game ALTER COLUMN id DROP DEFAULT;
       public            
   ziskapants    false    222    221    222            �           2604    66548    game_monster id    DEFAULT     r   ALTER TABLE ONLY public.game_monster ALTER COLUMN id SET DEFAULT nextval('public.game_monster_id_seq'::regclass);
 >   ALTER TABLE public.game_monster ALTER COLUMN id DROP DEFAULT;
       public            
   ziskapants    false    223    224    224            �           2604    66530 
   monster id    DEFAULT     h   ALTER TABLE ONLY public.monster ALTER COLUMN id SET DEFAULT nextval('public.monster_id_seq'::regclass);
 9   ALTER TABLE public.monster ALTER COLUMN id DROP DEFAULT;
       public            
   ziskapants    false    219    220    220            �           2604    66519    user id    DEFAULT     d   ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);
 8   ALTER TABLE public."user" ALTER COLUMN id DROP DEFAULT;
       public            
   ziskapants    false    218    217    218            �          0    66536    game 
   TABLE DATA           G   COPY public.game (id, user_id, name, created, description) FROM stdin;
    public            
   ziskapants    false    222   �3       �          0    66545    game_monster 
   TABLE DATA           E   COPY public.game_monster (id, monster_id, game_id, date) FROM stdin;
    public            
   ziskapants    false    224   �3       ~          0    66527    monster 
   TABLE DATA           i  COPY public.monster (id, user_id, type, name, description, hit_points, strength, dexterity, constitution, intelligence, wisdom, charisma, armor_class, initiative, speed, actions, legendary_actions, resistances, immunities, languages, skills, senses, saving_throws, challenge_rating, size, alignment, proficiency_bonus, created, modified, image_url) FROM stdin;
    public            
   ziskapants    false    220   �3       �          0    66577    session 
   TABLE DATA           4   COPY public.session (sid, sess, expire) FROM stdin;
    public            
   ziskapants    false    225   _      |          0    66516    user 
   TABLE DATA           R   COPY public."user" (id, username, password, archived, admin, created) FROM stdin;
    public            
   ziskapants    false    218   �      �           0    0    game_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.game_id_seq', 1, false);
          public            
   ziskapants    false    221            �           0    0    game_monster_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.game_monster_id_seq', 1, false);
          public            
   ziskapants    false    223            �           0    0    monster_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.monster_id_seq', 336, true);
          public            
   ziskapants    false    219            �           0    0    user_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.user_id_seq', 18, true);
          public            
   ziskapants    false    217            �           2606    66550    game_monster game_monster_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.game_monster
    ADD CONSTRAINT game_monster_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.game_monster DROP CONSTRAINT game_monster_pkey;
       public              
   ziskapants    false    224            �           2606    66543    game game_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.game
    ADD CONSTRAINT game_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.game DROP CONSTRAINT game_pkey;
       public              
   ziskapants    false    222            �           2606    66534    monster monster_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.monster
    ADD CONSTRAINT monster_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.monster DROP CONSTRAINT monster_pkey;
       public              
   ziskapants    false    220            �           2606    66583    session session_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.session
    ADD CONSTRAINT session_pkey PRIMARY KEY (sid);
 >   ALTER TABLE ONLY public.session DROP CONSTRAINT session_pkey;
       public              
   ziskapants    false    225            �           2606    66523    user user_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public              
   ziskapants    false    218            �           2606    66525    user user_username_unique 
   CONSTRAINT     Z   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_unique UNIQUE (username);
 E   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_username_unique;
       public              
   ziskapants    false    218            �           1259    66584    IDX_session_expire    INDEX     J   CREATE INDEX "IDX_session_expire" ON public.session USING btree (expire);
 (   DROP INDEX public."IDX_session_expire";
       public              
   ziskapants    false    225            �           2606    66566 )   game_monster game_monster_game_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.game_monster
    ADD CONSTRAINT game_monster_game_id_foreign FOREIGN KEY (game_id) REFERENCES public.game(id);
 S   ALTER TABLE ONLY public.game_monster DROP CONSTRAINT game_monster_game_id_foreign;
       public            
   ziskapants    false    3552    224    222            �           2606    66556 ,   game_monster game_monster_monster_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.game_monster
    ADD CONSTRAINT game_monster_monster_id_foreign FOREIGN KEY (monster_id) REFERENCES public.monster(id);
 V   ALTER TABLE ONLY public.game_monster DROP CONSTRAINT game_monster_monster_id_foreign;
       public            
   ziskapants    false    3550    220    224            �           2606    66551    game game_user_id_foreign    FK CONSTRAINT     y   ALTER TABLE ONLY public.game
    ADD CONSTRAINT game_user_id_foreign FOREIGN KEY (user_id) REFERENCES public."user"(id);
 C   ALTER TABLE ONLY public.game DROP CONSTRAINT game_user_id_foreign;
       public            
   ziskapants    false    3546    218    222            �           2606    66561    monster monster_user_id_foreign    FK CONSTRAINT        ALTER TABLE ONLY public.monster
    ADD CONSTRAINT monster_user_id_foreign FOREIGN KEY (user_id) REFERENCES public."user"(id);
 I   ALTER TABLE ONLY public.monster DROP CONSTRAINT monster_user_id_foreign;
       public            
   ziskapants    false    220    3546    218            �      x������ � �      �      x������ � �      ~      x�Խ�v�F�6x�~
,_���L�3���*ӮcW����u��/@ H@�$���~�~�~��CD I����9.[A �����r0�iR�yZ��q�1p�*s��A����{g>�y.�MU�i��ÏD⸉���<t�@8�7��-�M(�EU�n]_n�9��#��x��0��'�[�.��M��sD"������,��p��#��p��pc�����Dl�t��;��
ǅ��~�'���Q��8y����-� LJ��߂���9�:��2��`9�W��l0^&�1�3����t�lʛ����΂~�_��VEe薥���9_�3�;|�!u��❓&��������z�{(n�~�>~��&"!�?���"���q�)�L9tr�z�3���J7ߊ���9,�9���؇����8,��3⻸0�������2q~��~H�E`>��T��x�?U0��z-o����<xlY�<9a�o�����N\�ST�'N��:�>:��I<�"�=���[yzp��4%S��YG��iR��c-�]��F��,�W�؄���J���6�����c�ß7y�Jغ>}P%�ȋ�V8�N���J�s�$�!g��t��"+�x�8��ܕ`����}7��C:}�����-�p/��	]]�6|�vXV|�9\2����'�N��EU�n4�����,���O?�p�(����/���O�b����<�TeQ��?����h��N'˟~���[�T���*��l�M�
E��&K���d�9$O�̂�9a�����X� nF���4��j�%���7����j�wKXn:R��-[����o`/�E����[�n�}���ѐ�
��7�s)��a���`��lzx�<A ��<��;q�/h�{Q��i�o�E���{/H�S����~��i�6i�n��q񖿀`+`ׇ>>62ʠ$�؋���Uy�{��	�,�$�9�:�ͭ�J�׋]\[y<<7��Ƣ�cWpR��"�<\G�f0�K!�"t@�t��-E����M�4ի]KR��,Nk٩�rNz..�k�(<W������xiC	�D���M
�>w��*���(����n���UPC��U��@��=o�ܕ�H���:����xҒ�J�eU��pu.�����YE��"���m��VҢ�ߘ7���RޓD'�&CԢ�S�R!��)C߃@^���
��%�Ŕ��g��QS��I$˹�qO{D��z���"4�U�n�E���n�ys������~����W���-��J���Q�� m%���^6���$�\8S!<�7�<���lKR",w|8�G��^Q�eV�BzB��e$��L�)>`z�����&����ν(�vx�h��$��p`n]P�k>����oY��q$�+4�p�fi�;��֕D��E�J��M<�o �J8(|��Sx�WT.��ˇ��@��8�}!P��(y]�x�,E��(��t�j�0���p���!ޞ:M0�j
2���Ad�8�<�`[�3��@��枨�(N������[j._�~�s
jb�������ֶ֛^�|�9�GX�iܒ� �j��[��R����I��;��DK��+C$Ji��!,���e|�I�̹������q4�{t���{őmơa'ߒ�6�&@��Z �u��A7�Oki�>��2,�Yu�UUVqI�h
���\���4���_�. F� ��xV�e�2�+d�fQxWX.X5�nW�a�p��K&W�V�+��E�ٓ&l��v�\Ge*��Hp[r�+w�z���pN���-
�Î�d�m/eg��VB�-�PX���`eԅ�J��I� �z��5'��ݬۿ�U�Z��(�k�P��\0���A���������&���Q�1�zd�&nOؐh�x.XCaI���S�{qD��O
��i��Y��/��8��R&u�qX�N�Y�ȃ�l�e�[|Cl5���������d�IGi�ȗ"���׉m=|��ڇj���[��KÂ��jy���}�a��u
�:7�C�^���S�����
ύ��N�ܷJV�Kv�=�=�����7MS����&%8��V���:�(M(�R�M`�3>�n�;v��������w�ݵ�G��T���s�o_�L�
O/����呱��{=LP^hhU�R�3�y8�ΤW��#�x���С%<�v�[Z�iVھO�̟Zb5?�T��ۥ�X��մC�I!p'��z��,�$��*��0�U�_�JhK8�S�{��Q�{N�DCq��'��̗cCTQ�e� ��I�^�YL`����z����(w`�W��gDF��N�~�j��rP�`��Z8�$���C�/��]�2���o�`-J�����/�U�Qqh���	�'��#��<�]�P���	�bT��|}d+���l���j��r�\�a뤴�����}��?�����la�O� d�OJ#u���k~��Oma���1�SIU�'QZ�CCwZ�_�
|�Ri�r�)kE���]�{���nR�k��Y}���(���IS�Mː�#���2����^��������!_�F�f�a�NV�c��u��p��0Ԅp�ɺG��?����3	�@kQ���FQ�l}z�5��o�`T���XSCnA�$�۳�O���`8;�C�!�]�\~��<��zN8��8]?��.���A�^e	�ټ�Vn��&K:�R�#8�3�8�S�N�'�t��I���M���/��Ѝ�W����7�l�Udjb�
F����G)ܘ')$�$��$�77�����9 S��S�#���Z�Z�A��) �9�q>����᪡}|�I�i2���(ze=3�/�������C?XO���?�����������7��w��6���%�!�dg�j�7�"��Cڰ2H;p�V�(��6oQGax;���
�xQ�i)^/�}�G<C���b�A��}?��t�F�
��ฮ�;����[طX4$9 ���&#���J�%�C1/a|"�hM�ټ��!�2[��t��>�>l=�|����=}~�G���I�D��y�HqdJ��F�I6"O�>�4�O����|a��u������t4���/����c~���>͢-���7��C�8b��cؖ�q~aÝ��Cr���1}G�0�p}���{r�պ?���I_��T�� ��2������=�8��St��
�%؞L�MU�@٤���-XI�c7����=����t.^7p��Td���:����>��ɽ"�dx�W%����7r�V��x��eR.���P�C�<��*g��u�70��Χtk���Q�ƱuF9V��Y��IUKI�-��a����d�����	xq9j\:ܰ�q�&��=��ts���`+�Qu�5M�g���K�x�O��0TIfl����	
��Z` �!l�9ju����!+z�� " #���&���p~�K�M�c;(��Q^�Yx`'jq=��A�R/��4�Y�ԫL��t/�ǫ�'�	� ��>�i��� ���&��f�xB�E��Ї��+�_�#�8s��V�u8�����/�!X%���T"��dP����1^/cwY��a��Y;�"+��=��>��Hz|���Z�cP����>o#�|Z��J�E�sK����G����1%���qo(Vs^���F����%�G��г�͂��ܐ@�C�?=�F�.[��]�?>����S=�"4����Wg�%�P}��>6F�3��>��u�5�;����1�bTlBĸ��L
�T��í�0X����6'_d�w���Fr��w��C��I�<��!�/ఖ�"��6�z��C����b�MtlϫGq���҃��]/"���e�4졕��ɍ!�}\�>Ԯ��q5)�,��RF��x�g������x���Ye-`��#%)�9GP����pY���3�HzJ�'���8�ohq='��<�Τ#U>7"����\�&sC������]�g���q����C�    R�����bt���+�nW��|;��:�e�{�s
��`I}P),�a�;��ûU���2��)��������rJ��O�G����.� �T!��*�J���q��
��]�]x�ؤ8Dm����-�Ϋ������3���@<�¸�S��h���<W���{}0u��/l�ˌ����Ÿ�WJg/����d���{XM�YU���چ2��9,�al�K�9�­[� �@���\q4qKn�:�Ȥ���5=��8�$12x$z2�d��=�\��B���IWc���#�T�5sk��"k������;v�qjc�f�I8�+�:���u�{6t�@�{�Ϗ�AK�� �����W�����b���h�vr댗�f�w�ۗoV��F��;���mx�G��8};ڬ3�����a�TG�CU6ё|�غU��@�x��E��Ț�2S�8K��V�Q�zE�]_�Oe_{H��P�E�2�����\Y"��4����
����~�X����/�ӳ*���ZL�*c��q�"��o(F�n�(bKO°��.�JP8�d��d�w��t�0t½�n�'�sE�2���-�a�4-���԰e��~��372��F(���w���t��5~��Im���F��F֙Ay���I˗�娵2�pوr�s�g�������`���-����I��F��&���G�_x
;f<���g;�w��.F��t
&,��<�n��HxZpKع�i#}G��M��jb�;�}y����"|�����Y�����U����!����Ҵ�p����(:�y%�g.(lN.}�U9i�ȍU�K�ֈ�^����sps�xY��N4k`�/�2M�B>�y��֊؛Wj� P��Q��׸�\�9@7�QjU$�L�ȊC���I��1{~�}8C�p�g��?�R3�S��x$�
\���������� �y���pDX����NQ^�B�!J�m�r~X5F;��vל�����R#�B�@Ey��is��%��F���M�D��Lw��hm��@C���^�p��
'�vn����f�$ֻ�!������i�F)L���o�	�E"�p�=B4*�T�M���(΂�ɒ�n��->�R`��	@��pu��9��a�����C����+HiH�2�B|�r�`�0��X��{��r�?�]�*���
��x�5����aL`��Ń��}`�Lq]Q���cӸ9�2�����b�"��dj�RD�J�B�Dr����>R�Q!�]P(�k��)t#��X�y;��o?�	GZ�Ƣ⛡=#ښV�Ү�q>S���0բ�hUIS��;�{��05P8St�Uq�0�S6�Ъ]kʓ^����,����E����*��QB����E��4$3�0N�LT^�ז���:��dS/5oN�5爵s-�$ɴG���Y�ܐ��g��@y��Ō1���]����qmi{�oX~+�9͌������*/�ɣ�9�rI3�S^y��kzLK0��8�LFz74ܱ��i�Z0�>�GSP�;�?,��+�bP�!���t� 'OA�/ⰎB������Y#�����pri�cQ*���s,�X�#�P%m�J�p�`� ��f`�G��%�*�����,��Ɣ��2�NX�r�ഒY�X�X����=�uƁ%����d�}$sH�0�����|.�� g�#i)u �7��ϛ�q�l��\�3eRwރ
�Mn��aJ������.�6��������W����`%%:\�� '#�P�珤l=�*����о�X��*AK�(I�9MvwWz�@;\C�W���ն\s9G��~���R��>�r�T���#k��.�,�h�f�dڛ8)�|�:���l�����_x�0�W�����˷{��p�/�;]T�̬N�Z�����4��)�BY�q�ʋ�</WG5��P�=#��1�(Wd c�B払a�`��ʛ4�K���/�{��CBI]���/��d���]���ˌ�.;�>>�`�X��K�cl`8���J#O�b��D�'*�p2�b�w�
Z��#K�	ǌ��I�����Jw@O���gE��i�.	�í����f֋�z�޴Km�HQ�(b���G�%�eu~C�8�S� �/�O���O"��M�ď���-͂`�iY#���B��Ǝ"3F�.��Ƣ��d�I�<ʧ�h�4[`�Ԏ��5:P\� �U�6� ��
<飈�RBl���CE�]R(ͥS&�~K�Uꇒ����"�z�#3��<62��[�J�C ��.���>�r�M�0�P��ꦐNB_,�����q�"M�D�����%�z���w��NUp�.F�` nb���`>L��3�gҁ�:N|�ΰ?�d���@񸳈��H�r1�5�<6k�nE��}��?�n�֠v��q�y�x����`q[�͙J��80�S�S�%�H+T�M|x�~E�&x�&Ӻ�W�����d��v��b�c$;B,�U�Q+Ė&ess�d���m
�1Mn��n=8��51H�T�+�yI輡��X6U�jP�4������-	�.
�#Q��	DxB�t"qq�d��L�b:)�����$�G�1$|>k >�j�N�H+�T�����g0�gҾ�>�5v���;�D���9���*֣�-SLr��LN$��f#�Y�tN*��Q�q��Q���L����w���j�6/Ł�;�"�Е��L'���fn[��
�XH�(y5�h<3ݙu�̂���)����.��,Wvx�8�h&�[J���e�q
�q��k���gp�E�z\�z)��:�1�279��2c5��.RQ�0�E�qma��������E��d�/-.<K0�9e�bQ�~�5���kh,l���^.�/#&zr+��sI����
��H�+,�N<�k��R��%|\�
Bw*�0;+�_�ػ�I���5{h����y$�2���:�ͯ��Vox�^��R������Ҵg�;�7�G���e�)��S���D����x�Tf��V��@e�IƦ̛�`_�Ḑg+Ng���k�����tT�ŧ�"8��:}�&��h7��3���j	�d�����Hy��)�Zjr�-S{F�,�K�}������`m�Q7��}clGb��K�0�D�REc@29���`SEx@���ƴ��w�Ѧ����4��	���s���b��PH;
��X����?���-ǃKq_�V���U^+�g"p��q�\�j/D�y���*q��+�|��ߚ�;�H�j�"��$�R��ѻ��,�5^����{��6y�j)i��`z������Ȑ�|��%�-���f�RTEXt
@��\�h�
/UH��*�ϫ�bi�|O�?[���?d�ýx�`b�lCs`�"� u%(>��o�[� ��C��v�H��0)�t���돻�f.�����,G�TȾ�hz��K��E��ҕ�I�T[���@��Ēas|6?����@���$��7`��z	�l��c��*�����SQ�&(�M]a���C�i��XB�˕5
���vy��It���R0YW&x9����v*��Q��+/���Gi�ٿ$�*�-셓�p�, ��sd~�
lE�Ir�9��˔�H�_���(���jԈ��e0IN�Ω�l�e!���E6����?;��T��#���ma�]r�9f��7����M�W����Q�-����	2ި-��4��73J��7��>v��+_s�n���:�(3Y��,�G �_hۑ �耸ʚ�	��$�	|$��/I��>��P��3l�^ԅA}���53t)IJ���H�LA���hG���W����،6.7�m7N��4�H��{���Z�}��-���#O�$W�$�����%��Ŏ��m�#uX�]eF2��6 -�e�"�`���45���׬�|S7���H��J䙜�S�_����.LU<4�'#��y�$�3��L$�̉�g$ǚ�F9�d�ƄK	�Ds    �h2f�V���7�9l�ޟ!�Yq��<6�o��覱��7pd�cD _
�x�;넠�9�	�������g���S$Ü8����'s+oܙ����}e`�I�lX�W��n�r���ϰbOW�_�4�j:��똾���ֈv���i��܊��u�X-8|;6M߻j{�����8Мe%���#����˞��U:��6��L�8Ɣe}/%l�����82S�ދ����&��$7��	�\��1���Qq�e�u4	���t��:�H1�79#K�8�W�r,Q�d9J݉k��;�<u��+g	_L<"vp˔�LVT����c��Q��4�6��w���B��?��C���>��7@#�xl�1Fί�ȡ���O�p�4_`�p�|'���u�A��b�c[e�|k���+:i��A\N�<0��C%,`���_)�u��N����h��y�{X����-s��1܏��E,:l:��?�b�2�J�S�X`����l$���cFN��DR�m��C���}R�ؤK�G��.XA�0,]a�WT\�D�0�0�3��}��ȣG�0d<.����7��kX������!{i|LK��z�t�40�����ؐ�S�2j/-m<��������C��?�}Tn,"�G�u_��r��pFNu��5�ܸa��;�eI��~
V����z]�t2س:�O�Fb:�&g���U���㭃1�O�#*7�$v��3JdҚ�DO�<DahX9�R�\E�R!BQӇ�����Ĥ�h��ܮ䲎`5fM�����wY#�4i��l�i�ΙC�5�ʸ�j���xxpƹe�z���食�L�guY�6&�lYa��7Hy��-/�l���c�,�\̮
�o�k�.�F�b=Y=,��!����j��G�嘣@a���ܔ��y�àʠ�t;	�Bu�yȆ�l�Hh)q�+	<t�]l��I`}�]%d�X5�%��$������'Ǘj�A ���HVT)����	���)��HgV��K��	��5����
�k��H��k�dkU]i�cE8 sP��fZ	!C��g���^`��AHEJ�G���_9ќ�#�7Ȭ�4��\���0p�na��!�>۲������A�)	��
�uF�g�D�#�"�u������X�(���z��ꂅ���sʓ�K�G8AUV����)�)*���K�r~V'/e4o���ʸ�r�����0`=v�gE@��5���I��Վ|2�����wJ��J���t�ong�MoxqhRȀUm1{�Y(���(����R �T��fa�]�}g�j��ml���m*���_+ d�}jUS��S�Ia=G�����`�0��`2|��NT�&�6Z\�����ll�i���lx���D�e�L޹��J���h;S����%{�I��4g(��2�}�Pa�A3n�-��)��Łp):*1��/b[�h�F�:?Y!а.q0SH�Ze���O0,Ƽq~�bJ��X�?�
����և�tu�*OH��A|�,�I�β����"38i��R+�%��`]����(�fG� ��(�ޑ!'��#��6���]��q�<�p#ټң�c�ʕ�7�!��_A2�Gf�T-Uo�T�HU��]^��	e�p+�����b9�Z���y��Ԥ�z�؆��y��N�/[�?�H�eX�)m�HH��7��P�]&v ����h�4y\�E6�T�,�����no�7�E�-!g�ǩ�2����K�y�*�,����.�h';�0/U��C�%�6d�b�7A����Q
�:��nY�(
��	�Pܻ���2�_��Y}Q���W	jl�����F��bT�1 ��d9,S�^)��+�ث�����1x�i䵩�m��6��֡1eⰭ�u°L]�hꞼƫ�^~����<g�h�u]A�Fp�����[���db0Y���]<D�?{���*�a��e�18Y[��$��Y��C
/*�Ɩp�WM��8�1�%�PG��Գ���#E��Č��" �-	��o)�$|�Р����<Mc�؆aC'Hc�k�������G�<�v�AwrU�d�e��n=�<0�<��puf�.���G�6��{����UA͉c��I��j=��L��+Ő�w�t%�Uu�Kmv�q�L%���6�Z���b�o�s)����c�Ω�bw���߾��ߍfW��Y�FY��>��x|<d���=����@�S����Ri��C*W����$(���Ϣ4K}�>E�Y��UPZS�Yvt���"���D���	H�<C
tA�f��u��m��Ӡ��6ahp߬4]P�	7�q��7ҩ�:�V3�"�,�N�{���8u��:�!�g��od�G*������)�3�)�tyS��ؔ�.�j�l��F�� S�f���ś�;w`���f���d� m{2z�{'�e2��_�_�f�RVxUތ��~)/^��׸Ջ���|��u����Cc��D3c�qz�4�L�PN	���H�� ��=��r���{�/Q԰�^��k[�S�e�޶Ճ�[��e^��ӕ�O��a�M�]�����&׋VM��9,�QLgi�ڞI͙�]2a���ᑻ_��w��2D�BQ7�䎹M��(Mw�ޜZn���X%߫(����U7;0�f��鞬&!0�h���(qO����\�NuJ.��7��1�@Y�̚�J�ɦ��d��H|�r����Ty�o��S�kkV�+�f��uU�A&cL��� (��������-V��hl$>%�9��Q2��,x�7,V*Կ��J�5���~�5�`���C�n8�zL��+��ZH��h��q����(h�2���]�ƘN���M�I���`<)��U�˾Éo�����Ѿ�AL��l%�a���M<��:A!c�K����i�Ou�>S:�F.�a�p5�0����v����{H���1�=��h�ϸ�*����(9eJ�����Ԫ+�l7���[J�1�"�Ӫ�n(���P�E�3^kfu^M �!��¦�2��G��}d�:  �}��o�Q�7a-�[�G3s�p�Cg�2�_�x�U�zޥ���sO������\fZ�)W�;~v�_T㰈� �C�0��O�/	�I6�,���"���w&ԧ��=�i��Ǹ�ا��|�y��*�V��ِ�1�$��i�ƣ��_�� ^��Yb��w��]M_#Kdq��v��,Z�eu�&*�z|�,��4rXLOfIs���s��k�d�BV��v�GY��a�m[�h-UO0!\2U��k��Y�MHd��]�iTO<=5�IsIVx��
[�5X;x���m/�L�zv���H�!�X�b-�V���:Cgjs�ki�ә�~�������(s�ѩ�U�ù�ύ�X/{���v�������>�|���8)'�h���9N#��#��СPu���>������1�I�Y�D���٣�������ΕG�K;�J��w�,��`��}��{�ֳ�t��R'R=5O�[*3��$O/o�}�^�_I9���^�f�8�$�p��@KT�\�W(����\���+���+��䪡�E�b;+E��Ƀ�fl��}y�UghU��60;�=�+�C���0��(9�QN};�i13A�ޏ��v����")��ʗF$�`��v⇴�l>�*�=^Qa����Z�O�qq83��m�k�lh��r�g���G<c�������0�CU�a�	�[�28����(��7�X}EK)�=�J��ĩ��J��ɒ�.�9��B�������vIm����6ͭ�Q77[�\Cn�\I��J�ڣB�$B�X��G�9:��U�?DF��Г�~J�iy��g22�:��5�����`{�$��T�#]3B�e��v}�.�:RC�>ޖ��u{d4���� �!*�x��v�9{�`��;Z�/��|g�~�8�rn \�W$�Q�T���G��˽�1K�)��'�����`3���L����L�	B#N�����>�Fw,_(�b��3S*��ˠ��D��P0t�r�-�"�59�b�$��S�B UB�N��|�6��s�J:�}��Z     �z��31����_el<������J����=���,�ǭN���wO72z._�Z��TLg������"���+���3w^�B��.y$-�¦V
������n��K�cl�W�n4��=>c���aQ���a�Y�w�U�S��~Y�}���"��o���c�o]�E3��n����z�{:����+����>�D2�.�<�=F�잀�m�0�tK��*:��<x����۴�-�� 2�s���9�Ȇs���:PA&�3�jC�Y�JǃȠFQ��`-y~���R'{27A��� M�ːK��v�9�/�R�m5+����;y4�9�/`�#B�U�	�ez5m����d��n�CٜFw�#�O�]2-�w��e]�a���gА yL�%l$uM�*0���P�(�j
,��w��Y�����s҃�����&�B�ߎ�ۥ[N���,��g	H��e��g�;��%5��hd�WmJ�`eG
ُ�ur��'��%[� s��z�x�]aЁ���[$^�x���B#�2�l�H�I`��"yvcA�	��?�h%C<
��*���A��O��[a>�pgQ52����U��Ul@E���FMg|�l1����&���:O̡#�l ��Ez���YROBFc�뱐��0����X��Z�M�^'^F�n���Ͻ��s�h��9����J��}5�ni;�F��e��v�v	���O��\�N?4|���Ux�}L��}�>lR)�%�@�|δ��dE��y;�c`��1t*8�����ws�Y#��-͊(
%�d-����<�����+U��tv���R|-�Tj�:d���V&�@�7��3��~�[D�2l�I ��Z�ބ��F.I�u��Ta���zFʄ���gy�u��"���-����P��r�.%��_hDź��V��HZ�1ʅ[��9�H�WP�*���������Y����ȍ�Ycvq����s�ŤN�dȰ+v���nDv"�|N��d��[���[�ҭ�.�>{��d�N��f�&�ҭ]��y�z��c�Y\:%/Y(հ؊
�[�U5G1�d�nDQ:`����g�mo�o����褁CH�!	�\��1�ef��:1^�$�.%�=�JC�ߦN3(�]�i�3�sҠ#&b`٥T֮1��4�δk������+��<È�T�ݐ �D�����U��^D�Qs�ZDS�6�,�a��B�k���'��2�rX�0mB���]��N�p���-�e	P,�ȥM�Լ ��{���&�#���16[����&�:ݖ� voA�Z?���M\���H�fO�ͼO��VL�EW;�eI����@W�G��Y+����dH��6�F܌��-��+��
��>�ós�R��,w���٧�//��r
١�G+1�����::Q�H��֨ !��R8W�|kM*�nn?�Ƣ�.]N�9h�k��ż��K��lvI5#z@$��d�����]���2�Tem���9=DM��Ef�	@�s�*K&˗��L�� �8�z��^��*z�o?,�k���)��s���.��Z�;�s+v�'�.���>���?�p�$����a����r���h��ggM���pt��t��uv3B��Kޘ-oGX���%Gjk��?��h�8Ĳ`G��+�d�iS�^�2�`�`��K����u�y���t�H�Mv�`�N:E�Q�\��;}�KFW(��d.8&�ː�9%�W��#�ig$��|�]3Y2��K��t2i#�	�l9�����úm��a5NM�� H�ƭo��,�"/�]�����F��]Px�je}��f8�j�ӥ{VϝF	 M�bG����+�F)�A�sa'C���g_bg�p�{�+M��[Ŝx1�N��V;�AjN��ל�둚ԏ���-�Oug��,<^�d9�ỗ�iс�y%�w:_�s��d�h���v3�?nY4�np!��
��Tb��H�)�b�dMߑl��]X���j���%٫���RI�<{�t�	�-�W��(e���(�n�7�y���	�Q%-D	]W	3fpw"8-�̳��� � �`�(K�ٖR�Q�� <@k�����IpI�)�6(��L�z�?S��~�ʅuR/�k�v�X^� ��W�m�/���?Ev���1�/QX�;M�bbL�ϖ.�0,\*]�&��.�zu��t63���i�pL\�1���z$�n�2f��쓠��!M7!�m�ח5k���B�5�܈ĸis���]f`hGk��7��̣ /�l�FgJ9P1�y�KH��S���h��㐲�"�� 5uCgA�Y���"�c�J�I���j!dN��1�垩 �&����a��_�f�]d�F�Zf�y�T����GS��X��Y�I㵫!�96mu� �u%���rҀ��8��Q�m?���C�Y.}B��	����K������d�b�vb�E�!T����	�)��7�?�\�����PնVH���0V�Y���&Hǖ�4�L�9l)]�|���۷�(���d5j޻Mj���$ �ng��d,� B5����|Lep���-�ˁ�]��`�Cka���f�,�5t�*o`EM����o��n狙��(�!ۓ����$��2a�f��>|�b���&���E!��4>~H���¦��$���0�H%�T�����07��Hx��D]bm���Q�6�M%�,qȓ
�R)�~����N�r5K#���6M�w+��N�*l��&!���*1gb�O�/^$�����x����\T�S��n�2#a�[\�t1|������]ڲ|����G��Ƹ4�
t��Y,6Y��2g)t֘� ��K��.��L�+��зj��\�f�'��@o�[6�,���j�(s��-�-��p<-֎���*��b3��o ;}�^���\G��f��麰�Xi}m{9a��#����d��A��l�)�#�}֛9��[��_O~�J�gx'�k�<�lд��H��M�/�-���AH����4��c���1�?�(Ak�xkL3�4�ґ݊��������"\Lf3c����&����x�&�f�V�gը��A{�.��"F�\�j6aU�PG�ֆ�a��:F-��|��+Fk)��ޏ��w0Ӓ5��Y�& Z4Mi���X�⋚]�۠��W�&T�cB:�cn`{��a$���ь���"��`m#��:�ı�����L�`�׆>n��ư�C�9��3��ޝ����(�զ��Qc^�D���}|�_�+���C����׹9.��r�t���}`�ϷL�A����N���t�Kp���$�j���Y:e3�l�MK��%Hu�δ�fo��*'k�I�����iW���,O|�N�m�?�{���}\0Ff��߉�M6��o7ΐ��k�ejC`YlCv�����liO߁�K$4���;�ā�m�Q��o�W�S6B{/�>̢_ƍpB��	���)��g��
���ʁ�R��I�4��0S,�|�����(Z&Or7!~ާ�@C�b�6�����yy#"Wµ�<�f�f<���}E�jx����@C���Lby|g5���N�?�4�����:I�"n��v�H0�`(|����!-�\)�ʆ�'P��/��>,�	�_γG�.�Qk����5��<���-���E������Ւ�֩��7�z�o��X�T��wר�N�Ag��_)F¨��ۓ�o�OFV��k����-�<ж���9W�~���+�p"�PV�z��P��#����s7��������F�~�q��!�1��f��9��]�G-�lYw��~;}��ą�܌�:cWe���w��=�]��m������W@�Z`�)�f;8%?a.BMѳ���x��gO�"��� ���q���T����)�M��qa�<���k�D����xi�=�F�X5�����k��G�q��̜:�IF5gA�}��r1�E�J�]��Hm�u�|>���h�5�2��"6�MmՓz:�E�|�\�l��Z����-��W�Ż��؃UNo�#Ǡ'|D'��v(�~h��_$~�3ɵ���Rsd�=fԅ�YڮVu�M��r��N��0G�ng    ��5u���_��E���.����1ħ������N��@�:^�;�!a3N>�v��Z��S]u��LZ>_�R��_�"�v9�N��îغ~���x��|u�g�}0L3 �ח7X9(���������$��vQ	u����+a�f�����CU=��h1�ّoB���|��QTQ��C��`��Չ��Z���̈PGK!a!5�&�OW�D�^K�~��L�S�H�Ō���l.y����f��w�V�ݻ �+�i�rg0�*����PU�+7P��9�2�GO8z#�����%~/����e��ϕ̓�SAFTda��Vm��,�F�5�'�g�>%G/���]N��7b*5������6='�xe�X�����y�fx�,67kF�'W��h�Z΍v7��/��f�s�t|<���y���8M���q�)x"�����alS�o��dr6�<�Q�ԑ���mS*�R��9����#(jq8Z������I�DdQl$�wx+n.�&γ�1`fH�N��A6�D�X^�n���A�l!�)c��$�@���")��~4[�B�<uc�c����*٪�~���Ty�Ä�2@���GD���Tr-O���=G!�CB|>��dCz�`��O�k������y(����k�������I�eY�h Js������5;��L�����c7OOthX�VR������C"��1��k٭����U��L%�~�$x�Ҭ�&�ەQuG[�z��X���[�G(����aw�\eN�`U-PȮe�IE鱍4:�p�n��b�*�Q�-\E9���i��$§'%��V-����{NP��F�uT�]�DB��A����f�b<�Q��}m���E�3�k�Q�ǸUH��q"�1-R��x�c�Z���=���G]��%�m������]�D���w�RU�/���$�S^���W-<hOΟG���J��uD��K����_�����|����8%L��:ZP�oH!�� 	B_���H��ȸ�q�ħH��k'��y��J6�vkW0�������({.�s�б�I�8��{O���Q��iJ_�*b<Y\��=�2�]-�j�y
C�^�=��Q�[bȅM��G�X�}kE�r6DIF�uN�����C��.r���l	���5�*�y폐P!'E�����Hv ���D����QKA�4g�B���`#�#yx���k��p�T/ϸ�{�@(*�E.���M��j��^LwZ0zPu��=*��z=�Oz������T}q{d�֯�x�NA���¨]�Mv��U������;��d�>���5(u���m�Y��cC*�M!�4l
���Us����8/͎2�ݏn�V����}�1�h�JA{����7Ӟ��*�[�2���S���LI7[m��4�x8=eEл�^��쐹�@ي�_������ ����z�������e�I��q<j0k���&���Ȥ��t�m��IEnv���g��^Zl��w,�1"aD^s@�s�`LA%�X\Rv$�$xJ6VQ�$Q7�NQ���aNf�,Hu�ٌ����$ &rz��0?��&��M�V���?��=J�b7l��l�h3S��(e���l�j�f�%���̬zi鲻����V]c�*�+����AK��pV5M����3�&�庤�5w�5���p�
eA�q"|J�4�<[	�3hB7�)���� �g�	u�?��~g58Uh1�uq�]����F#��0��g��(/�</�C"UE�y�w�LV����k�X�՞5�B������S TY��]�pP����Y�;���=ě^IV�Xp��1*ܚ�σUmI=m��N�̌�	���:3i��f
�X!$���hй���u��_�[����ʿJ�}�s�(X��*������t�$��`�����h��Rw�坛R�L_��I�#馟C���ٖ����?A=� �յ�7u.Fj#$������N�ԉ$m��4��[��Fm35�}�t?�w�S�������1��h�y���M�)��~�y����NC-M���<�XȞm$c� \��rC�E�d#����D��)����f��,�4���4sJ"��%T���  ����P��h�q=����`>R0�9;2�e6s�!�S�}v�h_aĊ�-���U���k���=T+$�Y 0\�����W��J�P��+�r�@}.�4zV�M��k�nl��Sb~�A��OGF�;٥A�[�ϽRlVc�߭#yD�vR�w��8���D���H*	0�J6ݬ3�dm��.�j2 �n6�1��c3)�k�l�̯� i��H��e��äyU��:�%r9�Z�m�*��8�+&�M��T-L�^D�� �l��YP�s-�28f	���}�=͸�Ɖ*nRgv!':O*-�A3���)���)A0P�F���Jc�Ϡ��x]���s�W����4.4�NH���U/,IF��?���1W��Z�E�����#���MB	yu��' ��om��?�A.�HH+��ms*�Qeb�.���J�e*�3�7�-�C= �A�c/��Q1{Zt�M@˙ ��C݉�np��[ъ��_fYꭣ|��4f�7N�㭫� ���G�����UW�3L{�ѕ�ٳ �u��_ꤢ���E�a!�.��F�3v�,�]Ap�/����@lE��/L��t57�H��g<�z.l�h��2ģ~EY�{G�Awɍ;C����6>ճ)�ɍ��D${'-��@g]�me�ϫm�y7{r�n�1����(sL�F��m_���8pX6GF��א5��c_~�_6��Q��UZ�<��=��G)l�v��sj��onbٗ܄�H`۲P���53Z�m����-'[��&6�IC_v⑉��v��&����ӝ�a���`�a�&!g��$����߹�����Lh�6걓Q��R��ď�maRh1�ȥ~�F�5�BUu���] :	�kj�0/�!H魊� �d5������S&#⺗'�9ϧME�ZDB�u&��e��?�A\I����^5�9n�v��%w������ɵ�P#x<��:Uخ-ao@E�M	�l7(�
���ݞf(e�4ؘ���5Æp2T([���!97�FK���jX>�����XՓ��Ip�[���&�v�
�E��J��f/�/i�_ً���� ���A�מxt�,yx\lSOJ��2�D>�s�5���-D?��^�o�[�6Ϣ��MR�6�	�|��T��ZL����9ͷi�Y���J����Oux�Li��-7o�^7����uI��8��m��\
bݙ���ѫ�,4�[w%0�]�b�Ŏ���{j�<&Qǖ|�����re�����ԖtmZ�S���P>g��LodW��]ޥ���l�9��¥:yn�߹.}��d��`5���bT׍�-�+-��d53�k?#?Z=�n~xɱ�d��x� b5kT��l+X�)"zA�P��!��O;��ѹu�b�-{�����G��Z����d0�܋�+^�7QH0cp�ݬ�Y�H7+�����J�6��C�_�r�R�2� ���PrYK� ��0�1�	����,��g�AU��D�&=.�������n�tF�9~��+�-*���²;d���$��ub�0��*�#P��w���8@�4��1�g�%e������;6�]�8�(�������,�o�)I=�ȵ^7�ؒZ�H}0�	[��Ae�!�Gh�!���ܮr�Z��=l	�@=F'y���x>��uT��,X�O�m��Qr)l�{��/�����(�#A��r��}_�eV"�bz� ��u���
)`j�ޅZ��iϤ��������I�X7�
�j���9#�q�w�Z�1�U�^3kإ,g�4kiH�᤿#���j:�j�m��UF%��d���m���KΠΑ"�AYb/D� ��.�&g�2���sg�ɺq�Ӣ�S��3�qV2!����`�['	��d=Ί�ɨ�˦�U�f`�������}��xm������D j�]�p�E|��Z�п���m�_��8�    FkV5�MS͞s��j�Yy��m�����U��Qn��Xͧ���w�F�{���Dܮ�{�%�|�z�����ߐg[���闥��@
��K��5��p�.n#����E�	�9�{]ҥ����2�L�I�2�3��N�b6��ԁ��)�w7 UG�	�k��r���و츞<8�C=��Q.�t�S�m�jXbF�	�qQ�Ѳ���n,tj8F�|�j�6/�Rڧ$��B"G�*o�$��;F���K"��n6�ӯ
Y�LF6���?E�2������A�|�7��V������g~�]$�7�"��&���+���C�53ܑ݇~qݡ���K�b�&���tz�a.�{1��o6_LЎ����~u>�����<�xצ��y�) �E��ʶ�H<bm���Law��j�9k�C��[1�iPP����2�XɊ����X��վa�OR�\�ԄuX�\-��V��X�Y�H:2[�S��'ڲPaC�AC�5��;{0�(�r��2�=����ģs��:��)tL�-n~�	w	p�FTF�^�wIsT9u�7��d��8?Nd�\����B��eB�g	��+"W�{9=�^�T^;�ۂ	R��Js2Z�Ɔ��T�xUѭ������N'��L'K��h%�F�mt���QuK�-��B�Da<`��G �QHt� �=ZX�t"-��8���r<7:��O��/+])H�����t�PR�I��TЎ�,��FG��R��],�i�������������:�(����k�jLU*����ZPGQ�/��,a��7n��4Zgۤ�1�"�8��E@̓]��#���\���%w8����:�%�|�mz+��4�F�A�L�02s}I@�˶~�t:�����u�LF�������L�w�ٻ���j�X-n��pW��>���z�m��V����g*��]
�D2�����Ș���Tbub-���r�.:!ak(�K�)�*�mQ$	���fwa1�R�B����CC���� ��4Rm�J�Y1<7�ҋZ�n�;�<	����LkI�Q�R�*��1qfn֨����i�����0L�vty�TЏ���9�_ɔ�=�fL�'"��	�\�ʚ;j��%�$@�LD�#.-�����t�+e��g���/�(��M:��y����P���Y�u;��o�`���� �(w���P"!�H)��7Iv�F(4�G�x�*!��8���3�U7�A�3n�*��S����P�N����̩=E���qN�������+���d"�{�Յ3M���2��C�5O�9�I�#��̟a8|�J>�u3d�"l�,�.R�K"Q�����4�/N�Dkx��@�@T�A�`$2B�QY�м+f��t�wY�#s7��j�{?���)/���Ũ�ɥ'$j^�
|���@Y����g��3��f�qq���h�q�M`�Wq�	�5��$/�|�~��Xbp�ʓ�"��p��Ľ'V
X�ǐ�45Z
�Z�s&�-��1\U��u�R����+(���P�VQ�Bٴ��)A�Ȇu��=5{	ݛ��lj�mqO�N��X���I�0<r�h�m�u�n����̗��֜�E]ƤyCV��{��?�^@�Z�3u?4#�W�Y���K��]��j�[j�H�͔z+��k���|���;�����������������;��J9}�`/*4p�������uQ�4�{F��DopǙ�jR�c@��l�j���G8��
|@��|}B���XX��q��;�B�R�7W^!��.qt�=8���|����65N�ѳIZ�m
Je��_�lG��nm�N�������ߤ�*��¨�}|�q���n�
�lsX���ɴ��ș�u�	{#��Q�Ie�)G�v�8Vf��rS�;�l�mDƨj"K}�]�)�&͐�-�D�(��u�4r�.P�+���(�Uo
�W��q֍�:�zĪ��E�&�m.`��<��K��6?��V����bz�+�9�����-�+e�a�������0.��a�����.�W����8#@(�*jq �6�ò�PFg��E��l9䟓b�z�醤�|Of\#�S[�:(c�@����9�.�09|b��)0�P�V���xǰ>��#ts(I0__$���u���
��I���m@;����� �nV1�}��f�K�aE�$��
>�*M���ى��Ƌ��5�	ۮ6�є����D�\+C�*T�Up��f���!I29!In�������I�\�t�ş��1^�������D�m��0��EZ+%����G�;A�X��L����E"yn4�<ߤ���Ҥzz�`�����T��[�0���W܎��XAMd���,���m�t^�YB	�d.l恖G�h2A	撈AK%'����I�	�̕�*�fw�B8j�3=��qs�ԕy����V�a$���K�X.���p���zK1ͩR�`Ag��P����xXX���1�b6�%kS��=���QM�"h��W���& l;��'&7��:v��F��AǴ^����}���
w� �u�'&�J�%�ma��ISyۂ[�U�p�����nK�ͯ�x���0?�Y�϶~9��j~xܤ�X��K��ē�)�
�gT �$J#JAt�l�-t�����8��:Z�:�@g��C��"D$x�T2<�V�Vi	c�T��mt�J7\֮Ȩ��n.�#������ Qǁ�*M���VΩu�"G�x��fD�d$�LFtj��*[`��MG!�1���]rj�Q��V3��'C����+��g<��t��՘��(�]�j���&��ˇ4*;[���A�̦`���R���9u�zOZ�՚���17�->%����5�V�/S^���k.�4/�J]�dN��Qmi��������ۉ�u��l����8X<l����ff�y�B=l�X�����*˴�Lʌ�1�ٸ S%�%R��F�!����nJMJT�Ud�|�C���x<P­e&��raA(9�����V�[��Uv�p+E���~��#��ڌ�*wd�'}{�`c�z�����н���''cYD�8A��u��kk�I.2u�K�:i!�Q�����1%�L�5�� �ߎ���n�7�Yx8[Ky��̦�=}��6�lH�f�����[gyzY��Νo7�h�n���}�Vܭ��������.����g5�9� g��k�~����{�4�3�>}NQ�x�\J�y�lH+;b�Ǌ#󰱫�%[N���0op�(h�Js�\f6ճ�:Vӵ|wHG���l�k�K��=�h�9���WƠ���I�c=)R�aF�Bw�',��h��`��e��e���S���x���4&b�U��c`����}�:�>W:�_Y�{�umm�W�b��ņ?i$�k���I�	ٽ^�����( �ou��]a��vPtDO��tn�)��q6�/'�"^��d��SYбR*5]�;�"~M�\����F�(:�¿X�l� �c�k����k>�~E��-�p�CA�-U~��$��h��A��J�V���y7�0�q�\����ݗio��Cء8&x���?�[UK�ڢ�D���H�![4F��:Z%T���ł3-�lWQ˓�Ձ�F/�ξ�tFL� #-Q8�%7<��b���:��}��Ҷ�0է5a���R�9�����]��|���_��pw��f2g���A��St^g}T�L�x�n<7�]!���������"����pW�iU�����ǆ9Ma�2@�4�����2�zY�E|�R��e���5�6��V�Su�c[>tAk��d']X�N/��+��okl�~kXh?�������/8���nA�\#|���x���9 �[KJ���	�-�s���J��M�攷�&��a՟�?��5��F��� I6����(���bA�&d�0sP��i����Ơ�2�s���Z�sm��*[y��z�;�{��L��d��+(T��b�?�ۆ�>g�����7)�T1z��{���Wd1S��z������ȉ    z�5��21E7�ia��Q�ۯ�7@a�����N;fipШ�s8[nO����s�u�#�(�����W���ha`[�S7������Q�>lVN7�ڡ��a����آ�F$Śqqj?.����!�^*	uV-BdN�µ�����R�T���� ��IصfڍڊT}9Dy�� �hg `u����B��?���#�_��Ը9%�%Pe�F���qX�j�>=W����p���K��������QS[4KY��{d�HQ�5BzF��7�p���"��¯Yh�yj�Q���t�ڞ��S�>��?��ގ��u����Y�.g~�09�3��£�=T���G��]��	6<~GWAzio�NI� [�����]R|p����ix��4Yp�P�X��T/ܗB�SE��$"�͒�	71�@��!�sF�.�4q.�j�<����9C�wq�K���I	�%�����G�gk˟���c����z]M�������:o�)j'\1�Y]�h�N�YOU,?Ȱ�\U)���E�Ԛ]$P]�6��z�m�[�8�s������d1��[q�M����{Z�I�$���d=n���A6��.��}G���"'���9��y�)q��Zh:�Ȫ�����nj�_���4P��:��I2�Y�c��N�����Df� �)G=�A?��h�cDG]����/h���U\�t�|e5�m'�N��Ke�6�d��Ӎn�:R%�ԯ�(�$?������;�����o�E/1�&-��*x!�������M
��бzI~CI���%���L��O��a������?ldV�vp;��Z���2�9R����Rr�9(���� �0���i{��n�d�QE�r\Q��U���9��H��D�h�z��II��^L��*����+n��f(C���D�JpP����ƣ;��x`���y��3�H
�U�.2�
��_ԕ�c� �侢Ļ��L��J�=�]�Y��w(S�Nk^ܖ��ƕ�k����q�OvM�NfU)K[�������x�)|^�(v�T��of�5�(��9�)������lu��X��˕	�E8Y��:�O��xR�u2C�iZ�y�؇�<�@G
�������5��8��QQ�j#�U	�"q����4�����رc��SQ`��<�E��g����x�L*R��s���D�Go\��3��PQ�y&H,R�U�5���]�(�%�od,d��(왖c�3�p�h*ܨp�Rűqrb�ML��t�p�yU}w�P�F�f�Y�d]�um���)�}�v'Jwa�Ic_@'@c�|wY*f�_a^�&O1Iq��y_L���Ҧґ69�(��B�i2h£�!�Ӆ����׬��O,x=U�g6��)ן���SX��������|uw��]�L��x�w�$R��(��?��i��|]I��J���J�2~H�HZ�^˃�;���u�C�b�^�A`�|�tOi�ʪ�\t�^L�Q��o�!L���U�1ey�r���1�%�c 9�g3�UD��]�i�s:Yg�{_�;�.dd��g���*���oM�Vb;��QA;�^dI��Y	���9�d�EUM�S���jZ��3�C��;���+,8�hj�H�%��h�D�ӈ�2�o��uǥ���u�.i�\��[p�Nn`��>�kL���-�>�:9ݦ�w;�4^T��ɿ��2�Z���p��gg�{�5������z:M��.���\*2���X5ʝ��M���r��g{�5�UW���ؤ7If~̶�h���l��2=�	P��A
V;���J����CGO��o���~����L���O�h�ca�X�$� o�l��̒�;��P�d_�A��v1���[�����;,lg�������Y��(M5xP��#��¬��[5�K�oN�b�O�	�"l���F��aB�,x4�p¹��`>I2�)�-�e��O���)�-q^Y��V��ʩ���E�'�`���aE�-�zte��h���7iULN���3���(�o�V���s8V��_�������Ru?������-���c.MU�*�f{p�HN}Ew�bS}��ht5_����!�\  H�L�T�bF����� N=���57��t�[8�D,	�K�8ĕoZP? Jg]������Z������#�W1����n��BMk�-{�դ��'$�O0I�6"��ѻ���jb�j�I��4�� �6�vJXǬf���Q�}dn�X��~2�WR�o�c�L\�	�$��Mt�
���j����6�I��xVQ2�n���ݶ�-�ct���s�F)'��PXw>c��mLd'���@����;6 q[na�*�dL`;H��	d���� Ok�����H�6�i�a��]iM�����Se�1��1�LGV;2�QVs�]侗Ux�{������)kUx�j�}1N�4���g6'�O�cf�*��9�ru?����h��>�_"�6��ò=�N�r�R8�u���A}��Iwԡ�H!R{�����b�fQ|'�˷��4Y1�3n�u��SC�����^.|8��'�MBR0nS�{���O0 ��_���Ǖ��g&�W���,uȽv�v�ĸ�Y��=�m&J�l�q�n�Uo�R�=���3p���B8��Tm�.��j;�#Y=�G����ی��E}��4�
E�"T���"n4V���BQ�,&����TO�yA]"�����Ԓ�Ya��Z0"� �vWj��~���x#�R��g��(N��N��4��jg����t��M����8X�l���9�ly;�������K��m2�?��c�̕6�3��l��&�'oS"ƍ]���IeXOYd1���](i�b79r��t;�݊w4�� ws��I�
jU�JsFs��na�y
��c�f�FW%�T�Q�N}p��k��D�!Rt���X�;� ��6p	F���f��H�I���>�>�/��<ư#�&���E�j�r6��b-��#~a��Vޑo����Q�m�mc/��`�]<À���������;�+�2��d��/��SW���,,�2}�~;��
Sw��Bs|��1���&��t�%������tl�s-���Y���TLc�ک��U8�F�ᗄ�h��|/RY�Ze-d��f��u,�K��lT���6�1=��a/5���`�;����TCX)�oQa���n�90���-�4��{sQ�fp���Wσ�U\�iT�� �h���7���2��wǐ&I�L(֨��yQ����L��rJ�bO0�(��X>U�`�:�v�������6J�T��q.���t6̚���)b�#1-K�����k�v���G8C7���l�aq_o���eU�$�ؤ���+�ۋ����OpV��ѡ�[��g�3�w&������~�K�/�e=�Q�&+||�A�$��77��s�fs�/�o�2B���0�D4����
���ʧ��R��5���Ԩ���������V�Ӟ��U�`r�=�n�,KR��Ci���h�nm�8�����N���b,��5���::�I��ж��]��Ou�
�h:'t���^Ќ��|��C�OP�,AO�J��da���݇G�������!Y�!%�l9���T��[�w�ڢd�����e�!^�Ы���LZ�!�%�{~��=j�������fK�[��3��V/G����<�<堔�G�#S�-�u�~ 	�D � ��7���KzO�p��s�f��-��p8ܷ�a��|��I<�wx�f���7�Sq�F0C�����H�
�2��� @�j�M<dx+��p��?N��ÊaN�n�݂႑Q"�G��œ�V����19�.毶�oj�g��p�<8�ζ�t��J�7�jS�ٯc�����	�9��)_��歵���=ء\�<�E-��x�౛�#��{Hc_DHZ�W*۰.���V&Ջ6�R-��B:�:�>[�F�c����V�0�a���o	��>`B��G:Q�3��Y����M1��{��(��oT�-��y(�ٖw@��e�[�T��;l΍�)G[v    h �Q�ɍ���ӕ&
��m)8@'4����H^�
f�Ľ�kaT*;K��E=���`>���3�>�*�`l�)/�AW��̹�nq(��ki�����Ff�,CSrؘ�s��i�V^�����f�]�:g*&X�f���=i���b�17��uy�
lz�رC-���n,��t;�Ff2@l� ��M�#Y�A|N\.*#r��vE�Tg��m��SY������\�иH�X�ݘխ��V���4o�97�F?�n��ܧ��p���d�<[���,Kz~���"1��JK<3��`�����4�9\����1R��g�U�El���RBY�[m6�"PM��\QD���EWG�S�P5�o�$�mH4z�}1R`낍7�n�����2��ByM>߀�D4W��(�!G1w�aE���R��a���6�=���`�m��$��͵��"X�y����i�\��R�����@�W>�[������w_R\��1��N2�`ض`�.t'q�������W�t��'ozn��sD կC X.�oPk��ۓ6ĢW�#�����u*j�*�s�'��}-�}$W)�(����,]���Vz�qM������_��̡6d\��t��93/�rݚ�_�|�J�1�(1�-�sÇi����߿7��帙0o4��\<�m��q��0��U���A��U�?��'т�������I���hI/�A���ݴ���A��#�s�Dl0DPɀ��� ^C�l\�BX��1�b6�9UB=po��
��� ����t5�	�c����)�� 0r��X�/:p2�a{����D�ˡ��I�ऱ���{�!0R�4i�����ۨ
����c���5Bux����[�;�pKE��d�.�($�������8]�%pw���w��*ɫ⿿%������~	i��i��{5Yȋ�Ǳ�kWK�w����)Xu�$�w��d2����XF��y�����_�_�[�/��J7�-�X
mP�>ǖԔ�tGN�G�~�F{���S�Έ$�j�q��"U�	�nV��b
��������tI��IA�K4����Ps��)6�ʢ�����K���*Ԅ�Z-��I�r5���{����^��`��x)P^���$�3�B���T�WT���������c�K����ɪ7a_���D��K�O5�"Z[�����`�#���sIE��J`��+��2M'@z��54����D�i5�g$�x#ҠUɇ��-8�5�?�,�A�D>`�L���7�� <���"�C�քQ��'5��{�27MU��F���g���}U�\��_O}�@$�E��'DJZn\����e��	*��֫�S��8�Nz]��e6�>�a6|ݎ"?���#(�,H[��X��3o���D)'����6#�؅���fv�Sp��4,�}s�fdn�9&�$1�JSf�$�$aI�l� 0΅���vԹ��<@���vK���ڈaXD݉\+�c7��|p"I����j��G-2j� �0�͒�b"K&�,vC؛��H,���jWGf�^	GÍ��p�U\����WrJ��{��̏���t��^��boG���ӗ��qd������l�k��W̷�B�c~��)�!���d���]i����"��zo�1��@�q1���J,\�`eb�b��]�ƪX�����J��@�P���e��ˌ�x�xyt�DwjE>��t���$]�_F�t��4�?�<��_�z�)��ԃU���-�[^7�#u§�<��2|������7M6B� ��\k�(Rg���o��y��+�*���Q�^F���4�l���r�P��|��i磏d(��(��|B
���Ŋ��a~+	��4aTRS�_!R콆q���/�Yp��s���x-�cq[���Ѝ�^��N�{�K��+D�=�j	��!�/��k��������ȝ��?��R��1ͪt�.�/�Z���}HSg������C�F�I�"�.��8���Xje=[\��W�0���玩�K�Y<�I!�c��STt���X��*0N��&��%K�r�c$�i�}8�FD[6P*��r�D��#����Yi��������$�l�*�p���x<<��NS:~F�*ك߭�H\T�.p0r\'��4�Ғ#:�'�nqKT_A�m���[A��'/��D=��Y[�L�Nyӆ�r�Y���B6_�s��b�y>�R�khꭍR�v�jfN�裩`W����������(�l�y���c�
���Ry��Xי�0Dr��Y�g��,��ۿ�-��lp4Z�&4�c2u���5�u�Dd{��d~��I�`G�:6�35���ur�,`��7����͢N�_6�mhq?��R'"��F��h��Kx�����]�^r�21il����?��7�G3����������n��,�Kg��ߟ���f_ѯ��,�H��<�D$A���g��x�Ή�%-�M��$��P��X�<J.�{���*p�*��48��ìܙ3Օ���H�	sD�����m�V�>+%�;q��s�����¡7fj	��[��>>�]6�L1gė�����0�xd�P�4!���̵}�y���s�@���մ:��.AF���^gt+�6��ɢ<Ѳ��jmrq�h5k�L6 ax��c�Z�� WA�w��ǝ�7G��r�s/��4��E�S0Q���&��;˄!�Ҳb&�]ym�̥3.p�.ܻ����.#���@�!E3�\��U�T͜6�q�K�A���@���)q>�����CMoU��	9�;���tcٜΛ�gӫ�Tn�<3En�W.Q�3�|&R!��oJ���+iV8��H/�1Q�ADC��C�՚�o�-���v��&�.����(�q�R�WݙѦ�|��vܰQ�F�g-c�xb��&�\SM:�'U��/_Dbv;`�y�^�b4��'���lv���EZ��	�iE�'v'~��%YZ��"��2�k�+�wx���gx������y��?,�|6�m%+�G����G��fp�!a,���-����n�g�W/��;E�Md�M��FїS�F�2�Ȟ,r>7��y����y �!^���!h�Ka��Ә�����ppF>#��T�D\����	�8l����&ӂ������L�t�']�s�7���o�W�[��M)!��Sx~�
������CR�m�f�O�R��n�W��4Խ�˂]blzhoen��z{� ��~
�+��fy1���ڙc~B���JR4���c>�
=���MR*l˴�a��a�`��MHU�N�-ȭ�4�5X 2v���m$��0������� $��<A�n3�W`��,�P�6L�
���U'\���>%Y��
B��T_f��V�����Q�G^�(�j��-D ��ɮ��W���p�j�xP0������i�NPb8�7�)���o��8aYU� i/*���eTm%�Qs��dO1���%sܝ��	���[i,ez����%���k]���:-��狸����O���ж�1���l�g��	��z*�ē��hϋ��;J-7��7;�?���m�5U�1QOo�r��+��j��/��G��E�����ʧ��0>�R��v\����.i�j#��æ�^���Nk���ւ��Ӛ�T��H�X��V�O��w�vI'&C��E��טϳ�D���Wo�+�>�ID������y��0���!�a��2��Q�C��?��5W5�,�d���2��=�"v| ��@���3"��`\{T�G��c���i~islu������ͣb�(�������+�E�@*����
��$�z���2Ɵ�I��3�� 
�*Ɵv���Vڟ�x�5 �/� _N�b���/{��O1�+~
)���K�/�
y���<ox1��^Qư�JX�eQ�x����d;�?�*�3w�@B�	��.�J0I>��{3ˉ�У&zt�3d�G�P��N�F����^��x'V6}�@I�G�; 7�T�mL���X �f��|4���Ȍ#���*�C�}�~�o'�g���i�w�    w�E���^�w�1�:���6rau �w� �⧜\b�	�zj`@"�(�1}�����=�C���5Y���zտB�R�	�� S�͍�+���p#� R:W��IxZ���2���r�ɟPu^ƒ�>���T5п�K52���"����2��ū��r�l���>�P�0 ����{����IpXk�/¥AMIY�أnlH�(�_%��U��|�9�ӈ鉆!����R�ۋ���t�(1�TӔ�T�Q3�Ob6�k^���՛��HN����320��!���!kSy����������*PUs������߲Ud��d/٬��ycIٽm;U��
-�*t�R�`bDB�4<���p/�~�X�S�'�	ߣ�R�N�}7���}���Ԥ�V�,���D]l"TW-t2�������O�h�ĩ [#6kk��l��O-������w]R�=�7>�����5���zܯ�	�@��c91ߎ�X��&Ͷ�dj����ƹB��.%�ksq�<�}]�����yw`_;�������8UU�kKg���ʣ���;Ĝܔ�؊����}�U:UH>�Q����+Ϭ��@d�8�t_�ok<���}1��ϻy4[���9 �hd;����l8�Ņ�0�B]ͨ� ����
��I��}}�����w�����}�x� ��V��8�����62���<�"*+�Q����3�G�kh{��\ϒڜ���q�^cd�{:��>�ɥuJ�7�"c.i���lаQ��إ���]�#G�3��Ӟ�1��Py��G �=<��,�եӮ�� ��E�ς�O0mU`x���m���X~𽴷J����ʷqT���ĵ` d��6�uA�AUC#cu
� 9�0�J����d2�����Syf����S��SCg��v��+���. 
�A�-��(�"��66N6g7��T���n�H&G5��;�aá�5Vd��hLgIr̒�$*� ���E^I<�1&lb��|��X�U,'S��S�1a�_x�G�NT��d�(��v�8��#���LظU���f����\^ ��PCSh@��XB5S�ۈ���^�8�(|p��+��_����2,tj�9EU��zj-9��`E�2f�2i�αe��ǖ�-y��+;5+0p�Ua�!h�ā7�'��Ҟh�*a�>���6�QN.�s� �L�(ʄ�P&Lh��8����ӑ����W�4����*L�Q'�T������-�g��؋t7���A	8"��p�R�K��L�x�m�r$*�a��9�6�+.WI�������V�'_�m�8�X8�@�y�҈���Q�-fPd>3��a�x���po����צB�A��2�5��A��z3
k�T���t��	�ɤ2m�髳�BVO�}�[�j6�����
/��I��	�d�`W�f ��8K68yl aDl��(Q��-pǂ{��]��wV�����CW�W[����^	F������7�\�:�Ql�\�g?J�8�E���9��BUB��xb��L8�we
T��o#���F�;�S�
4*�Mkc���*��ٲ�Ѝ��I��ZF5�<+8��
r�?�u����JT�`�,�1Ѵ^��x���A��7�r��)���^gR赛\�E۔Bw�ѷ�h��~�i�E�J��/]f{y}T��چ��l�����J:P��`^��f|�����:���9^��� QO3&/���Ts{���*XȻ���^{���tÌZ:�r/C�#��ʝIڸ�� %R�A� �p������ȴ�b4��������j�֚�:&��׃d������<���%���xKR�S!0��.���٫<��`wq��EF�����*�$��l>�v��'�Bg���$����L zw��C��8M<����\h�dKKg����D��$����7��9T�����_��������k��0��jߩs��[�Q�Z���v����o�O��O���""*r[�W�1e�&:e1�1s����5�����~Z!J��hǓ �nOB���g����k�Q'�ոG�U��+�>.�`�p��s��e��A-a�4�&�k�&�нBԣ\47��{�|��M:��0|�E)��bc0ʬ���- �&����rc�)���z>g9���{z�'�B|���h��$)��賔UJ�3F*d00*W�p����R��Lm	��Q��pH	�=mz�'��Ժ��9%Z���j��0g�
��7��i!��QkU.|c{]�\����Oܝ̉��t�����5��I���<0�<�2o�����:\�`C}��z��"�:����5�	���x]��mpxfχ")�����b�����r��ؑ@ȍ��sJ��q�E8�ڐ(R��79kw��0�ȴRg�Hӄ�=�,����0���I�R�OX��M�HOL��&�l;���E;�H�(��L��Yҙ�х�}F�\:���2����09��Wa��9��T��Z{�~����]@W ���Ҡ�n�=�h`�|p/������9Q9(;o->G�$�u�O+4)����
s�yޛʪpp���+,�l�=�P���:����'�]��Q��6���I6n2h�cJt9��\������\���CBS���W�d�c��>�=Q!���L�UT痛�qϓ�;"�o�:���cS�d�Ir^�>21���=��F�k�}]ty��wW���(��7F���I�����ExԻ�LX�$�ғ� n�-��(�2�Рo����U�0�|����$qP�tL�Q���T�������T��fy�s�G1�Im��,��B���]���xli$�bo�~����\��a`�ǔ���֎\Xmc���f�|�~�mF��8�_W��ڰ#W(6��|��?�0�Z'��Zo�G����B �U;⪄�ax����@lDh!���FϮI�"�B��E��+�r� �z�A��6�������g{�s�,E��l�엁ي3I�)��ۑ��d[�����i���8	�U>��:.%	m#�}�-��Z���RUU3�����3�[;'�ZG�{�Rt�o��J%��cNlv��[C��8~��y�ᤕ�Hkr(��ۂ�KBk2�n����j�yH�Lg�~H�tN�2�����x�7@���&d7ۿ�/ S�HE�c�-�_�=�P,�AK�x����G���K�����l;��Bt|\va�zV������#��~�B}�de�=Th$cʈj��?3	W�R�Gr1_����Ǩ���J�&x�z�C���v��(S�3"
�:��W�|}�����t�`��K�2��C���h����������+����-�N��˿�9^[��#׾������nV�co'?�$c����xX�=�0�!��R�G��Ɏ�ax���?f֦�dc85f'�l^�������a�T�H�6�AZ��J9U�p�K��R)�K�τ���rM�Tr
���{��c��Γ�T�� ����|g"���DޔT�x��Ӑ����'�Tl�������D���`�	�d�Vm�d$��̴����ɩX�����p�W5��z�&r�0���OxB�23'�,J��5ʷ,����b-�?�ߐ$�1M�	mZ��Ɂ�%hi�TrU��JOo�m V�KN��`���.�LjDK̡��TԢ��;`nǪL�N��x��w�~7�䛗(zM���Q��:�*���L������:*�*��̌�~�6m�:$���}1�������I�Ƶt��D�"[�Xw�*��������]"]-�"ņ%��d㓠]F��@7��DE�B���4��ͤ##��-����`�$s�������d�4<_#_Q��������n�,B��2���y�\��UD�&E��Wh3#�^�@������1�m�I}=u�������m@.�9�8�	����fp�ߚxN�hטz�'�w{�95�g�]��YN���v���)ds�_�q8<���dݟ�z����<��?F~JzM?'(    lvn?�&`�]av˓0r���4�lmn�ͩ�+��s!� ���+R���&���J�Hu+�m!u#>�K��ژ ���RX�<kȬ��rP��۩8�ظQ����I���iR)T����D��X5nξ�'��P��ې
pԠ�v�~W�i|�ku��Bbs��� �T�b��T(�^�d۟H�G��He�~{�N&s��dC��8بY��b��`B �.�a�)��Q#���������p�a||t���~=�C,b�/��.H�~Ѣo��MG�(�U��wÇi����߿�����Oz=C45��˰�����~UL��(=����tQ�?Ʈ�%��?{�5��^��Ԍ�_�:�PN>��RJ	�A��}^U�dһ��%g	�X�|���x�$�W���NI����P�ɉ����������)�6'�d)R0*Qy{�vu��id8�@r���NߡӐs�AZD$O��}!��R���%���xب�s����^�)��G��3�������z]tAYd̷c��,-�R����d����S����B4Z�:?�41`�⃙ (�%�0���̺�>l��Μ'BH�k��r���9��*�I$������괐_k����H��e]����d�a���,2�T�F�lJ��/��,����z�������������mM�S}o�x�`�f���y�
��\0���M:�qbS����Y>_��c$3�ڹ�M��'�/���A'�@�2%L���nՆyg6j���fl�c�]�M�F���ahd��I���LC�	�i2�ZYGg;B��IP�N�8�or'�#��ܸ[>���!Y��s�l��腼Q|�*n����zN����� 7�p<��%�Q�y���E��K��_�b�g�e7T&�oUE��m��x�.�co뫗,��;2��癣O�ߍ���I�_�#���MZ��O�����ƣ��� Co�Z����n��AL��[1H[?a��ߋ�Ԅ�x���F�Ӣ����v�I�1ս �G�����ΰ��*��i�ܒd�H<F�c����6D0BĊ9�T��V��O�Y����FhT��v�cj䣵g�T�4�5�2�oC�7���/� ���.�y֓jc��K;��q�=��Dܨ�~smP�!�e3��PU�l��%�¡����0���akb}�"�g_�H:Qw������[�ܒ��,��)�a�R�DY��I��隭H���8����.���~>��[�ש���{���Q��(��VT���%��,\S2�f�rL�WȈ�3ە�N�0\�+D��-��HY�#���fu��4b���*���S��u���\Ԯ�<��$s"PlaP����_�K)R��D�b��'��I]��ac��C������=a�T.�4��g�2������l)���9��ػg�|p��U��������3q�P�uL���xy���uv[*'IꮥĪA�γ�2mW�>�⋃��.���?0����q�ކ�]>_��E6^��L���H!z�nXjlW�;X>���բݴ��5"o$!��8dYK�D_���B�nX��F����,S����;�"WʢquY���F�Q�b"�	�/b�3}�f��=��ӱ(� 	%�%хY]Yj� Tb{�C;Є�5t`<\���B.����?�<?1����w��t9�6*����Sm}D��Ew�����4�5��ΩS���^�2dρ���'L�%������5Psɋ��^�#+��V��ө68�nK}���]��:6�e�|-��`�S��+����3���ޒ}��"�j�DtZ�C�}�����c��(w�)�f~��3NӉ!Y�:+�^�_��$9�;#9�FM���k�����}�q���jsf(x-|�'!&����q��m�D�"�vTw�!���A� �,Q�-!����~��������x}�J��+���&��>����%�/��oU��_Ygh\�v5�&�f�i`�����	��]�u&,��u �+0�l�KX3�L&F�,�����|��N��l$�a ��U�����TB��"�����;dh�)uJ���
�u�-���Рt×w	�,\�r�0n�|�㍨�M�{��2�T��+h��v�kF���A��.��2 �Tǻ���_B"o�/�ȳ���}�W�m��r�7Y��i]>�T]#<V���fXB-Q��=R}ʶ8O��PQ��B�J�w�5��>�P�"u�fvc�Q�N,��Յ5뜸�����a��bq�:�]���+6<��
X�I�34�_��K�y��i�9���d%�Ǔi%| ��m�1��,+2��2S)Rp��
YY�-��9Q�QB�uy�B�(҃nl
�-���H�b��A�.� Et���=�C��E��0�=	�D��]� &��@8�ar�|%�
�#{>�n�␧f�Q�jO��➣2?Dl`>��	��,X��߭���>�D|;��{�o>hn!�u	ۜ�uv��M4�*��H����WU��t�}1y\��"��b�������x���iǀ�P;�	3&�l�q3� �Z福ӥ-t��{�r�7e;(�\l2�h��,�k��aB�tƷ�h%zL���Qns|�4|��ϩ�0�h�ޚ!p��uٔ����%CH��+O3�ު@�İ���уe�ȡ�����������24��4�������h$�A��7�(��3u�{�˪�6�O$ջ��D������h?���"���=�6�;/�7�*�s3W�[��,��ʪ�J��:[���+��p4,y�4���ZE�;M�ԁ�)��Ö}�>/l���Q-o�� 9��ɚ�՚�+��,�u�&�MV��b�%���k����`X�v^��$�a���뤵����(19����z�HkҸD�e�}@ʚN�M{U�9Q?UxA{&pf��Ka��Ԭ�(�LE�҈h�)���V�ׯ��r��dy��Si�<>N&��	s�0_�u�,K�l�rRL���;e`&�)S��o�K6}SF𣆴�q���B=87;�GJƜw]ǭ4�f[$�����۝%�~�<̒΃��"H|
��j㗔zj%ޫHen@�V$5�i�ד5��WK�;��s��eEg�
f�|�y��?�)df&��OH����۟�����wL�w$eĹs�6r&�)���$��I�?���p�v�r<N �m�o
{]�ٻ�L�MV��4�Jdu��{O�#�z����/���)-����Z��t�)����[��gʘ�F��j�8��O��J���EM���BgEd�Ug���ϩ1�3¸��g���K��rU�ҕ�d�i��ڀ4鎦F�;�źX���x��8��SP�:}4g�|�$ݴ>"oC�9�p0�A����`ҩy�g9��m�7��$�h�ѵ�����bbq��܀x,@�ý�W��}tyw�߱�U�h�.�
|�a,@z;M�-(����.��#b^xb�2��QTX��� �8Z`v6�^��*o�y�[����
�]q'
Q��	}?��څL�=Ŝ�sBT	���_�w)F8*�����P>N��-<��,J`����>�a�x�w��>z�e9����<����/3� ��)�D�!7g�S9b�� ���A �&g ���kq[;��C��P7K}��^#��Q�g�m��=b�B�/e!J�/��V(���A�����F���W�e�����ͮs�7hMy m���-y�/��甈7��V[�b�"F��9K�R�&6�H�����ҏ%+�b>"]��p݄�Q�/�m�ٸmQL,��h�HL��c0��$�TR������GbC��k{I�D`�����ɜr���I�U��$33�-��Dn�������#ϳ�6�ӿ��e���e���(45\Z`/s�Ƴ:�%Sv"�1H�j�a\Wϻ7��d0���|�Mw�x���ao�\�d%fh���cxmq�۠v�	�p�%E���    "�c���U"���R�P7d��&a�rC������S�+��-x{rP!���"c�`QD�li�74�E���@V��[@�&��d�I�L$���>�a�o�X�"�e�f�v����Cq�����������T�+��W�Xk/��i���������j.�@���K�A�oX��T��xq����Q��R����T��Bi�|4���o5����]��f�J���Լ��z��2��0td���3�կ�ߊ��������h�1�V����6�m���^�sH��vbRZ����(���$�7VC���Q�c�z��n~�-��,���:�}��i��(�fnI3�حctfSQV9~���T�fgXA�,H���O工9R'Vh8,"�Rgd/݇wD���h8�=�B`C�C��!�(r��sr��<Yu�գ%nIVcB�؎��櫢�� w�c�8F��ֵ-�(�1��H��W� ��AE2`\i�����m�r���iƜ����M���Jw���㔚�]Ǆ�G���AUB��)(n��]Cy�cL�<\\�tО�����͵�	�nj[����۟h}Վ�2�����˗�W����ηݙ]���;:��5�%�D���N�Α�?�*1���U���1{��.X�9����� ��S/V�1�a���d��I�Ŏf��I!x#<t��`-�h�gx~S��	�=Mۗ��ai������pJO�jo��TSw�z�&a
/��_C�(-��C@_D3�"?��W��$#(���5�U��@)��@t���K#=d�z�8$)�6��l�ƥԌҚ<%CnN�)5��S��f�i[�$=�G�O?�i&B��6�	Pb��sga���z��Ҟ��ðpQ[p5�B*l���I�F�O"P*� KQ*
�;iAy�a��r���	1E5������Qj�a��x���"��h6��tL�t��_`���Ɍ��9t	�Ʌ5�ã?��\�_18�"�+��"��|\70��@��9sJ��8�Y��1��!���rdI�M�?�6TJSƵ����� �F-¬X.��s�`�%$���)I����)�^��=-�+j�f��V�G����jGe%�l'�ėn|��nNe8���O�yA���aUh&����,vL�¤U>o�H�����,+R�8�7��{F�̫�E�lk24�z�U^��ٕa�d�}>��~V��/�c��:!ە!�́���H�� ���L��`��CE���M��^V@H�e	2��6Lp����XX=��a�����V�*�Q^�����z�����	d.	�A�4�;t��ܣ�z�k�5�﹈������!�u�x�c�y�o#�s��$��x $�ٙ�����{�!���G�^�kB��6��� r�A�Xpal�)��ҡݶ��q�,�����:�aV'a��p�������pNb��Kൿ����`�>�#_}�t���c�/%[��'����ce��HZ;X�@r�d�e�$�6k�[��L8 5F<>�悕Mt�4�Sӵ��i�D�C8?��3l2 ��Cp"�xT�y�L�@�����t�?����sn�߹���+D�:q���c�K����w���b�ה5�Bc�UÛ�~C������h��Z~O���3B{���F%�s����I�������<�Z)$q?�&���V��vO��5fq�}��2%�LI���{��p��&�
r��}���������/��U�\PT��q��>��,=m�����15/fAf�7�,��6sb����(�5LSf�'.�®r�!^L7����@�.�Q���g�b���6-����;N'��x4�F��?���KB��'��D�?`�>�u����Le�L�*eH
�R�1��DrL��J�x�0[���4���*q��fH�76�Dƥ�Xyh��Rf��� �@�v���݇xR���ᬼ� N������l4>b����i�p��W�<*f؀�-r�?M�N�͚�I�`�I)��Y�� ���%�)�hј%�2�H��~X���y{�pH����j�S���á�+�l����5�^/���C݉�����ȅ7j��E_�mh�^"��v�<Z' ���c��z��\Bq�R�͇�u^�U:���+�1g!��'�(���*��=S$��yt���$�wX�k{���Dj:��9��|=|����6�����n7���Mf�[
�$KN�Ͳ7�}0~�vW2�.<�<bH,S�$Q��+�U�"��JU��Ԛ�Hɰ�6��Yֺ�t���u�Jw�=��%�5Gux�}!���Yr������]<�C���d!�R���/M�u��`t���:���.�\4����Ln��;�.����~�P�鲜U��+$r��|\��yc��YC���A�9Q���6�f3�_�a+P�G�y�BB�V I�����I� c�A�B���d�!UvN?�v���s��s�>rz�'���
T��?M�)�)��V���ԅy+KOjhz��zڊ��sV���1`�Q'������T-���XHΊ�3�0䥇0��%�i��0H���D`+�,����ٽ�Kr��r]%��1qzL�R�c�5�¨丕3LҪ����U�+Ax$R�=�.����P!�&�TǽB��.*�����"ӵ�,������������h��I :�"u�1������s`A�f�c 7vD�|����-.�/Q�zN�����
��MX�ڃЧ3�-~a����w�Z;���Yj����$[���$a��)�E�M2ڔ~��aM�e�m�^L0Z}	�V��K[M(v���-2�7R��w�����f��\D�"=��m�E{���g06��/]�?M���s�nS[�-h�l�B���	S�p5,�ꍊ	��854��QV �h�E�P��<�r�}��� ސ�a�zx{X�7�b�*Q�� iC���!(�|F_Ė��S5��o�q0s�48Q�uo<pL��&Ƽ@ՍF]�T�����n�Wp1}���k5��'0�l�*���G��A��ZQEM�	�gtS���[�,�)��;�G���U�Y�O�6(��T��Q��1R�u:��H����� Z�Sݚ��8� j�����i�uvE�-���y$Q㘌Qp��.�`ц�I͛�W��1?;��sB)P|F+������ᴱYǄ�~�����4�He�Wj1�]?p-��>n˱LR�zp�r���PhȆɉP��;�V�(���,�!?:�v2�橠a�C��;H�I�;vJ��jШ�vƚ�8)�c� \+�����J�����-�T�N��g:�T<�)�9>��r$��n�\��'~�h'�V����{xld��c�d}�1�ꕍN�W862����e8���<|~�&�Dr�B�>Q{U���x��$�oޛri�R�r�27<���^B|�yK�B�XV=��q.@���|�U�6��}��`��26��0�����Q�7��C&�l��ʎ,:�ɷ�P!�����:��ӌ3e=��	��hF*�e�V5g}��&�VV�+�]��e0��O��"�O]�ӷ
o{�m[��<}�IC���D6��n�0���~п�����?����G���B��7�L�g��Bb��u섒�P7o�H����Q��!�r*+ �jE�X��y�����}��A��l��ֺL(�����;������˳2ٌ�U���f��YK����Z�E
O �-�[ T<\��,6�aq{��ߟ=��6�9�u��<��8��:	g1㛻�[�_VB�k#-z"�$׉�"ZWJ�[� �t�u��|��&�E�+�H���(��T+ᾛ��x��F��y�4���=�~Qw���c�N��E��"��v�>a�+��
b_6Kv g��)�k�It>���x	���g�[.��o�g��~��%H��~P�
b1�Ն��e�"eq?۶�b�%ntIr���in��������[mx����^�iw�[��n���@p�����g��=���2*l���1�6`�>�Rʢ���dq    ,*#��B�|#���]2�,.���{�����6KU�{Q�<��W�r���P����2^gJ(�Gt\]�8�~��WE"����=�!F�+�Є��͈^��g��pr_
9)�����&¾Y���{iO ��w%���@�Mxb��>�N��X�Ѐ*��ɗtE�)�Lh���5��	�B8Q˻N��E	a��IkѵJ1-%%	�f�w��:��"0�)�"J��*m�T�|���%Xn�|�%�i����+'���&ڭQ�]��$���<{#lfr�I1�N�F��v��$a��{=�$���4���$"�G��W�.?�­���\�.�I�aZQ�D]�_�$�y�SKl^D�\ː��"%pbHt�Y���r��ҽ:+fĽW��-��$9J����90�ͦ]�t�jR�@Jmd���L���󻘆�J$a)�s��2�@��I��h�;6�l0!����qn2��!9p$8��*��P8�B��^�?�!�!z���?D�^�q���F�@P<��0������zW�+[���~�f��x�5����h��v��x^��b��������$�w����S����]��	���]�rb�xn�� ��H�n%s
rqCvd�{T$nLH!��s+�1�t�ps&�t-�!$$~�m9��*Ό��'��Ojh�Y��Z^�U�F4����eUlXY��/��4�Xh<T�{�u���8�j�2�é�n�zs�ƿo��N�,MU2k�H/Sāe�+��(���>�XL����i2V:' ID拡�����j՞_����q?�1�|�O����������D�U�5�	䘑�B\���"X�R�潮�I�ǥ�Ͳ
8SI��b��=��a�U_mX��Ac����5޽����rV��:*◭ ������oD��ж���_B'y3!�Y��/�$8`�/���.%�,��C�:�� S��C����Q9����5ld�C������ӄi�
�8�� �ҩ�<�DV���Ń��i='��a��V���:�/k�Aƾ{t����˞��$�n�Gz"���O���Do)�F]r2nӜ9��o1����I�e��V��F�]��8H9k���(����s������G����v��_m�`�̓��0�f�쀮�6��`��ה��� b��)m2�"t�d�Hd�����%����#l���Y`]J�?iEi(��2���2���Y�
�T�d�ދ��FK�6T;�)���a,Ykj�rR��u9)8�~��iO9#�.�Fgd��T�H���L��CMa^�y9��z��,t5��������L5�byϻ�M�ӷ�YiCfpr��t�*�{T�5��;%���tb��`����~���lLcu��q���DA�� ���#��0K����*�'�1 �{��%���i�l�3b�}�+�Mf�ѨB����/UOɗ�[���p&!�@yf��G*��P�9zE���JȆ��#GV/���T��C�5w9&�`{�k���IB���EL�t��PH��6�4���hR�y�Tl9ﬨ�K���N�G_��$��\�T2�9{�z��FIBm�����ی����8����<�x�~��-���:�8��]䕙:��<�Q�_�C���20<��?���I�}�]D7]=G����ݐ?>S���{~���!&�q:�ʂ>ŶJ��⪰8��Z�^B��	^<��h�J��>���2���M�u����>�z�B�#�!a�����IťɒNQ$�-���)z�pB���z6P�Ʃ��ú�ez�'¿k>�73s��UE{�e���Zo����iz�E���a8e�ci�mZ`���C>aE��%4��2�u7�d&�	�*�I���y
sR��B�D3vL���댒r!����Mϊ6�E�̒��^��l؉�0�f�}S��[���k}��go�	��Ր��[x4vɨxUڂ}�}_���lX�9C�a���%����8A\���`�9ހ�1�]S���u�m�|�V4A�~���� �iٚq�:�O`�R��0��b#�Ip�T�\��u�9���4LN�Ii���ע�pq�9�aW����jM)�+m*Bf�������Y��뻵���n���r��b���Sk
Q)!<�v�cM���d+�7��
e������5T�����M�Rpq�E�e���;�z�/;^����n���}��C�;3���,���Tm�X�,��s��Ij5hVIa�9�;�D���vfy]DNjnu\`��$��|����٦	?���a=1ү��}����� ���ҟ!��[�D؏k��z�("�������=mj��L�S�٪��ƐQ���:�WQL`��Ӗ�uHC��v�
��z0f�>1�0�L�u��^U�꾭��/u��>��LR��k��n��a�ڇ�`�b񥦸�cQ����kJ�]gЬƪR73���ꡎ��ǭ�s��Ȁ�ݸz
!�aq]J�sd	!�10s"0�j�	s>��g��b]�]�z�\��׈t��q�BdR�tcip�1O��G���@�W#�jD,�&|�0�����mUgۑ�{�}H�dd=�x)���	,`c���N#��Q�	)Y�׊d<���~�c�l�'x�~�m��2nS��m�"��`�1��xv��h���Q���0���n=u��t��UP���g#'��岍�D]����-1梜�e�o&�O&�M�F�x����l���ϋU"���a��ϸT>��F�1~!eC��r�8��b6;T�c��=�!^����:�\��V$?
Bk����w�[����/%<�S@+b���H|��RG�!M�b{���a��]����'��-Z[�%��ƧK��i,�Ɇ�;65)5�Tx�UKn�@�u�K���wـ�d��͏�`����%[�g�J�5�[���I7��#��̰�C�b�`��m��k)�Nn�y�����	r�vT��-����Z�꨷���^G�YQ�����m���j#B��)l�rf8�,v�2fs���ޤ3��r��`:����xm�����BrSz|��|�_R�E@�)�;m�"&�Kլg��$xԡ��e��В���9���g�0P*QTK���#¾����3` ���
��g���y����562l%0��f��۩��7a;�ҥ�:������������������>O�5�7Pm.�+��z�]�l{��R7��C��D�<��o�7L95W(� w<�؞=�,��Uw����A}�@��1�Q^��a0_U���U����jOo�mҜ��n:��t��_�'E�s2���6�cxL+|�?�9��.b�*�]*���j�>8��h4����k��w��]���go�.6[�� |
HLj���.�߈B��4���,��3��w�"�)�H3A��/"/��K�5��K�I�:L�h		�E�
W�V�&��D���~G��j8���?Qm)P�(!�&1I*�2c\좰�N>�w�Jr��6��� ���)�F�Gʇ� ���k���n�|h�+�0W����I 7}��IWɻL���h���.�[�Cߧ�7��f.z��ⅿ�d�<�DtG}p�M0(�v��&@(o����D{L�Ry��@��9l'���JY6Q��l�:��46�L�f�!�7S��5�e�3���w�臯m��L�2�&����W�o�/�,�*�\��T=�(�B�W	x�r�z�O�s`�B��`_\L[]��'�ZO����V?2l�C�*��l4^߶�B(���H#؍Z�i/� �}3��H�(3c6�J�pJXi�T�����ի��ob����D����|qJ�����xl}�+'���n�f��i����q���8����`�m��H8S�-��x�w������Z5��⾊�є���qN�Epl�����š��XH���`����H�E?�^F��I��]X����u�X��c���j_d�K��^�d���GX%^�⎭�P�3J���?)�o�L��/u����7!7�>�ǥ�/�Te������!>K�29I�@H�$|Bd���
�lT�    �S&�<�_I9E!�d|J�%S�	&��j-�ZT��i׫��^6���w�+e�;*,�~/�>pss�P��Fn���|���z��Q�E2/��_�0�&���2�����b/�U�?0��CFY���Qb]a��["=���|��(�D��d���Ps6q�)Wqa|�����������U�(�|ܚ׉���\�y���ϴ}aH?�3\{��
U�0\M���"k�S��G��:�p!�W�U �i��>�ű�n#��N~�܌��v�=塭 �K���5��Qk�U���Aǈ=��E>����[���!<�J�h�~ڀ����$����~$�0HO���kVr�niu�!fFP|P��+#�����j�w �J��y ��;����A2��,�;�L.E��r�ĨZF)�{dF�i��)�vY�m���v�!2Y���ˮpeiBa~����G]��&	��8��:���v�*�H�X�2�/I
+
,�G�K�AK�bF8�`e���'�tXH���F%�˚,���G�T�)��Mt�1(�Vր�"?�ȵ�¤٩�r���P�ϱPi�X�R�7w$��4X0��dd����|�?x�D��)�:%��b�&	��F�����`�δ
gvV�/%��*�Дс�f�m%E=2��	��r�t�ၑg��-5 o*��8�Us�LP�$k��l�AR����̮P���`��`�">{�%I�ع��N�M�S�;e L�p.ΤԮ�I���4�5��Vi��37&�8�e:}η�aG=;�:�1��:��a����"aW���ܷٴߑf����V�ʿ��M��9���h�JI�ʺ�جi{����f'�i<͚�Bz$'����=�(�W%�0��á�kw�ͮ�8x-ε�yԺ�����FD�[C�LTu�b#N^p�``���C���&�u����1�S�&�'d���iy��� ��w�\;j%ZN_W��L�$�sS�q+q͆��sY��}xRV���<, �=�I�C
����G	g��P_Fp�AP!�ND��"�x�`��c�-5��h��(���ló��Î� �<rttr�o&@;�o������ˬ���Tz@Tips|��U�ƻ�F�J�}����$6{K̖y1�B�-C�_5�`F�y��V�d�~_��T�0�'i�$��<�jj��b�e�8^��*�ǃ���]�����Xtn���a�HϏ�"�B��2�Θ9dw�I�3F��a�ú�U�>T��TȀ�I����HNu�r4�(7��Н!�<eK��Qz���*Eg�H���.��/t,�Ɯ�٥[x�8�*�e���"M�;�g٤�0E��W+��jBG�6��bl�f��yUM���̬\�cP��ԧ��v	��:R�����j�d�7�ii�� nY%��ŋ��@)��̚���5vg�J� ԾP)�YA���i3���S����Zʢ-SE��M(��L��Df�yc�N�WK�T
��p������<S��9(iT�ɉ�r��{�Aֹ#x�M���yR�N�����J���|�6�Ш���p�Z�"�2�Һ�ng���0�Y.�_�}��3=
�2y&)uY���2JM<D�PDD8T=Q����_� s:Z������i�o��j"j~f���*�>���y�E]-�{>YPvhh��S�Ǘ�b"<�3�����U|lUm�`�0���4GV�i(�|(�ZI�ۮ�"�ef�FI=�z,P��ddҼ�z<֋|p��_�P�]�<m�7<,X�~�lQ�L�����u`���,4c� L��S�@�mL�h�G�X���`|��V�5�I�1d��!X��v,OHbhK-�u�yq�5�dd�.�Zi�q�lX�W{~��>�%�G]�^���L^�c��5�ue���M��#�$�@L���=vj�K��� �w��P��P5T&�U�g
��?��dp\�Dʲ�_3�{�d}o�*�2#|�F���XZ���S}HL3>P(c�Z��N�\�vaj55С������0��z����.��y������/&�`O�'����H���/��5�m�Y����T�M%d����ț�_���%	Tg:�O�:���EDq��g��#�eI[eb8�Rz�T�3�T�"-?����ܜj�L�G��r'���f�����r��']7�����_��S�6C���u�"s���,rJ�c�w{`1��b� ��M0��9�O�O6
}������U�����ܼk�ExP��ʕ3�-.�gvø>m�))�@�9�y������x�R�EWȥz��z9��
����Kg-s��/��s���6L~���)�M��
��#���~?;`W�ՠf�kɛ.v�$fC+w�DHn/�N����-�c�y�.ए��i&��㑝��'�~Mf�N�^G���4�����;&�;�Pj��3���N'��s&Q�/Hb�v��J��{$�,�/����\)�`$	=j^������Ìˎ��-��*"x�����l6i��5q�=��,T�{�}yz
�K�X�UhF5�Y���"WH�s�|ks�?15bk�G���&�E��A�נ�y�h�k\�8֪���s���~{Q��~>��W������yR��l×?��,�p��ҿ�w��� ��Q���»"��
�!�j��Ԃ핌��'&��I�:��٢3z�l���t��h�~',5�O�O/�����h��)Pu��j�!�z��tN!.J�������Ɍ!�s�C<c ~�C��e�|{���V�(ɝ��!�]!��Q�j�i��`�bt�|�rl�q����tiݨ���m��سpJ�J�X��J���'8�W��.�7��pܤ^5�a�x��. �.����x?�����%�8:��R��΁b��&��y�?�B �����a����O�g���߻���6�p�Dր����g��򚭉,Y��z�8��NȶBe�L�+���؝�Wb/�v:�����;�h�	��HD�&��dP6z��쓥C]�X����$^�	-	��+�Hc��Y� MHD��d���9$
en8�D��{��͑
�՞9�=}�-�-{�6$�%V�L.��)�+�P}Z"g�48H�f{!�9��e�zh����D�2����(Soh�k����N�c\���z�����W��kC�\�l�k�_����T���d\h�,�Dܐ���q�)�u�8��t�G_�����4X%//��s&��?�,�����L��`?0��Hװ��K�?�j��0��M[4��H3}�JH�r�HN -W�{������o�^���1Hpts��S_��,~�
w:���?��4jض��H�/�-H�T�L,�b�Ґ#!A �L�a�Jp�toĥbD��]��eW>R��h6��p�IY���xX�II�Sh����$��{x��}���1�3N�}n�@M��ٯ���Ұ�TL&���,���.N\���<�A�V`lf�yw+'O;C�
�����7�{�_� ��~�|�"��w�5��/��Xh�џ�Μ
��X˥*��vd�wy�I��-���E���������`މI���Rږ�A����,�F��(F>�k(�&�Bʯ�M�yAy����J�N�~�4~v���M��y,�� ?���Ù�RP�Rt���H:9U�.	,��+�� $kb4�/�l�x��`5��Q6��5A�51�V�zf!Z�+���3ϦΓ�x����p�i�K�<%�S�L��E�.o��I\�3&v��$q�P&|Ed���������[�rCCgl1�}}B��K�e�A��}�J���5�=�߻��=�eH���*�U|�c�E� �#�|*�����n߰ i4�����|;���b��<� ���*����h��-I��HY�%v��dF�I�|(�m3d���C[]��{�`ɹx�/L\Ҳ�A��?!�'��f��,�����F@ 
Ɯd$�x��r
 l��l�a~	ϣj    TTSRe�ha�V5i�.�͒��Wt�!��E�	����mI�j��S�4����=�S����m?�����)����^96h�;IB`6H;I���Mߤ*���W�p֖�Sk
������`��޳4�t��{W��0�[����}�rY���!��*�C7�d���M���/o]�7h�ϯ��Uw.�b�H��#� ��so���,��XRn�h$��O���N�h��K��$�^!aI�1|Y��e�8�'�v\������-uV����u+-�V�8L�Ad�b��֎ �SJ���d��mP6��T��@D �B�d�6u�n5�o����9�2���>��y�Y2�Ľ��*]-{B��JR9�W�޵-`[�N��R<����բ��_}��F�&��}�/�G�3�ܺ�h��B(1*��mN����#W}��?p�bX���z���ש�TmU�2��\٪Yv����V��M�2q*?��ա�B��(���5؉���A��^̋�幛/��k-����A�t�7��Ȅ�`��չ�3��I="�c���B���Z�BJ7�!�쐆�/�(U� �t��#�;��O=�c�`��^wUuN�I��@�B�]�*��Y'��R��8��]p�z�D,�&�v�Q���$:z���7�1��$V�k�_��s?���A����-K�YQͧ��-�&��1�jķd*~򎁽J��p�Q�(�(��M�p&ؠFI)M濜!M���q���R�/M��	���b�O��T��u�rs6D�igɦ�Ts�{jN�!#��	���QaN��A���ŏ�����n_���젪j�U�<�S�/�����4���?<�gi����/^2n�rr��>���(�#���>��+�Ü1x/ڬ|�T�ܙ�&I_��>�0����#�r�VP+�vT�B$�jn�h'؉$f� �����Ɛv�)l)��I�5,_�8t�7��[��S��c�Q�"��iq/"��A�a*<��w0��Q��r5��N�Um[��V]-K�h��4|��Q���>��$6�c����gf�k����,��@Z�N��Е���lr�1i^ǯ�^�'^��y�g��,#�����&�ڰ鴴a�2����y;=��^Š�ccڳ���q���L2�6*�?)��͓/(U`��:��1�-VǬ�0�d�a�"_�@��Co8���*�+�cD&I��
�2mZ� <1p^(�z���>�-7���w������[����ۧ�rzV��'�//n}�̈́�˒U�>�����3�R����7�}�sn��N��
���kY���,��yk��y�V�/�c;ƵsI��g�Ũ8��(ȱ� '~Eh\_Ņ>W(���PZ;�t2��q��a������+j77�O=���ŰӝE����{ٮ������}���Rq�h���IW��;(��QaPh[���H=�Ӫ[��>�R{Y&	b���̱� ���}X�e4�1����.}L8���^�6ㅷE�@�,C��� ��$)���X�l�۸�����SA�P�y|D��;�W�7DO.o�Fl���T��-2W��г�e�}��#~Gς��t+UW�TB����e�A�Y*JP�*��r���8�Jͼ��Dխ9r�E�W4k:`�����t�,f�(Y{����M	�`4R���G�8��.)P��T��>�H.���7��(�vݱ�A��b3dD��]1ܱL�����10�YH�1�w�|��|�e�f[�/������=:�('JsG�ƚ����!e��߭�	���WZ��p��� ������,"�-EKp)vs?��v9~r6�<��:+S,�����V�T��C����ٙQ�����zcἶ�����9�ط��U�vO�]�o^ȥ��V�v�����G���h� O;��;��A�g/{������H訤v�.ǉ�t�����{�ӑ�Ť@�!9z�|�bo��H=$^܀�GFQrX�P�����d��RbW/�ܴ3���e揼�*���"<��@N(�!���4VYB�⧎bf�7�ѭ�9*�й�:��O��:�E����"�O�pC�CZ�gx�ᅕ�H������!�4u3cћRP�%((������$��-�/�>�r�`�#�Ҕ��j�����Gqm3�	I�M��,�a��E�a<Gu�CCeF%�\�'�l���}����Nɐ޹d�O��m �'�'gF�X?���I�3�Q�������ա���Ъ˷s��c�bS�J��j$��o�մ��o���Xs�|'�V������`�t@ߐ�4�8���yތJɮ+���x�`�������1Á�!��z}�Ζ/�c���Ջt�M	Ч�a룷ͱ��cZ�kv5��#����t��=�N�E�Ȗ���%nR�������S���
uX�H��sNr�~�%V�̔����@dL%�2���Ib�7e�J\�~&L�7N·M��;S��/��1����3��z����� ��Ɏ3�ޅ��?zd���׉7���s4�����b,t��'"�}g��A�B�����Rۗ�d#�!�`�·;g�"����v^x$�H��I��A��Ӛ�9����΄�a!H��
 ���N��kWKH�πh+q2�x�#f`�����iD"Dm��5��ɐ�p��t���#5�r^Ja�:'p��W�z�R��Z��_��H��=�v'��K��*BC�
vf��Jٶ���]<�+(���9ّӜ�Z0f)At��p�����ض\��ԁR�z�BmnD��*��P a�8O`/�s�p(p��c��*���)���=*1�82ß�ş?�ְU��!
5�2d��7&�D�G�[F��"Z�9���ܣj_۝\��؈���y��/q7�^�0�[����N�>��2�(��SI���Q��W@���>_��w�J��0�7�4�y��WC��I�+[�)��Τ�}���ׄ6'������IH�:��sr�0�K�Ei|К�[uF���:o5��=�v!K8�I<�!����1<v�4c�2c���=1�4@ׄ���/p��3�Zp��RԘ��G��r�u��Y�I���@m��E��b�"�G���ԭOn�"��_0�-7�Uk?�	<�-�`xL�������|B#�������8S�Q/��vӝ����|�Ϣ�s��X��C��,o�a����y�f���J��J���K�=�s�(p���3ORW��dp�-|��}�B#���ʒŸ�����4S���e%Q9F3��i�i�G�/\\p;<I`[�~#���a�.��t``�$�Y.6���t/E�_i�c�dT��;*8�wb����|X�f>w���n��b�I�[��L�Ί�c��mVg޽���J��7���Y| �{@� ��5!��H�O7�����&*jЮ�mDŮ����^�5�8��h��U�'v����¦AǨ�1C� �'��2�2 -�3/n�:���m� ���+F�S��� ���e���&[�a��夣j�?�p�}�������i|`0CA��Uq(�䠆z:�^��)���|&�za���[�y`�c)`>��TP#/W(W�f�׌;xtr��߮����T�`K#?���F �G�w4Z\�ô ,�a����9�b�v�ZwO�:�7�R�ijHm�2��I��b��i�IcI��4�oH��5���肇���{�J7�t�~Ț�@��0����{ԃC���'��}eS��.u;#�GVK��`�i�b@׊m�~h�Z:M��B �Njy�H}��W���Mr���Y�ɣ]{s�yDd��:��� '>p���F��h	��5�h４��LC'5��%@j�:��x��h �;0Y�$'�)��Ga�ej"�>�6ሞRMR7 �)˕�Ҝ]nU�'�<k��
lF]�)�W~F��� �J��S��T�����OO��5	b�&F��.�������+/�?���T��
����Ē<��D
�y9�   ������'�5���^p�RI��ю��|���G���.[�\+*S+�\Z���@3��!�Յfv�9w�nя����ԥ[!���x;�~^�;�X��ph�a����C��΅	�����X��+<�SCL�%�6X�1D	�M�/"Ilwl�߃�<De�lE�v�I�ES)�F�H����q�kG �$���:W��ݢ��n��f!zb4V�<߄� ^����+�8�95�yaژ���ܥ-=�bR���ѷ����"ؿB���]a���4���"&a��k�뢤`N.�ph�(�Yat�I�-hd�ʼY��3BI�a�TaJ:/|��z8O0��a
��):
�Ma����5�s�KO�H�wX3���'��'|�2���/ޕt�vz�q1�ew��tt��HB�'K����Ғ>'.(���zU"8b��o����-0��>�ch���'�{�|��-�Bn�Z��5��ˬ�jr���%n��֛�`�.�+��J���Z�X�lA���Rk�h]��]~N�(hgh'U�;V]S��9Z���񵛽n��M<��/rXu��nQ�X���$�ӎ����YC�ČÑ���:��96r-�tX)ia�x(��T1V��{�$A@))%�����]B�R'�|��V�k�EQ�����+X�PK�ʌ 7��vx��x	zF���}| ���	8��H6`@+�Wud>s���k�^*��������SWѝBG]�g5��W�9ԩ����B:�M���z�W�-�8�=�a{�.lrV��}U�S���z�%gT�=7g��=�,g�����q��`�j��wG?P���a��RZ�y׹�|s����1j7�E�Y/�Q7��s��{�gK9�z�8Z`k��_ݕ,��3|E>�"*>:ŕsH�eFK��e����Y43cH�|sQ������~�WLJ�����NT���Y�t��$�����~zFt�����v��ٷ�:�E{&9�_Ԍ(�Q��~8��+�Q�ÞhB��7!ҏ��C��A�&|�	�_�Rt#��Չd�[���t|:��S��9f@yأFr %�er�Vr!�D,=���Y�<�@J�dE�ٟ���� �����ǧ-���g�[��r�k�A��cɘi]VP�t�1���\��dr3��8F�8�Z5.F���/�2��5FW�r�M!�|�g��%��=�ۏW���̤�0!O�i<T����]�4���<���؝�xL�@Ǝc��
�|����o��{+(��CN����@݋�|�'���ņ�g-�����t8!�E)�pe_��w��$p	�v����8�|]~W��7�.��"# �[1��U g��K�r�{X���)]B��Iv�	f5�F�ja�<;���ŷg��@⣂K0ť��E����M)$��8&�E�`�7j=�j��l�W4�ݮζ��{7Iv���ޫN2z�MY>�b���׊�D�TK��cD�d���UCL��ݿ{�,p�AtL�L�}1���\�.�C�9e�Kҽ�]�h�y�����"��f󦂼�zc�Y;w��ꋆ|�-���X�g�ȅF�#ǈ���5��˨aÁ�j#&sF=���˔����|`�Q
aа\� �%K��dQY�%��#��`3�n[��4t3L���5H0��T�)գ���!�$�0C1�"����C�y���#���Ͷ�8zq��ҽ�A��,��8��0~�ǣ��/�b5o��-�F���峑�QKr�Pt,�2
�����}�.L��"�b�Tg^�i�P��I�� �����ZY�s��[��*���/i�N�5��O��l��.      �     x���OO�0��맘r^���m��&@0���		�)[
e)i:����� GT��'�������Wb�^�}*���K���������s$k��I�H�I��.No�r�m� ��S��,��Ȝ a�|���1�9R������H.ׅi�6q��Q�f�.�ZS4s[������y��=�-ri����xwi����;��'�dT)91Ɗ;�ī��z&�O-xH=�`�J�U|����*6o�:ܗ����88e�Laq�&վk8���7��o�m�;A�e��:�}�q� �$��      |   �  x�}�Ɏ�H�5���m10�cƀ�`3�3�C0}e�e�J*�b�70(�[[@���C?�H���V0��[���M�4����*��鹊U���{�Y�~�ɟ(�e~���~����'�Z�b�Xt��[j�'�m�s�G�\�K���|ѣ�������q�����~��Uz��I���T�l�:��U�����7,3�bzXk2���IH�䵗�@��4#�xR������,�8ޯ[-�0>��j����ѩ�gI��ZDn˃#G'g��`Cz<	�ǅT��Q��A�K�]5["���	���.��g��WBg���D���	��<ع�p2�r��)_��Q]��W�fm�k~���{�F�T���d.sf٠�ds�^����cӢ��|
�.
�!�`�n'����|{R�80<}k<�lk5�MM�Jo}�"�����;=A�C�S�:%Yx�.|�c(T��?���	���c�ǀ��C�p�鄘X��^7
�kQny�V�����C�~=.	�sB���x���y��I�Yx	��C4L;���Y�N{o� .y��;Y#@���|6���x���%�UG>s�����ʃ�{�]1j��z��0�Dr�В�=T���ݽ�\x���k'҆��-_$���]�� n��m��5�s�fm��'Q�N�8�Z4��+�*���V�Ke����$�I����HH��U�^��A�QwzL�5��l>���!;`�zB��2X�{�g��q��=NCѐ��|���>�9{p`Z�p�����$m����b{TϕR�����'2Y�,F���/���}�{�����Ѷ�3a�:,����61�,�%ْ;aĕ7��R(�-�}�ں,�&�?0���������Y�{     