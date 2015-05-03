goog.provide 'arch.mock'

arch.mock.List =
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
      bgColor: '#403B3B'
      contentColor: '#fff'
    image:
      size: [1024, 768]
      url: 'url na obrazek, ktery bude ve velikosti kterou poslu v requestu'
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
      bgColor: '#fff'
      contentColor: '#906090'
    image:
      size: [1080, 1920]
      url: 'url na obrazek, ktery bude ve velikosti kterou poslu v requestu'
]

arch.mock.Detail =
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
      bgColor: '#403B3B'
      contentColor: '#fff'
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
          bgColor: '#403B3B'
          contentColor: '#fff'
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
          bgColor: '#403B3B'
          contentColor: '#fff'
    ]
