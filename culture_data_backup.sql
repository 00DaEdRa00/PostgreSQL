--
-- PostgreSQL database dump
--

\restrict iCcwFgj31hImHCf0KNCD3xE1dCFZBtPKNbarXP1vSaej4RVKKGOJijuvaNaC3xF

-- Dumped from database version 18.4
-- Dumped by pg_dump version 18.4

-- Started on 2026-07-01 13:54:48

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 7 (class 2615 OID 16388)
-- Name: culture_data; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA culture_data;


ALTER SCHEMA culture_data OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 221 (class 1259 OID 16389)
-- Name: culture_palaces_clubs; Type: TABLE; Schema: culture_data; Owner: postgres
--

CREATE TABLE culture_data.culture_palaces_clubs (
    "data.general.name" character varying(128) NOT NULL,
    "data.general.locale.name" character varying(50) NOT NULL,
    "data.general.locale.timezone" character varying(50) NOT NULL,
    "data.general.address.street" character varying(64),
    "data.general.address.comment" character varying(256),
    "data.general.address.fullAddress" character varying(128) NOT NULL,
    "data.general.address.mapPosition" jsonb,
    "data.general.description" text NOT NULL,
    "data.general.contacts.website" character varying(128),
    "data.general.contacts.email" character varying(50),
    "data.general.contacts.phones" jsonb,
    "data.general.image" jsonb,
    "data.general.gallery" jsonb,
    "data.general.category.type" character varying(50),
    "data.general.category.name" character varying(50) NOT NULL,
    "data.general.organization.name" character varying(256) NOT NULL,
    "data.general.organization.locale.name" character varying(50),
    "data.general.organization.locale.timezone" character varying(50),
    "data.general.organization.address.street" character varying(50),
    "data.general.organization.address.comment" character varying(50),
    "data.general.organization.address.fullAddress" character varying(128),
    "data.general.organization.address.mapPosition" character varying(50),
    "data.general.organization.inn" bigint,
    "data.general.organization.type" character varying(50),
    "data.general.organization.subordination.name" character varying(50),
    "data.general.organization.subordination.timezone" character varying(50),
    "data.general.organization.socialGroups" character varying(8192),
    "data.general.organization.id" integer,
    "data.general.tags" jsonb,
    "data.general.videoHostings" character varying(2048),
    "data.general.workingSchedule.0" jsonb,
    "data.general.workingSchedule.1" jsonb,
    "data.general.workingSchedule.2" jsonb,
    "data.general.workingSchedule.3" jsonb,
    "data.general.workingSchedule.4" jsonb,
    "data.general.workingSchedule.5" jsonb,
    "data.general.workingSchedule.6" jsonb,
    "data.general.extraFields.artType" character varying(50),
    "data.general.extraFields.audienceType" character varying(50),
    "data.general.extraFields.language" character varying(50),
    "data.general.extraFields.professionalLevel" character varying(50),
    "data.general.extraFields.virtualTour" character varying(50),
    "data.general.extraFields.types" character varying(50),
    "data.general.seances" character varying(50),
    "data.general.id" bigint NOT NULL,
    "data.general.externalInfo" text,
    "data.general.externalIds.eipskId" integer,
    "data.general.externalIds.culturarf" character varying(50),
    "data.general.externalIds.goscatalogId" integer,
    "data.general.externalIds.statistic" integer,
    "data.info.createDate" timestamp with time zone,
    "data.info.updateDate" timestamp with time zone,
    geom culture_data.geometry(Point,4326)
);


ALTER TABLE culture_data.culture_palaces_clubs OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 20044)
-- Name: data.general.id.seq; Type: SEQUENCE; Schema: culture_data; Owner: postgres
--

CREATE SEQUENCE culture_data."data.general.id.seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE culture_data."data.general.id.seq" OWNER TO postgres;

--
-- TOC entry 5859 (class 0 OID 0)
-- Dependencies: 222
-- Name: data.general.id.seq; Type: SEQUENCE OWNED BY; Schema: culture_data; Owner: postgres
--

ALTER SEQUENCE culture_data."data.general.id.seq" OWNED BY culture_data.culture_palaces_clubs."data.general.id";


--
-- TOC entry 230 (class 1259 OID 21234)
-- Name: m2m_culture_palaces_clubs_tags; Type: TABLE; Schema: culture_data; Owner: postgres
--

CREATE TABLE culture_data.m2m_culture_palaces_clubs_tags (
    culture_palaces_clubs_id bigint CONSTRAINT m2m_culture_palaces_clubs_tag_culture_palaces_clubs_id_not_null NOT NULL,
    tag_sys_id integer NOT NULL
);


ALTER TABLE culture_data.m2m_culture_palaces_clubs_tags OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 21191)
-- Name: tags; Type: TABLE; Schema: culture_data; Owner: postgres
--

CREATE TABLE culture_data.tags (
    id integer NOT NULL,
    sys_id integer NOT NULL,
    name character varying(255) NOT NULL,
    sys_name character varying(255) NOT NULL
);


ALTER TABLE culture_data.tags OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 21190)
-- Name: tags_id_seq; Type: SEQUENCE; Schema: culture_data; Owner: postgres
--

CREATE SEQUENCE culture_data.tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE culture_data.tags_id_seq OWNER TO postgres;

--
-- TOC entry 5860 (class 0 OID 0)
-- Dependencies: 228
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: culture_data; Owner: postgres
--

ALTER SEQUENCE culture_data.tags_id_seq OWNED BY culture_data.tags.id;


--
-- TOC entry 5678 (class 2604 OID 21194)
-- Name: tags id; Type: DEFAULT; Schema: culture_data; Owner: postgres
--

ALTER TABLE ONLY culture_data.tags ALTER COLUMN id SET DEFAULT nextval('culture_data.tags_id_seq'::regclass);


--
-- TOC entry 5849 (class 0 OID 16389)
-- Dependencies: 221
-- Data for Name: culture_palaces_clubs; Type: TABLE DATA; Schema: culture_data; Owner: postgres
--

INSERT INTO culture_data.culture_palaces_clubs VALUES ('Сосновский сельский клуб', 'Кадуйский район', 'Europe/Moscow', 'ул Центральная,зд 5а', NULL, 'обл Вологодская,р-н Кадуйский,п Сосновка,ул Центральная,зд 5а', '{"type": "Point", "coordinates": [36.497867, 59.582464]}', '<p><span>Здание Сосновского сельского клуба построено в 1955 году. До 2016 года клуб был самостоятельным учреждением, юридическим лицом. Сейчас это филиал Кадуйского центра культурного развития. </span></p> <p><span>Клуб является центром культурной жизни села и его окрестностей. На базе учреждения создан замечательный вокальный ансамбль «Конфетки-бараночки», который по праву является украшением культурной жизни поселка</span><span>. Также работает клуб «Белая королева» для любителей шахмат, клуб «Охота на рыбалку» для рыболовов и охотников, музыкально-инструментальная студия, детское объединение «Детсовет» и спортивная секция «Не отстаем от Шараповой».</span></p>', NULL, NULL, '[]', '{"url": "https://all.culture.ru/uploads/b778a641eaa67d146d3f87991b27d40e.jpg", "title": "сосновка дк.jpg"}', '[{"url": "https://all.culture.ru/uploads/f6891ed0fddd237226ebb14359d740e6.jpg", "title": "сосновка дк 2.jpg"}]', NULL, 'Дворцы культуры и клубы', 'МБУ «Кадуйский ЦКР»', 'Вологодская область', 'Europe/Moscow', 'ул Строителей,д 2', NULL, 'обл Вологодская,рп Кадуй,ул Строителей,д 2', NULL, 3510010837, 'mincult', 'Вологодская область', 'Europe/Moscow', '[{"network":"ok","name":"Культура. Кадуй","networkId":"61103236120724","updateDate":"2024-02-16T11:35:59Z","createDate":"2024-02-16T11:35:59Z","accountId":49941,"postingGroupId":44748}]', 36609, '[{"id": 596, "name": "Доступная среда", "sysName": "dostupnaya-sreda"}]', NULL, NULL, '{"to": "18:00:00", "from": "10:00:00"}', '{"to": "18:00:00", "from": "10:00:00"}', NULL, '{"to": "18:00:00", "from": "10:00:00"}', '{"to": "18:00:00", "from": "10:00:00"}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 83329, '[{"url":"https://www.culture.ru/institutes/96276/sosnovskii-selskii-klub","serviceName":"Культура.рф"},{"url":"https://afisha7.ru/kaduy/dvorcy-kultury-i-kluby/110840pl","serviceName":"Афиша7"}]', NULL, NULL, NULL, NULL, '2024-02-26 11:52:25+03', '2024-02-27 08:17:25+03', '0101000020E6100000FA60191BBA3F4240768C2B2E8ECA4D40');
INSERT INTO culture_data.culture_palaces_clubs VALUES ('Хохловский дом культуры', 'Кадуйский район', 'Europe/Moscow', 'ул Торфяников,д 12', NULL, 'обл Вологодская,р-н Кадуйский,рп Хохлово,ул Торфяников,д 12', '{"type": "Point", "coordinates": [37.398078, 59.146555]}', '<p>Хохловский дом культуры был открыт в 1988 году. В нем работают 32 клубных формирования, в них занимается 741 человек. Ежегодно коллективом Хохловского дома культуры проводится более 3 000 мероприятий, которые посещает около 40 000 человек. </p><p>Коллективы художественной самодеятельности – постоянные участники областных и районных мероприятий, победители всероссийских, региональных и областных конкурсов. Народный самодеятельный коллектив ансамбль «Тальянка», являющийся лауреатом различных конкурсов, известен и за пределами региона. </p><p>В здании размещены 3 экспозиции Центра народной традиционной культуры и ремесел: «Улома железная», коллекции музыкальных инструментов и вышивки. Они пользуются популярностью у жителей и гостей поселка Хохлово и Кадуйского округа. </p>', NULL, 'dk.hohlovo@mail.ru', '[]', '{"url": "https://all.culture.ru/uploads/48a27f6f9cb4cd77114becce7a8b35a9.jpg", "title": "7f36ed9f03f201bf2c889c0984547fff.jpg"}', '[{"url": "https://all.culture.ru/uploads/cb94afd3a204ee667ce304ea5420f757.jpg", "title": "2a1b0e5dcee20a1bf8cba6931fe45f9e.jpg"}]', NULL, 'Дворцы культуры и клубы', 'МБУ «Кадуйский ЦКР»', 'Вологодская область', 'Europe/Moscow', 'ул Строителей,д 2', NULL, 'обл Вологодская,рп Кадуй,ул Строителей,д 2', NULL, 3510010837, 'mincult', 'Вологодская область', 'Europe/Moscow', '[{"network":"ok","name":"Культура. Кадуй","networkId":"61103236120724","updateDate":"2024-02-16T11:35:59Z","createDate":"2024-02-16T11:35:59Z","accountId":49941,"postingGroupId":44748}]', 36609, '[{"id": 25, "name": "Классическое искусство", "sysName": "klassicheskoe-iskusstvo"}, {"id": 27, "name": "Декоративно-прикладное искусство", "sysName": "dekorativno-prikladnoe-iskusstvo"}, {"id": 29, "name": "Музыка", "sysName": "muzyka"}, {"id": 39, "name": "Для детей", "sysName": "dlya-detey"}, {"id": 317, "name": "Для молодежи", "sysName": "dlya-molodezhi"}, {"id": 596, "name": "Доступная среда", "sysName": "dostupnaya-sreda"}]', NULL, NULL, '{"to": "18:05:00", "from": "10:00:00"}', '{"to": "18:05:00", "from": "10:00:00"}', '{"to": "19:00:00", "from": "10:00:00"}', '{"to": "19:00:00", "from": "10:00:00"}', '{"to": "22:00:00", "from": "14:00:00"}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 83328, '[{"url":"https://www.culture.ru/institutes/96275/khokhlovskii-dom-kultury","serviceName":"Культура.рф"},{"url":"https://afisha7.ru/kaduy/dvorcy-kultury-i-kluby/110839pl","serviceName":"Афиша7"}]', NULL, NULL, NULL, NULL, '2024-02-26 11:49:51+03', '2024-02-27 08:14:31+03', '0101000020E6100000E8A04B38F4B242405B087250C2924D40');
INSERT INTO culture_data.culture_palaces_clubs VALUES ('Томашевский клуб', 'Великоустюгский район', 'Europe/Moscow', 'д 9', NULL, 'обл Вологодская,р-н Великоустюгский,д Томашево,д 9', '{"type": "Point", "coordinates": [46.815872, 60.505744]}', '<p>В Томашевском клубе проводятся массовые мероприятия – это концерты, праздники, выставки, вечера, посиделки, игровые и спортивные состязания, устные журналы. Учреждение ежегодно принимает участие в смотрах-фестивалях художественной самодеятельности.</p><p> Занятие найдется для всех: и для маленьких, и для больших. Для детей проводятся конкурсные и игровые программы, для молодежи – различные беседы, танцевальные и игровые вечера. На базе Томашевского клуба действуют кружки «Умелые ручки» и «Веселые ребята». Также работает самодеятельный ансамбль под названием «Ивушки» (в составе – девять человек), который выступает на концертах, посещает со своими выступлениями близлежащие деревни.</p>', 'https://кдцву.рф', 'svetaponi07@gmail.com', '[{"value": "79997918932", "comment": "Зорина Любовь Михайловна, начальник Орловского клуба"}, {"value": "78173821660", "comment": "Нечаева Елена Николаевна"}]', '{"url": "https://all.culture.ru/uploads/7f29d7ff7f5480ba21f4b84fabb2a904.jpg", "title": "рг гн.jpg"}', NULL, NULL, 'Дворцы культуры и клубы', 'МБУК «Великоустюгский культурно-досуговый центр»', 'Великоустюгский район', 'Europe/Moscow', 'пр-кт Советский,д 101', NULL, 'обл Вологодская,р-н Великоустюгский,г Великий Устюг,пр-кт Советский,д 101', NULL, 3526015975, 'mincult', 'Великоустюгский район', 'Europe/Moscow', '[{"network":"vk","name":"\"Кузинский клуб\"","networkId":"170421267","updateDate":"2023-04-05T11:45:45Z","createDate":"2023-04-05T11:45:45Z","accountId":46589,"postingGroupId":41531},{"network":"vk","name":"\"Усть-Алексеевский клуб\"","networkId":"196143083","updateDate":"2023-04-05T13:11:25Z","createDate":"2023-04-05T13:11:25Z","accountId":46589,"postingGroupId":41534},{"network":"vk","name":"«Верхневарженский клуб»","networkId":"219499380","updateDate":"2023-04-05T11:45:28Z","createDate":"2023-04-05T11:45:28Z","accountId":46589,"postingGroupId":41530},{"network":"vk","name":"«Морозовский клуб»","networkId":"219948363","updateDate":"2023-07-05T08:23:07Z","createDate":"2023-07-05T08:23:07Z","accountId":46589,"postingGroupId":42638},{"network":"vk","name":"«Новаторский клуб»","networkId":"217628593","updateDate":"2023-03-17T08:05:55Z","createDate":"2023-03-17T08:05:55Z","accountId":46589,"postingGroupId":41030},{"network":"vk","name":"Анюта Красникова","networkId":"17613040","updateDate":"2023-03-17T10:43:29Z","createDate":"2023-03-17T10:43:29Z","accountId":46594,"postingGroupId":41037},{"network":"vk","name":"БУК \"Юдинский дом культуры\" п. Стрига 6а","networkId":"160210512","updateDate":"2023-04-11T12:03:48Z","createDate":"2023-04-11T12:03:48Z","accountId":46589,"postingGroupId":41660},{"network":"vk","name":"Великоустюгский культурно-досуговый центр","networkId":"117993849","updateDate":"2024-02-15T08:49:55Z","createDate":"2024-02-15T08:49:55Z","accountId":46589,"postingGroupId":44737},{"network":"vk","name":"Обособленное подразделение \"Аристовский клуб\"","networkId":"195948369","updateDate":"2023-03-17T08:06:12Z","createDate":"2023-03-17T08:06:12Z","accountId":46589,"postingGroupId":41031},{"network":"vk","name":"Обособленное подразделение \"Сусоловский клуб\"","networkId":"219106681","updateDate":"2023-04-07T11:43:09Z","createDate":"2023-04-07T11:43:09Z","accountId":46589,"postingGroupId":41581},{"network":"vk","name":"Обособленное подразделение \"Теплогорский клуб\"","networkId":"97047864","updateDate":"2023-04-07T11:43:26Z","createDate":"2023-04-07T11:43:26Z","accountId":46589,"postingGroupId":41582},{"network":"vk","name":"Окультурено молодежью","networkId":"199241624","updateDate":"2023-03-17T10:42:43Z","createDate":"2023-03-17T10:42:43Z","accountId":46594,"postingGroupId":41036},{"network":"vk","name":"Парк культуры и отдыха /Великий Устюг/","networkId":"153198570","updateDate":"2023-04-05T11:46:08Z","createDate":"2023-04-05T11:46:08Z","accountId":46589,"postingGroupId":41532},{"network":"vk","name":"Полдарский клуб","networkId":"206228726","updateDate":"2023-07-05T08:23:33Z","createDate":"2023-07-05T08:23:33Z","accountId":46589,"postingGroupId":42639},{"network":"vk","name":"Театр Деда Мороза","networkId":"199304892","updateDate":"2020-11-03T05:54:59Z","createDate":"2020-11-03T05:54:59Z","accountId":21245,"postingGroupId":30273}]', 20409, '[{"id": 27, "name": "Декоративно-прикладное искусство", "sysName": "dekorativno-prikladnoe-iskusstvo"}, {"id": 29, "name": "Музыка", "sysName": "muzyka"}, {"id": 39, "name": "Для детей", "sysName": "dlya-detey"}, {"id": 317, "name": "Для молодежи", "sysName": "dlya-molodezhi"}, {"id": 596, "name": "Доступная среда", "sysName": "dostupnaya-sreda"}]', NULL, NULL, '{"to": "13:00:00", "from": "10:00:00"}', '{"to": "13:00:00", "from": "10:00:00"}', '{"to": "13:00:00", "from": "10:00:00"}', '{"to": "13:00:00", "from": "10:00:00"}', '{"to": "23:00:00", "from": "20:00:00"}', '{"to": "16:00:00", "from": "13:00:00"}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 83485, '[{"url":"https://www.culture.ru/institutes/96429/tomashevskii-klub","serviceName":"Культура.рф"}]', NULL, NULL, NULL, NULL, '2024-03-05 14:29:35+03', '2024-03-06 11:36:06+03', '0101000020E61000006EDC627E6E684740F9122A38BC404E40');
INSERT INTO culture_data.culture_palaces_clubs VALUES ('Мазский сельский клуб', 'Кадуйский район', 'Europe/Moscow', 'ул Центральная,зд 68', NULL, 'обл Вологодская,р-н Кадуйский,д Маза,ул Центральная,зд 68', '{"type": "Point", "coordinates": [36.713355, 59.328558]}', '<p><span>В 1969 году в деревне Маза был открыт Дом культуры. В 2016 году его реорганизовали, он стал филиалом Рукавицкого дома культуры. С 2023 года является филиалом Кадуйского центра культурного развития. </span></p> <p><span>На базе сельского клуба создан вокальный ансамбль «Белые росы», который является участником местных, районных и межрайонных мероприятий. Ведут работу клубные формирования для детей, молодежи и старшего поколения. Действует театральный кружок, клуб «Оберег», мастерская художественного слова.</span></p> <p><span>Ежегодно во второе воскресенье июля работники клуба проводят праздник деревни с концертно-развлекательной программой и общим деревенским застольем. За год в Мазском клубе проходит порядка 300 мероприятий.</span></p>', NULL, NULL, '[]', '{"url": "https://all.culture.ru/uploads/28d604804cb4070a464f4cbd42e66366.jpg", "title": "маза дк.jpg"}', NULL, NULL, 'Дворцы культуры и клубы', 'МБУ «Кадуйский ЦКР»', 'Вологодская область', 'Europe/Moscow', 'ул Строителей,д 2', NULL, 'обл Вологодская,рп Кадуй,ул Строителей,д 2', NULL, 3510010837, 'mincult', 'Вологодская область', 'Europe/Moscow', '[{"network":"ok","name":"Культура. Кадуй","networkId":"61103236120724","updateDate":"2024-02-16T11:35:59Z","createDate":"2024-02-16T11:35:59Z","accountId":49941,"postingGroupId":44748}]', 36609, '[{"id": 596, "name": "Доступная среда", "sysName": "dostupnaya-sreda"}]', NULL, NULL, '{"to": "18:00:00", "from": "14:00:00"}', '{"to": "18:00:00", "from": "14:00:00"}', '{"to": "18:00:00", "from": "14:00:00"}', '{"to": "22:00:00", "from": "18:00:00"}', '{"to": "23:00:00", "from": "19:00:00"}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 83354, '[{"url":"https://www.culture.ru/institutes/96303/mazskii-selskii-klub","serviceName":"Культура.рф"},{"url":"https://afisha7.ru/kaduy/dvorcy-kultury-i-kluby/110902pl","serviceName":"Афиша7"}]', NULL, NULL, NULL, NULL, '2024-02-27 15:40:17+03', '2024-02-28 08:36:54+03', '0101000020E610000013B875374F5B42406A6B44300EAA4D40');
INSERT INTO culture_data.culture_palaces_clubs VALUES ('Рукавицкий сельский дом культуры', 'Кадуйский район', 'Europe/Moscow', 'пер Рабочий,зд 11', NULL, 'обл Вологодская,р-н Кадуйский,д Малая Рукавицкая,пер Рабочий,зд 11', '{"type": "Point", "coordinates": [37.19134, 59.196274]}', '<p> Одноэтажное деревянное здание Дома культуры построено в 1982 году. Благодаря участию в региональных проектах «Сельский Дом культуры» и «Местный Дом культуры» в 2019 году в учреждении проведен капитальный ремонт внутренних помещений и приобретено современное звуковое и световое оборудование. В 2022 году Рукавицкий дом культуры стал одним из победителей областного конкурса на государственную поддержку лучших сельских учреждений культуры.</p><p>В учреждении функционируют 26 творческих объединений для детей и взрослых различных направлений: вокал, хореография, игровое, патриотическое, здоровый образ жизни, рукоделие. Наиболее полюбились зрителям вокальная студия «Семизерье» и вокально-инструментальный ансамбль «Верные друзья». </p><p>Ежегодно Дом культуры проводит более 500 мероприятий, которые посещает порядка 20 000 человек. На базе учреждения реализуется благотворительный проект «Волшебная комната» по прокату нарядной одежды для семей, попавших в трудную жизненную ситуацию.</p>', NULL, 'rukavitskiydomkultury2020@mail.ru', '[]', '{"url": "https://all.culture.ru/uploads/8c8eb723cc90e2e6da84940207184cef.jpg", "title": "рдк.jpg"}', NULL, NULL, 'Дворцы культуры и клубы', 'МБУ «Кадуйский ЦКР»', 'Вологодская область', 'Europe/Moscow', 'ул Строителей,д 2', NULL, 'обл Вологодская,рп Кадуй,ул Строителей,д 2', NULL, 3510010837, 'mincult', 'Вологодская область', 'Europe/Moscow', '[{"network":"ok","name":"Культура. Кадуй","networkId":"61103236120724","updateDate":"2024-02-16T11:35:59Z","createDate":"2024-02-16T11:35:59Z","accountId":49941,"postingGroupId":44748}]', 36609, '[{"id": 596, "name": "Доступная среда", "sysName": "dostupnaya-sreda"}]', NULL, NULL, '{"to": "21:00:00", "from": "15:00:00"}', '{"to": "20:00:00", "from": "14:00:00"}', '{"to": "20:00:00", "from": "14:00:00"}', '{"to": "20:00:00", "from": "14:00:00"}', '{"to": "22:00:00", "from": "15:00:00"}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 83333, '[{"url":"https://afisha7.ru/kaduy/dvorcy-kultury-i-kluby/110844pl","serviceName":"Афиша7"},{"url":"https://www.culture.ru/institutes/96281/rukavickii-selskii-dom-kultury","serviceName":"Культура.рф"}]', NULL, NULL, NULL, NULL, '2024-02-26 13:58:41+03', '2024-02-27 09:17:40+03', '0101000020E6100000543541D47D9842400E87A5811F994D40');
INSERT INTO culture_data.culture_palaces_clubs VALUES ('Андроновский сельский дом культуры', 'Кадуйский район', 'Europe/Moscow', 'ул Надежды,д 11', NULL, 'обл Вологодская,р-н Кадуйский,д Андроново,ул Надежды,д 11', '{"type": "Point", "coordinates": [37.259306, 59.400625]}', '<p> Андроновский дом культуры был открыт в 1972 году. Более 50 лет он является центром культурной жизни деревни Андроново и близлежащих населенных пунктов. </p><p>На базе Дома культуры работают 11 клубных формирований. С особой любовью в селе относятся к участникам вокально-танцевальной детской группы «Овация». Дети учатся не только петь и танцевать, но и быть добрыми, раскованными, учатся общению. Для взрослых создан клуб «Рябинушка» и формирование «Юбиляр». Сельская молодежь активно участвует в клубе «Буги-вуги» и кружке «Зажигай». Вокальный ансамбль «Горлица» по праву является украшением Дома культуры.</p><p> </p><p>Среди детей и подростков проводится большая работа по формированию здорового образа жизни, для взрослых регулярно организуются познавательно-развлекательные программы. </p>', NULL, NULL, '[]', '{"url": "https://all.culture.ru/uploads/c71b4a803f8c0849fe3c0b83a4de4c2b.jpg", "title": "IMG_20220520_175250.jpg"}', '[{"url": "https://all.culture.ru/uploads/6f65bcd6cab501c3b79731e8d47869bc.jpg", "title": "Андроновский ДК (3).jpg"}, {"url": "https://all.culture.ru/uploads/1192179cb993810b5633f6ee6bf6ef7c.JPG", "title": "IMG_1537 (1).JPG"}]', NULL, 'Дворцы культуры и клубы', 'МБУ «Кадуйский ЦКР»', 'Вологодская область', 'Europe/Moscow', 'ул Строителей,д 2', NULL, 'обл Вологодская,рп Кадуй,ул Строителей,д 2', NULL, 3510010837, 'mincult', 'Вологодская область', 'Europe/Moscow', '[{"network":"ok","name":"Культура. Кадуй","networkId":"61103236120724","updateDate":"2024-02-16T11:35:59Z","createDate":"2024-02-16T11:35:59Z","accountId":49941,"postingGroupId":44748}]', 36609, '[{"id": 39, "name": "Для детей", "sysName": "dlya-detey"}, {"id": 317, "name": "Для молодежи", "sysName": "dlya-molodezhi"}, {"id": 596, "name": "Доступная среда", "sysName": "dostupnaya-sreda"}]', NULL, NULL, '{"to": "14:00:00", "from": "11:00:00"}', '{"to": "14:00:00", "from": "11:00:00"}', '{"to": "14:00:00", "from": "11:00:00"}', '{"to": "18:00:00", "from": "15:00:00"}', '{"to": "18:00:00", "from": "15:00:00"}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 83243, '[{"url":"https://www.culture.ru/institutes/96192/andronovskii-selskii-dom-kultury","serviceName":"Культура.рф"},{"url":"https://afisha7.ru/kaduy/dvorcy-kultury-i-kluby/110615pl","serviceName":"Афиша7"}]', NULL, NULL, NULL, NULL, '2024-02-19 15:56:07+03', '2024-02-20 08:10:01+03', '0101000020E61000000BD462F030A14240E17A14AE47B34D40');
INSERT INTO culture_data.culture_palaces_clubs VALUES ('Нюксенский этнокультурный центр «Пожарище»', 'Нюксенский район', 'Europe/Moscow', 'д 25', 'авт. «Нюксеница – Пожарище» один раз в день', 'обл Вологодская,р-н Нюксенский,д Пожарище,д 25', '{"type": "Point", "coordinates": [44.07472171211021, 60.474300560123666]}', '<p>Этнокультурный центр является важным туристским объектом Вологодской области, как юридическое лицо создан в 2008 году. Возрождение созидательного народного мировоззрения, воссоздание праздников, гуляний, обрядов, предметов народного быта и искусства, приобщение к культурному наследию – важнейшие направления деятельности центра. </p><p>Восстановлением региональных традиций Уфтюги занимаются участники шести клубных формирований самодеятельного народного творчества и клубы по интересам «Народный архив» и «Лад». Все направления работы творческих формирований имеют культурно-познавательную значимость, призваны пробудить интерес к малой родине, к родовым корням. Кроме заслуженного коллектива народного творчества фольклорно-этнографического ансамбля «Уфтюжаночка» почетное звание «образцовый» имеет самодеятельный фольклорный театр. </p><p>В помещении экспозиционного зала работают сменные фольклорно-этнографические выставки, обеспечивающие доступ желающих к фондам. Организована уличная выставка исторических банеров «Сохраняя наследие», «Традиционный народный костюм Уфтюгско-Кокшенгского пограничья», «Праздничные головные платки: шелковики, репсовики, аглицкие», «Семейные реликвии», «Изготовлено по старинным образцам», «Этнографические куклы из фондов этнокультурного центра», «Куклы бабушки Поли», фотовыставка «Откроем мир забытых вещей и названий». </p>', 'https://рэц-пожарище.рф', 'centruftuga@mail.ru', '[{"value": "78174722160", "comment": ""}]', '{"url": "https://all.culture.ru/uploads/4228c3761d19e65f21814d534834f2d7.jpg", "title": "80c4959b-bcdf-57a4-86ff-f2db2b0a2b1a.jpg"}', '[{"url": "https://all.culture.ru/uploads/ece9e358e3d6942d678a8e900604a51c.jpg", "title": "m0r6NBCCl70.jpg"}, {"url": "https://all.culture.ru/uploads/bae91f684e5e49191277683fb387102a.jpg", "title": "fta_j6o4DQQ.jpg"}, {"url": "https://all.culture.ru/uploads/cd6e888b6eb25551121256629434f9b1.jpg", "title": "yl8Z6m8Jjz0.jpg"}, {"url": "https://all.culture.ru/uploads/952813e6836a94ba2202bfb99f029e9c.jpg", "title": "kollektiv.jpg"}, {"url": "https://all.culture.ru/uploads/ecb63ae65ee85fdf3bc179a4046e2149.jpg", "title": "w_d5cc654d.jpg"}, {"url": "https://all.culture.ru/uploads/0e47b4a12873427eeeeed2f0edc15b0f.jpg", "title": "69vcchaowfu.jpg"}, {"url": "https://all.culture.ru/uploads/d9dc1fe472b4fe8a79b6962d55e4e76f.jpg", "title": "07.jpg"}]', NULL, 'Дворцы культуры и клубы', 'МБУК и Т «НЭЦ Пожарище»', 'Нюксенский район', 'Europe/Moscow', '25 д', NULL, 'обл Вологодская,р-н Нюксенский,д Пожарище,25 д', NULL, 3515004040, 'mincult', 'Нюксенский район', 'Europe/Moscow', NULL, 36574, '[{"id": 24, "name": "История", "sysName": "istoriya"}, {"id": 27, "name": "Декоративно-прикладное искусство", "sysName": "dekorativno-prikladnoe-iskusstvo"}, {"id": 39, "name": "Для детей", "sysName": "dlya-detey"}, {"id": 152, "name": "Этнография", "sysName": "etnografiya"}, {"id": 317, "name": "Для молодежи", "sysName": "dlya-molodezhi"}, {"id": 596, "name": "Доступная среда", "sysName": "dostupnaya-sreda"}, {"id": 751, "name": "Культура для школьников", "sysName": "kultura-dlya-shkolnikov"}]', NULL, '{"to": "17:15:00", "from": "09:00:00"}', '{"to": "17:15:00", "from": "09:00:00"}', '{"to": "17:15:00", "from": "09:00:00"}', '{"to": "17:15:00", "from": "09:00:00"}', '{"to": "17:15:00", "from": "09:00:00"}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 83240, '[{"url":"https://afisha7.ru/nyuksenica/dvorcy-kultury-i-kluby/110596pl","serviceName":"Афиша7"},{"url":"https://www.culture.ru/institutes/96189/nyuksenskii-etnokulturnyi-centr-pozharishe","serviceName":"Культура.рф"}]', NULL, NULL, NULL, NULL, '2024-02-19 14:26:48+03', '2024-02-19 16:18:36+03', '0101000020E610000041E8267B90094640521A79E1B53C4E40');
INSERT INTO culture_data.culture_palaces_clubs VALUES ('Никольский сельский дом культуры', 'Кадуйский район', 'Europe/Moscow', 'ул Городская,д 4', NULL, 'обл Вологодская,р-н Кадуйский,с Никольское,ул Городская,д 4', '{"type": "Point", "coordinates": [37.179123, 59.355228]}', '<p><span>Никольский сельский дом культуры создан в августе 1968 года для организации досуга и приобщения жителей сельского поселения к творчеству, культурному развитию и самообразованию, любительскому искусству и ремеслам. </span></p> <p><span>В учреждении работают любительские творческие коллективы, кружки, студии и другие клубные формирования. У детей пользуется популярностью клуб «МАСТЕР.ок», клуб «Веселая горница», клуб «Карусель». Для юношества создан клуб «Сверстники» и КВН. Взрослое население с удовольствием посещает клуб «Огонек», клуб «Дом», мини-театр «Миниатюра». </span></p><p><span>Большое внимание сотрудники Дома культуры уделяют развитию коллективов художественной самодеятельности. Ансамбль ветеранов «Вдохновение», народный ансамбль лирической песни «Зоренька», детский ансамбль танца «Веселинка», детский ансамбль «Задоринки» не раз становились лауреатами районных и межмуниципальных конкурсов. </span></p> <p><span></span><span></span><span>На базе Никольского сельского клуба ежегодно проходит М</span>ежмуниципальный фестиваль-конкурс художественной самодеятельности среди сельских учреждений культуры «Мое село – моя Россия». <span>Работники Дома культуры оказывают консультативную, методическую и организационно-творческую помощь в подготовке и проведении культурно-досуговых мероприятий.</span></p>', NULL, 'mkuk.ndk@yandex.ru', '[{"value": "78174234168"}]', '{"url": "https://all.culture.ru/uploads/61c68358b70e7e900c49f8e02f88a1fe.jpg", "title": "1.jpg"}', '[{"url": "https://all.culture.ru/uploads/92ad729e179a09756e8b84928ec4bf8d.jpg", "title": "3d72ecb6a073b0910534501f34f2cd1d.jpg"}, {"url": "https://all.culture.ru/uploads/05e70906b5f8e91f51e8492696e67ea3.jpg", "title": "WWrV3IueZ8s.jpg"}, {"url": "https://all.culture.ru/uploads/ae35a4a2c574525652f27a0dfabdba21.jpg", "title": "e1ba62ecd02faaa69f13ca0143260311.jpg"}]', NULL, 'Дворцы культуры и клубы', 'МБУ «Кадуйский ЦКР»', 'Вологодская область', 'Europe/Moscow', 'ул Строителей,д 2', NULL, 'обл Вологодская,рп Кадуй,ул Строителей,д 2', NULL, 3510010837, 'mincult', 'Вологодская область', 'Europe/Moscow', '[{"network":"ok","name":"Культура. Кадуй","networkId":"61103236120724","updateDate":"2024-02-16T11:35:59Z","createDate":"2024-02-16T11:35:59Z","accountId":49941,"postingGroupId":44748}]', 36609, '[{"id": 25, "name": "Классическое искусство", "sysName": "klassicheskoe-iskusstvo"}, {"id": 27, "name": "Декоративно-прикладное искусство", "sysName": "dekorativno-prikladnoe-iskusstvo"}, {"id": 39, "name": "Для детей", "sysName": "dlya-detey"}, {"id": 317, "name": "Для молодежи", "sysName": "dlya-molodezhi"}, {"id": 596, "name": "Доступная среда", "sysName": "dostupnaya-sreda"}, {"id": 751, "name": "Культура для школьников", "sysName": "kultura-dlya-shkolnikov"}]', NULL, NULL, '{"to": "18:00:00", "from": "11:00:00"}', '{"to": "18:00:00", "from": "10:00:00"}', '{"to": "18:00:00", "from": "10:00:00"}', '{"to": "18:00:00", "from": "10:00:00"}', '{"to": "21:00:00", "from": "15:00:00"}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 83231, '[{"url":"https://www.culture.ru/institutes/96178/nikolskii-selskii-dom-kultury","serviceName":"Культура.рф"},{"url":"https://afisha7.ru/kaduy/dvorcy-kultury-i-kluby/110613pl","serviceName":"Афиша7"}]', NULL, NULL, NULL, NULL, '2024-02-19 08:18:13+03', '2024-02-20 09:20:26+03', '0101000020E61000000F7BA180ED964240CE4F711C78AD4D40');
INSERT INTO culture_data.culture_palaces_clubs VALUES ('Верхнешарденьгский клуб', 'Великоустюгский район', 'Europe/Moscow', 'д 79а', NULL, 'обл Вологодская,р-н Великоустюгский,с Верхняя Шарденьга,д 79а', '{"type": "Point", "coordinates": [46.318241, 60.395201]}', '<p>В здании бывшей школы расположен Верхнешарденьгский клуб, в котором проходят самые различные мероприятия. Для жителей и гостей поселения активно организуются и проводятся тематические праздники, концертные программы, народные гулянья, театрализованные представления, веселые игровые программы, вечера отдыха, занимательные конкурсы, интересные викторины, выставки, полезные мастер-классы. </p><p>Большее количество жителей села Верхняя Шарденьга – пенсионеры. Для них созданы два клубных формирования: клуб «Околица», в котором занимаются восемь человек, и театральный коллектив «Таланты», в составе которого десять человек. </p>', 'http://кдцву.рф', 'mukuadk@mail.ru', '[{"value": "78173868187", "comment": "специалист Забелинская Марина Сергеевна"}, {"value": "78173868187", "comment": "Бычихина Елена Евгеньевна начальник обособленного подразделения"}]', '{"url": "https://all.culture.ru/uploads/18970ec9978879835dea2b3ec1aaab50.jpg", "title": "2nJWgzZiVTw.jpg"}', NULL, NULL, 'Дворцы культуры и клубы', 'МБУК «Великоустюгский культурно-досуговый центр»', 'Великоустюгский район', 'Europe/Moscow', 'пр-кт Советский,д 101', NULL, 'обл Вологодская,р-н Великоустюгский,г Великий Устюг,пр-кт Советский,д 101', NULL, 3526015975, 'mincult', 'Великоустюгский район', 'Europe/Moscow', '[{"network":"vk","name":"\"Кузинский клуб\"","networkId":"170421267","updateDate":"2023-04-05T11:45:45Z","createDate":"2023-04-05T11:45:45Z","accountId":46589,"postingGroupId":41531},{"network":"vk","name":"\"Усть-Алексеевский клуб\"","networkId":"196143083","updateDate":"2023-04-05T13:11:25Z","createDate":"2023-04-05T13:11:25Z","accountId":46589,"postingGroupId":41534},{"network":"vk","name":"«Верхневарженский клуб»","networkId":"219499380","updateDate":"2023-04-05T11:45:28Z","createDate":"2023-04-05T11:45:28Z","accountId":46589,"postingGroupId":41530},{"network":"vk","name":"«Морозовский клуб»","networkId":"219948363","updateDate":"2023-07-05T08:23:07Z","createDate":"2023-07-05T08:23:07Z","accountId":46589,"postingGroupId":42638},{"network":"vk","name":"«Новаторский клуб»","networkId":"217628593","updateDate":"2023-03-17T08:05:55Z","createDate":"2023-03-17T08:05:55Z","accountId":46589,"postingGroupId":41030},{"network":"vk","name":"Анюта Красникова","networkId":"17613040","updateDate":"2023-03-17T10:43:29Z","createDate":"2023-03-17T10:43:29Z","accountId":46594,"postingGroupId":41037},{"network":"vk","name":"БУК \"Юдинский дом культуры\" п. Стрига 6а","networkId":"160210512","updateDate":"2023-04-11T12:03:48Z","createDate":"2023-04-11T12:03:48Z","accountId":46589,"postingGroupId":41660},{"network":"vk","name":"Великоустюгский культурно-досуговый центр","networkId":"117993849","updateDate":"2024-02-15T08:49:55Z","createDate":"2024-02-15T08:49:55Z","accountId":46589,"postingGroupId":44737},{"network":"vk","name":"Обособленное подразделение \"Аристовский клуб\"","networkId":"195948369","updateDate":"2023-03-17T08:06:12Z","createDate":"2023-03-17T08:06:12Z","accountId":46589,"postingGroupId":41031},{"network":"vk","name":"Обособленное подразделение \"Сусоловский клуб\"","networkId":"219106681","updateDate":"2023-04-07T11:43:09Z","createDate":"2023-04-07T11:43:09Z","accountId":46589,"postingGroupId":41581},{"network":"vk","name":"Обособленное подразделение \"Теплогорский клуб\"","networkId":"97047864","updateDate":"2023-04-07T11:43:26Z","createDate":"2023-04-07T11:43:26Z","accountId":46589,"postingGroupId":41582},{"network":"vk","name":"Окультурено молодежью","networkId":"199241624","updateDate":"2023-03-17T10:42:43Z","createDate":"2023-03-17T10:42:43Z","accountId":46594,"postingGroupId":41036},{"network":"vk","name":"Парк культуры и отдыха /Великий Устюг/","networkId":"153198570","updateDate":"2023-04-05T11:46:08Z","createDate":"2023-04-05T11:46:08Z","accountId":46589,"postingGroupId":41532},{"network":"vk","name":"Полдарский клуб","networkId":"206228726","updateDate":"2023-07-05T08:23:33Z","createDate":"2023-07-05T08:23:33Z","accountId":46589,"postingGroupId":42639},{"network":"vk","name":"Театр Деда Мороза","networkId":"199304892","updateDate":"2020-11-03T05:54:59Z","createDate":"2020-11-03T05:54:59Z","accountId":21245,"postingGroupId":30273}]', 20409, '[{"id": 27, "name": "Декоративно-прикладное искусство", "sysName": "dekorativno-prikladnoe-iskusstvo"}, {"id": 29, "name": "Музыка", "sysName": "muzyka"}, {"id": 39, "name": "Для детей", "sysName": "dlya-detey"}, {"id": 317, "name": "Для молодежи", "sysName": "dlya-molodezhi"}, {"id": 596, "name": "Доступная среда", "sysName": "dostupnaya-sreda"}]', NULL, NULL, '{"to": "14:00:00", "from": "10:00:00"}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 83214, '[{"url":"https://afisha7.ru/velikiy-ustyug/dvorcy-kultury-i-kluby/110583pl","serviceName":"Афиша7"},{"url":"https://www.culture.ru/institutes/96164/verkhneshardengskii-klub","serviceName":"Культура.рф"}]', NULL, NULL, NULL, NULL, '2024-02-16 14:11:43+03', '2024-02-19 09:18:44+03', '0101000020E6100000889FFF1EBC2847405A2C45F295324E40');
INSERT INTO culture_data.culture_palaces_clubs VALUES ('Кадниковский дом культуры', 'Вожегодский район', 'Europe/Moscow', 'ул Первомайская,д 7', NULL, 'обл Вологодская,р-н Вожегодский,п Кадниковский,ул Первомайская,д 7', '{"type": "Point", "coordinates": [40.26798, 60.322771]}', '<p><span>Кадниковский дом культуры был открыт 7 марта 1975 года. </span><span>Он обслуживает жителей сельского поселения Кадниковское и является единственным культурно-досуговым учреждением на этой территории. В зону обслуживания входят поселки Яхренга и Бекетово.</span></p> <p><span></span><span>Для жителей созданы все условия для комфортного проведения досуга: уютный зрительный зал на 260 мест, танцевальный зал, комнаты для кружковых занятий. </span><span></span><span>Традиционно организуются мероприятия, посвященные праздничным календарным датам. </span></p><p><span></span><span>В работе с несовершеннолетними<span> </span>первостепенное место занимают патриотическое, духовно-нравственное и эстетическое воспитание, пропаганда здорового образа жизни, э</span><span>стетическое воспитание (игровые, праздничные, музыкальные программы, мастер-классы). Проводятся тематические программы, беседы, устные журналы, спортивные мероприятия.</span></p> <p><span>Творческие коллективы Дома культуры принимают участие в межпоселенческих и районных фестивалях и конкурсах. </span><span></span></p>', NULL, NULL, '[{"value": "78174422647", "comment": ""}]', '{"url": "https://all.culture.ru/uploads/4912d3bcd752d90f261e44ba7e1199e0.jpg", "title": "Дом культуры.jpg"}', NULL, NULL, 'Дворцы культуры и клубы', 'МБУК «Вожегодский ЦКР»', 'Вожегодский район', 'Europe/Moscow', 'ул Садовая,д 10', NULL, 'обл Вологодская,р-н Вожегодский,рп Вожега,ул Садовая,д 10', NULL, 3506005231, 'mincult', 'Вожегодский район', 'Europe/Moscow', NULL, 26662, '[{"id": 27, "name": "Декоративно-прикладное искусство", "sysName": "dekorativno-prikladnoe-iskusstvo"}, {"id": 29, "name": "Музыка", "sysName": "muzyka"}, {"id": 39, "name": "Для детей", "sysName": "dlya-detey"}, {"id": 317, "name": "Для молодежи", "sysName": "dlya-molodezhi"}, {"id": 596, "name": "Доступная среда", "sysName": "dostupnaya-sreda"}]', NULL, NULL, '{"to": "18:00:00", "from": "11:00:00"}', '{"to": "18:00:00", "from": "11:00:00"}', '{"to": "18:00:00", "from": "11:00:00"}', '{"to": "18:00:00", "from": "11:00:00"}', '{"to": "18:00:00", "from": "11:00:00"}', '{"to": "18:00:00", "from": "11:00:00"}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 83941, '[{"url":"https://afisha7.ru/vozhega/dvorcy-kultury-i-kluby/112023pl","serviceName":"Афиша7"},{"url":"https://www.culture.ru/institutes/96885/kadnikovskii-dom-kultury","serviceName":"Культура.рф"}]', NULL, NULL, NULL, NULL, '2024-04-02 14:58:38+03', '2024-04-03 16:41:41+03', '0101000020E6100000B5FD2B2B4D224440728C648F50294E40');
INSERT INTO culture_data.culture_palaces_clubs VALUES ('Тарногский центр традиционной народной культуры', 'Тарногский район', 'Europe/Moscow', 'ул Кирова,д 8', NULL, 'обл Вологодская,р-н Тарногский,с Тарногский Городок,ул Кирова,д 8', '{"type": "Point", "coordinates": [43.573151, 60.500893]}', '<p>Центр создан для сохранения, изучения, восстановления и развития традиционной народной культуры. Сотрудники учреждения занимаются развитием местного народного художественного творчества, самобытной национальной культуры, народного творчества и фольклорного наследия. </p><p>На базе центра осуществляют деятельность четыре ансамбля, два из которых имеют статус «народный»: народный фольклорный коллектив «Сударушка», народный семейный коллектив братьев Никулиных, семейный коллектив Череповецких, женский вокальный ансамбль «Росстань». Сотрудники учреждения организуют и проводят мероприятия по традиционной народной культуре для взрослых и детей.</p>', 'https://tarnogakultura.vlg.muzkult.ru', 'tarnogactnk@yandex.ru', '[{"value": "78174821247"}]', '{"url": "https://all.culture.ru/uploads/c0d42c1839d6e859d7d8dfc1769229c4.jpg", "title": "1_SfU8gss6c.jpg"}', '[{"url": "https://all.culture.ru/uploads/07e4bb2f5d7b7b6511243d52996b0ecf.jpg", "title": "b1bIFOey0v4.jpg"}, {"url": "https://all.culture.ru/uploads/4f1740031838dbd022fdbfd253cd52cc.jpg", "title": "tEcxFCxminE.jpg"}, {"url": "https://all.culture.ru/uploads/d7c840f3881136d52b722d9dbab23f68.jpg", "title": "FSgaeV4-buE.jpg"}, {"url": "https://all.culture.ru/uploads/be022ce0d8bfa1b68132818cb6b7593b.jpg", "title": "03.jpg"}]', NULL, 'Дворцы культуры и клубы', 'БУК «Тарногский ЦТНК»', 'Тарногский район', 'Europe/Moscow', 'ул Кирова,д 8', NULL, 'обл Вологодская,р-н Тарногский,с Тарногский Городок,ул Кирова,д 8', NULL, 3517003571, 'mincult', 'Тарногский район', 'Europe/Moscow', NULL, 37098, '[{"id": 42, "name": "Культурные центры", "sysName": "kulturnye-centry"}, {"id": 350, "name": "Народная культура", "sysName": "narodnaya-kultura"}, {"id": 596, "name": "Доступная среда", "sysName": "dostupnaya-sreda"}]', NULL, '{"to": "17:00:00", "from": "09:00:00"}', '{"to": "17:00:00", "from": "09:00:00"}', '{"to": "17:00:00", "from": "09:00:00"}', '{"to": "17:00:00", "from": "09:00:00"}', '{"to": "17:00:00", "from": "09:00:00"}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 84620, '[{"url":"https://www.culture.ru/institutes/97542/tarnogskii-centr-tradicionnoi-narodnoi-kultury","serviceName":"Культура.рф"},{"url":"https://afisha7.ru/tarnogskiy-gorodok/dvorcy-kultury-i-kluby/113131pl","serviceName":"Афиша7"}]', NULL, NULL, NULL, NULL, '2024-05-20 09:59:54+03', '2024-05-20 10:32:51+03', '0101000020E6100000B95510035DC94540CDE506431D404E40');
INSERT INTO culture_data.culture_palaces_clubs VALUES ('Ильинский клуб', 'Великоустюгский район', 'Europe/Moscow', 'д 51', 'в летний период – паром из г. Великий Устюг; в зимний период – по ледовой переправе', 'обл Вологодская,р-н Великоустюгский,с Ильинское,д 51', '{"type": "Point", "coordinates": [46.749351, 60.597636]}', '<p>Здание действующего клуба введено в эксплуатацию в конце лета 1989 года. Руководителем была Тамара Петровна Бестужева.</p> <p> В клубе работали кружки, проходили смотры художественной самодеятельности, весело и многолюдно проводились праздники: «Проводы зимы», Масленица, день деревни, 9 Мая, «Золотая осень», Новый год. В выходные и праздники проходили дискотеки для молодежи.</p> <p> До конца 1999 года вечерами показывали художественные кинофильмы. Все организации села и их работники в то время принимали активное участие в праздничных мероприятиях. С 2016 года заведующей работает Надежда Гавриловна Краева.</p> <p> На базе клуба занимается вокальный коллектив «Надежда», созданный в мае 2017 года, который не только организует праздничные мероприятия в своем клубе, но и активно участвует в муниципальных, межрегиональных, районных фестивалях и конкурсах. </p><p> Для жителей проводятся тематические вечера, праздничные вечера отдыха, торжественные митинги, молодежные дискотеки, юбилейные вечера отдыха и день деревни. Уютный зал всегда с радостью принимает зрителей, приходящих на организуемые в Доме культуры мероприятия.</p>', 'http://кдцву.рф', 'voroninausachyova@mail.ru', '[{"value": "78173861117", "comment": "Заведующая Краева Надежда Гавриловна"}, {"value": "78173865432", "comment": "Начальник Соболева Людмила Владимировна"}]', '{"url": "https://all.culture.ru/uploads/bf8e95a9a2130d10828927650a6dfa06.jpg", "title": "345.jpg"}', NULL, NULL, 'Дворцы культуры и клубы', 'МБУК «Великоустюгский культурно-досуговый центр»', 'Великоустюгский район', 'Europe/Moscow', 'пр-кт Советский,д 101', NULL, 'обл Вологодская,р-н Великоустюгский,г Великий Устюг,пр-кт Советский,д 101', NULL, 3526015975, 'mincult', 'Великоустюгский район', 'Europe/Moscow', '[{"network":"vk","name":"\"Кузинский клуб\"","networkId":"170421267","updateDate":"2023-04-05T11:45:45Z","createDate":"2023-04-05T11:45:45Z","accountId":46589,"postingGroupId":41531},{"network":"vk","name":"\"Усть-Алексеевский клуб\"","networkId":"196143083","updateDate":"2023-04-05T13:11:25Z","createDate":"2023-04-05T13:11:25Z","accountId":46589,"postingGroupId":41534},{"network":"vk","name":"«Верхневарженский клуб»","networkId":"219499380","updateDate":"2023-04-05T11:45:28Z","createDate":"2023-04-05T11:45:28Z","accountId":46589,"postingGroupId":41530},{"network":"vk","name":"«Морозовский клуб»","networkId":"219948363","updateDate":"2023-07-05T08:23:07Z","createDate":"2023-07-05T08:23:07Z","accountId":46589,"postingGroupId":42638},{"network":"vk","name":"«Новаторский клуб»","networkId":"217628593","updateDate":"2023-03-17T08:05:55Z","createDate":"2023-03-17T08:05:55Z","accountId":46589,"postingGroupId":41030},{"network":"vk","name":"Анюта Красникова","networkId":"17613040","updateDate":"2023-03-17T10:43:29Z","createDate":"2023-03-17T10:43:29Z","accountId":46594,"postingGroupId":41037},{"network":"vk","name":"БУК \"Юдинский дом культуры\" п. Стрига 6а","networkId":"160210512","updateDate":"2023-04-11T12:03:48Z","createDate":"2023-04-11T12:03:48Z","accountId":46589,"postingGroupId":41660},{"network":"vk","name":"Великоустюгский культурно-досуговый центр","networkId":"117993849","updateDate":"2024-02-15T08:49:55Z","createDate":"2024-02-15T08:49:55Z","accountId":46589,"postingGroupId":44737},{"network":"vk","name":"Обособленное подразделение \"Аристовский клуб\"","networkId":"195948369","updateDate":"2023-03-17T08:06:12Z","createDate":"2023-03-17T08:06:12Z","accountId":46589,"postingGroupId":41031},{"network":"vk","name":"Обособленное подразделение \"Сусоловский клуб\"","networkId":"219106681","updateDate":"2023-04-07T11:43:09Z","createDate":"2023-04-07T11:43:09Z","accountId":46589,"postingGroupId":41581},{"network":"vk","name":"Обособленное подразделение \"Теплогорский клуб\"","networkId":"97047864","updateDate":"2023-04-07T11:43:26Z","createDate":"2023-04-07T11:43:26Z","accountId":46589,"postingGroupId":41582},{"network":"vk","name":"Окультурено молодежью","networkId":"199241624","updateDate":"2023-03-17T10:42:43Z","createDate":"2023-03-17T10:42:43Z","accountId":46594,"postingGroupId":41036},{"network":"vk","name":"Парк культуры и отдыха /Великий Устюг/","networkId":"153198570","updateDate":"2023-04-05T11:46:08Z","createDate":"2023-04-05T11:46:08Z","accountId":46589,"postingGroupId":41532},{"network":"vk","name":"Полдарский клуб","networkId":"206228726","updateDate":"2023-07-05T08:23:33Z","createDate":"2023-07-05T08:23:33Z","accountId":46589,"postingGroupId":42639},{"network":"vk","name":"Театр Деда Мороза","networkId":"199304892","updateDate":"2020-11-03T05:54:59Z","createDate":"2020-11-03T05:54:59Z","accountId":21245,"postingGroupId":30273}]', 20409, '[{"id": 27, "name": "Декоративно-прикладное искусство", "sysName": "dekorativno-prikladnoe-iskusstvo"}, {"id": 29, "name": "Музыка", "sysName": "muzyka"}, {"id": 39, "name": "Для детей", "sysName": "dlya-detey"}, {"id": 317, "name": "Для молодежи", "sysName": "dlya-molodezhi"}, {"id": 596, "name": "Доступная среда", "sysName": "dostupnaya-sreda"}]', NULL, '{"to": "16:00:00", "from": "14:00:00"}', '{"to": "14:00:00", "from": "12:00:00"}', '{"to": "16:00:00", "from": "14:00:00"}', '{"to": "14:00:00", "from": "12:00:00"}', '{"to": "16:00:00", "from": "14:00:00"}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 82080, '[{"url":"https://www.culture.ru/institutes/95059/ilinskii-klub","serviceName":"Культура.рф"},{"url":"https://afisha7.ru/velikiy-ustyug/dvorcy-kultury-i-kluby/108026pl","serviceName":"Афиша7"},{"url":"https://map.funtam.ru/offer/poi?showMainEvent=false&shareId=c6a7339d-1ce9-4abf-a6ab-b8691008aee8&shareType=venue","serviceName":"ФанТам"}]', 82080, NULL, NULL, NULL, '2023-12-07 11:19:38+03', '2025-04-25 16:17:26+03', '0101000020E6100000C91CCBBBEA5F4740C57421567F4C4E40');
INSERT INTO culture_data.culture_palaces_clubs VALUES ('Викторовский клуб', 'Великоустюгский район', 'Europe/Moscow', 'ул Полевая,д 15', 'в летний период – паром из г. Великий Устюг; в зимний период – по ледовой переправе на 680-м км р. Северная Двина', 'обл Вологодская,р-н Великоустюгский,д Первомайское,ул Полевая,д 15', '{"type": "Point", "coordinates": [46.86774, 60.609883]}', '<p>Викторовский клуб начал свою работу в 1953 году. </p><p>Здесь проводятся юбилеи жителей, концерты, праздники деревни, выставки цветов, рисунков, поделок, вязаных изделий, выпечных изделий, тематические вечера, устные журналы, викторины, игровые и танцевальные программы для детей и взрослых, вечера отдыха и др.<br /></p> <p> Коллектив артистов за 70 лет периодически обновлялся, с 2011 года он называется «Первомайские Любавушки». В Викторовском клубе также работают кружки «Художественная самодеятельность», «Давайте рисовать», любительское объединение «Поговорим о том о сем и про любовь споем».</p> <p>Направления деятельности Викторовского клуба:</p><ol><li>Развитие творческих способностей.</li><li>Популяризация знаний о Великой Отечественной войне.</li><li>Сбор и оформление материала о ветеранах Великой Отечественной войны, о людях хороших, о юбилярах.</li></ol>', 'http://кдцву.рф', 'meledina50@yandex.ru', '[{"value": "78173861184", "comment": "Заведующая Перминова Галина Витальевна"}, {"value": "78173865432", "comment": "Начальник Соболева Людмила Владимировна"}]', '{"url": "https://all.culture.ru/uploads/52892159fbc5b311a570c0c6516aa22a.JPG", "title": "DSCN2246[1].JPG"}', NULL, NULL, 'Дворцы культуры и клубы', 'МБУК «Великоустюгский культурно-досуговый центр»', 'Великоустюгский район', 'Europe/Moscow', 'пр-кт Советский,д 101', NULL, 'обл Вологодская,р-н Великоустюгский,г Великий Устюг,пр-кт Советский,д 101', NULL, 3526015975, 'mincult', 'Великоустюгский район', 'Europe/Moscow', '[{"network":"vk","name":"\"Кузинский клуб\"","networkId":"170421267","updateDate":"2023-04-05T11:45:45Z","createDate":"2023-04-05T11:45:45Z","accountId":46589,"postingGroupId":41531},{"network":"vk","name":"\"Усть-Алексеевский клуб\"","networkId":"196143083","updateDate":"2023-04-05T13:11:25Z","createDate":"2023-04-05T13:11:25Z","accountId":46589,"postingGroupId":41534},{"network":"vk","name":"«Верхневарженский клуб»","networkId":"219499380","updateDate":"2023-04-05T11:45:28Z","createDate":"2023-04-05T11:45:28Z","accountId":46589,"postingGroupId":41530},{"network":"vk","name":"«Морозовский клуб»","networkId":"219948363","updateDate":"2023-07-05T08:23:07Z","createDate":"2023-07-05T08:23:07Z","accountId":46589,"postingGroupId":42638},{"network":"vk","name":"«Новаторский клуб»","networkId":"217628593","updateDate":"2023-03-17T08:05:55Z","createDate":"2023-03-17T08:05:55Z","accountId":46589,"postingGroupId":41030},{"network":"vk","name":"Анюта Красникова","networkId":"17613040","updateDate":"2023-03-17T10:43:29Z","createDate":"2023-03-17T10:43:29Z","accountId":46594,"postingGroupId":41037},{"network":"vk","name":"БУК \"Юдинский дом культуры\" п. Стрига 6а","networkId":"160210512","updateDate":"2023-04-11T12:03:48Z","createDate":"2023-04-11T12:03:48Z","accountId":46589,"postingGroupId":41660},{"network":"vk","name":"Великоустюгский культурно-досуговый центр","networkId":"117993849","updateDate":"2024-02-15T08:49:55Z","createDate":"2024-02-15T08:49:55Z","accountId":46589,"postingGroupId":44737},{"network":"vk","name":"Обособленное подразделение \"Аристовский клуб\"","networkId":"195948369","updateDate":"2023-03-17T08:06:12Z","createDate":"2023-03-17T08:06:12Z","accountId":46589,"postingGroupId":41031},{"network":"vk","name":"Обособленное подразделение \"Сусоловский клуб\"","networkId":"219106681","updateDate":"2023-04-07T11:43:09Z","createDate":"2023-04-07T11:43:09Z","accountId":46589,"postingGroupId":41581},{"network":"vk","name":"Обособленное подразделение \"Теплогорский клуб\"","networkId":"97047864","updateDate":"2023-04-07T11:43:26Z","createDate":"2023-04-07T11:43:26Z","accountId":46589,"postingGroupId":41582},{"network":"vk","name":"Окультурено молодежью","networkId":"199241624","updateDate":"2023-03-17T10:42:43Z","createDate":"2023-03-17T10:42:43Z","accountId":46594,"postingGroupId":41036},{"network":"vk","name":"Парк культуры и отдыха /Великий Устюг/","networkId":"153198570","updateDate":"2023-04-05T11:46:08Z","createDate":"2023-04-05T11:46:08Z","accountId":46589,"postingGroupId":41532},{"network":"vk","name":"Полдарский клуб","networkId":"206228726","updateDate":"2023-07-05T08:23:33Z","createDate":"2023-07-05T08:23:33Z","accountId":46589,"postingGroupId":42639},{"network":"vk","name":"Театр Деда Мороза","networkId":"199304892","updateDate":"2020-11-03T05:54:59Z","createDate":"2020-11-03T05:54:59Z","accountId":21245,"postingGroupId":30273}]', 20409, '[{"id": 27, "name": "Декоративно-прикладное искусство", "sysName": "dekorativno-prikladnoe-iskusstvo"}, {"id": 29, "name": "Музыка", "sysName": "muzyka"}, {"id": 39, "name": "Для детей", "sysName": "dlya-detey"}, {"id": 317, "name": "Для молодежи", "sysName": "dlya-molodezhi"}, {"id": 596, "name": "Доступная среда", "sysName": "dostupnaya-sreda"}]', NULL, '{"to": "12:00:00", "from": "10:00:00"}', '{"to": "12:00:00", "from": "10:00:00"}', '{"to": "12:00:00", "from": "10:00:00"}', '{"to": "12:00:00", "from": "10:00:00"}', '{"to": "18:00:00", "from": "10:00:00"}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 82076, '[{"url":"https://www.culture.ru/institutes/95043/viktorovskii-klub","serviceName":"Культура.рф"},{"url":"https://afisha7.ru/velikiy-ustyug/dvorcy-kultury-i-kluby/108013pl","serviceName":"Афиша7"},{"url":"https://map.funtam.ru/offer/poi?showMainEvent=false&shareId=4b3ffec6-b3d6-4217-89b4-145ee22102d6&shareType=venue","serviceName":"ФанТам"}]', 82076, NULL, NULL, NULL, '2023-12-07 11:14:32+03', '2025-04-25 16:18:30+03', '0101000020E61000002CB7B41A126F474075B169A5104E4E40');
INSERT INTO culture_data.culture_palaces_clubs VALUES ('Березниковский клуб', 'Вологодский район', 'Europe/Moscow', 'д 56', NULL, 'обл Вологодская,р-н Вологодский,д Березник,д 56', '{"type": "Point", "coordinates": [39.19517462562877, 59.70256946710288]}', '<p> Березниковский клуб был открыт в 1940 году.</p><p>На базе клуба создано 14 клубных формирований, количество участников – 179 человек. Коллективы и солисты – лауреаты всероссийских, областных, городских, районных фестивалей и конкурсов. </p><p><span><span> </span>Работа клуба сейчас направлена на сохранение традиционной народной культуры. <span> Традиционными и любимыми мероприятиями для зрителей являются День села, сельскохозяйственная ярмарка «Золотая осень», День матери, День работников сельского хозяйства, День защиты детей, День старшего поколения, День Победы, широкая Масленица, митинги, акции </span><span> и т. д. Ежегодно коллектив клуба участвует в поселенческом празднике «Заговенье», литературном празднике «Костер Гиляровского», культурно-спортивном празднике на приз С. В. Ильюшина, районных краеведческих чтениях «Кубеноозерье – сторона родная». </span></span></p><p><span></span><span> Филиал работает в тесном контакте с сельскохозяйственным производственным кооперативом «Ильюшинский», Березниковской<span> </span>школой, Березниковским детским садом, библиотекой, ФОКом, советом ветеранов, советом молодежи.</span></p>', NULL, NULL, '[{"value": "78172776306", "comment": ""}]', '{"url": "https://all.culture.ru/uploads/c08114b0c4b1a19b54837e5fc66cd0e5.jpg", "title": "1.jpg"}', NULL, NULL, 'Дворцы культуры и клубы', 'Муниципальное бюджетное учреждение культуры «Новленский Дом культуры»', 'Вологодский район', 'Europe/Moscow', 'ул Советская,д 30', NULL, 'обл Вологодская,р-н Вологодский,с Новленское,ул Советская,д 30', NULL, 3507303368, 'mincult', 'Вологодский район', 'Europe/Moscow', NULL, 14125, '[{"id": 29, "name": "Музыка", "sysName": "muzyka"}, {"id": 317, "name": "Для молодежи", "sysName": "dlya-molodezhi"}, {"id": 751, "name": "Культура для школьников", "sysName": "kultura-dlya-shkolnikov"}, {"id": 39, "name": "Для детей", "sysName": "dlya-detey"}]', NULL, NULL, '{"to": "20:00:00", "from": "14:00:00"}', '{"to": "20:00:00", "from": "14:00:00"}', '{"to": "20:00:00", "from": "14:00:00"}', '{"to": "23:00:00", "from": "14:00:00"}', '{"to": "21:00:00", "from": "14:00:00"}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36946, '[{"url":"https://afisha7.ru/vologda/dvorcy-kultury-i-kluby/135651pl","serviceName":"Афиша7"},{"url":"https://www.culture.ru/institutes/71117/bereznikovskii-klub","serviceName":"Культура.рф"}]', 36946, NULL, NULL, NULL, '2018-12-19 14:19:32+03', '2025-07-11 12:30:22+03', '0101000020E6100000D50A6D7BFB9843400130DACBEDD94D40');
INSERT INTO culture_data.culture_palaces_clubs VALUES ('Центральный дом культуры с. Кичменгский Городок', 'Кичменгско-Городецкий район', 'Europe/Moscow', 'ул Центральная,д 8', NULL, 'обл Вологодская,р-н Кичменгско-Городецкий,с Кичменгский Городок,ул Центральная,д 8', '{"type": "Point", "coordinates": [45.80272614955902, 59.99222069044922]}', '<p>Дом культуры начал свою работу в 1989 году. Он является центром культуры Кичменгско-Городецкого района, здесь проходят все основные районные фестивали, конкурсы, концерты, театрализованные постановки, встречи, семинары.<br /><br />На базе ДК занимается более 20 творческих коллективов: вокальных, танцевальных, театральных и инструментальных. Четыре из них имеют звание «Народный самодеятельный коллектив».<br /><br />В 2017 году ДК получил грант в размере пяти миллионов рублей от Федерального фонда социальной и экономической поддержки отечественной кинематографии для оборудования кинозала.<br /><br />Сегодня кинозал имеет все необходимое для показа фильмов на высоком профессиональном уровне. С 4 августа 2018 года здесь регулярно проходят показы фильмов и мультфильмов в двух форматах – 2D и 3D. С 31 января 2019 года учреждение работает с фирмой «Премьер-зал» по поставке кинофильмов.<br /><br />16 февраля 2023 года Районный дом культуры Кичменгско-Городецкого муниципального района Вологодской области переименован в Центральный дом культуры Кичменгско-Городецкого муниципального округа Вологодской области на основании приказа Управления культуры «О внесении изменений в уставные документы» № 112 от 30.12.2022.</p>', 'https://rdk-kg.vlg.muzkult.ru/event/s/afisha', 'rdkgorodok@mail.ru', '[{"value": "78174021120", "comment": "Копосова Татьяна Николаевна"}]', '{"url": "https://all.culture.ru/uploads/5ddb8e87578d2c42fa7d52409e8e7670.jpg", "title": "Рисунок1 (1).jpg"}', '[{"url": "https://all.culture.ru/uploads/d17a26a29207fdbc747a4c387b76ed5a.jpeg", "title": "5LV8N12D7Z4.jpg"}, {"url": "https://all.culture.ru/uploads/67b0106af229903ae9aaf097e36cf03e.jpeg", "title": "KE4dW4vt8Tw.jpg"}, {"url": "https://all.culture.ru/uploads/5125547b61bf04820fa423a00c0141de.jpeg", "title": "MkSmAFan7hk.jpg"}, {"url": "https://all.culture.ru/uploads/c610c1104831dfabbc619c26bbf02f77.jpeg", "title": "MZo2cgTg5Dc.jpg"}, {"url": "https://all.culture.ru/uploads/a83d493d1cb7e2a677b8e7dffb72e9ea.jpeg", "title": "nVxyZ-A1n4.jpg"}, {"url": "https://all.culture.ru/uploads/8eecbd90ae2bd5c563b8ac22d660166c.jpeg", "title": "oyQn4jjcobM.jpg"}, {"url": "https://all.culture.ru/uploads/c8e194191ac8e87624b271d8b7663b87.jpeg", "title": "YCMaMrASOs4.jpg"}]', NULL, 'Дворцы культуры и клубы', 'БУК «Районный дом культуры»', 'Кичменгско-Городецкий район', 'Europe/Moscow', 'ул Центральная', NULL, 'обл Вологодская,р-н Кичменгско-Городецкий,с Кичменгский Городок,ул Центральная', NULL, 3512005007, 'mincult', 'Кичменгско-Городецкий район', 'Europe/Moscow', NULL, 20268, '[{"id": 753, "name": "Кинозал", "sysName": "kinozal"}, {"id": 122, "name": "Искусство", "sysName": "iskusstvo"}, {"id": 29, "name": "Музыка", "sysName": "muzyka"}, {"id": 596, "name": "Доступная среда", "sysName": "dostupnaya-sreda"}]', NULL, '{"to": "21:00:00", "from": "08:30:00"}', '{"to": "21:00:00", "from": "08:30:00"}', '{"to": "21:00:00", "from": "08:30:00"}', '{"to": "21:00:00", "from": "08:30:00"}', '{"to": "21:00:00", "from": "08:30:00"}', '{"to": "20:00:00", "from": "12:00:00"}', '{"to": "20:00:00", "from": "12:00:00"}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 40035, '[{"url":"https://www.culture.ru/institutes/40814/centralnyi-dom-kultury-s-kichmengskii-gorodok","serviceName":"Культура.рф"},{"url":"https://afisha7.ru/kichmengskiy-gorodok/dvorcy-kultury-i-kluby/22003pl","serviceName":"Афиша7"},{"url":"https://map.funtam.ru/offer/poi?showMainEvent=false&shareId=4cf10653-4a36-4be4-bf37-ead8b0fe43ec&shareType=venue","serviceName":"ФанТам"}]', 40035, NULL, NULL, NULL, '2019-10-04 11:14:38+03', '2025-08-29 17:51:44+03', '0101000020E6100000000000BBBFE646406DF26B1601FF4D40');
INSERT INTO culture_data.culture_palaces_clubs VALUES ('Культурный центр «Сухонский» г. Сокола', 'Сокольский район', 'Europe/Moscow', 'ул Советская,д 115', NULL, 'обл Вологодская,р-н Сокольский,г Сокол,ул Советская,д 115', '{"type": "Point", "coordinates": [40.087841, 59.474596]}', '<p> Культурный центр «Сухонский» является ведущим учреждением культуры, где проходят значимые для города и Сокольского округа мероприятия: фестивали, конкурсы, концерты, игровые программы и др. Центр организует постановку театральных и оперных представлений, проведение концертов и прочих сценических выступлений, мероприятий информационного, культурного и общественного характера. На его базе работают 37 клубных формирований, из них 20 формирований для детей до 14 лет и 6 формирований для молодежи до 24 лет. </p><p> Культурный центр тесно взаимодействует с администрацией Сокольского муниципального округа, учебными заведениями, предприятиями и общественными организациями города и округа. Тесное сотрудничество, взаимодействие и партнерство поддерживается с дворцами культуры и клубами сельских поселений Сокольского округа. </p>', 'http://kulturnycentr.ru', 'cult-sokol@yandex.ru', '[{"value": "78173332739", "comment": "методический кабинет"}]', '{"url": "https://all.culture.ru/uploads/025a2a17e8ed501fcf5c9cf9f54bd669.jpg", "title": "2167b3b4be48b2f7626427b0a62e38de.jpg"}', NULL, NULL, 'Дворцы культуры и клубы', 'БУК СМО Культурный центр «Сухонский»', 'Сокольский район', 'Europe/Moscow', 'ул Советская,д 115', NULL, 'обл Вологодская,р-н Сокольский,г Сокол,ул Советская,д 115', NULL, 3527011758, 'mincult', 'Сокольский район', 'Europe/Moscow', '[{"network":"vk","name":"БУК СМО КЦ \"Сухонский\"","networkId":"16111380","updateDate":"2023-03-29T09:51:40Z","createDate":"2023-03-29T09:51:40Z","accountId":22652,"postingGroupId":41301}]', 12852, '[{"id": 596, "name": "Доступная среда", "sysName": "dostupnaya-sreda"}, {"id": 317, "name": "Для молодежи", "sysName": "dlya-molodezhi"}, {"id": 39, "name": "Для детей", "sysName": "dlya-detey"}]', NULL, '{"to": "19:00:00", "from": "08:00:00"}', '{"to": "19:00:00", "from": "08:00:00"}', '{"to": "19:00:00", "from": "08:00:00"}', '{"to": "19:00:00", "from": "08:00:00"}', '{"to": "19:00:00", "from": "08:00:00"}', '{"to": "19:00:00", "from": "08:00:00"}', '{"to": "19:00:00", "from": "08:00:00"}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 39081, '[{"url":"https://www.culture.ru/institutes/40121/kulturnyi-centr-sukhonskii-g-sokola","serviceName":"Культура.рф"},{"url":"https://afisha7.ru/sokol/dvorcy-kultury-i-kluby/21599pl","serviceName":"Афиша7"},{"url":"https://map.funtam.ru/offer/poi?showMainEvent=false&shareId=1187f24c-d0b1-4d61-8a0b-6a1bb3ce9c33&shareType=venue","serviceName":"ФанТам"}]', 39081, NULL, NULL, NULL, '2019-05-23 11:47:29+03', '2025-08-29 17:22:46+03', '0101000020E6100000BC1FB75F3E0B4440FD67CD8FBFBC4D40');


--
-- TOC entry 5853 (class 0 OID 21234)
-- Dependencies: 230
-- Data for Name: m2m_culture_palaces_clubs_tags; Type: TABLE DATA; Schema: culture_data; Owner: postgres
--

INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (83231, 596);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (83214, 39);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (82076, 317);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (83329, 596);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (40035, 122);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (82080, 39);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (36946, 39);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (83941, 596);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (83328, 29);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (83941, 39);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (83243, 317);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (83240, 596);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (82076, 39);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (83328, 25);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (83240, 39);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (84620, 42);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (83243, 39);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (83240, 317);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (83214, 29);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (39081, 317);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (83240, 24);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (83941, 317);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (83328, 317);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (36946, 29);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (82080, 317);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (83328, 39);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (36946, 317);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (40035, 596);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (82080, 596);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (83485, 39);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (84620, 596);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (82080, 29);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (83231, 39);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (82076, 596);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (84620, 350);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (83214, 596);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (83328, 596);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (40035, 29);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (83485, 596);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (83941, 27);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (83240, 152);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (83941, 29);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (83231, 751);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (83231, 27);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (83240, 751);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (83214, 27);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (40035, 753);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (36946, 751);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (39081, 596);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (83231, 25);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (83354, 596);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (83243, 596);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (83328, 27);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (82076, 27);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (83214, 317);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (83231, 317);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (82076, 29);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (83240, 27);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (83485, 27);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (39081, 39);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (83333, 596);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (82080, 27);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (83485, 29);
INSERT INTO culture_data.m2m_culture_palaces_clubs_tags VALUES (83485, 317);


--
-- TOC entry 5677 (class 0 OID 20389)
-- Dependencies: 224
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: culture_data; Owner: postgres
--



--
-- TOC entry 5852 (class 0 OID 21191)
-- Dependencies: 229
-- Data for Name: tags; Type: TABLE DATA; Schema: culture_data; Owner: postgres
--

INSERT INTO culture_data.tags VALUES (1, 39, 'Для детей', 'dlya-detey');
INSERT INTO culture_data.tags VALUES (2, 753, 'Кинозал', 'kinozal');
INSERT INTO culture_data.tags VALUES (3, 24, 'История', 'istoriya');
INSERT INTO culture_data.tags VALUES (4, 122, 'Искусство', 'iskusstvo');
INSERT INTO culture_data.tags VALUES (5, 751, 'Культура для школьников', 'kultura-dlya-shkolnikov');
INSERT INTO culture_data.tags VALUES (6, 42, 'Культурные центры', 'kulturnye-centry');
INSERT INTO culture_data.tags VALUES (7, 152, 'Этнография', 'etnografiya');
INSERT INTO culture_data.tags VALUES (8, 25, 'Классическое искусство', 'klassicheskoe-iskusstvo');
INSERT INTO culture_data.tags VALUES (9, 27, 'Декоративно-прикладное искусство', 'dekorativno-prikladnoe-iskusstvo');
INSERT INTO culture_data.tags VALUES (10, 350, 'Народная культура', 'narodnaya-kultura');
INSERT INTO culture_data.tags VALUES (11, 29, 'Музыка', 'muzyka');
INSERT INTO culture_data.tags VALUES (12, 596, 'Доступная среда', 'dostupnaya-sreda');
INSERT INTO culture_data.tags VALUES (13, 317, 'Для молодежи', 'dlya-molodezhi');


--
-- TOC entry 5861 (class 0 OID 0)
-- Dependencies: 222
-- Name: data.general.id.seq; Type: SEQUENCE SET; Schema: culture_data; Owner: postgres
--

SELECT pg_catalog.setval('culture_data."data.general.id.seq"', 1, false);


--
-- TOC entry 5862 (class 0 OID 0)
-- Dependencies: 228
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: culture_data; Owner: postgres
--

SELECT pg_catalog.setval('culture_data.tags_id_seq', 13, true);


--
-- TOC entry 5681 (class 2606 OID 20050)
-- Name: culture_palaces_clubs culture_palaces_clubs_pkey; Type: CONSTRAINT; Schema: culture_data; Owner: postgres
--

ALTER TABLE ONLY culture_data.culture_palaces_clubs
    ADD CONSTRAINT culture_palaces_clubs_pkey PRIMARY KEY ("data.general.id");


--
-- TOC entry 5694 (class 2606 OID 21240)
-- Name: m2m_culture_palaces_clubs_tags m2m_culture_palaces_clubs_tags_pkey; Type: CONSTRAINT; Schema: culture_data; Owner: postgres
--

ALTER TABLE ONLY culture_data.m2m_culture_palaces_clubs_tags
    ADD CONSTRAINT m2m_culture_palaces_clubs_tags_pkey PRIMARY KEY (culture_palaces_clubs_id, tag_sys_id);


--
-- TOC entry 5689 (class 2606 OID 21202)
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: culture_data; Owner: postgres
--

ALTER TABLE ONLY culture_data.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- TOC entry 5691 (class 2606 OID 21233)
-- Name: tags tags_sys_id_unique; Type: CONSTRAINT; Schema: culture_data; Owner: postgres
--

ALTER TABLE ONLY culture_data.tags
    ADD CONSTRAINT tags_sys_id_unique UNIQUE (sys_id);


--
-- TOC entry 5683 (class 2606 OID 20052)
-- Name: culture_palaces_clubs unique_id; Type: CONSTRAINT; Schema: culture_data; Owner: postgres
--

ALTER TABLE ONLY culture_data.culture_palaces_clubs
    ADD CONSTRAINT unique_id UNIQUE ("data.general.id");


--
-- TOC entry 5685 (class 2606 OID 20054)
-- Name: culture_palaces_clubs unique_map; Type: CONSTRAINT; Schema: culture_data; Owner: postgres
--

ALTER TABLE ONLY culture_data.culture_palaces_clubs
    ADD CONSTRAINT unique_map UNIQUE ("data.general.address.mapPosition");


--
-- TOC entry 5692 (class 1259 OID 21251)
-- Name: idx_m2m_tag_sys_id; Type: INDEX; Schema: culture_data; Owner: postgres
--

CREATE INDEX idx_m2m_tag_sys_id ON culture_data.m2m_culture_palaces_clubs_tags USING btree (tag_sys_id);


--
-- TOC entry 5695 (class 2606 OID 21241)
-- Name: m2m_culture_palaces_clubs_tags m2m_culture_palaces_clubs_tags_culture_palaces_clubs_id_fkey; Type: FK CONSTRAINT; Schema: culture_data; Owner: postgres
--

ALTER TABLE ONLY culture_data.m2m_culture_palaces_clubs_tags
    ADD CONSTRAINT m2m_culture_palaces_clubs_tags_culture_palaces_clubs_id_fkey FOREIGN KEY (culture_palaces_clubs_id) REFERENCES culture_data.culture_palaces_clubs("data.general.id");


--
-- TOC entry 5696 (class 2606 OID 21246)
-- Name: m2m_culture_palaces_clubs_tags m2m_culture_palaces_clubs_tags_tag_sys_id_fkey; Type: FK CONSTRAINT; Schema: culture_data; Owner: postgres
--

ALTER TABLE ONLY culture_data.m2m_culture_palaces_clubs_tags
    ADD CONSTRAINT m2m_culture_palaces_clubs_tags_tag_sys_id_fkey FOREIGN KEY (tag_sys_id) REFERENCES culture_data.tags(sys_id);


-- Completed on 2026-07-01 13:54:48

--
-- PostgreSQL database dump complete
--

\unrestrict iCcwFgj31hImHCf0KNCD3xE1dCFZBtPKNbarXP1vSaej4RVKKGOJijuvaNaC3xF

