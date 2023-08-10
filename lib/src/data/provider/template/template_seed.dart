import 'package:uuid/uuid.dart';

import '../../../domain/domain.dart';

const uuid = Uuid();

final group1994 = CoinGroup(
  name: '1994',
  isSpecial: false,
  coins: [
    Coin(
      id: uuid.v4(),
      name: '1 Centavo',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '5 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '10 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '25 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '50 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '1 Real',
      isRare: false,
    ),
  ],
);
final group1995 = CoinGroup(
  name: '1995',
  isSpecial: false,
  coins: [
    Coin(
      id: uuid.v4(),
      name: '1 Centavo',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '5 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '10 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '25 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '50 Centavos',
      isRare: false,
    ),
  ],
);
final group50Years = CoinGroup(
  name: '50 Anos da FAO Alimentos para todos',
  isSpecial: true,
  coins: [
    Coin(
      id: uuid.v4(),
      name: '10 Centavos',
      isRare: true,
    ),
    Coin(
      id: uuid.v4(),
      name: '25 Centavos',
      isRare: true,
    ),
  ],
);
final group1996 = CoinGroup(
  name: '1996',
  isSpecial: false,
  coins: [
    Coin(
      id: uuid.v4(),
      name: '1 Centavo',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '5 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '10 Centavos',
      isRare: false,
    ),
  ],
);
final group1997 = CoinGroup(
  name: '1997',
  isSpecial: false,
  coins: [
    Coin(
      id: uuid.v4(),
      name: '1 Centavo',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '5 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '10 Centavos',
      isRare: false,
    ),
  ],
);

final firstFamily = CoinFamily(
  name: '1ª Família',
  coinGroup: [group1994, group1995, group50Years, group1996, group1997],
);

final group1998 = CoinGroup(
  name: '1998',
  isSpecial: false,
  coins: [
    Coin(
      id: uuid.v4(),
      name: '1 Centavo',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '5 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '10 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '25 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '50 Centavos',
      isRare: true,
    ),
    Coin(
      id: uuid.v4(),
      name: '1 Real',
      isRare: true,
    ),
  ],
);
final group1999 = CoinGroup(
  name: '1999',
  isSpecial: false,
  coins: [
    Coin(
      id: uuid.v4(),
      name: '1 Centavo',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '5 Centavos',
      isRare: true,
    ),
    Coin(
      id: uuid.v4(),
      name: '10 Centavos',
      isRare: true,
    ),
    Coin(
      id: uuid.v4(),
      name: '25 Centavos',
      isRare: true,
    ),
    Coin(
      id: uuid.v4(),
      name: '1 Real',
      isRare: true,
    ),
  ],
);
final group1998HumanRights = CoinGroup(
  name: '1998 - Direitos Humanus',
  isSpecial: true,
  coins: [
    Coin(
      id: uuid.v4(),
      name: '1 Real',
      isRare: true,
    ),
  ],
);
final group2000 = CoinGroup(
  name: '2000',
  isSpecial: false,
  coins: [
    Coin(
      id: uuid.v4(),
      name: '1 Centavo',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '5 Centavos',
      isRare: true,
    ),
    Coin(
      id: uuid.v4(),
      name: '10 Centavos',
      isRare: true,
    ),
    Coin(
      id: uuid.v4(),
      name: '25 Centavos',
      isRare: true,
    ),
    Coin(
      id: uuid.v4(),
      name: '50 Centavos',
      isRare: true,
    ),
  ],
);
final group2001 = CoinGroup(
  name: '2001',
  isSpecial: false,
  coins: [
    Coin(
      id: uuid.v4(),
      name: '1 Centavo',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '5 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '10 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '25 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '50 Centavos',
      isRare: true,
    ),
  ],
);
final group2002 = CoinGroup(
  name: '2002',
  isSpecial: false,
  coins: [
    Coin(
      id: uuid.v4(),
      name: '1 Centavo',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '5 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '10 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '25 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '50 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '1 Real',
      isRare: false,
    ),
  ],
);
final group2002JK = CoinGroup(
  name: '2002 - Juscelino Kubitschek',
  isSpecial: true,
  coins: [
    Coin(
      id: uuid.v4(),
      name: '1 Real',
      isRare: false,
    ),
  ],
);
final group2003 = CoinGroup(
  name: '2003',
  isSpecial: false,
  coins: [
    Coin(
      id: uuid.v4(),
      name: '1 Centavo',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '5 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '10 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '25 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '50 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '1 Real',
      isRare: false,
    ),
  ],
);
final group2004 = CoinGroup(
  name: '2004',
  isSpecial: false,
  coins: [
    Coin(
      id: uuid.v4(),
      name: '1 Centavo',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '5 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '10 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '25 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '1 Real',
      isRare: false,
    ),
  ],
);
final group2005 = CoinGroup(
  name: '2005',
  isSpecial: false,
  coins: [
    Coin(
      id: uuid.v4(),
      name: '5 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '10 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '25 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '50 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '1 Real',
      isRare: false,
    ),
  ],
);
final group40Years = CoinGroup(
  name: '40 Anos do Banco Central',
  isSpecial: true,
  coins: [
    Coin(
      id: uuid.v4(),
      name: '1 Real',
      isRare: true,
    ),
  ],
);
final group2006 = CoinGroup(
  name: '2006',
  isSpecial: false,
  coins: [
    Coin(
      id: uuid.v4(),
      name: '5 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '10 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '25 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '50 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '1 Real',
      isRare: false,
    ),
  ],
);
final group2007 = CoinGroup(
  name: '2007',
  isSpecial: false,
  coins: [
    Coin(
      id: uuid.v4(),
      name: '5 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '10 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '25 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '50 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '1 Real',
      isRare: false,
    ),
  ],
);
final group2008 = CoinGroup(
  name: '2008',
  isSpecial: false,
  coins: [
    Coin(
      id: uuid.v4(),
      name: '5 Centavos',
      isRare: true,
    ),
    Coin(
      id: uuid.v4(),
      name: '10 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '25 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '50 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '1 Real',
      isRare: false,
    ),
  ],
);
final group2009 = CoinGroup(
  name: '2009',
  isSpecial: false,
  coins: [
    Coin(
      id: uuid.v4(),
      name: '5 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '10 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '25 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '50 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '1 Real',
      isRare: false,
    ),
  ],
);
final group2010 = CoinGroup(
  name: '2010',
  isSpecial: false,
  coins: [
    Coin(
      id: uuid.v4(),
      name: '5 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '10 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '25 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '50 Centavos',
      isRare: false,
    ),
  ],
);
final group2011 = CoinGroup(
  name: '2011',
  isSpecial: false,
  coins: [
    Coin(
      id: uuid.v4(),
      name: '5 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '10 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '25 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '50 Centavos',
      isRare: false,
    ),
  ],
);
final group2012 = CoinGroup(
  name: '2012',
  isSpecial: false,
  coins: [
    Coin(
      id: uuid.v4(),
      name: '5 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '10 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '25 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '50 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '1 Real',
      isRare: false,
    ),
  ],
);
final group2013 = CoinGroup(
  name: '2013',
  isSpecial: false,
  coins: [
    Coin(
      id: uuid.v4(),
      name: '5 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '10 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '25 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '50 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '1 Real',
      isRare: false,
    ),
  ],
);
final group2014 = CoinGroup(
  name: '2014',
  isSpecial: false,
  coins: [
    Coin(
      id: uuid.v4(),
      name: '5 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '10 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '25 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '50 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '1 Real',
      isRare: true,
    ),
  ],
);
final group2015 = CoinGroup(
  name: '2015',
  isSpecial: false,
  coins: [
    Coin(
      id: uuid.v4(),
      name: '5 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '10 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '25 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '50 Centavos',
      isRare: false,
    ),
  ],
);
final group50YearsBC = CoinGroup(
  name: '50 Anos do Banco Central',
  isSpecial: true,
  coins: [
    Coin(
      id: uuid.v4(),
      name: '1 Real',
      isRare: true,
    ),
  ],
);
final group2016 = CoinGroup(
  name: '2016',
  isSpecial: false,
  coins: [
    Coin(
      id: uuid.v4(),
      name: '5 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '10 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '25 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '50 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '1 Real',
      isRare: true,
    ),
  ],
);
final group2017 = CoinGroup(
  name: '2017',
  isSpecial: false,
  coins: [
    Coin(
      id: uuid.v4(),
      name: '5 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '10 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '25 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '50 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '1 Real',
      isRare: false,
    ),
  ],
);
final group2018 = CoinGroup(
  name: '2018',
  isSpecial: false,
  coins: [
    Coin(
      id: uuid.v4(),
      name: '5 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '10 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '25 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '50 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '1 Real',
      isRare: false,
    ),
  ],
);
final group2019 = CoinGroup(
  name: '2019',
  isSpecial: false,
  coins: [
    Coin(
      id: uuid.v4(),
      name: '5 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '10 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '25 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '50 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '1 Real',
      isRare: false,
    ),
  ],
);
final group25YearsReal = CoinGroup(
  name: '25 Anos do Real',
  isSpecial: true,
  coins: [
    Coin(
      id: uuid.v4(),
      name: '5 Centavos A',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '50 Centavos A',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '1 Real',
      isRare: true,
    ),
  ],
);
final group2020 = CoinGroup(
  name: '2020',
  isSpecial: false,
  coins: [
    Coin(
      id: uuid.v4(),
      name: '5 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '10 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '25 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '50 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '1 Real',
      isRare: false,
    ),
  ],
);
final group2021 = CoinGroup(
  name: '2021',
  isSpecial: false,
  coins: [
    Coin(
      id: uuid.v4(),
      name: '5 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '10 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '25 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '50 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '1 Real',
      isRare: false,
    ),
  ],
);
final group2022 = CoinGroup(
  name: '2022',
  isSpecial: false,
  coins: [
    Coin(
      id: uuid.v4(),
      name: '5 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '10 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '25 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '50 Centavos',
      isRare: false,
    ),
    Coin(
      id: uuid.v4(),
      name: '1 Real',
      isRare: false,
    ),
  ],
);
final group2016OlympicGames = CoinGroup(
  name: 'Jogos Olímpicos Rio 2016',
  isSpecial: true,
  coins: [
    Coin(
      id: uuid.v4(),
      name: '1 Real - Entrega da Bandeira Olímpica',
      isRare: true,
    ),
    Coin(
      id: uuid.v4(),
      name: '1 Real - Mascote Olímpico',
      isRare: true,
    ),
    Coin(
      id: uuid.v4(),
      name: '1 Real - Mascote Paralímpico',
      isRare: true,
    ),
    Coin(
      id: uuid.v4(),
      name: '1 Real - Atletismo',
      isRare: true,
    ),
    Coin(
      id: uuid.v4(),
      name: '1 Real - Natação',
      isRare: true,
    ),
    Coin(
      id: uuid.v4(),
      name: '1 Real - Paratriatlo',
      isRare: true,
    ),
    Coin(
      id: uuid.v4(),
      name: '1 Real - Golfe',
      isRare: true,
    ),
    Coin(
      id: uuid.v4(),
      name: '1 Real - Basquete',
      isRare: true,
    ),
    Coin(
      id: uuid.v4(),
      name: '1 Real - Vela',
      isRare: true,
    ),
    Coin(
      id: uuid.v4(),
      name: '1 Real - Paracanoagem',
      isRare: true,
    ),
    Coin(
      id: uuid.v4(),
      name: '1 Real - Rugby',
      isRare: true,
    ),
    Coin(
      id: uuid.v4(),
      name: '1 Real - Futebol',
      isRare: true,
    ),
    Coin(
      id: uuid.v4(),
      name: '1 Real - Vôlei',
      isRare: true,
    ),
    Coin(
      id: uuid.v4(),
      name: '1 Real - Atletismo Paralimpíco',
      isRare: true,
    ),
    Coin(
      id: uuid.v4(),
      name: '1 Real - Judô',
      isRare: true,
    ),
    Coin(
      id: uuid.v4(),
      name: '1 Real - Boxe',
      isRare: true,
    ),
    Coin(
      id: uuid.v4(),
      name: '1 Real - Natação Paralímpica',
      isRare: true,
    ),
  ],
);

final secondFamily = CoinFamily(
  name: '2ª Família',
  coinGroup: [
    group1998,
    group1998HumanRights,
    group1999,
    group2000,
    group2001,
    group2002,
    group2002JK,
    group2003,
    group2004,
    group2005,
    group40Years,
    group2006,
    group2007,
    group2008,
    group2009,
    group2010,
    group2011,
    group2012,
    group2013,
    group2014,
    group2015,
    group50YearsBC,
    group2016,
    group2016OlympicGames,
    group2017,
    group2018,
    group2019,
    group25YearsReal,
    group2020,
    group2021,
    group2022,
  ],
);

final template = CollectionTemplate(
  id: '',
  defaultName: 'Coleção dos Reais',
  coinFamily: [
    firstFamily,
    secondFamily,
  ],
);
