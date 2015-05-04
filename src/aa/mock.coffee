goog.provide 'aa.mock'

aa.mock.List =
  data: [
    id: 1
    title: 'Domy v mlze, Rtyně'
    date: '2009-01-01'
    desc: 'Nádherné výhledy nad dramatickým údolím řeky Jizery v obci
      Benešov u Semil. Svažitý pozemek situovaný na jih za zahradou'
    params: [
        key: 'custom1'
        name: 'Typologie'
        value: 'Rodinný dům'
      ,
        key: 'custom2'
        name: 'Status'
        value: 'Realizováno'
    ]
    colors:
      bg: '#403B3B'
      content: '#fff'
    image:
      size: [1024, 768]
      url: 'http://ad009cdnb.archdaily.net/wp-content/uploads/2011/03/1299213392-mg-1336-1280x853-1000x666.jpg'
  ,
    id: 2
    title: 'Stodola, Benešov'
    date: '2012-01-01'
    desc: 'Nádherné výhledy nad dramatickým údolím řeky Jizery v obci
      Benešov u Semil. Svažitý pozemek situovaný na jih za zahradou'
    params: [
        name: 'Typologie'
        value: 'Urbanismus'
      ,
        name: 'Status'
        value: 'Realizováno'
    ]
    colors:
      bg: '#fff'
      content: '#906090'
    image:
      size: [1080, 1920]
      url: 'http://ad009cdnb.archdaily.net/wp-content/uploads/2012/08/5024bf9528ba0d658d00003c_hope-street-geelong-west-steve-domoney-architecture_heard_1.jpg'
]

aa.mock.Detail =
  data:
    id: 3
    title: 'Domy v mlze, Rtyně'
    date: '2009-01-01'
    desc: 'Nádherné výhledy nad dramatickým údolím řeky Jizery v obci
      Benešov u Semil. Svažitý pozemek situovaný na jih za zahradou'
    params: [
        key: 'custom1'
        name: 'Typologie'
        value: 'Rodinný dům'
      ,
        key: 'custom2'
        name: 'Status'
        value: 'Realizováno'
    ]
    colors:
      bg: '#403B3B'
      content: '#fff'
    image:
      size: [1024, 768]
      url: 'url na obrazek, ktery bude ve velikosti kterou poslu v requestu'
    slides: [
        id: 1
        projectId: 3
        type: 'image'
        title: 'Pohled na štít domu z jižní části'
        desc: 'nějaký popisek' # muze byt null
        colors:
          bg: '#403B3B'
          content: '#fff'
        image:
          size: [1024, 768]
          url: 'url na obrazek, ktery bude ve velikosti kterou poslu v requestu'
        fullImage:
          size: [2048, 1536]
          url: 'url na obrazek v plne velikosti'
      ,
        id: 2
        projectId: 3
        type: 'text'
        title: 'Pohled na štít domu z jižní části'
        html: '<p>prvni odstavec</p><p>druhy <strong>odstavec</strong></p>'
        colors:
          bg: '#403B3B'
          content: '#fff'
    ]
