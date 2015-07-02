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
    title: 'Bahnhof Süd, Basel'
    slug: 'bahnhof-sud'
    date: '2010-01-01'
    custom1: 'Residential'
    custom2: 'Realised'
    colors:
      bg: '#4f5d74'
      content: '#ffffff'
    image:
      size: [1922, 2880]
      url: '/img/data/bahnhof_sud_01.jpg'
  ,
    id: 2
    title: 'Vorarlberg Museum, Bregenz'
    slug: 'vorarlberg-museum'
    date: '2012-01-01'
    custom1: 'Museum'
    custom2: 'Realized'
    colors:
      bg: '#a2a8ae'
      content: '#ffffff'
    image:
      size: [5577, 2065]
      url: '/img/data/proj2/vorarlberg_museum_01.jpg'
  ,
    id: 3
    title: 'MFO Park, Zurich (Oerlikon)'
    slug: 'mfo-park'
    date: '2009-01-01'
    custom1: 'Public park'
    custom2: 'Realised'
    colors:
      bg: '#534b3b'
      content: '#ffffff'
    image:
      size: [2800, 1875]
      url: '/img/data/proj3/mfo_park_01.jpg'
]

aa.mock.Detail = {
  'bahnhof-sud':
    id: 1
    title: 'Bahnhof Süd, Basel'
    slug: 'bahnhof-sud'
    date: '2010-01-01'
    desc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras mattis magna lorem, quis lobortis.'
    custom1: 'Residential'
    custom2: 'Realized'
    colors:
      bg: '#878684'
      content: '#ffffff'
    image:
      size: [4912, 7360]
      url: '/img/data/DSC_1789.JPG'
    slides: [
        id: 1
        projectId: 1
        type: 'image'
        title: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras mattis magna lorem, quis lobortis.'
        desc: 'nějaký popisek' # muze byt null
        colors:
          bg: '#878684'
          content: '#ffffff'
        image:
          size: [1922, 2880]
          url: '/img/data/bahnhof_sud_01.jpg'
        fullImage:
          size: [1922, 2880]
          url: '/img/data/bahnhof_sud_01.jpg'
      ,
        id: 3
        projectId: 1
        type: 'image'
        title: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras mattis magna lorem, quis lobortis.'
        desc: 'nějaký popisek' # muze byt null
        colors:
          bg: '#545e70'
          content: '#ffffff'
        image:
          size: [2880, 1922]
          url: '/img/data/bahnhof_sud_02.jpg'
        fullImage:
          size: [2880, 1922]
          url: '/img/data/bahnhof_sud_02.jpg'
      ,
        id: 2
        projectId: 1
        type: 'text'
        title: 'Explikace'
        html: '
          <div class="explication">
            <p>Author: Herzog & de Meuron: Bahnhof Süd</p>
            <p>Photograph: Benedikt Markel</p>
            <p>Location: Güterstrasse 123–127, Basel, Switzerland</p>
            <p>Study: 2009-2010</p>
            <p>Realisation: 2010-2011</p>
          </div>
          <p>Golfové hřiště Čertovo břemeno nepatří k těm umělým, vyumělkovaným, které po světě najdete. Možná se dá i říct, že rodina majitelů
            měla spíš touhu dát do pořádku zanedbanou krajinu okolo svých statků, očistit ji od náletových křovin, vysušit neprostupné močály a
            místo nich vytvořit spoustu malých jezírek, kde se zase usadily ryby a žáby. Povedlo se jim to neuvěřitelně přirozeným způsobem s
            absolutním respektem k charakteru místní přírody.</p>
          <p>Měl jsem tu čest navázat na tuto jejich krásnou krajinářskou práci a vytvořit zde nejdříve v letech 2000 – 2002 malou klubovnu,
            která zabezpečovala úplně minimální zázemí pro hráče v začátcích hřiště. Už tenkrát zvítězila snaha nevnášet do krajiny novou hmotu
            moderní stavby. Svůj účel splnila taková malá jeskyňka z betonu a kamene, zahrabaná pod jeden z travnatých pahorků.</p>
          <p>Když jsem v roce 2007 dostal úkol navrhnout tady novou velkou klubovnu, bylo jasné, že se bude její koncept ubírat stejným směrem.
            Bylo jasné, že to musí být dům, který bude žít s místní přírodou v úplné symbióze, přesto, že jeho program není vůbec malý. Musí
            pojmout velkou klubovnu s restaurací pro 80 – 100 lidí, konferenční salonek pro 30 – 60 lidí, bar, recepci, kanceláře, šatny,
            sociální zázemí, úschovnu bagů, velkou kuchyň, sklady, strojovny a kompletní zázemí pro personál hřiště. Navíc je zde trojice
            pohotovostních pokojů, které mohou příležitostně posloužit jako ubytování pro přátele, nebo bydlení pro správce areálu. Dispozici
            bylo potřeba úsporně vyřešit tak, aby objekt v běžných pracovních dnech, kdy je poloprázdný, mohla ve veřejné části obsloužit pouze
            jedna osoba, jež dokáže mít přehled nad celým prostorem. Zároveň však musí umět pojmout při akcích až 200 lidí a zůstat pohodlným
            fungujícím organismem.</p>
        '
        colors:
          bg: '#6C6C6C'
          content: '#ffffff'
      ,
        id: 2
        projectId: 1
        type: 'image'
        title: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras mattis magna lorem, quis lobortis.'
        desc: 'nějaký popisek' # muze byt null
        colors:
          bg: '#5d6e8c'
          content: '#ffffff'
        image:
          size: [2880, 1922]
          url: '/img/data/bahnhof_sud_03.jpg'
        fullImage:
          size: [2880, 1922]
          url: '/img/data/bahnhof_sud_03.jpg'
               ,
        id: 2
        projectId: 1
        type: 'image'
        title: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras mattis magna lorem, quis lobortis.'
        desc: 'nějaký popisek' # muze byt null
        colors:
          bg: '#525659'
          content: '#ffffff'
        image:
          size: [2880, 1922]
          url: '/img/data/bahnhof_sud_04.jpg'
        fullImage:
          size: [2880, 1922]
          url: '/img/data/bahnhof_sud_04.jpg'
    ]
  ,
  'vorarlberg-museum':
    id: 2
    title: 'Vorarlberg Museum, Bregenz'
    slug: 'vorarlberg-museum'
    date: '2012-01-01'
    custom1: 'Museum'
    custom2: 'Realised'
    colors:
      bg: '#a2a8ae'
      content: '#ffffff'
    image:
      size: [5577, 2065]
      url: '/img/data/proj2/vorarlberg_museum_01.jpg'
    slides: [
      id: 1
      projectId: 2
      type: 'image'
      title: '1'
      colors:
        bg: '#a2a8ae'
        content: '#ffffff'
      image:
        size: [5577, 2065]
        url: '/img/data/proj2/vorarlberg_museum_01.jpg'
      fullImage:
        size: [5577, 2065]
        url: '/img/data/proj2/vorarlberg_museum_01.jpg'
    ,
      id: 2
      projectId: 2
      type: 'image'
      title: '2'
      colors:
        bg: '#7e8182'
        content: '#ffffff'
      image:
        size: [2800, 1869]
        url: '/img/data/proj2/vorarlberg_museum_02.jpg'
      fullImage:
        size: [2800, 1869]
        url: '/img/data/proj2/vorarlberg_museum_02.jpg'
    ,
      id: 3
      projectId: 2
      type: 'image'
      title: '3'
      colors:
        bg: '#393a3b'
        content: '#ffffff'
      image:
        size: [2800, 1869]
        url: '/img/data/proj2/vorarlberg_museum_03.jpg'
      fullImage:
        size: [2800, 1869]
        url: '/img/data/proj2/vorarlberg_museum_03.jpg'
    ,
      id: 4
      projectId: 2
      type: 'image'
      title: '4'
      colors:
        bg: '#9c9ea2'
        content: '#ffffff'
      image:
        size: [2552, 2800]
        url: '/img/data/proj2/vorarlberg_museum_04.jpg'
      fullImage:
        size: [2552, 2800]
        url: '/img/data/proj2/vorarlberg_museum_04.jpg'
    ,
      id: 5
      projectId: 2
      type: 'image'
      title: '5'
      colors:
        bg: '#5d5953'
        content: '#ffffff'
      image:
        size: [2800, 1869]
        url: '/img/data/proj2/vorarlberg_museum_05.jpg'
      fullImage:
        size: [2800, 1869]
        url: '/img/data/proj2/vorarlberg_museum_05.jpg'
    ,
      id: 6
      projectId: 2
      type: 'image'
      title: '6'
      colors:
        bg: '#d3d3d3'
        content: '#000000'
      image:
        size: [2800, 1418]
        url: '/img/data/proj2/vorarlberg_museum_06.png'
      fullImage:
        size: [2800, 1418]
        url: '/img/data/proj2/vorarlberg_museum_06.png'
    ,
      id: 7
      projectId: 2
      type: 'image'
      title: '7'
      colors:
        bg: '#d3d3d3'
        content: '#000000'
      image:
        size: [2800, 2800]
        url: '/img/data/proj2/vorarlberg_museum_07.png'
      fullImage:
        size: [2800, 2800]
        url: '/img/data/proj2/vorarlberg_museum_07.png'
   ,
      id: 8
      projectId: 2
      type: 'image'
      title: '8'
      colors:
        bg: '#d3d3d3'
        content: '#000000'
      image:
        size: [2800, 2800]
        url: '/img/data/proj2/vorarlberg_museum_08.png'
      fullImage:
        size: [2800, 2800]
        url: '/img/data/proj2/vorarlberg_museum_08.png'
    ,
      id: 9
      projectId: 2
      type: 'image'
      title: '9'
      colors:
        bg: '#d3d3d3'
        content: '#000000'
      image:
        size: [2800, 2800]
        url: '/img/data/proj2/vorarlberg_museum_09.png'
      fullImage:
        size: [2800, 2800]
        url: '/img/data/proj2/vorarlberg_museum_09.png'
    ,
      id: 10
      projectId: 2
      type: 'image'
      title: '10'
      colors:
        bg: '#d3d3d3'
        content: '#000000'
      image:
        size: [2800, 2800]
        url: '/img/data/proj2/vorarlberg_museum_10.png'
      fullImage:
        size: [2800, 2800]
        url: '/img/data/proj2/vorarlberg_museum_10.png'
   ,
      id: 11
      projectId: 2
      type: 'image'
      title: '11'
      colors:
        bg: '#d3d3d3'
        content: '#000000'
      image:
        size: [2800, 2800]
        url: '/img/data/proj2/vorarlberg_museum_11.png'
      fullImage:
        size: [2800, 2800]
        url: '/img/data/proj2/vorarlberg_museum_11.png'
    ,
      id: 12
      projectId: 2
      type: 'image'
      title: '12'
      colors:
        bg: '#d3d3d3'
        content: '#000000'
      image:
        size: [2800, 2800]
        url: '/img/data/proj2/vorarlberg_museum_12.png'
      fullImage:
        size: [2800, 2800]
        url: '/img/data/proj2/vorarlberg_museum_12.png'
    ]
  ,
  'mfo-park':
    id: 3
    title: 'MFO Park, Zurich (Oerlikon)'
    slug: 'mfo-park'
    date: '2009-01-01'
    custom1: 'Public park'
    custom2: 'Realised'
    colors:
      bg: '#534b3b'
      content: '#ffffff'
    image:
      size: [2800, 1875]
      url: '/img/data/proj3/mfo_park_01.jpg'
    slides: [
      id: 1
      projectId: 3
      type: 'image'
      title: '1'
      colors:
        bg: '#534b3b'
        content: '#ffffff'
      image:
        size: [2800, 1875]
        url: '/img/data/proj3/mfo_park_01.jpg'
      fullImage:
        size: [2800, 1875]
        url: '/img/data/proj3/mfo_park_01.jpg'
    ,
      id: 2
      projectId: 3
      type: 'image'
      title: '2'
      colors:
        bg: '#78653d'
        content: '#ffffff'
      image:
        size: [2800, 1860]
        url: '/img/data/proj3/mfo_park_02.jpg'
      fullImage:
        size: [2800, 1860]
        url: '/img/data/proj3/mfo_park_02.jpg'
    ,
      id: 3
      projectId: 3
      type: 'image'
      title: '3'
      colors:
        bg: '#3a362a'
        content: '#ffffff'
      image:
        size: [1869, 2800]
        url: '/img/data/proj3/mfo_park_03.jpg'
      fullImage:
        size: [1869, 2800]
        url: '/img/data/proj3/mfo_park_03.jpg'
    ,
      id: 4
      projectId: 3
      type: 'image'
      title: '4'
      colors:
        bg: '#595859'
        content: '#ffffff'
      image:
        size: [2800, 1860]
        url: '/img/data/proj3/mfo_park_04.jpg'
      fullImage:
        size: [2800, 1860]
        url: '/img/data/proj3/mfo_park_04.jpg'
    ,
      id: 5
      projectId: 3
      type: 'image'
      title: '5'
      colors:
        bg: '#797778'
        content: '#ffffff'
      image:
        size: [2800, 1860]
        url: '/img/data/proj3/mfo_park_05.jpg'
      fullImage:
        size: [2800, 1860]
        url: '/img/data/proj3/mfo_park_05.jpg'
    ,
      id: 6
      projectId: 3
      type: 'image'
      title: '6'
      colors:
        bg: '#8b8886'
        content: '#ffffff'
      image:
        size: [2800, 1860]
        url: '/img/data/proj3/mfo_park_06.jpg'
      fullImage:
        size: [2800, 1860]
        url: '/img/data/proj3/mfo_park_06.jpg'
    ]
}
