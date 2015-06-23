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
    title: 'Letní rodinný dům na ostrově Caicos'
    slug: 'letni-rodinny-dum-na-ostrove-caicos'
    date: '2012-01-01'
    custom1: 'Rodinný dům'
    custom2: 'Realizováno'
    colors:
      bg: '#6e837e'
      content: '#CAB5A9'
    image:
      size: [750, 498]
      url: '/img/data/proj2/img01.jpeg'
  ,
    id: 3
    title: 'Rodinný dum Vlna'
    slug: 'rodinny-dum-vlna'
    date: '2009-01-01'
    custom1: 'Rodinný dům'
    custom2: 'Realizováno'
    colors:
      bg: '#5b6773'
      content: '#B1A189'
    image:
      size: [750, 562]
      url: '/img/data/proj3/img01.jpeg'
  ,
    id: 4
    title: 'Sídlo firmy mminterier'
    slug: 'sidlo-firmy-mminterier'
    date: '2009-01-01'
    custom1: 'Urbanismus'
    custom2: 'Realizováno'
    colors:
      bg: '#878684'
      content: '#434344'
    image:
      size: [750, 563]
      url: '/img/data/proj4/img01.jpeg'
]

aa.mock.Detail = {
  'golf-klub-certovo-bremeno':
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
          content: '#fff'
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
          content: '#fff'
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
          bg: '#C6CFCE'
          content: '#fff'
      ,
        id: 2
        projectId: 1
        type: 'image'
        title: 'Tréninkové plochy'
        desc: 'nějaký popisek' # muze byt null
        colors:
          bg: '#607a77'
          content: '#fff'
        image:
          size: [2362, 1670]
          url: '/img/data/02.jpg'
        fullImage:
          size: [2362, 1670]
          url: '/img/data/02.jpg'
    ]
  ,
  'letni-rodinny-dum-na-ostrove-caicos':
    id: 2
    title: 'Letní rodinný dům na ostrově Caicos'
    slug: 'letni-rodinny-dum-na-ostrove-caicos'
    date: '2012-01-01'
    custom1: 'Rodinný dům'
    custom2: 'Realizováno'
    colors:
      bg: '#6e837e'
      content: '#CAB5A9'
    image:
      size: [750, 498]
      url: '/img/data/proj2/img01.jpeg'
    slides: [
      id: 1
      projectId: 2
      type: 'image'
      title: '1'
      colors:
        bg: '#6e837e'
        content: '#fff'
      image:
        size: [750, 498]
        url: '/img/data/proj2/img01.jpeg'
      fullImage:
        size: [750, 498]
        url: '/img/data/proj2/img01.jpeg'
    ,
      id: 2
      projectId: 2
      type: 'image'
      title: '2'
      colors:
        bg: '#443d2b'
        content: '#fff'
      image:
        size: [750, 557]
        url: '/img/data/proj2/img02.jpeg'
      fullImage:
        size: [750, 557]
        url: '/img/data/proj2/img02.jpeg'
    ,
      id: 3
      projectId: 2
      type: 'image'
      title: '3'
      colors:
        bg: '#6e7271'
        content: '#fff'
      image:
        size: [750, 501]
        url: '/img/data/proj2/img03.jpeg'
      fullImage:
        size: [750, 501]
        url: '/img/data/proj2/img03.jpeg'
    ,
      id: 4
      projectId: 2
      type: 'image'
      title: '4'
      colors:
        bg: '#7c704a'
        content: '#fff'
      image:
        size: [750, 515]
        url: '/img/data/proj2/img04.jpeg'
      fullImage:
        size: [750, 515]
        url: '/img/data/proj2/img04.jpeg'
    ,
      id: 5
      projectId: 2
      type: 'image'
      title: '5'
      colors:
        bg: '#545448'
        content: '#fff'
      image:
        size: [554, 750]
        url: '/img/data/proj2/img05.jpeg'
      fullImage:
        size: [554, 750]
        url: '/img/data/proj2/img05.jpeg'
    ,
      id: 6
      projectId: 2
      type: 'image'
      title: '6'
      colors:
        bg: '#f4f4f4'
        content: '#fff'
      image:
        size: [750, 530]
        url: '/img/data/proj2/img06.jpeg'
      fullImage:
        size: [750, 530]
        url: '/img/data/proj2/img06.jpeg'
    ,
      id: 7
      projectId: 2
      type: 'image'
      title: '7'
      colors:
        bg: '#545b4b'
        content: '#fff'
      image:
        size: [750, 409]
        url: '/img/data/proj2/img07.jpeg'
      fullImage:
        size: [750, 409]
        url: '/img/data/proj2/img07.jpeg'
    ,
      id: 8
      projectId: 2
      type: 'image'
      title: '8'
      colors:
        bg: '#5d707e'
        content: '#fff'
      image:
        size: [750, 280]
        url: '/img/data/proj2/img08.jpeg'
      fullImage:
        size: [750, 280]
        url: '/img/data/proj2/img08.jpeg'
    ,
      id: 9
      projectId: 2
      type: 'image'
      title: '9'
      colors:
        bg: '#4f3f30'
        content: '#fff'
      image:
        size: [750, 498]
        url: '/img/data/proj2/img09.jpeg'
      fullImage:
        size: [750, 498]
        url: '/img/data/proj2/img09.jpeg'
    ]
  ,
  'rodinny-dum-vlna':
    id: 3
    title: 'Rodinný dum Vlna'
    slug: 'rodinny-dum-vlna'
    date: '2009-01-01'
    custom1: 'Rodinný dům'
    custom2: 'Realizováno'
    colors:
      bg: '#5b6773'
      content: '#B1A189'
    image:
      size: [750, 562]
      url: '/img/data/proj3/img01.jpeg'
    slides: [
      id: 1
      projectId: 3
      type: 'image'
      title: '1'
      colors:
        bg: '#5b6773'
        content: '#fff'
      image:
        size: [750, 562]
        url: '/img/data/proj3/img01.jpeg'
      fullImage:
        size: [750, 562]
        url: '/img/data/proj3/img01.jpeg'
    ,
      id: 2
      projectId: 3
      type: 'image'
      title: '2'
      colors:
        bg: '#606465'
        content: '#fff'
      image:
        size: [750, 562]
        url: '/img/data/proj3/img02.jpeg'
      fullImage:
        size: [750, 562]
        url: '/img/data/proj3/img02.jpeg'
    ,
      id: 3
      projectId: 3
      type: 'image'
      title: '3'
      colors:
        bg: '#5e5a3d'
        content: '#fff'
      image:
        size: [750, 562]
        url: '/img/data/proj3/img03.jpeg'
      fullImage:
        size: [750, 562]
        url: '/img/data/proj3/img03.jpeg'
    ,
      id: 4
      projectId: 3
      type: 'image'
      title: '4'
      colors:
        bg: '#6d7440'
        content: '#fff'
      image:
        size: [562, 750]
        url: '/img/data/proj3/img04.jpeg'
      fullImage:
        size: [562, 750]
        url: '/img/data/proj3/img04.jpeg'
    ,
      id: 5
      projectId: 3
      type: 'image'
      title: '5'
      colors:
        bg: '#7f806e'
        content: '#fff'
      image:
        size: [750, 562]
        url: '/img/data/proj3/img05.jpeg'
      fullImage:
        size: [750, 562]
        url: '/img/data/proj3/img05.jpeg'
    ,
      id: 6
      projectId: 3
      type: 'image'
      title: '6'
      colors:
        bg: '#425b58'
        content: '#fff'
      image:
        size: [750, 562]
        url: '/img/data/proj3/img06.jpeg'
      fullImage:
        size: [750, 562]
        url: '/img/data/proj3/img06.jpeg'
    ,
      id: 7
      projectId: 3
      type: 'image'
      title: '7'
      colors:
        bg: '#f1f1f1'
        content: '#fff'
      image:
        size: [750, 296]
        url: '/img/data/proj3/img07.jpeg'
      fullImage:
        size: [750, 296]
        url: '/img/data/proj3/img07.jpeg'
    ,
      id: 8
      projectId: 3
      type: 'image'
      title: '8'
      colors:
        bg: '#57594c'
        content: '#fff'
      image:
        size: [750, 562]
        url: '/img/data/proj3/img08.jpeg'
      fullImage:
        size: [750, 562]
        url: '/img/data/proj3/img08.jpeg'
    ,
      id: 9
      projectId: 3
      type: 'image'
      title: '9'
      colors:
        bg: '#838578'
        content: '#fff'
      image:
        size: [750, 562]
        url: '/img/data/proj3/img09.jpeg'
      fullImage:
        size: [750, 562]
        url: '/img/data/proj3/img09.jpeg'
      ]
  ,
  'sidlo-firmy-mminterier':
    id: 4
    title: 'Sídlo firmy mminterier'
    slug: 'sidlo-firmy-mminterier'
    date: '2009-01-01'
    custom1: 'Urbanismus'
    custom2: 'Realizováno'
    colors:
      bg: '#878684'
      content: '#434344'
    image:
      size: [750, 563]
      url: '/img/data/proj4/img01.jpeg'
    slides: [
      id: 1
      projectId: 4
      type: 'image'
      title: '1'
      colors:
        bg: '#878684'
        content: '#fff'
      image:
        size: [750, 563]
        url: '/img/data/proj4/img01.jpeg'
      fullImage:
        size: [750, 563]
        url: '/img/data/proj4/img01.jpeg'
    ,
      id: 2
      projectId: 4
      type: 'image'
      title: '2'
      colors:
        bg: '#949691'
        content: '#fff'
      image:
        size: [750, 622]
        url: '/img/data/proj4/img02.jpeg'
      fullImage:
        size: [750, 622]
        url: '/img/data/proj4/img02.jpeg'
    ,
      id: 3
      projectId: 4
      type: 'image'
      title: '3'
      colors:
        bg: '#84837f'
        content: '#fff'
      image:
        size: [750, 563]
        url: '/img/data/proj4/img03.jpeg'
      fullImage:
        size: [750, 563]
        url: '/img/data/proj4/img03.jpeg'
    ,
      id: 4
      projectId: 4
      type: 'image'
      title: '4'
      colors:
        bg: '#a59d9b'
        content: '#fff'
      image:
        size: [563, 750]
        url: '/img/data/proj4/img04.jpeg'
      fullImage:
        size: [563, 750]
        url: '/img/data/proj4/img04.jpeg'
    ,
      id: 5
      projectId: 4
      type: 'image'
      title: '5'
      colors:
        bg: '#ba9a85'
        content: '#fff'
      image:
        size: [750, 563]
        url: '/img/data/proj4/img05.jpeg'
      fullImage:
        size: [750, 563]
        url: '/img/data/proj4/img05.jpeg'
    ,
      id: 6
      projectId: 4
      type: 'image'
      title: '6'
      colors:
        bg: '#98be11'
        content: '#fff'
      image:
        size: [563, 750]
        url: '/img/data/proj4/img06.jpeg'
      fullImage:
        size: [563, 750]
        url: '/img/data/proj4/img06.jpeg'
    ,
      id: 7
      projectId: 4
      type: 'image'
      title: '7'
      colors:
        bg: '#cfcfc3'
        content: '#fff'
      image:
        size: [750, 513]
        url: '/img/data/proj4/img07.jpeg'
      fullImage:
        size: [750, 513]
        url: '/img/data/proj4/img07.jpeg'
    ,
      id: 8
      projectId: 4
      type: 'image'
      title: '8'
      colors:
        bg: '#ababad'
        content: '#fff'
      image:
        size: [750, 563]
        url: '/img/data/proj4/img08.jpeg'
      fullImage:
        size: [750, 563]
        url: '/img/data/proj4/img08.jpeg'
    ,
      id: 9
      projectId: 4
      type: 'image'
      title: '9'
      colors:
        bg: '#5b6870'
        content: '#fff'
      image:
        size: [750, 563]
        url: '/img/data/proj4/img09.jpeg'
      fullImage:
        size: [750, 563]
        url: '/img/data/proj4/img09.jpeg'
    ]
}
