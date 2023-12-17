// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "../src/Balancer.sol";
import "../src/IWeightedPool.sol";
import "../src/IStablePool.sol";

contract weightPoolTest is Test {
    Balancer balancer;

    function setUp() public {
        // Deploy the Balancer contract or set it up as needed
        balancer = new Balancer(0xBA12222222228d8Ba445958a75a0704d566BF2C8);
    }
    function testWeightPool() public {

        address[405] memory addresses = [
        0x5c6Ee304399DBdB9C8Ef030aB642B10820DB8F56,
        0xcF7b51ce5755513d4bE016b0e28D6EDEffa1d52a,
        0x3ff3a210e57cFe679D9AD1e9bA6453A716C56a2e,
        0xCB0e14e96f2cEFA8550ad8e4aeA344F211E5061d,
        0xF4C0DD9B82DA36C07605df83c8a416F11724d88b,
        0xf16aEe6a71aF1A9Bc8F56975A4c2705ca7A782Bc,
        0x92762B42A06dCDDDc5B7362Cfb01E631c4D44B40,
        0x9232a548DD9E81BaC65500b5e0d918F8Ba93675C,
        0x9F9d900462492D4C21e9523ca95A7CD86142F298,
        0x6f0ed6f346007563D3266DE350d174a831bDE0ca,
        0x8Bd4A1E74A27182D23B98c10Fd21D4FbB0eD4BA0,
        0xCfCA23cA9CA720B6E98E3Eb9B6aa0fFC4a5C08B9,
        0xA6F548DF93de924d73be7D25dC02554c6bD66dB5,
        0x36Be1E97eA98AB43b4dEBf92742517266F5731a3,
        0x350196326AEAA9b98f1903fb5e8fc2686f85318C,
        0xa3C500969accb3D8DF08CBa313C120818fE0ed9D,
        0x5122E01D819E58BB2E22528c0D68D310f0AA6FD7,
        0xc29562b045D80fD77c69Bec09541F5c16fe20d9d,
        0xbc5F4f9332d8415AAf31180Ab4661c9141CC84E4,
        0x9CC64EE4CB672Bc04C54B00a37E1Ed75b2Cc19Dd,
        0x39eB558131E5eBeb9f76a6cbf6898f6E6DCe5e4E,
        0xFD1Cf6FD41F229Ca86ada0584c63C49C3d66BbC9,
        0xc88c76dD8b92408Fe9bEa1a54922A31E232d873c,
        0xBaeEC99c90E3420Ec6c1e7A769d2A856d2898e4D,
        0x82b8c7c6Fb62D09CfD004309c1F353FB1A926Edc,
        0x08775ccb6674d6bDCeB0797C364C2653ED84F384,
        0xe8cc7E765647625B95F59C15848379D10B9AB4af,
        0x6228f64D5BA8376652Bfe7E36569D595347cF6Fb,
        0xde8C195Aa41C11a0c4787372deFBbDdAa31306D2,
        0x8167A1117691f39e05e9131cfA88F0e3A620E967,
        0xB721a3B209F8b598b926826f69280bee7A6bb796,
        0x514f35a92A13bc7093f299AF5D8ebb1387E42D6B,
        0xb986Fd52697f16bE888bFAD2c5bF12cd67Ce834B,
        0x68e3266C9C8bbD44ad9Dca5AFBfe629022AeE9fE,
        0xefDC9246E0c4280fb1c138e1093a95Ab88959CF8,
        0xb460DAa847c45f1C4a41cb05BFB3b51c92e41B36,
        0x67f117350Eab45983374F4f83d275d8A5D62b1bf,
        0x93ab2aFDED588A9e7F3Ef569834b13685D612f96,
        0x072f14B85ADd63488DDaD88f855Fda4A99d6aC9B,
        0x42FBD9F666AaCC0026ca1B88C94259519e03dd67,
        0x1ee442b5326009Bb18F2F472d3e0061513d1A0fF,
        0x0b09deA16768f0799065C475bE02919503cB2a35,
        0xaac98EE71D4F8A156B6abaa6844Cdb7789d086CE,
        0xc4451498F950b8B3AbD9a815cF221a8e64791388,
        0x26Cc136e9b8FD65466F193a8e5710661Ed9A9827,
        0x96646936b91d6B9D7D0c47C496AfBF3D6ec7B6f8,
        0xDf2c03c12442c7A0895455A48569B889079cA52A,
        0x577A7f7EE659Aa14Dc16FD384B3F8078E23F1920,
        0x798b112420AD6391A4129Ac25eF59663a44C88bB,
        0x9137F3A026Fa419a7a9a0bA8DF6601D4B0aBfd26,
        0xE99481DC77691d8E2456E5f3F61C1810adFC1503,
        0x1bCCAaC02BAe336c6352Acc3b772059EF1142fa7,
        0xf8C4CD95c7496cB7c8d97202Cf7e5b8DA2204C2b,
        0x3E09E828c716c5e2BC5034EeD7d5eC8677ffba18,
        0x271d57cE059780462F89800141A089008Ca78D4a,
        0x034E2d995B39A88aB9a532A9BF0deDDac2c576eA,
        0x27C9f71cC31464B906E0006d4FcBC8900F48f15f,
        0xDbC4F138528B6B893cBCc3fd9c15D8B34D0554aE,
        0x54ca50EE86616379420Cc56718E12566aa75Abbe,
        0x5f1f4E50ba51D723F12385a8a9606afc3A0555f5,
        0x3F7C10701b14197E2695dEC6428a2Ca4Cf7FC3B8,
        0x7056C8DFa8182859eD0d4Fb0eF0886fdf3d2edCF,
        0x5d6e3d7632D6719e04cA162be652164Bec1EaA6b,
        0x3ebf48cd7586d7A4521cE59E53D9a907EBf1480F,
        0x1b6e13673f29688e27311B332aF1527f1ebF1D28,
        0xF506984C16737B1A9577cadeDa02a49fD612Aff8,
        0x186084fF790C65088BA694Df11758faE4943EE9E,
        0x158e0fBC2271E1dCEbadD365a22E2B4dD173C0DB,
        0x441b8a1980f2F2E43A9397099d15CC2Fe6D36250,
        0x18FDf15ff782e44C1f9B6C5846ff6B0F0004F6a2,
        0xa02E4b3d18D4E6B8d18Ac421fBc3dfFF8933c40a,
        0x87a867f5D240a782d43D90b6B06DEa470F3f8F22,
        0x87165B659Ba7746907a48763063efA3B323C2B07,
        0xEA39581977325C0833694D51656316Ef8A926a62,
        0xd4f79CA0Ac83192693bce4699d0c10C66Aa6Cf0F,
        0x759FABc513AccD292ADA967C4DD7Bb94Da39232e,
        0x470581ca95C071728e85a6E28a5b1754cD489bE2,
        0xfF083f57A556bfB3BBe46Ea1B4Fa154b2b1FBe88,
        0x382dC5b2eCa1C1308Eb7e2B40c0F571AFB899aC8,
        0x0578292CB20a443bA1CdE459c985CE14Ca2bDEe5,
        0xbB41e62BA1A743376119Fa83EC6dd575EA796613,
        0x0BF37157d30dFe6f56757DCadff01AEd83b08cD6,
        0x5b3b589B45531a2f0aE203d5044782bA46aEFC4c,
        0x5512A4bbe7B3051f92324bAcF25C02b9000c4a50,
        0x02CA8086498552C071451724D3A34cAA3922b65a,
        0x51735bdFBFE3fC13dEa8DC6502E2E95898942961,
        0x8f4205e1604133d1875a3E771AE7e4F2b0865639,
        0x8e9690E135005E415BD050B11768615DE43fe5f8,
        0x23a07596cF915CCcDFD5Ea8EC7e0268ba5488478,
        0x60B4601cDdDc4467f31b1F770cb93c51dC7dC728,
        0x9F2b223dA9F3911698C9b90Ecdf3ffEe37DD54a8,
        0xEFAa1604e82e1B3AF8430b90192c1B9e8197e377,
        0x61d5dc44849c9C87b0856a2a311536205C96c7FD,
        0x9145bcfF3fb05C873B35a78e466c9E7Ba1e90Ef8,
        0xa5533A44D06800Eaf2DaAD5aAd3f9AA9e1DC3614,
        0x314C1A82e147489c7A65F7051e742C9d6981438E,
        0x7D98f308Db99FDD04BbF4217a4be8809F38fAa64,
        0x988f2B03Aea264378518B7235d08c6cB2583AAA4,
        0xd689ABc77B82803F22c49dE5C8A0049Cc74D11fD,
        0xFB46Bc8FC0D06421D362A31B7230F39462efA79A,
        0x3e5FA9518eA95c3E533EB377C001702A9AaCAA32,
        0x29d7a7E0d781C957696697B94D4Bc18C651e358E,
        0x48607651416A943bF5AC71C41BE1420538e78f87,
        0xd590931466cdD6d488A25da1E89dD0539723800c,
        0xBF96189Eee9357a95C7719f4F5047F76bdE804E5,
        0x67b532d47A31CE1eD0800E6913dbf5F6e9C48a18,
        0x100A6a9524541E92dd068a9cd3E5DEF16388Fec0,
        0x472AFe4C35dC218A41736D4aceEaB650db43C584,
        0x9e030b67a8384cbba09D5927533Aa98010C87d91,
        0x494B26D4aEE801Cb1fabF498Ee24f0af20238743,
        0xB209468FC8C99360657D48238e1a7cf0B13362b6,
        0x8eB6c82C3081bBBd45DcAC5afA631aaC53478b7C,
        0x844Ba71D4902Ed3dE091112951b9c4B4D25A09DD,
        0xE4010EF5E37dc23154680f23c4A0d48BFca91687,
        0x8ED9e70BfA17A1E2C4F8e561c8d0c2d1acc092fA,
        0xe2469f47aB58cf9CF59F9822e3C5De4950a41C49,
        0x20FacEcaa68E9b7c92d2d0ec9136D864Df805233,
        0x9F2a5E84abf5AA0771f4027c726B5697d9D2010a,
        0xF3a605DA753e9dE545841de10EA8bFfBd1Da9C75,
        0x08cC92fEdc1cE2D8525176a63FcfF404450f2998,
        0x5f7FA48d765053F8dD85E052843e12D23e3D7BC5,
        0x0A8156fdc4B488CB1Bf1c44c7eE944088174Fa30,
        0x0fd5663D4893AE0D579D580584806AAdd2dD0B8b,
        0x5b1C06c4923DBBa4B27Cfa270FFB2E60Aa286159,
        0xc45D42f801105e861e86658648e3678aD7aa70f9,
        0xd4E2af4507B6B89333441C0c398edfFB40f86f4D,
        0x7C9cF12d783821d5C63d8E9427aF5C44bAd92445,
        0xae7bFd6fA54259fC477879712Eebe34164d3A84F,
        0x5Aa90c7362ea46b3cbFBD7F01EA5Ca69C98Fef1c,
        0x2D344A84BaC123660b021EEbE4eB6F12ba25fe86,
        0xeC60a5FeF79a92c741Cb74FdD6bfC340C0279B01,
        0x99A14324Cfd525A34BBc93ac7e348929909D57fD,
        0x702605F43471183158938C1a3e5f5A359d7b31ba,
        0x8fE054748Fc5c8eE50AB8860409a4E9e760E13f4,
        0xA7Ff759DBeF9F3EFDD1d59Beee44b966AcAfe214,
        0x76FCf0e8C7Ff37A47a799FA2cd4c13cDe0D981C9,
        0x8334215586e93EE85E3f1a281eAF66e52015754D,
        0x82e80Ce9D4890BAF288B70aC548Aa256599Bf044,
        0xE24281bc68C2a56e19B67b3787Fd5e95937bd970,
        0x7819f1532c49388106f7762328c51eE70EdD134c,
        0x3B9Fb87F7d081CEDdb1289258FA5660d955317b6,
        0xd8721E92BA0F8235B375E9ec9a7B697Ec4e2D6c6,
        0xe91888a1D08E37598867d213a4ACB5692071BB3a,
        0xd8833594420dB3D6589c1098dbDd073f52419Dba,
        0xD1eC5e215E8148D76F4460e4097FD3d5ae0A3558,
        0x7173b184525feAD2fFbde5FBe6FCB65Ea8246eE7,
        0xdE148e6cC3F6047EeD6E97238D341A2b8589e19E,
        0xC6A5032dC4bF638e15b4a66BC718ba7bA474FF73,
        0xBb31b8EEBB9C71001562AE56Aa5751Af313e6d89,
        0x47E1Cf97A0586367349A14306A65F54Ba0b8f1B6,
        0x0947592314Bf2BD0f86A74299bc8e534e3c7313f,
        0x771fBbfcBD8BA252f7f1ee47c1A486BDB0b5bC62,
        0xDb0cBcF1b8282dedc90e8c2CEFe11041d6d1e9f0,
        0xB53f8F2907d8E5fED503f8ebCe4433FB5c5BEae2,
        0x065F5B35D4077334379847fe26f58B1029e51161,
        0x9c08C7a7a89cfD671c79eacdc6F07c1996277eD5,
        0x8e6C196e201942246Cef85718C5D3a5622518053,
        0x77952E11E1ba727FfceA95a0f38Ed7DA586EeBc7,
        0xD278166DAbaf26707362f7CfDd204b277FD2a460,
        0xf8a0623ab66F985EfFc1C69D05F1af4BaDB01b00,
        0xa9Dd57145ca13a2F05199d85e3f2739Af6478427,
        0x148CE9b50bE946a96e94A4f5479b771bAB9B1c59,
        0x68454578f7017bA0C0c5bD1091975d7a7F3001c8,
        0x00612Eb4F312eB6ace7aCC8781196601078aE339,
        0xB70c25D96EF260eA07F650037Bf68F5d6583885e,
        0x6a5EaD5433a50472642Cd268E584dafa5a394490,
        0xf5aAf7Ee8C39B651CEBF5f1F50C10631E78e0ef9,
        0x517390b2B806cb62f20ad340DE6d98B2A8F17F2B,
        0xf33A6B68D2f6ae0353746C150757E4c494e02366,
        0x85370D9e3bb111391cc89F6DE344E80176046183,
        0x3f725ED5791b72554E9BEDf461eb76fC72dB8834,
        0x2dE32a7c98C3ef6ec79e703500e8CA5b2eC819aa,
        0x80bE0c303D8Ad2A280878b50a39B1ee8E54DBD22,
        0xb8E2cBb2455E80ad0eb536AE30a5290bDD7Baa91,
        0x2D6e3515C8b47192Ca3913770fa741d3C4Dac354,
        0x0297e37f1873D2DAb4487Aa67cD56B58E2F27875,
        0xe340EBfcAA544da8bB1Ee9005F1a346D50Ec422e,
        0x0C3A264adb2D95e077277867ACc03320224c6b09,
        0x8405DC5Ed3789fDBEc5A7f9366b977cB0B023F9f,
        0x77B692C5ca2CCEaeeF4dcC959D6C3bD919710B66,
        0x8fcB5BB072c221793FE975d377AA3634d7A47921,
        0x14462305D211C12A736986F4E8216E28c5EA7Ab4,
        0x4aA462D59361fC0115B3aB7E447627534a8642ae,
        0x16faF9f73748013155B7bC116a3008b57332D1e6,
        0x8DD7b0C76Ae83bCcE1B5510cCEb7DceC8b40087c,
        0x959216BB492B2efa72b15B7AAcEa5B5C984c3ccA,
        0x4626d81b3a1711bEb79f4CEcFf2413886d461677,
        0xB704aA724E69601Ffdc9B748137491BFfa1B858D,
        0xF5f6fb82649DF7991054Ef796C39da81B93364Df,
        0x4dA83bbE43235d600b914Ec3dbdE8B2EAA801869,
        0x6803C821Dac9b61026b3F4aF0FcF46229361D551,
        0x9E7fD25Ad9D97F1e6716fa5bB04749A4621e892d,
        0x639883476960a23b38579acfd7D71561A0f408Cf,
        0xEA8886a24b6e01Fba88A9e98d794e8D1F29eD863,
        0x6987633f18Ca0B4a10831331FcC57211941B6bA0,
        0x6f4906c181e6aCb096908238c5ffD088cca6Ba9f,
        0x7EB878107Af0440F9E776f999CE053D277c8Aca8,
        0x5D563Ca1E2daaAe3402c36097b934630AB53702c,
        0x1b65fe4881800B91d4277ba738b567CbB200A60d,
        0x25Accb7943Fd73Dda5E23bA6329085a3C24bfb6a,
        0x344e8f99a55DA2ba6B4b5158df2143374E400DF2,
        0x01abc00E86C7e258823b9a055Fd62cA6CF61a163,
        0x35c264f24F3A2fB0B9025905D3bBf10874B055AA,
        0x231E687C9961d3A27e6E266Ac5C433Ce4F8253E4,
        0xDac7eF49161bdBf0e8f0B4c8e2D38DF19D972874,
        0x38A01c45D86b61A70044fB2A76eAC8e75B1ac78E,
        0xE54B3F5c444a801e61BECDCa93e74CdC1C4C1F90,
        0x56b2811BF75bB258d2234af4f43b479bb55c3B46,
        0x380aAbE019ed2a9C2d632b51eDDD30fd804d0fAD,
        0x8AE511Baa25D6c7d21F45ebE60Ff29912D28A8E6,
        0x7320d680Ca9BCE8048a286f00A79A2c9f8DCD7b3,
        0xA0B7BE8336EaA4bA1c7bbc23A694dE3C0ff83a10,
        0x95f1A3cA4aF4d08B9C42D65Ef07b66E8222ED85a,
        0x6AE82385f76e3742f89cB46343B169f6ee49dE1b,
        0x6E5ba97e42e4Bd036a9b785DB964DC8AAD1c699d,
        0x064BcC35BFE023Fe717A87574faE9333f98AAE4D,
        0x5E6989c0E2B6600aB585D56Bf05479d5450a60C8,
        0x0901EDCA10664C4c27374D18cFab2Df2aCf828fb,
        0x9F1F16B025F703eE985B58cEd48dAf93daD2f7EF,
        0x496ff26B76b8d23bbc6cF1Df1eeE4a48795490F7,
        0xB6b9B165C4AC3f5233A0CF413126C72Be28B468A,
        0xF767F0a3FCf1EAfEc2180b7dE79D0c559D7E7e37,
        0xb204BF10bc3a5435017D3db247f56dA601dFe08A,
        0x90291319F1D4eA3ad4dB0Dd8fe9E12BAF749E845,
        0xe4aF3c338260AAbf119B5023d497437974769413,
        0xfa1575c57D887E93f37A3C267a548Ede008458B3,
        0x3cc9DEc81110aBC5a221825573D32251eB6cCEa2,
        0x96bA9025311e2f47B840A1f68ED57A3DF1EA8747,
        0xdB3e5Cf969c05625Db344deA9C8b12515e235Df3,
        0x09804CaEA2400035b18E2173fdD10EC8b670cA09,
        0x813E6A5f31C95F7c5f9982B1FDc6C69610bEab4A,
        0xD9Fb1aE180Fbf88F28f14a04842bD17BCEb69fEf,
        0x4729F67394030472e853cb61954fe784BFB36c3B,
        0x6b0D50a9df06006170e2d11D468cbFe0f58B43e2,
        0xa33E376932b2c01323F0A7f9bBe0a53F7662B2E9,
        0xB2634e2BFab9664F603626afc3D270BE63c09adE,
        0x4227b3D63003EB53bBAE6f9139EC0fcbBb5C0b23,
        0xe805c864992e6a6cBf46E7E81C7154B78155D0ac,
        0x769432a08426d25F8F99a1AF16Db23CE41CaD784,
        0xB0401Ab1108BD26C85A07243dFDF09F4821D76a2,
        0x4445899c226bCb451aC8E2c42070510859557fb6,
        0x6dF50E37A6aEfB9024a7284EF1C9e1E8e7c4F7b8,
        0xd5A44704beFD1CfCCa67F7bc498a7654cC092959,
        0xA3283E3470D3CD1F18C074E3f2d3965F6D62fFF2,
        0x10f8EA49255e8a865ca4edA1630168C85cC8ee81,
        0x319438FDD5D27922aCeD2a1b15CD7F0bc3B03068,
        0x15C1cDAcd3dA1E1C1304200b1bEb080D50BbBc0F,
        0x445494F823f3483ee62d854eBc9f58d5B9972A25,
        0xED5D8FA2f341b1F6f264DB560D9B8215e8beFFaA,
        0x1eE71e1Ed744AE6D4058F5c7797C2e583DbfB095,
        0xa5629408958264c2bCe5217A0466924644e311eD,
        0x0DA692Ac0611397027c91E559cFD482C4197e403,
        0x8c5f3C967EeF7da094582D831fb1C80F92eCf5DD,
        0xee3959FD00a0B996d801fc34B7CE566bD037f5f5,
        0x43BDd55D9C98Ae9184dc3a869Ab89a83762156D5,
        0xCE8D4Ad8Cce1240EcBc49385BAF4c399A7F353F9,
        0xa718042E5622099E5F0aCe4E7122058ab39e1bbe,
        0x6CD0C0E378Fe120cf733ac1431bD1d308c5B6DF0,
        0x605dFF05302a63aC974B083DA50549A7Cde01C1B,
        0xac0af4e07f8F4a13b1a73d7D381609C426932718,
        0x3e500d50845d4F1c362112Dc246179437511d840,
        0x4fD4687ec38220F805b6363C3c1E52D0dF3B5023,
        0x70b7D3b3209A59fb0400e17F67F3eE8c37363f49,
        0x89EA4363Bd541d27d9811E4Df1209dAa73154472,
        0x3de27EFa2F1AA663Ae5D458857e731c129069F29,
        0x58B645FA247B60f2cB896991Fd8956146c9FCB4A,
        0xd6855F0A3C26A1b1B2785Ba2604758c0878169bC,
        0x503717B3Dc137e230AFC7c772520D7974474fB70,
        0x173063A30E095313eEe39411f07E95A8a806014e,
        0x85177c679B84CB54e875A8F5112747b9438ed39e,
        0x647c1FD457b95b75D0972fF08FE01d7D7bda05dF,
        0xaBf3Eb5Ce7FEE55b25E2ca65962184979166b228,
        0x17dDd9646a69C9445CD8A9f921d4cD93BF50D108,
        0x4ce0BD7deBf13434d3ae127430e9BD4291bfB61f,
        0x0FaDd10F606554FeC1574F28398469D98d68D297,
        0xa0cF2478a7a9FaDd53ce24665399Aa80C7eb5075,
        0x6E13fB316613e6B73dbF83a74f4aa08154abd533,
        0xdedB0a5aBC452164Fd241dA019741026f6EFdC74,
        0xF2CBD0AA97419BC4dbbaeFC06607e05C003c2476,
        0xa660ba113F9AABaeB4Bcd28A4a1705f4997d5432,
        0xadF6ae8A9256dEB22796E65D42Dc27394F812873,
        0xe3132B8923aE75c66C9C07032FC56Fd4Bb1e4eCB,
        0x03cD191F589d12b0582a99808cf19851E468E6B5,
        0xdd378A2a1DD89A90Ee1dE05afF195a4F2E476C49,
        0x6Aa6d7542310cDC75D1179B8729E1E6ec8d42BF1,
        0x26c2B83FC8535DeEaD276f5Cc3ad9c1a2192E027,
        0xB2B918f2d628b4c8ff237b0A1c6aC3Bea222FEDc,
        0xa5aE45BFee323684ee4BA045C44B0aA85e2C6e9D,
        0x7758237B1ee34b7e702c5315f562b859481e344b,
        0x334C96d792e4b26B841d28f53235281cec1be1F2,
        0x8a92c3afAbaB59101B4e2426C82a7ddBb66B5450,
        0x08209eD93725328828CB199afBE0E068C8E5E215,
        0xbcAe92a7ef7Ff3FEEC11eB3354990640F6e5842F,
        0x415747EE98D482e6dD9B431fa76Ad5553744F247,
        0x40fb0516aC8fF93B48Bcf9Da7717E523e78c34f7,
        0x5844D529E20bA8040670E2F19A3F139E88791ffe,
        0x664c6a02DCdbaaDa80838C20C1e7f21e5b3eA90E,
        0xC2A8Ae832B4328EE1b592C7019A2e6A215d1339D,
        0x2354228e3C6F6906884B4A113974d23099dF90A9,
        0xAC0f0065e06cfDe8E8a64681cBA72719D8e2Aa7d,
        0x85Be1e46283f5f438D1f864c2d925506571d544f,
        0x78EdDf7618BA6a55bd118974755cB653702a9a2d,
        0xB5E3de837F869B0248825e0175DA73d4E8c3db6B,
        0x05Bb9b340D21Fc5A0D730EcD1CA79584Fe88E5b8,
        0xb9BD68A77cCF8314c0Dfe51bC291C77590C4e9e6,
        0xBD3a698826d27563d08d459Faff2d5F6960e21Cf,
        0xad302e620FEDb60078B33514757335545ba05c6D,
        0x3bB9d50A0743103F896D823B332EE15E231848D1,
        0x6602315d19278278578830933aeaaC0d684c9C3f,
        0x3a271A9838B36Ea8c42eAf230f969c6b40E4Ac04,
        0xCF354603A9AEbD2Ff9f33E1B04246d8Ea204ae95,
        0x0d70F2fC0096b9E3d39ad8A9c011126FbDb69779,
        0x4dd7517dE8065A688dd0e398ed031B6e469f9F0F,
        0x5FAce3411e8dB2E35D2720633579C30915F0e998,
        0x1aaBd649a2292da5cBb994656Cf1938aBaF1f657,
        0x45910fafF3cBf990FdB204682e93055506682d17,
        0x8339E311265A025Fd5792DB800daA8edA4264e2C,
        0x05b1a35FdBC43849aA836B00c8861696edce8cC4,
        0xdB02F620a59F1B16146EDD0e8dBEb27D94e9C25c,
        0xA1Df257176A81E3e9FE2E99F8A06806079A25D01,
        0x344818B9b4cFec947FE8cCbEa65B3605585c2C71,
        0x760AfD4460089EDbb77F71149f6Fe1d7554C5450,
        0xC3141fC45791CcA3F21F2A926Fd8598c39a4C6d2,
        0x1874C311eb0833f31bF2cBC8C7b8Cc21Fa37bE1E,
        0x603588f77dC1d72468C5267CD3a6cD3261384850,
        0xcD84dcAEeEB4FD1bc46A4945ea122A2643Fa8d39,
        0x90ed574867B420A56c658460474F525156a6e5cf,
        0x55fFeB33a19952530997572fBb6D039310b2E799,
        0x240273a118a67BB878CA5Fc3C3d645D60622F6f4,
        0x87D2433cc05a915c11229EFBDc1e94FfCc311Db0,
        0xa1a6a7DC48919A182cF2541fcF7e2ecd952E9775,
        0xa3b42269Ef2b63403b347ee85C1cFb0988cdE9AC,
        0x3f7a7fd7F214bE45EC26820Fd01aC3bE4fC75aa7,
        0x4FA6086ED10C971D255aa1B09a6beB1C7bE5ca37,
        0xAEcdBcB6889c329480aaB3a7D6fCeEA05D33Ac35,
        0xDd8B9A9d6fE0482e7688cfF3C9f990e1D4d0b338,
        0x66958112c5da50Fa59d7E5BA4447609cDb09c1B1,
        0xf1f6004398e29437801257eCC2B0a852717430b7,
        0x2BCe2b4275b0767c7B253a7FF984A41c2a2d24Ea,
        0x5C406E75bAF8C66ea7b7C266ba2f4d474F33EC10,
        0x7ed8639B84a0F55F87204f45a06ECCF566815Eaf,
        0x5e6632Fe1b7c6A8c1001eFa690cDC8D01cC56F79,
        0x38ca7131CFd8e3D734129416e2e4559c21EB6Aca,
        0x0868f7A5045847845D0A0B2a2220102adDf642d8,
        0x037c08AC83C40B517B56F6658a39f637cb50C24c,
        0x4114Fd8554e63A9e0f09cA2480977883fEa06430,
        0xC5DAf328AB785C20c9100F6d347dd712f1a1C36e,
        0xd18f5CB9F4e6b9A25814590d10372C74eFd12d7f,
        0x14Bf727F67Aa294ec36347BD95aBA1a2c136FE7a,
        0x7237c3d8186fE5e301c6537956B2CA08e7aBa43f,
        0x331bC9c616e4Ca9032bfccE9056cF9988045Acc6,
        0xe2E01a8b901dE83156e51bc6f87309E64C9bD39A,
        0xCFEe7b4299a19D7a63dcd9d2C784Ab99bF69b04D,
        0x5A6aE1fd70d04bA4a279FC219dfAbC53825cb01D,
        0x6A4D422afe275Bb381B7C0A03a591c0be40C583A,
        0x065a935bc0fe6d02ebDf42A8CBdC3Ceb898C2826,
        0x4f2E0f963794a3876a54C503eC63dE95e9F24a75,
        0x02653cAe0caD6b3cd73E7DBc4f7A3cE6693C3ed7,
        0x6fBAEBFD2617c99B47A66415081BAA21e944fb7f,
        0xdfeBFF31dFD8d162372E9aFb6a6f668172D3Bc00,
        0x8b66c529148690891a187379DBDb2873a4E0C449,
        0x7ebD7B086b32E98C9Ee4840a6f43A2a9b6Cc3B06,
        0x0a9E96988E21c9A03B8DC011826A00259e02C46e,
        0x614b5038611729ed49e0dED154d8A5d3AF9D1D9E,
        0x11839D635e2F0270DA37e8ef4324D4d5d5432957,
        0xf751aC6835977294bB2c093124C372e57b8Edd29,
        0x5210287a2a440c06d7F3fcC4CC7B119BA8DE4339,
        0x15432bA000e58E3c0aE52A5dEc0579215EBC75D0,
        0x4228290eE9cab692938Ff0b4ba303FBCDB68e9F2,
        0x3FEBe770201CF4d351D33708170B9202BA1C6Af7,
        0xf7795Ee348c197EAbfb5283d9f5A2231548e75CE,
        0x2e52c64FD319E380cDbCFC4577eA1Fda558a32e4,
        0xc4Fd39b52100C96a5F7dcD3c6522485897329889,
        0xF656A566C9d3B2Cb046481351A1179017530C6C9,
        0x7152a37BBF363262bAD269EC4dE2269dD0E84Ca3,
        0xF94A7Df264A2ec8bCEef2cFE54d7cA3f6C6DFC7a,
        0xe8075304A388f2f9B2af61f502741a88Ff21D9A4,
        0xe2cD73cfeB471f9F2b08A18afbc87Ff2324eF24E,
        0xe074fBcC87e18615D6b099Ee603BD37dE562416b,
        0xDe620bb8BE43ee54d7aa73f8E99A7409Fe511084,
        0xD5D7bc115B32ad1449C6D0083E43C87be95F2809,
        0xd16847480D6bc218048CD31Ad98b63CC34e5c2bF,
        0xBF8418344C046FCf87FeF3c15a8526Ada6A0a116,
        0x9cE746Ded4D6031e4f2Da842936C57d0e50f8D0E,
        0x9c00362427f263ebc02A6F5229132f39335Fe963,
        0x9a8B37BDF329713360c5201f05Cb76b8338d56f1,
        0x8E9d636BbE6939BD0F52849afc02C0c66F6A3603,
        0x80A8eA2f9EBFC2Db9a093BD46E01471267914E49,
        0x802d0f2f4b5f1fb5BfC9b2040a703c1464e1D4CB,
        0x71A5259b0929f9EA607b599511b6Cc4ae3d9C774,
        0x6FE95FafE2F86158c77Bf18350672D360BfC78a2,
        0x69671C808c8F1C1490A4C9e0145884dFb5631378,
        0x67F8FCb9D3c463da05DE1392EfDbB2A87F8599Ea,
        0x6055689F452d2f9D86945F3597e1D47EE819254D,
        0x5fA3ce1fB47bC8A29B5C02e2e7167799BBAf5F41,
        0x4aBB6FD289fA70056CFcB58ceBab8689921eB922,
        0x4212bE3C7b255bA4B29705573ABD023cdcE21542,
        0x36128D5436d2d70cab39C9AF9CcE146C38554ff0,
        0x3035917bE42aF437CBdD774Be26B9EC90a2BD677,
        0x1D310a6238e11c8BE91D83193C88A99eB66279bE,
        0x150D969723Bc8924dC667ba3254bacd967FAd266,
        0x10f21C9bD8128a29Aa785Ab2dE0d044DCdd79436,
        0x0CDAB06B07197D96369Fea6F3bEA6eFC7Ecdf709,
        0x0A2a6C2996007da3Fc8b30cA26179E1292c2Ef0a,
        0x062F38735AAC32320DB5e2DBBEb07968351D7C72
        ];

        for (uint i = 0; i < addresses.length; i++) {
            IWeightedPool pool = IWeightedPool(addresses[i]);

            try pool.getInvariant() returns (uint256 weights_) {
            } catch {
                console.logBytes32(pool.getPoolId());
            }
        }
    }
}