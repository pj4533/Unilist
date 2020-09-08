# unilist [![Donate](https://img.shields.io/badge/donate-bitcoin-blue.svg)](https://blockchair.com/bitcoin/address/1CDF8xDX33tdkEyUcHL22DBTDEmq4ukMPp) [![Donate](https://img.shields.io/badge/donate-ethereum-blue.svg)](https://blockchair.com/ethereum/address/0xde6458b369ebadba2b515ca0dd4a4d978ad2f93a)  <a href="https://www.buymeacoffee.com/pj4533" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy Me A Coffee" style="height: 41px !important;width: 174px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" ></a>

Given a Uniswap token list URL, returns pricing information

```
OVERVIEW: Uniswap Token List Info

USAGE: unilist <url>

ARGUMENTS:
  <url>                   Uniswap list url

OPTIONS:
  -h, --help              Show help information.
```

### Developer Commands

`swift build` Builds app to the `.build` folder

`swift build -c release` Build a release version

`swift package generate-xcodeproj` Generates an xcode project file

### Example Output

```
~/projects/unilist ] swift run unilist https://www.coingecko.com/tokens_list/uniswap/defi_100/v_0_0_0.json
PieDAO BTC++ (BTC++) $0.00
UMA Voting Token v1 (UMA) $14.82
STAKE (STAKE) $25.01
Tellor Tributes (TRB) $36.84
yearn.finance (YFI) $22,850.63
Wrapped NXM (wNXM) $39.54
Numeraire (NMR) $37.55
Reserve (RSV) $0.98
Bancor Network Token (BNT) $1.10
Wrapped BTC (WBTC) $10,487.26
Redeemable DAI (rDAI) $1.74
AirSwap Token (AST) $0.11
The Tokenized Bitcoin (imBTC) $70,710.11
Republic Token (REN) $0.29
Serum (SRM) $2.41
MCDEX Token (MCB) $3.49
ChainLink Token (LINK) $12.55
pTokens BTC (pBTC) $10,419.25
bZx Protocol Token (BZRX) $0.55
Synth sUSD (sUSD) $1.01
Synth sETH (sETH) $348.98
Dai Stablecoin (DAI) $1.03
EthLend Token (LEND) $0.57
Reserve Rights (RSR) $0.02
pNetwork Token (PNT) $0.57
Dai Stablecoin v1.0 (DAI) $0.00
Jarvis Reward Token (JRT) $0.11
Akropolis (AKRO) $0.03
Orion Protocol (ORN) $2.39
PieDAO USD++ Pool (USD++) $0.00
Hydro Protocol Token (HOT) $0.01
Maker (MKR) $523.04
DXdao (DXD) $258.56
Meta (MTA) $4.19
Synth iETH (iETH) $0.00
Monolith TKN (TKN) $0.54
IDEX Token (IDEX) $0.09
Balancer (BAL) $21.56
BandToken (BAND) $9.49
LoopringCoin V2 (LRC) $0.18
Compound (COMP) $180.45
Synthetix Network Token (SNX) $4.57
Auctus Token (AUC) $0.19
Curve.fi DAI/USDC/USDT/sUSD (crvPlain3andSUSD) $0.94
Ethfinex Nectar Token (NEC) $0.24
Ampleforth (AMPL) $0.68
Curve DAO Token (CRV) $2.06
Kyber Network Crystal (KNC) $1.23
Curve.fi yDAI/yUSDC/yUSDT/yTUSD (yDAI+yUSDC+yUSDT+yTUSD) $1.06
Synth sDEFI (sDEFI) $2,894.74
0x Protocol Token (ZRX) $0.46
renBTC (renBTC) $10,242.25
Melon Token (MLN) $42.95
DMM: Governance (DMG) $0.65


Index: $2,583.78
```