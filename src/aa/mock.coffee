goog.provide 'aa.mock'

aa.mock.Params = [
    key: null
    name: ' '
  ,
    key: 'title'
    name: 'Název projektu'
  ,
    key: 'custom1'
    name: 'Typologie'
  ,
    key: 'custom2'
    name: 'Status'
  ,
    key: 'date'
    name: 'Rok'
]

aa.mock.List =
  data: [
    id: 1
    title: 'Golf Klub Čertovo Břemeno'
    slug: 'golf-klub-certovo-bremeno'
    date: '2010-01-01'
    desc: 'Novostavba Golfklubu s restaurací a kompletním zázemím pro hráče i personál golfového hřiště'
    custom1: 'Golfové hřiště'
    custom2: 'Realizováno'
    colors:
      bg: '#4c746c'
      content: '#C6CFCE'
    image:
      size: [2362, 1670]
      url: '/img/data/01.jpg'
  ,
    id: 2
    title: 'Domy v mlze, Rtyně'
    slug: 'domy-v-mlze-rtyne'
    date: '2009-01-01'
    desc: 'Nádherné výhledy nad dramatickým údolím řeky Jizery v obci
      Benešov u Semil. Svažitý pozemek situovaný na jih za zahradou'
    custom1: 'Rodinný dům'
    custom2: 'Realizováno'
    colors:
      bg: '#6c797e'
      content: '#fff'
    image:
      size: [1000, 666]
      url: 'http://ad009cdnb.archdaily.net/wp-content/uploads/2011/03/1299213392-mg-1336-1280x853-1000x666.jpg'
  ,
    id: 3
    title: 'Stodola, Benešov'
    slug: 'stodola-benesov'
    date: '2012-01-01'
    desc: 'Nádherné výhledy nad dramatickým údolím řeky Jizery v obci
      Benešov u Semil. Svažitý pozemek situovaný na jih za zahradou'
    custom1: 'Urbanismus'
    custom2: 'Soutěž'
    colors:
      bg: '#8b8c8e'
      content: '#2b2933'
    image:
      size: [2000, 1500]
      url: 'http://ad009cdnb.archdaily.net/wp-content/uploads/2012/08/5024bf9528ba0d658d00003c_hope-street-geelong-west-steve-domoney-architecture_heard_1.jpg'
]

aa.mock.Detail =
  data:
    id: 1
    title: 'Golf Klub Čertovo Břemeno'
    slug: 'golf-klub-certovo-bremeno'
    date: '2010-01-01'
    desc: 'Novostavba Golfklubu s restaurací a kompletním zázemím pro hráče i personál golfového hřiště'
    custom1: 'Golfové hřiště'
    custom2: 'Realizováno'
    colors:
      bg: '#4c746c'
      content: '#C6CFCE'
    image:
      size: [2362, 1670]
      url: '/img/data/01.jpg'
    slides: [
        id: 1
        projectId: 1
        type: 'image'
        title: 'Hlavní budova'
        desc: 'nějaký popisek' # muze byt null
        colors:
          bg: '#4c746c'
          content: '#C6CFCE'
        image:
          size: [2362, 1670]
          url: '/img/data/04.jpg'
        fullImage:
          size: [2362, 1670]
          url: '/img/data/04.jpg'
      ,
        id: 3
        projectId: 1
        type: 'image'
        title: 'Klubovna'
        desc: 'nějaký popisek' # muze byt null
        colors:
          bg: '#6d633c'
          content: '#322E4B'
        image:
          size: [1671, 2362]
          url: '/img/data/03.jpg'
        fullImage:
          size: [1671, 2362]
          url: '/img/data/03.jpg'
      ,
        id: 2
        projectId: 1
        type: 'text'
        title: 'Explikace'
        html: '
          <p>Golfové hřiště Čertovo břemeno nepatří k těm umělým, vyumělkovaným, které po světě najdete. Možná se dá i říct, že rodina majitelů měla spíš touhu dát do pořádku zanedbanou krajinu okolo svých statků, očistit ji od náletových křovin, vysušit neprostupné močály a místo nich vytvořit spoustu malých jezírek, kde se zase usadily ryby a žáby. Povedlo se jim to neuvěřitelně přirozeným způsobem s absolutním respektem k charakteru místní přírody.</p>
          <p>Měl jsem tu čest navázat na tuto jejich krásnou krajinářskou práci a vytvořit zde nejdříve v letech 2000 – 2002 malou klubovnu, která zabezpečovala úplně minimální zázemí pro hráče v začátcích hřiště. Už tenkrát zvítězila snaha nevnášet do krajiny novou hmotu moderní stavby. Svůj účel splnila taková malá jeskyňka z betonu a kamene, zahrabaná pod jeden z travnatých pahorků.</p>
          <p>Když jsem v roce 2007 dostal úkol navrhnout tady novou velkou klubovnu, bylo jasné, že se bude její koncept ubírat stejným směrem. Bylo jasné, že to musí být dům, který bude žít s místní přírodou v úplné symbióze, přesto, že jeho program není vůbec malý. Musí pojmout velkou klubovnu s restaurací pro 80 – 100 lidí, konferenční salonek pro 30 – 60 lidí, bar, recepci, kanceláře, šatny, sociální zázemí, úschovnu bagů, velkou kuchyň, sklady, strojovny a kompletní zázemí pro personál hřiště. Navíc je zde trojice pohotovostních pokojů, které mohou příležitostně posloužit jako ubytování pro přátele, nebo bydlení pro správce areálu. Dispozici bylo potřeba úsporně vyřešit tak, aby objekt v běžných pracovních dnech, kdy je poloprázdný, mohla ve veřejné části obsloužit pouze jedna osoba, jež dokáže mít přehled nad celým prostorem. Zároveň však musí umět pojmout při akcích až 200 lidí a zůstat pohodlným fungujícím organismem.</p>
        '
        colors:
          bg: '#C6CFCE'
          content: '#4c746c'
      ,
        id: 2
        projectId: 1
        type: 'image'
        title: 'Tréninkové plochy'
        desc: 'nějaký popisek' # muze byt null
        colors:
          bg: '#607a77'
          content: '#C4AC9B'
        image:
          size: [2362, 1670]
          url: '/img/data/02.jpg'
        fullImage:
          size: [2362, 1670]
          url: '/img/data/02.jpg'


    ]
