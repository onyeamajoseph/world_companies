SELECT * FROM largest_companies.companies_ranked_by_pe_ratio;

WITH duplicates AS (
  SELECT Ranks,
         ROW_NUMBER() OVER (PARTITION BY namess, symbol, pe_ratio_ttm, price_gbp, country ORDER BY Ranks) AS rn
  FROM companies_ranked_by_pe_ratio
)
DELETE FROM companies_ranked_by_pe_ratio
WHERE Ranks IN (
  SELECT Ranks FROM duplicates WHERE rn > 1
);

select * from companies_ranked_by_pe_ratio;

select * from companies_ranked_by_pe_ratio
order by Ranks asc;

WITH duplicates AS (
  SELECT Ranks,
         ROW_NUMBER() OVER (PARTITION BY namess, symbol, pe_ratio_ttm, price_gbp, country ORDER BY Ranks) AS rn
  FROM companies_ranked_by_pe_ratio
)
DELETE FROM companies_ranked_by_pe_ratio
WHERE Ranks IN (
  SELECT Ranks FROM duplicates WHERE rn > 1
);

CREATE TABLE companies_ranked_by_revenue (
    Ranks INT,
    namess VARCHAR(255),
    symbol VARCHAR(50),
    revenue_ttm FLOAT,
    price_gbp FLOAT,
    country VARCHAR(100)
);

select * from companies_ranked_by_revenue;



INSERT INTO companies_ranked_by_revenue (Ranks, namess, symbol, revenue_ttm, price_gbp, country) 
VALUES
(1, 'Walmart', 'WMT', 665035000000.00, 61.03, 'United States'),
(2, 'Amazon', 'AMZN', 604334000000.00, 143.45, 'United States'),
(3, 'Saudi Aramco', '2222.SR', 495355000000.00, 5.51, 'Saudi Arabia'),
(4, 'Sinopec', '600028.SS', 435697000000.00, 0.75, 'China'),
(5, 'PetroChina', '601857.SS', 429672000000.00, 0.97, 'China'),
(6, 'Berkshire Hathaway', 'BRK-B', 402877000000.00, 347.54, 'United States'),
(7, 'Apple', 'AAPL', 385603000000.00, 176.71, 'United States'),
(8, 'UnitedHealth', 'UNH', 381255000000.00, 441.49, 'United States'),
(9, 'CVS Health', 'CVS', 363248000000.00, 47.73, 'United States'),
(10, 'Volkswagen', 'VOW3.DE', 350679000000.00, 80.00, 'Germany'),
(11, 'Exxon Mobil', 'XOM', 340655000000.00, 87.87, 'United States'),
(12, 'Alphabet (Google)', 'GOOG', 328284000000.00, 126.25, 'United States'),
(13, 'China State Construction Engineering', '601668.SS', 319970000000.00, 0.66, 'China'),
(14, 'McKesson', 'MCK', 313751000000.00, 371.63, 'United States'),
(15, 'Toyota', 'TM', 308599000000.00, 136.21, 'Japan'),
(16, 'Shell', 'SHEL', 302023000000.00, 50.14, 'United Kingdom'),
(17, 'Cencora', 'COR', 283831000000.00, 170.94, 'United States'),
(18, 'JBS', 'JBSS3.SA', 281463000000.00, 4.24, 'Brazil'),
(19, 'Glencore', 'GLCNF', 255984000000.00, 4.35, 'Switzerland'),
(20, 'Costco', 'COST', 253695000000.00, 684.67, 'United States'),
(21, 'Microsoft', 'MSFT', 245122000000.00, 326.32, 'United States'),
(22, 'Cardinal Health', 'CAH', 226827000000.00, 84.18, 'United States'),
(23, 'Exor', 'EXO.AS', 223101000000.00, 80.55, 'Netherlands'),
(24, 'Cigna', 'CI', 216008000000.00, 264.09, 'United States'),
(25, 'TotalEnergies', 'TTE', 210244000000.00, 49.61, 'France'),
(26, 'Samsung', '005930.KS', 209375000000.00, 35.02, 'South Korea'),
(27, 'BP', 'BP', 201589000000.00, 23.88, 'United Kingdom'),
(28, 'Foxconn (Hon Hai Precision Industry)', '2317.TW', 197384000000.00, 4.46, 'Taiwan'),
(29, 'Chevron', 'CVX', 197009000000.00, 110.38, 'United States'),
(30, 'Ford', 'F', 180348000000.00, 8.03, 'United States'),
(31, 'General Motors', 'GM', 178092000000.00, 34.47, 'United States'),
(32, 'Elevance Health', 'ELV', 171719000000.00, 396.34, 'United States'),
(33, 'JPMorgan Chase', 'JPM', 170327000000.00, 157.99, 'United States'),
(34, 'China Railway Group', '0390.HK', 169791000000.00, 0.40, 'China'),
(35, 'BMW', 'BMW.DE', 167358000000.00, 66.84, 'Germany'),
(36, 'Mercedes-Benz', 'MBG.DE', 162018000000.00, 49.08, 'Germany'),
(37, 'Centene', 'CNC', 157745000000.00, 56.83, 'United States'),
(38, 'China Railway Construction', '601186.SS', 155226000000.00, 0.96, 'China'),
(39, 'Jingdong Mall', 'JD', 154000000000.00, 31.57, 'China'),
(40, 'Home Depot', 'HD', 152089000000.00, 305.40, 'United States'),
(41, 'Phillips 66', 'PSX', 151853000000.00, 99.15, 'United States'),
(42, 'Kroger', 'KR', 150202000000.00, 43.16, 'United States'),
(43, 'Meta Platforms (Facebook)', 'META', 149783000000.00, 433.38, 'United States'),
(44, 'Marathon Petroleum', 'MPC', 147792000000.00, 123.75, 'United States'),
(45, 'Walgreens Boots Alliance', 'WBA', 145532000000.00, 6.86, 'United States'),
(46, 'China Mobile', '0941.HK', 142725000000.00, 7.18, 'China'),
(47, 'Honda', 'HMC', 141023000000.00, 24.23, 'Japan'),
(48, 'Valero Energy', 'VLO', 140067000000.00, 102.49, 'United States'),
(49, 'AXA', 'CS.PA', 134351000000.00, 29.35, 'France'),
(50, 'Verizon', 'VZ', 134243000000.00, 34.23, 'United States'),
(51, 'Mitsubishi Corporation', '8058.T', 133590000000.00, 15.79, 'Japan'),
(52, 'Alibaba', 'BABA', 132417000000.00, 84.01, 'China'),
(53, 'Prudential', 'PUK', 128560000000.00, 14.27, 'United Kingdom'),
(54, 'CITIC limited', '0267.HK', 125713000000.00, 0.90, 'China'),
(55, 'Hyundai', 'HYMTF', 125353000000.00, 50.30, 'South Korea'),
(56, 'AT&T', 'T', 122197000000.00, 16.58, 'United States'),
(57, 'Deutsche Telekom', 'DTE.DE', 121538000000.00, 22.35, 'Germany'),
(58, 'Comcast', 'CMCSA', 121113000000.00, 31.68, 'United States'),
(59, 'Ping An Insurance', '601318.SS', 113107000000.00, 6.14, 'China'),
(60, 'ICBC', '1398.HK', 112934000000.00, 0.45, 'China'),
(61, 'Humana', 'HUM', 112036000000.00, 243.12, 'United States'),
(62, 'Reliance Industries', 'RELIANCE.NS', 111087000000.00, 26.82, 'India'),
(63, 'Nestlé', 'NESN.SW', 111032000000.00, 77.11, 'Switzerland'),
(64, 'Allianz', 'ALV.DE', 107853000000.00, 250.10, 'Germany'),
(65, 'Target', 'TGT', 107300000000.00, 118.18, 'United States'),
(66, 'China Communications Construction', '601800.SS', 105403000000.00, 1.04, 'China'),
(67, 'Equinor', 'EQNR', 105318000000.00, 19.13, 'Norway'),
(68, 'China Construction Bank', '601939.SS', 105088000000.00, 0.85, 'China'),
(69, 'Life Insurance Corporation of India (LIC)', 'LICI.NS', 104146000000.00, 9.15, 'India'),
(70, 'Stellantis', 'STLA', 100924000000.00, 10.61, 'Netherlands'),
(71, 'ENI', 'E', 98895013012.00, 23.24, 'Italy'),
(72, 'Bank of America', 'BAC', 98321000000.00, 29.90, 'United States'),
(73, 'SAIC Motor', '600104.SS', 98092564899.00, 1.57, 'China'),
(74, 'SK Group', '034730.KS', 97443914539.00, 87.22, 'South Korea'),
(75, 'Agricultural Bank of China', '601288.SS', 96889079690.00, 0.52, 'China'),
(76, 'NVIDIA', 'NVDA', 96307000000.00, 92.17, 'United States'),
(77, 'Ahold Delhaize', 'AD.AS', 96094832570.00, 26.33, 'Netherlands'),
(78, 'Itōchū Shōji', '8001.T', 95761078314.00, 41.07, 'Japan'),
(79, 'Tesla', 'TSLA', 95318000000.00, 200.36, 'United States'),
(80, 'LVMH', 'MC.PA', 95238779571.00, 585.99, 'France'),
(81, 'Brookfield Corporation', 'BN', 94916000000.00, 40.44, 'Canada'),
(82, 'ENEOS Holdings', '5020.T', 94550414613.00, 4.17, 'Japan'),
(83, 'Carrefour', 'CA.PA', 93864691576.00, 13.07, 'France'),
(84, 'Uniper', 'UN0.DE', 92251425293.00, 45.66, 'Germany'),
(85, 'Indian Oil', 'IOC.NS', 92218272535.00, 1.64, 'India'),
(86, 'Pepsico', 'PEP', 92054000000.00, 130.16, 'United States'),
(87, 'Dell', 'DELL', 91839000000.00, 90.41, 'United States'),
(88, 'ENGIE', 'ENGI.PA', 91273491046.00, 13.05, 'France'),
(89, 'NTT (Nippon Telegraph &amp; Telephone)', '9432.T', 91187742362.00, 0.79, 'Japan'),
(90, 'Mitsui Bussan', '8031.T', 91000928004.00, 17.00, 'Japan'),
(91, 'Walt Disney', 'DIS', 90028000000.00, 73.26, 'United States'),
(92, 'Enel', 'ENEL.MI', 89871180222.00, 6.06, 'Italy'),
(93, 'BYD', '002594.SZ', 89658591321.00, 33.04, 'China'),
(94, 'United Parcel Service', 'UPS', 89502000000.00, 103.16, 'United States'),
(95, 'PTT PCL', 'PTT-R.BK', 89239309811.00, 0.77, 'Thailand'),
(96, 'Archer Daniels Midland (ADM)', 'ADM', 88768000000.00, 45.54, 'United States'),
(97, 'DHL Group (Deutsche Post)', 'DHL.DE', 88130240490.00, 33.64, 'Germany'),
(98, 'FedEx', 'FDX', 87591000000.00, 206.93, 'United States'),
(99, 'E.ON', 'EOAN.DE', 87444973643.00, 11.30, 'Germany'),
(100, 'Sony', 'SONY', 87211612525.00, 75.17, 'Japan'),
(101, 'Johnson & Johnson', 'JNJ', 86576000000.00, 122.68, 'United States'),
(102, 'Nissan', '7201.T', 86451000355.00, 2.15, 'Japan'),
(103, 'Bank of China', '601988.SS', 86314880725.00, 0.54, 'China'),
(104, 'Generali', 'G.MI', 86209332084.00, 21.92, 'Italy'),
(105, 'Tencent', 'TCEHY', 86165584253.00, 43.70, 'China'),
(106, 'Tesco', 'TSCO.L', 86157792323.00, 3.61, 'United Kingdom'),
(107, 'StoneX Group', 'SNEX', 85384400000.00, 62.14, 'United States'),
(108, 'Dior', 'CDI.PA', 84937516761.00, 549.69, 'France'),
(109, 'Procter & Gamble', 'PG', 84039000000.00, 131.98, 'United States'),
(110, 'Lowe''s Companies', 'LOW', 84023000000.00, 204.18, 'United States'),
(111, 'Siemens', 'SIE.DE', 83956343057.00, 152.92, 'Germany'),
(112, 'PKN Orlen', 'PKN.WA', 83881988983.00, 11.01, 'Poland'),
(113, 'Energy Transfer Partners', 'ET', 83629000000.00, 12.21, 'United States'),
(114, 'Wells Fargo', 'WFC', 82887000000.00, 42.44, 'United States'),
(115, 'Repsol', 'REP.MC', 82410053170.00, 9.98, 'Spain'),
(116, 'Japan Post Holdings', '6178.T', 81589585320.00, 7.31, 'Japan'),
(117, 'Sinopharm', '1099.HK', 80057351854.00, 2.03, 'China'),
(118, 'Citigroup', 'C', 79824000000.00, 46.89, 'United States'),
(119, 'Albertsons', 'ACI', 79452900000.00, 14.09, 'United States'),
(120, 'T-Mobile US', 'TMUS', 79096000000.00, 156.21, 'United States'),
(121, 'Sysco', 'SYY', 78844000000.00, 58.88, 'United States'),
(122, 'Petrobras', 'PBR', 78375496031.00, 10.98, 'Brazil'),
(123, 'Oil &amp; Natural Gas', 'ONGC.NS', 77528551410.00, 2.70, 'India'),
(124, 'Vinci', 'DG.PA', 77255140394.00, 89.17, 'France'),
(125, 'Kia', '000270.KS', 77160091428.00, 56.88, 'South Korea'),
(126, '7-Eleven', '3382.T', 77070090999.00, 11.48, 'Japan'),
(127, 'BNP Paribas', 'BNP.PA', 75244964637.00, 52.06, 'France'),
(128, 'Foxconn Industrial Internet', '601138.SS', 74631762705.00, 2.71, 'China'),
(129, 'TSMC', 'TSM', 73867987262.00, 134.01, 'Taiwan'),
(130, 'Boeing', 'BA', 73557000000.00, 116.37, 'United States'),
(131, 'Raytheon Technologies', 'RTX', 72417000000.00, 91.76, 'United States'),
(132, 'China Telecom', '0728.HK', 72272971401.00, 0.44, 'China'),
(133, 'Airbus', 'AIR.PA', 72072695634.00, 111.32, 'Netherlands'),
(134, 'Alimentation Couche-Tard', 'ATD.TO', 71917800000.00, 42.33, 'Canada'),
(135, 'Roche', 'ROG.SW', 71888614930.00, 244.85, 'Switzerland'),
(136, 'The People''s Insurance Company (PICC)', '601319.SS', 71737346044.00, 0.80, 'China'),
(137, 'Dai-ichi Life Holdings', '8750.T', 71383810719.00, 19.69, 'Japan'),
(138, 'Lockheed Martin', 'LMT', 71069000000.00, 444.06, 'United States'),
(139, 'China Life Insurance', '601628.SS', 71024094349.00, 4.73, 'China'),
(140, 'Vodafone', 'VOD', 70493076497.00, 7.66, 'United Kingdom'),
(141, 'BASF', 'BAS.DE', 70430092369.00, 40.07, 'Germany'),
(142, 'Toyota Tsusho', '8015.T', 69539781842.00, 13.83, 'Japan'),
(143, 'Koç Holding', 'KCHOL.IS', 68968959519.00, 4.24, 'Turkey'),
(144, 'Munich RE (Münchener Rück)', 'MUV2.DE', 68353328233.00, 419.57, 'Germany'),
(145, 'HCA Healthcare', 'HCA', 68347000000.00, 303.20, 'United States'),
(146, 'MetLife', 'MET', 68071000000.00, 62.44, 'United States'),
(147, 'Progressive', 'PGR', 67801000000.00, 190.68, 'United States'),
(148, 'Zurich Insurance Group', 'ZURN.SW', 67336000000.00, 462.25, 'Switzerland'),
(149, 'Korea Electric Power', 'KEP', 67092358385.00, 5.96, 'South Korea'),
(150, 'HSBC', 'HSBC', 66985000000.00, 34.40, 'United Kingdom'),
(151, 'Caterpillar', 'CAT', 66368000000.00, 297.31, 'United States'),
(152, 'Hitachi', '6501.T', 66282234216.00, 20.22, 'Japan'),
(153, 'Santander', 'SAN', 65880637822.00, 3.89, 'Spain'),
(154, 'LG Electronics', '066570.KS', 64577872230.00, 59.38, 'South Korea'),
(155, 'Accenture', 'ACN', 64475845000.00, 268.16, 'Ireland'),
(156, 'Aeon', '8267.T', 64458675478.00, 20.85, 'Japan'),
(157, 'ArcelorMittal', 'MT', 63699000000.00, 19.91, 'Luxembourg'),
(158, 'American Express', 'AXP', 63268000000.00, 203.94, 'United States'),
(159, 'Merck', 'MRK', 62479000000.00, 86.12, 'United States'),
(160, 'Prudential Financial', 'PRU', 62456000000.00, 91.61, 'United States'),
(161, 'Country Garden', '2007.HK', 62400643767.00, 0.05, 'China'),
(162, 'IBM', 'IBM', 62362000000.00, 168.09, 'United States'),
(163, 'Société Générale', 'GLE.PA', 62232161848.00, 18.75, 'France'),
(164, 'General Electric', 'GE', 61915000000.00, 140.25, 'United States'),
(165, 'Bouygues', 'EN.PA', 60912365770.00, 25.38, 'France'),
(166, 'Nippon Steel', '5401.T', 60511781598.00, 17.11, 'Japan'),
(167, 'CNOOC', '0883.HK', 60337157742.00, 1.90, 'China'),
(168, 'Allstate', 'ALL', 60302000000.00, 142.32, 'United States'),
(169, 'Delta Air Lines', 'DAL', 60117000000.00, 38.81, 'United States'),
(170, 'Anheuser-Busch Inbev', 'BUD', 59927000000.00, 50.37, 'Belgium'),
(171, 'Daimler Truck', 'DTG.F', 59805217527.00, 28.35, 'Germany'),
(172, 'Idemitsu Kosan', '5019.T', 59485386564.00, 5.50, 'Japan'),
(173, 'Performance Food Group', 'PFGC', 58281200000.00, 59.41, 'United States'),
(174, 'Unilever', 'UL', 58038974771.00, 49.68, 'United Kingdom'),
(175, 'Panasonic', '6752.T', 57971633469.00, 6.65, 'Japan'),
(176, 'SK Innovation', '096775.KS', 57444317897.00, 46.23, 'South Korea'),
(177, 'Vanke', '2202.HK', 57004489902.00, 0.73, 'China'),
(178, 'Lenovo', '0992.HK', 56863784000.00, 1.04, 'Hong Kong'),
(179, 'ConocoPhillips', 'COP', 56447000000.00, 79.27, 'United States'),
(180, 'TD Synnex', 'SNX', 56291082000.00, 90.41, 'United States'),
(181, 'Bunge', 'BG', 55821000000.00, 73.81, 'United States'),
(182, 'Pfizer', 'PFE', 55642000000.00, 22.12, 'United States'),
(183, 'United Airlines Holdings', 'UAL', 55635000000.00, 43.95, 'United States'),
(184, 'TJX Companies', 'TJX', 55623000000.00, 89.41, 'United States'),
(185, 'POSCO', 'PKX', 55227769629.00, 54.29, 'South Korea'),
(186, 'Intel', 'INTC', 55121000000.00, 18.03, 'United States'),
(187, 'AbbVie', 'ABBV', 55000000000.00, 148.26, 'United States'),
(188, 'Enterprise Products', 'EPD', 54863000000.00, 22.27, 'United States'),
(189, 'Deere & Company', 'DE', 54848000000.00, 316.20, 'United States'),
(190, 'Midea', '000333.SZ', 54821959350.00, 8.18, 'China'),
(191, 'Charter Communications', 'CHTR', 54659000000.00, 246.65, 'United States'),
(192, 'Rio Tinto', 'RIO', 54041000000.00, 54.30, 'United Kingdom'),
(193, 'Chubb', 'CB', 53833000000.00, 219.09, 'Switzerland'),
(194, 'BHP Group', 'BHP', 53817000000.00, 47.41, 'Australia'),
(195, 'Oracle', 'ORCL', 53815000000.00, 128.61, 'United States'),
(196, 'Bharat Petroleum', 'BPCL.NS', 53806964559.00, 3.36, 'India'),
(197, 'Cisco', 'CSCO', 53803000000.00, 40.24, 'United States'),
(198, 'American Airlines', 'AAL', 53448000000.00, 8.68, 'United States'),
(199, 'HP', 'HPQ', 53321000000.00, 27.14, 'United States'),
(200, 'Walmex', 'WMMVF', 53268864646.00, 2.29, 'Mexico'),
(201, 'Tyson Foods', 'TSN', 53092000000.00, 45.55, 'United States'),
(202, 'Compagnie de Saint-Gobain', 'SGO.PA', 53000221092.00, 68.99, 'France'),
(203, 'Tata Motors', 'TATAMOTORS.NS', 52916067823.00, 8.85, 'India'),
(204, 'CATL', '300750.SZ', 52768937950.00, 27.08, 'China'),
(205, 'Morgan Stanley', 'MS', 52688000000.00, 78.84, 'United States'),
(206, 'Volvo Group', 'VOLV-A.ST', 52392222205.00, 20.06, 'Sweden'),
(207, 'Hindustan Petroleum', 'HINDPETRO.NS', 52065129513.00, 4.00, 'India'),
(208, 'Nike', 'NKE', 51362000000.00, 67.97, 'United States'),
(209, 'Traton', '8TRA.DE', 51187897208.00, 24.87, 'Germany'),
(210, 'Sanofi', 'SNY', 51136758851.00, 43.95, 'France'),
(211, 'Bayer', 'BAYN.DE', 50873527669.00, 25.90, 'Germany'),
(212, 'China Unicom', '0762.HK', 50718682162.00, 0.65, 'Hong Kong'),
(213, 'Goldman Sachs', 'GS', 50079000000.00, 374.47, 'United States'),
(214, 'Renault', 'RNO.PA', 49762402789.00, 32.90, 'France'),
(215, 'Plains All American Pipeline', 'PAA', 49697000000.00, 13.20, 'United States'),
(216, 'Plains GP', 'PAGP', 49697000000.00, 14.10, 'United States'),
(217, 'Marubeni', '8002.T', 49463263396.00, 12.52, 'Japan'),
(218, 'Iberdrola', 'IBE.MC', 49361104546.00, 11.71, 'Spain'),
(219, 'AstraZeneca', 'AZN', 49133000000.00, 59.39, 'United Kingdom'),
(220, 'Maersk', 'MAERSK-B.CO', 48996000000.00, 1275.21, 'Denmark'),
(221, 'Novartis', 'NVS', 48860000000.00, 87.85, 'Switzerland'),
(222, 'Denso', '6902.T', 48758027955.00, 11.37, 'Japan'),
(223, 'Tokio Marine', '8766.T', 48307239619.00, 27.98, 'Japan'),
(224, 'China Pacific Insurance', '601601.SS', 47839978790.00, 4.20, 'China'),
(225, 'China Shenhua Energy', '601088.SS', 47616857288.00, 4.69, 'China'),
(226, 'Pinduoduo', 'PDD', 47565550959.00, 105.64, 'China'),
(227, 'Veolia', 'VIE.PA', 47223171043.00, 24.85, 'France'),
(228, 'Sumitomo', '8053.T', 47127331260.00, 17.08, 'Japan'),
(229, 'America Movil', 'AMX', 47082157467.00, 12.53, 'Mexico'),
(230, 'Broadcom', 'AVGO', 46815000000.00, 130.52, 'United States'),
(231, 'Bristol-Myers Squibb', 'BMY', 46509000000.00, 39.20, 'United States'),
(232, 'Coca-Cola', 'KO', 46465000000.00, 54.80, 'United States'),
(233, 'Legal &amp; General', 'LGEN.L', 46428403078.00, 2.27, 'United Kingdom'),
(234, 'World Kinect', 'WKC', 46164900000.00, 23.32, 'United States'),
(235, 'SoftBank', '9984.T', 46103468094.00, 45.07, 'Japan'),
(236, 'CM Bank', '3968.HK', 45889560009.00, 3.77, 'China'),
(237, 'L''Oréal', 'OR.PA', 45525646695.00, 340.62, 'France'),
(238, 'George Weston', 'WN.TO', 45060244958.00, 126.25, 'Canada'),
(239, 'UBS', 'UBS', 44948000000.00, 23.41, 'Switzerland'),
(240, 'General Dynamics', 'GD', 44946000000.00, 228.30, 'United States'),
(241, 'Orange', 'ORAN', 44812353255.00, 8.83, 'France'),
(242, 'Loblaw Companies', 'L.TO', 44609459001.00, 100.09, 'Canada'),
(243, 'ENKA', 'ENKAI.IS', 44221590246.00, 1.02, 'Turkey'),
(244, 'Telefónica', 'TEF', 44094171500.00, 3.73, 'Spain'),
(245, 'Cenovus Energy', 'CVE', 44085796679.00, 12.71, 'Canada'),
(246, 'The Travelers Companies', 'TRV', 44082000000.00, 177.80, 'United States'),
(247, 'MS&amp;AD Insurance', '8725.T', 44034118052.00, 17.81, 'Japan'),
(248, 'Swiss Re', 'SREN.SW', 43745000000.00, 105.85, 'Switzerland'),
(249, 'Continental', 'CON.DE', 43684679399.00, 48.99, 'Germany'),
(250, 'Magna International', 'MGA', 43070000000.00, 31.58, 'Canada'),
(251, 'Dow', 'DOW', 43031000000.00, 41.50, 'United States'),
(252, 'Woolworths Group', 'WOW.AX', 42846956116.00, 16.92, 'Australia'),
(253, 'Hyundai Mobis', '012330.KS', 42795424976.00, 123.83, 'South Korea'),
(254, 'Porsche', 'P911.DE', 42694060735.00, 60.30, 'Germany'),
(255, 'Wilmar International', 'F34.SI', 42640519000.00, 1.96, 'Singapore'),
(256, 'Power Financial', 'PWF-PS.TO', 42540908911.00, 11.72, 'Canada'),
(257, 'Best Buy', 'BBY', 42537000000.00, 78.02, 'United States'),
(258, 'Thermo Fisher Scientific', 'TMO', 42346000000.00, 465.68, 'United States'),
(259, 'Aviva', 'AV.L', 42126103125.00, 4.86, 'United Kingdom'),
(260, 'Fomento Económico Mexicano', 'FMX', 42101031844.00, 75.73, 'Mexico'),
(261, 'Vale', 'VALE', 42056000000.00, 9.09, 'Brazil'),
(262, 'American International Group', 'AIG', 42048000000.00, 55.47, 'United States'),
(263, 'Xiaomi', 'XIACF', 41780071275.00, 2.15, 'China'),
(264, 'Mitsubishi UFJ Financial', 'MUFG', 41268411808.00, 7.77, 'Japan'),
(265, 'Toronto Dominion Bank', 'TD', 41229576524.00, 48.22, 'Canada'),
(266, 'LyondellBasell', 'LYB', 41037000000.00, 73.58, 'United States'),
(267, 'Zijin Mining', '601899.SS', 40866899923.00, 1.95, 'China'),
(268, 'Royal Bank Of Canada', 'RY', 40809470302.00, 94.74, 'Canada'),
(269, 'Northrop Grumman', 'NOC', 40764000000.00, 401.75, 'United States'),
(270, 'Abbott Laboratories', 'ABT', 40725000000.00, 85.68, 'United States'),
(271, 'Suncor Energy', 'SU', 40540641182.00, 28.02, 'Canada'),
(272, 'Inditex', 'IDEXY', 40170081356.00, 22.63, 'Spain'),
(273, 'Uber', 'UBER', 40059000000.00, 57.45, 'United States'),
(274, 'Warner Bros. Discovery', 'WBD', 39934000000.00, 6.22, 'United States'),
(275, 'EnBW Energie', 'EBK.DE', 39728256571.00, 56.57, 'Germany'),
(276, 'Schneider Electric', 'SU.PA', 39688260004.00, 199.82, 'France'),
(277, 'Dollar General', 'DG', 39676978000.00, 65.04, 'United States'),
(278, 'Imperial Brands', 'IMB.L', 39609744912.00, 21.78, 'United Kingdom'),
(279, 'State Bank of India', 'SBIN.NS', 39589044690.00, 7.16, 'India'),
(280, 'GlaxoSmithKline', 'GSK', 39466901179.00, 31.15, 'United Kingdom'),
(281, 'Lufthansa', 'LHA.DE', 39273057161.00, 5.56, 'Germany'),
(282, 'KDDI', '9433.T', 39254825313.00, 24.57, 'Japan'),
(283, 'OMV', 'OMV.F', 39158354036.00, 31.80, 'Austria'),
(284, 'Meituan', '3690.HK', 39004178960.00, 16.81, 'China'),
(285, 'Eli Lilly', 'LLY', 38922800000.00, 665.95, 'United States'),
(286, 'LG Chem', '051910.KS', 38513057594.00, 202.97, 'South Korea'),
(287, 'China Taiping Insurance', '0966.HK', 38495218891.00, 1.22, 'Hong Kong'),
(288, 'Sainsbury''s', 'SBRY.L', 38112700603.00, 2.98, 'United Kingdom'),
(289, 'Compass Group', 'CPG.L', 37844839573.00, 24.14, 'United Kingdom'),
(290, 'Thyssenkrupp', 'TKA.F', 37793245106.00, 2.89, 'Germany'),
(291, 'Capital One', 'COF', 37780000000.00, 112.81, 'United States'),
(292, 'Banco Bilbao Vizcaya Argentaria', 'BBVA', 37759036877.00, 8.29, 'Spain'),
(293, 'Jardine Matheson', 'J36.SI', 37724000000.00, 29.76, 'Hong Kong'),
(294, 'Volvo Car', 'VOLCAR-B.ST', 37690663993.00, 2.05, 'Sweden'),
(295, 'Old Mutual', 'OMU.JO', 37434206171.00, 0.59, 'South Africa'),
(296, 'Molina Healthcare', 'MOH', 37407000000.00, 259.69, 'United States'),
(297, 'S.F. Express', '002352.SZ', 37397619226.00, 4.84, 'China'),
(298, 'QUALCOMM', 'QCOM', 37348000000.00, 129.91, 'United States'),
(299, 'Honeywell', 'HON', 37334000000.00, 157.84, 'United States'),
(300, 'Novo Nordisk', 'NVO', 37329866240.00, 89.74, 'Denmark'),
(301, 'D. R. Horton', 'DHI', 37302900000.00, 143.90, 'United States'),
(302, 'PBF Energy', 'PBF', 37253900000.00, 23.64, 'United States'),
(303, 'SABIC', '2010.SR', 37194786421.00, 15.22, 'Saudi Arabia'),
(304, 'Haier Smart Home', '600690.SS', 36963017944.00, 3.46, 'China'),
(305, 'Imperial Oil', 'IMO', 36943532837.00, 53.48, 'Canada'),
(306, 'US Foods', 'USFD', 36700000000.00, 46.01, 'United States'),
(307, 'Suzuki Motor', '7269.T', 36601845119.00, 8.52, 'Japan'),
(308, 'Pegatron', '4938.TW', 36591718562.00, 2.45, 'Taiwan'),
(309, 'Starbucks', 'SBUX', 36475800000.00, 73.99, 'United States'),
(310, 'Salesforce', 'CRM', 36465000000.00, 208.69, 'United States'),
(311, 'Philip Morris', 'PM', 36449000000.00, 92.30, 'United States'),
(312, 'Longfor Group', '0960.HK', 36330105845.00, 1.47, 'China'),
(313, 'Netflix', 'NFLX', 36304243000.00, 539.62, 'United States'),
(314, 'Mondelez', 'MDLZ', 35976000000.00, 56.32, 'United States'),
(315, 'Quanta Computer', '2382.TW', 35912890690.00, 6.28, 'Taiwan'),
(316, 'Siemens Energy', 'ENR.F', 35846668759.00, 27.57, 'Germany'),
(317, 'Mitsubishi Electric', '6503.T', 35814616948.00, 12.32, 'Japan'),
(318, 'Lennar', 'LEN', 35776308000.00, 141.53, 'United States'),
(319, 'Daiwa House', '1925.T', 35434826319.00, 24.10, 'Japan'),
(320, 'Grupo ACS', 'ACS.MC', 35307018103.00, 34.96, 'Spain'),
(321, 'JFE Holdings', '5411.T', 35298976264.00, 10.26, 'Japan'),
(322, 'Paccar', 'PCAR', 35289400000.00, 74.38, 'United States'),
(323, 'Schlumberger', 'SLB', 35146000000.00, 31.92, 'United States'),
(324, 'SAP', 'SAP', 35128949831.00, 174.95, 'Germany'),
(325, 'Bank of Communications', '601328.SS', 35021663837.00, 0.80, 'China'),
(326, 'Jerónimo Martins', 'JEM.F', 34956425632.00, 15.12, 'Portugal'),
(327, 'Visa', 'V', 34918000000.00, 209.83, 'United States'),
(328, 'Huaneng Power', '600011.SS', 34445392116.00, 0.83, 'China'),
(329, 'Cummins', 'CMI', 34173000000.00, 248.04, 'United States'),
(330, 'HDFC Bank', 'HDB', 34078962625.00, 48.14, 'India'),
(331, 'Lithia Motors', 'LAD', 33744900000.00, 240.53, 'United States'),
(332, 'Ecopetrol', 'EC', 33612137957.00, 6.85, 'Colombia'),
(333, 'CK Hutchison Holdings', '0001.HK', 33596390746.00, 4.37, 'Hong Kong'),
(334, 'Heineken', 'HEIA.AS', 33564006191.00, 67.53, 'Netherlands'),
(335, 'Aisin Seiki', '7259.T', 33515253213.00, 8.44, 'Japan'),
(336, 'SK Hynix', '000660.KS', 33365618686.00, 99.41, 'South Korea'),
(337, 'Metro AG', 'B4B.F', 33328251495.00, 4.15, 'Germany'),
(338, 'CBRE Group', 'CBRE', 33144021000.00, 93.54, 'United States'),
(339, 'Luxshare Precision', '002475.SZ', 33142901695.00, 4.67, 'China'),
(340, 'CRRC', '1766.HK', 33105862811.00, 0.50, 'China'),
(341, 'Air France-KLM', 'AF.PA', 33062324205.00, 7.67, 'France'),
(342, 'Sompo Holdings', '8630.T', 32964995637.00, 17.12, 'Japan'),
(343, 'Mazda', '7261.T', 32928759667.00, 5.72, 'Japan'),
(344, 'Linde', 'LIN', 32824000000.00, 363.63, 'United Kingdom'),
(345, 'Nucor', 'NUE', 32694520000.00, 114.59, 'United States'),
(346, 'Medtronic', 'MDT', 32577000000.00, 67.88, 'Ireland'),
(347, 'China Resources Pharmaceutical Group', '3320.HK', 32522492689.00, 0.59, 'Hong Kong'),
(348, 'Diageo', 'DEO', 32342252682.00, 107.28, 'United Kingdom'),
(349, 'Cement Roadstone Holding', 'CRH', 32323000000.00, 69.67, 'Ireland'),
(350, 'ABB', 'ABBN.SW', 32322000000.00, 44.12, 'Switzerland'),
(351, 'Enbridge', 'ENB', 32191027607.00, 30.88, 'Canada'),
(352, 'Subaru', '7270.T', 32111046497.00, 13.28, 'Japan'),
(353, 'BT Group', 'BT-A.L', 31993706844.00, 1.49, 'United Kingdom'),
(354, 'Postal Savings Bank of China', '601658.SS', 31970553531.00, 0.57, 'China'),
(355, 'Manulife Financial', 'MFC', 31882810897.00, 22.33, 'Canada'),
(356, 'Mitsubishi Heavy Industries', '7011.T', 31730298288.00, 11.33, 'Japan'),
(357, 'Hochtief', 'HOT.F', 31711306044.00, 93.47, 'Germany'),
(358, 'CJ Group', '001040.KS', 31597058310.00, 67.70, 'South Korea'),
(359, 'Barclays', 'BCS', 31552679792.00, 9.22, 'United Kingdom'),
(360, 'Deutsche Bank', 'DB', 31452238670.00, 13.08, 'Germany'),
(361, 'HF Sinclair', 'DINO', 31438583000.00, 34.05, 'United States'),
(362, 'Canadian Natural Resources', 'CNQ', 31420829430.00, 25.31, 'Canada'),
(363, 'Fannie Mae', 'FNMA', 31097000000.00, 0.93, 'United States'),
(364, 'PayPal', 'PYPL', 31028000000.00, 59.71, 'United States'),
(365, 'Dollar Tree', 'DLTR', 30966300000.00, 55.03, 'United States'),
(366, 'Amgen', 'AMGN', 30934000000.00, 243.52, 'United States'),
(367, 'Weichai Power', '2338.HK', 30683033377.00, 1.40, 'China'),
(368, 'Michelin', 'ML.PA', 30667739340.00, 30.84, 'France'),
(369, 'Anglo American', 'AAL.L', 30652000000.00, 24.31, 'United Kingdom'),
(370, 'Rajesh Exports', 'RAJESHEXPO.NS', 30648442825.00, 2.64, 'India'),
(371, 'International Consolidated Airlines', 'BABWF', 30630280914.00, 2.06, 'Spain'),
(372, '3M', 'MMM', 30583000000.00, 104.11, 'United States'),
(373, 'Sumitomo Mitsui Financial Group', 'SMFG', 30582300696.00, 9.59, 'Japan'),
(374, 'Air Liquide', 'AI.PA', 30519124475.00, 147.24, 'France'),
(375, 'Itaú Unibanco', 'ITUB', 30425037452.00, 5.12, 'Brazil'),
(376, 'GE Vernova', 'GEV', 30405000000.00, 192.97, 'United States'),
(377, 'Jabil', 'JBL', 30377000000.00, 92.41, 'United States'),
(378, 'United Natural Foods', 'UNFI', 30242000000.00, 12.74, 'United States'),
(379, 'Forvia SE', 'FRVIA.PA', 30121600707.00, 7.78, 'France'),
(380, 'Duke Energy', 'DUK', 30049000000.00, 87.64, 'United States'),
(381, 'Sumitomo Denki Kōgyō', '5802.T', 30032521202.00, 12.28, 'Japan'),
(382, 'China Resources Land', '1109.HK', 30022346127.00, 2.80, 'Hong Kong'),
(383, 'Daikin', '6367.T', 29963184686.00, 107.38, 'Japan'),
(384, 'Mitsubishi Chemical Holdings', '4188.T', 29923931177.00, 4.91, 'Japan'),
(385, 'Penske Automotive', 'PAG', 29864400000.00, 123.54, 'United States'),
(386, 'Banco do Brasil', 'BBAS3.SA', 29785897341.00, 3.73, 'Brazil'),
(387, 'NTT Data', '9613.T', 29778081969.00, 13.77, 'Japan'),
(388, 'Arrow Electronics', 'ARW', 29673304000.00, 102.00, 'United States'),
(389, 'Industrial Bank', '601166.SS', 29637329498.00, 2.07, 'China'),
(390, 'Ferguson', 'FERG', 29635000000.00, 150.59, 'United Kingdom'),
(391, 'BAE Systems', 'BA.L', 29401385348.00, 12.28, 'United Kingdom'),
(392, 'Takeda Pharmaceutical', 'TAK', 29307236309.00, 10.92, 'Japan'),
(393, 'Paramount Global', 'PARA', 29269000000.00, 8.13, 'United States'),
(394, 'Bridgestone', '5108.T', 29190728084.00, 29.42, 'Japan'),
(395, 'Wistron Corporation', '3231.TW', 29129218422.00, 2.40, 'Taiwan'),
(396, 'Intesa Sanpaolo', 'ISP.MI', 29096097231.00, 3.24, 'Italy'),
(397, 'Tata Consultancy Services', 'TCS.NS', 29034071971.00, 38.77, 'India'),
(398, 'Hewlett Packard Enterprise', 'HPE', 29020000000.00, 15.28, 'United States'),
(399, 'Korea Gas', '036460.KS', 29017835160.00, 26.53, 'South Korea'),
(400, 'Empresas Copec', 'COPEC.SN', 28976115000.00, 5.00, 'Chile');

select * from companies_ranked_by_revenue;
select * from companies_ranked_by_pe_ratio;
select * from companies_ranked_by_market_cap;
select * from companies_ranked_by_earnings;
select * from companies_ranked_by_dividend_yield;

-- Companies with both highest revenue and profit -----

SELECT r.namess, r.revenue_ttm, p.earnings_ttm
FROM companies_ranked_by_revenue r
JOIN companies_ranked_by_earnings p ON r.namess = p.namess
ORDER BY r.revenue_ttm DESC,  p.earnings_ttm DESC
LIMIT 10;

-- Profit-to-revenue ratio for top companies by revenue --

SELECT r.namess, r.revenue_ttm, p.earnings_ttm, 
       (p.earnings_ttm /r.revenue_ttm ) AS Profit_Margin
FROM companies_ranked_by_revenue r
JOIN companies_ranked_by_earnings p ON r.namess = p.namess
ORDER BY r.revenue_ttm DESC
LIMIT 10;

-- Companies where profit > 20% of revenue -----
SELECT r.namess, r.revenue_ttm, p.earnings_ttm
FROM companies_ranked_by_revenue r
JOIN companies_ranked_by_earnings p ON r.namess = p.namess
WHERE p.earnings_ttm / r.revenue_ttm > 0.2;

-- How many companies in top 5 by revenue are also in top 5 by profit --
WITH TopRevenue AS (
    SELECT namess FROM companies_ranked_by_revenue ORDER BY revenue_ttm DESC LIMIT 100
),
TopProfit AS (
    SELECT namess FROM companies_ranked_by_earnings ORDER BY earnings_ttm DESC LIMIT 100
)
SELECT COUNT(*) AS Common_Companies
FROM TopRevenue r
JOIN TopProfit p ON r.namess = p.namess;

-- Compare avg revenue for companies above/below $10B profit--
SELECT 
  CASE WHEN p.earnings_ttm >= 10 THEN 'Above 10B' ELSE 'Below 10B' END AS Profit_Category,
  AVG(r.revenue_ttm) AS Avg_Revenue
FROM companies_ranked_by_earnings p
JOIN companies_ranked_by_revenue r ON p.namess = r.namess
GROUP BY Profit_Category;

-- Highest market cap per revenue ratio----
SELECT m.namess, m.marketcap, r.revenue_ttm, 
       (m.marketcap / r.revenue_ttm) AS Cap_to_Revenue
FROM companies_ranked_by_market_cap m
JOIN companies_ranked_by_revenue r ON m.namess = r.namess
ORDER BY Cap_to_Revenue DESC
LIMIT 10;

-- Market cap > $200B, revenue < $50B-----
select m.namess, m.marketcap, r.revenue_ttm
from companies_ranked_by_market_cap m
join companies_ranked_by_revenue r on m.namess = r.namess
where marketcap > 200000000000 and revenue_ttm < 50000000000; 

-- Industry with highest avg cap/revenue ratio--------
SELECT m.namess, 
       AVG(m.marketcap / r.revenue_ttm) AS Avg_Cap_to_Rev
FROM companies_ranked_by_market_cap m
JOIN companies_ranked_by_revenue r ON m.namess = r.namess
GROUP BY m.namess
ORDER BY Avg_Cap_to_Rev DESC;


-- Top 50 companies by market cap  with lowest profit
WITH TopCap AS (
  SELECT namess FROM companies_ranked_by_market_cap ORDER BY marketcap DESC LIMIT 50
)
SELECT p.namess, p.earnings_ttm
FROM TopCap c
JOIN companies_ranked_by_earnings p ON c.namess = p.namess
ORDER BY p.earnings_ttm ASC;


-- Country with most companies in top 100 market cap---
SELECT country, COUNT(*) AS Count
FROM (
    SELECT namess, country FROM companies_ranked_by_market_cap ORDER BY marketcap DESC LIMIT 100
) t
GROUP BY country
ORDER BY Count DESC;

-- Among companies in the top 100 by dividend yield, which also generate more than $50B in revenue?--
WITH TopDividend AS (
  SELECT namess AS namess, dividend_yield_ttm
  FROM companies_ranked_by_dividend_yield
  ORDER BY dividend_yield_ttm DESC
  LIMIT 100
)
SELECT td.namess, r.revenue_ttm, td.dividend_yield_ttm
FROM TopDividend td
JOIN companies_ranked_by_revenue r ON td.namess = r.namess
WHERE r.revenue_ttm > 50000000000;

-- What is the average dividend yield for companies with revenue above $75B? ----
SELECT AVG(d.dividend_yield_ttm) AS avg_dividend_yield
FROM companies_ranked_by_revenue r
JOIN companies_ranked_by_dividend_yield d ON r.namess = d.namess
WHERE r.revenue_ttm > 75;

-- Identify companies in both the top 50 by revenue and top 50 by dividend yield----
WITH TopRevenue AS (
  SELECT namess AS namess
  FROM companies_ranked_by_revenue
  ORDER BY revenue_ttm DESC
  LIMIT 50
),
TopDividend AS (
  SELECT namess AS namess
  FROM companies_ranked_by_dividend_yield
  ORDER BY dividend_yield_ttm DESC
  LIMIT 50
)
SELECT tr.namess
FROM TopRevenue tr
JOIN TopDividend td ON tr.namess = td.namess;

-- Which companies pay high dividends (>5%) but generate less than $10B in revenue?---
SELECT d.namess AS namess, d.dividend_yield_ttm, r.revenue_ttm
FROM companies_ranked_by_dividend_yield d
JOIN companies_ranked_by_revenue r ON d.namess = r.namess
WHERE d.dividend_yield_ttm > 0.05 AND r.revenue_ttm < 10000000000;
