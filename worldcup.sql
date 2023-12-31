PGDMP                         {            worldcup     15.3 (Ubuntu 15.3-1.pgdg22.04+1)     15.3 (Ubuntu 15.3-1.pgdg22.04+1)     3           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            4           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            5           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            6           1262    16391    worldcup    DATABASE     t   CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';
    DROP DATABASE worldcup;
                postgres    false            �            1259    16403    games    TABLE       CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(20) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);
    DROP TABLE public.games;
       public         heap    postgres    false            �            1259    16402    games_game_id_seq    SEQUENCE     �   CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.games_game_id_seq;
       public          postgres    false    217            7           0    0    games_game_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;
          public          postgres    false    216            �            1259    16393    teams    TABLE     e   CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(15) NOT NULL
);
    DROP TABLE public.teams;
       public         heap    postgres    false            �            1259    16392    teams_team_id_seq    SEQUENCE     �   CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.teams_team_id_seq;
       public          postgres    false    215            8           0    0    teams_team_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;
          public          postgres    false    214            �           2604    16406    games game_id    DEFAULT     n   ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);
 <   ALTER TABLE public.games ALTER COLUMN game_id DROP DEFAULT;
       public          postgres    false    216    217    217            �           2604    16396    teams team_id    DEFAULT     n   ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);
 <   ALTER TABLE public.teams ALTER COLUMN team_id DROP DEFAULT;
       public          postgres    false    214    215    215            0          0    16403    games 
   TABLE DATA           k   COPY public.games (game_id, year, round, winner_id, opponent_id, winner_goals, opponent_goals) FROM stdin;
    public          postgres    false    217   �       .          0    16393    teams 
   TABLE DATA           .   COPY public.teams (team_id, name) FROM stdin;
    public          postgres    false    215   �       9           0    0    games_game_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.games_game_id_seq', 32, true);
          public          postgres    false    216            :           0    0    teams_team_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.teams_team_id_seq', 72, true);
          public          postgres    false    214            �           2606    16408    games games_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);
 :   ALTER TABLE ONLY public.games DROP CONSTRAINT games_pkey;
       public            postgres    false    217            �           2606    16400    teams teams_name_key 
   CONSTRAINT     O   ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);
 >   ALTER TABLE ONLY public.teams DROP CONSTRAINT teams_name_key;
       public            postgres    false    215            �           2606    16398    teams teams_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);
 :   ALTER TABLE ONLY public.teams DROP CONSTRAINT teams_pkey;
       public            postgres    false    215            �           2606    16424    games fk_games_opponent    FK CONSTRAINT        ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_games_opponent FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);
 A   ALTER TABLE ONLY public.games DROP CONSTRAINT fk_games_opponent;
       public          postgres    false    3226    215    217            �           2606    16419    games fk_games_teams    FK CONSTRAINT     z   ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_games_teams FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);
 >   ALTER TABLE ONLY public.games DROP CONSTRAINT fk_games_teams;
       public          postgres    false    215    217    3226            0   '  x�m�AN�0еs
. ���I k,�TP�J�,���8�*��y���"VxZ��	r�����۲n�wϧ�cF`=�������[PS�0��KPsl��3m�y�E�A\&�<���)��ǽ��t3~\��˲���0F�3p�#z���h�c��4&�#Z��q�E�X@��8�ϖ�sLǯ��|���xQ����Ezөk3�MQs�=J�ܓE�!4�?MJ�0��o+B�s��:(�n���G������mI�8�?�W��v�vy�Xl0��q�bk���L�u�PlK�B�����      .   �   x�-��j�0�ϳO�'(vb��1q�@�������^���d�6y�ڤ�������k��
�u8)�ɱ�t�ɬ���Б��4���h~��@�`�����9Nn������kA�3��.�Q፯�fx�_m�9�%��ɮ�\Ygw��!�ɱ'[`�����$�nd-��.����R:&^����-�z![�N�<�̰��2�!�̯�5�A�t�&q��>����`RV     