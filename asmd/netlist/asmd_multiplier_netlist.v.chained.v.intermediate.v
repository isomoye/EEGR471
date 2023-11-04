
(* dynports = 1 *)

(* top = 1 *)

(* src = "asmd_multiplier.v:1" *)


module __UNIT__UNDER__FINANGLING__
(
  product,
  ready,
  word0,
  word1,
  start,
  clk,
  reset,
  sin,
  shift,
  sout,
  tck,
  test
);

  input sin;
  output sout;
  input shift;
  input tck;
  input test;
  wire __clk_source__;
  (* src = "asmd_multiplier.v:13|datapath_unit.v:17" *)
  wire _000_;
  (* src = "asmd_multiplier.v:13|datapath_unit.v:17" *)
  wire _001_;
  (* src = "asmd_multiplier.v:13|datapath_unit.v:17" *)
  wire _002_;
  (* src = "asmd_multiplier.v:13|datapath_unit.v:17" *)
  wire _003_;
  (* src = "asmd_multiplier.v:13|datapath_unit.v:17" *)
  wire _004_;
  (* src = "asmd_multiplier.v:13|datapath_unit.v:17" *)
  wire _005_;
  (* src = "asmd_multiplier.v:13|datapath_unit.v:17" *)
  wire _006_;
  (* src = "asmd_multiplier.v:13|datapath_unit.v:17" *)
  wire _007_;
  (* src = "asmd_multiplier.v:13|datapath_unit.v:17" *)
  wire _008_;
  (* src = "asmd_multiplier.v:13|datapath_unit.v:17" *)
  wire _009_;
  (* src = "asmd_multiplier.v:13|datapath_unit.v:17" *)
  wire _010_;
  (* src = "asmd_multiplier.v:13|datapath_unit.v:17" *)
  wire _011_;
  (* src = "asmd_multiplier.v:13|datapath_unit.v:17" *)
  wire _012_;
  (* src = "asmd_multiplier.v:13|datapath_unit.v:17" *)
  wire _013_;
  (* src = "asmd_multiplier.v:13|datapath_unit.v:17" *)
  wire _014_;
  (* src = "asmd_multiplier.v:13|datapath_unit.v:17" *)
  wire _015_;
  (* src = "asmd_multiplier.v:13|datapath_unit.v:17" *)
  wire _016_;
  (* src = "asmd_multiplier.v:13|datapath_unit.v:17" *)
  wire _017_;
  (* src = "asmd_multiplier.v:13|datapath_unit.v:17" *)
  wire _018_;
  (* src = "asmd_multiplier.v:13|datapath_unit.v:17" *)
  wire _019_;
  wire _020_;
  wire _021_;
  wire _022_;
  wire _023_;
  wire _024_;
  wire _025_;
  wire _026_;
  wire _027_;
  wire _028_;
  wire _029_;
  wire _030_;
  wire _031_;
  wire _032_;
  wire _033_;
  wire _034_;
  wire _035_;
  wire _036_;
  wire _037_;
  wire _038_;
  wire _039_;
  wire _040_;
  wire _041_;
  wire _042_;
  wire _043_;
  wire _044_;
  wire _045_;
  wire _046_;
  wire _047_;
  wire _048_;
  wire _049_;
  wire _050_;
  wire _051_;
  wire _052_;
  wire _053_;
  wire _054_;
  wire _055_;
  wire _056_;
  wire _057_;
  wire _058_;
  wire _059_;
  wire _060_;
  wire _061_;
  wire _062_;
  wire _063_;
  wire _064_;
  wire _065_;
  wire _066_;
  wire _067_;
  wire _068_;
  wire _069_;
  wire _070_;
  wire _071_;
  wire _072_;
  wire _073_;
  wire _074_;
  wire _075_;
  wire _076_;
  wire _077_;
  wire _078_;
  wire _079_;
  wire _080_;
  wire _081_;
  wire _082_;
  wire _083_;
  wire _084_;
  wire _085_;
  wire _086_;
  wire _087_;
  wire _088_;
  wire _089_;
  wire _090_;
  wire _091_;
  wire _092_;
  wire _093_;
  wire _094_;
  wire _095_;
  wire _096_;
  wire _097_;
  wire _098_;
  wire _099_;
  wire _100_;
  wire _101_;
  wire _102_;
  wire _103_;
  wire _104_;
  wire _105_;
  wire _106_;
  wire _107_;
  wire _108_;
  wire _109_;
  wire _110_;
  wire _111_;
  wire _112_;
  wire _113_;
  wire _114_;
  wire _115_;
  wire _116_;
  wire _117_;
  wire _118_;
  wire _119_;
  wire _120_;
  wire _121_;
  wire _122_;
  wire _123_;
  wire _124_;
  wire _125_;
  wire _126_;
  wire _127_;
  wire _128_;
  wire _129_;
  wire _130_;
  wire _131_;
  wire _132_;
  wire _133_;
  wire _134_;
  wire _135_;
  wire _136_;
  wire _137_;
  wire _138_;
  wire _139_;
  wire _140_;
  wire _141_;
  wire _142_;
  wire _143_;
  wire _144_;
  wire _145_;
  wire _146_;
  wire _147_;
  wire _148_;
  wire _149_;
  wire _150_;
  wire _151_;
  wire _152_;
  wire _153_;
  wire _154_;
  wire _155_;
  wire _156_;
  wire _157_;
  wire _158_;
  wire _159_;
  wire _160_;
  wire _161_;
  wire _162_;
  wire _163_;
  wire _164_;
  wire _165_;
  wire _166_;
  wire _167_;
  wire _168_;
  wire _169_;
  wire _170_;
  wire _171_;
  wire _172_;
  wire _173_;
  wire _174_;
  wire _175_;
  wire _176_;
  wire _177_;
  wire _178_;
  wire _179_;
  wire _180_;
  wire _181_;
  wire _182_;
  wire _183_;
  wire _184_;
  wire _185_;
  wire _186_;
  wire _187_;
  wire _188_;
  wire _189_;
  wire _190_;
  wire _191_;
  wire _192_;
  wire _193_;
  wire _194_;
  wire _195_;
  wire _196_;
  wire _197_;
  wire _198_;
  (* src = "asmd_multiplier.v:5" *)
  input clk;
  (* src = "asmd_multiplier.v:9|control_unit.v:3" *)
  wire \control_module0.clk ;
  (* src = "asmd_multiplier.v:9|control_unit.v:2" *)
  wire \control_module0.m0 ;
  (* src = "asmd_multiplier.v:9|control_unit.v:4" *)
  wire \control_module0.next_state ;
  (* src = "asmd_multiplier.v:9|control_unit.v:1" *)
  wire \control_module0.ready ;
  (* src = "asmd_multiplier.v:9|control_unit.v:3" *)
  wire \control_module0.reset ;
  (* src = "asmd_multiplier.v:9|control_unit.v:2" *)
  wire \control_module0.start ;
  (* src = "asmd_multiplier.v:9|control_unit.v:4" *)
  wire \control_module0.state ;
  (* src = "asmd_multiplier.v:13|datapath_unit.v:7" *)
  wire \datapath_module0.clk ;
  (* src = "asmd_multiplier.v:13|datapath_unit.v:4" *)
  wire \datapath_module0.m0 ;
  (* src = "asmd_multiplier.v:13|datapath_unit.v:10" *)
  wire [7:0] \datapath_module0.multiplicand ;
  (* src = "asmd_multiplier.v:13|datapath_unit.v:11" *)
  wire [3:0] \datapath_module0.multiplier ;
  (* src = "asmd_multiplier.v:13|datapath_unit.v:3" *)
  wire [7:0] \datapath_module0.product ;
  (* src = "asmd_multiplier.v:13|datapath_unit.v:7" *)
  wire \datapath_module0.reset ;
  (* src = "asmd_multiplier.v:13|datapath_unit.v:6" *)
  wire [3:0] \datapath_module0.word0 ;
  (* src = "asmd_multiplier.v:13|datapath_unit.v:6" *)
  wire [3:0] \datapath_module0.word1 ;
  (* src = "asmd_multiplier.v:8" *)
  wire m0;
  (* src = "asmd_multiplier.v:2" *)
  output [7:0] product;
  (* src = "asmd_multiplier.v:3" *)
  output ready;
  (* src = "asmd_multiplier.v:5" *)
  input reset;
  (* src = "asmd_multiplier.v:5" *)
  input start;
  (* src = "asmd_multiplier.v:4" *)
  input [3:0] word0;
  (* src = "asmd_multiplier.v:4" *)
  input [3:0] word1;

  NOT
  _199_
  (
    .A(\datapath_module0.multiplier [3]),
    .Y(_155_)
  );


  NOT
  _200_
  (
    .A(\datapath_module0.multiplier [2]),
    .Y(_156_)
  );


  NOT
  _201_
  (
    .A(start),
    .Y(_157_)
  );


  NOT
  _202_
  (
    .A(\control_module0.state ),
    .Y(_158_)
  );


  NOT
  _203_
  (
    .A(\datapath_module0.product [0]),
    .Y(_159_)
  );


  NOT
  _204_
  (
    .A(\control_module0.m0 ),
    .Y(_160_)
  );


  NOT
  _205_
  (
    .A(\datapath_module0.multiplicand [0]),
    .Y(_161_)
  );


  NOT
  _206_
  (
    .A(\datapath_module0.product [2]),
    .Y(_162_)
  );


  NOT
  _207_
  (
    .A(\datapath_module0.product [3]),
    .Y(_163_)
  );


  NOT
  _208_
  (
    .A(\datapath_module0.multiplicand [3]),
    .Y(_164_)
  );


  NOT
  _209_
  (
    .A(\datapath_module0.product [4]),
    .Y(_165_)
  );


  NOT
  _210_
  (
    .A(\datapath_module0.multiplicand [4]),
    .Y(_166_)
  );


  NOT
  _211_
  (
    .A(\datapath_module0.product [5]),
    .Y(_167_)
  );


  NOT
  _212_
  (
    .A(\datapath_module0.multiplicand [5]),
    .Y(_168_)
  );


  NOT
  _213_
  (
    .A(\datapath_module0.product [6]),
    .Y(_169_)
  );


  NOT
  _214_
  (
    .A(\datapath_module0.multiplicand [6]),
    .Y(_170_)
  );


  NOT
  _215_
  (
    .A(\datapath_module0.multiplicand [7]),
    .Y(_171_)
  );


  NOR
  _216_
  (
    .A(word0[1]),
    .B(word0[0]),
    .Y(_172_)
  );


  NOR
  _217_
  (
    .A(word0[3]),
    .B(word0[2]),
    .Y(_173_)
  );


  NAND
  _218_
  (
    .A(_172_),
    .B(_173_),
    .Y(_174_)
  );


  NOR
  _219_
  (
    .A(word1[3]),
    .B(word1[2]),
    .Y(_175_)
  );


  NOR
  _220_
  (
    .A(word1[1]),
    .B(word1[0]),
    .Y(_176_)
  );


  NAND
  _221_
  (
    .A(_175_),
    .B(_176_),
    .Y(_177_)
  );


  NAND
  _222_
  (
    .A(_174_),
    .B(_177_),
    .Y(_178_)
  );


  NOT
  _223_
  (
    .A(_178_),
    .Y(_179_)
  );


  NOR
  _224_
  (
    .A(reset),
    .B(\control_module0.state ),
    .Y(ready)
  );


  NOT
  _225_
  (
    .A(ready),
    .Y(_180_)
  );


  NOR
  _226_
  (
    .A(_157_),
    .B(_180_),
    .Y(_181_)
  );


  NAND
  _227_
  (
    .A(start),
    .B(ready),
    .Y(_182_)
  );


  NOR
  _228_
  (
    .A(_178_),
    .B(_182_),
    .Y(_183_)
  );


  NAND
  _229_
  (
    .A(_179_),
    .B(_181_),
    .Y(_184_)
  );


  NAND
  _230_
  (
    .A(\datapath_module0.multiplier [3]),
    .B(\control_module0.state ),
    .Y(_185_)
  );


  NOT
  _231_
  (
    .A(_185_),
    .Y(_186_)
  );


  NOR
  _232_
  (
    .A(_183_),
    .B(_186_),
    .Y(_187_)
  );


  NAND
  _233_
  (
    .A(_184_),
    .B(_185_),
    .Y(_188_)
  );


  NOR
  _234_
  (
    .A(_160_),
    .B(\datapath_module0.multiplier [1]),
    .Y(_189_)
  );


  NAND
  _235_
  (
    .A(_156_),
    .B(_189_),
    .Y(_190_)
  );


  NAND
  _236_
  (
    .A(\control_module0.state ),
    .B(_190_),
    .Y(_191_)
  );


  NAND
  _237_
  (
    .A(_187_),
    .B(_191_),
    .Y(\control_module0.next_state )
  );


  NAND
  _238_
  (
    .A(_178_),
    .B(_181_),
    .Y(_192_)
  );


  NOT
  _239_
  (
    .A(_192_),
    .Y(_193_)
  );


  NAND
  _240_
  (
    .A(\control_module0.state ),
    .B(\datapath_module0.multiplicand [0]),
    .Y(_194_)
  );


  NOT
  _241_
  (
    .A(_194_),
    .Y(_195_)
  );


  NOR
  _242_
  (
    .A(_160_),
    .B(_194_),
    .Y(_196_)
  );


  NAND
  _243_
  (
    .A(\control_module0.m0 ),
    .B(_195_),
    .Y(_197_)
  );


  NAND
  _244_
  (
    .A(\datapath_module0.product [0]),
    .B(_196_),
    .Y(_198_)
  );


  NAND
  _245_
  (
    .A(_159_),
    .B(_197_),
    .Y(_020_)
  );


  NAND
  _246_
  (
    .A(_198_),
    .B(_020_),
    .Y(_021_)
  );


  NOR
  _247_
  (
    .A(_193_),
    .B(_021_),
    .Y(_012_)
  );


  NAND
  _248_
  (
    .A(\control_module0.state ),
    .B(\control_module0.m0 ),
    .Y(_022_)
  );


  NOT
  _249_
  (
    .A(_022_),
    .Y(_023_)
  );


  NAND
  _250_
  (
    .A(\datapath_module0.product [0]),
    .B(\datapath_module0.multiplicand [0]),
    .Y(_024_)
  );


  NOT
  _251_
  (
    .A(_024_),
    .Y(_025_)
  );


  NOR
  _252_
  (
    .A(\datapath_module0.product [1]),
    .B(\datapath_module0.multiplicand [1]),
    .Y(_026_)
  );


  NOT
  _253_
  (
    .A(_026_),
    .Y(_027_)
  );


  NAND
  _254_
  (
    .A(\datapath_module0.product [1]),
    .B(\datapath_module0.multiplicand [1]),
    .Y(_028_)
  );


  NOT
  _255_
  (
    .A(_028_),
    .Y(_029_)
  );


  NOR
  _256_
  (
    .A(_026_),
    .B(_029_),
    .Y(_030_)
  );


  NAND
  _257_
  (
    .A(_027_),
    .B(_028_),
    .Y(_031_)
  );


  NAND
  _258_
  (
    .A(_025_),
    .B(_030_),
    .Y(_032_)
  );


  NAND
  _259_
  (
    .A(_024_),
    .B(_031_),
    .Y(_033_)
  );


  NAND
  _260_
  (
    .A(_032_),
    .B(_033_),
    .Y(_034_)
  );


  NAND
  _261_
  (
    .A(_023_),
    .B(_034_),
    .Y(_035_)
  );


  NOR
  _262_
  (
    .A(\datapath_module0.product [1]),
    .B(_023_),
    .Y(_036_)
  );


  NAND
  _263_
  (
    .A(_192_),
    .B(_035_),
    .Y(_037_)
  );


  NOR
  _264_
  (
    .A(_036_),
    .B(_037_),
    .Y(_013_)
  );


  NAND
  _265_
  (
    .A(_028_),
    .B(_032_),
    .Y(_038_)
  );


  NAND
  _266_
  (
    .A(\datapath_module0.product [2]),
    .B(\datapath_module0.multiplicand [2]),
    .Y(_039_)
  );


  NOT
  _267_
  (
    .A(_039_),
    .Y(_040_)
  );


  NOR
  _268_
  (
    .A(\datapath_module0.product [2]),
    .B(\datapath_module0.multiplicand [2]),
    .Y(_041_)
  );


  NOR
  _269_
  (
    .A(_040_),
    .B(_041_),
    .Y(_042_)
  );


  NOR
  _270_
  (
    .A(_038_),
    .B(_042_),
    .Y(_043_)
  );


  NAND
  _271_
  (
    .A(_038_),
    .B(_042_),
    .Y(_044_)
  );


  NOT
  _272_
  (
    .A(_044_),
    .Y(_045_)
  );


  NOR
  _273_
  (
    .A(_043_),
    .B(_045_),
    .Y(_046_)
  );


  NOR
  _274_
  (
    .A(_022_),
    .B(_046_),
    .Y(_047_)
  );


  NAND
  _275_
  (
    .A(_162_),
    .B(_022_),
    .Y(_048_)
  );


  NAND
  _276_
  (
    .A(_192_),
    .B(_048_),
    .Y(_049_)
  );


  NOR
  _277_
  (
    .A(_047_),
    .B(_049_),
    .Y(_014_)
  );


  NAND
  _278_
  (
    .A(_039_),
    .B(_044_),
    .Y(_050_)
  );


  NAND
  _279_
  (
    .A(_163_),
    .B(_164_),
    .Y(_051_)
  );


  NAND
  _280_
  (
    .A(\datapath_module0.product [3]),
    .B(\datapath_module0.multiplicand [3]),
    .Y(_052_)
  );


  NAND
  _281_
  (
    .A(_051_),
    .B(_052_),
    .Y(_053_)
  );


  NAND
  _282_
  (
    .A(_050_),
    .B(_053_),
    .Y(_054_)
  );


  NOR
  _283_
  (
    .A(_050_),
    .B(_053_),
    .Y(_055_)
  );


  NOT
  _284_
  (
    .A(_055_),
    .Y(_056_)
  );


  NAND
  _285_
  (
    .A(_054_),
    .B(_056_),
    .Y(_057_)
  );


  NOR
  _286_
  (
    .A(_022_),
    .B(_057_),
    .Y(_058_)
  );


  NAND
  _287_
  (
    .A(_163_),
    .B(_022_),
    .Y(_059_)
  );


  NAND
  _288_
  (
    .A(_192_),
    .B(_059_),
    .Y(_060_)
  );


  NOR
  _289_
  (
    .A(_058_),
    .B(_060_),
    .Y(_015_)
  );


  NOR
  _290_
  (
    .A(\datapath_module0.product [4]),
    .B(\datapath_module0.multiplicand [4]),
    .Y(_061_)
  );


  NAND
  _291_
  (
    .A(\datapath_module0.product [4]),
    .B(\datapath_module0.multiplicand [4]),
    .Y(_062_)
  );


  NOT
  _292_
  (
    .A(_062_),
    .Y(_063_)
  );


  NOR
  _293_
  (
    .A(_061_),
    .B(_063_),
    .Y(_064_)
  );


  NAND
  _294_
  (
    .A(_050_),
    .B(_051_),
    .Y(_065_)
  );


  NAND
  _295_
  (
    .A(_052_),
    .B(_065_),
    .Y(_066_)
  );


  NAND
  _296_
  (
    .A(_064_),
    .B(_066_),
    .Y(_067_)
  );


  NOT
  _297_
  (
    .A(_067_),
    .Y(_068_)
  );


  NOR
  _298_
  (
    .A(_064_),
    .B(_066_),
    .Y(_069_)
  );


  NOR
  _299_
  (
    .A(_068_),
    .B(_069_),
    .Y(_070_)
  );


  NOR
  _300_
  (
    .A(_022_),
    .B(_070_),
    .Y(_071_)
  );


  NAND
  _301_
  (
    .A(_165_),
    .B(_022_),
    .Y(_072_)
  );


  NAND
  _302_
  (
    .A(_192_),
    .B(_072_),
    .Y(_073_)
  );


  NOR
  _303_
  (
    .A(_071_),
    .B(_073_),
    .Y(_016_)
  );


  NAND
  _304_
  (
    .A(_062_),
    .B(_067_),
    .Y(_074_)
  );


  NOR
  _305_
  (
    .A(\datapath_module0.product [5]),
    .B(\datapath_module0.multiplicand [5]),
    .Y(_075_)
  );


  NAND
  _306_
  (
    .A(\datapath_module0.product [5]),
    .B(\datapath_module0.multiplicand [5]),
    .Y(_076_)
  );


  NOT
  _307_
  (
    .A(_076_),
    .Y(_077_)
  );


  NOR
  _308_
  (
    .A(_075_),
    .B(_077_),
    .Y(_078_)
  );


  NAND
  _309_
  (
    .A(_074_),
    .B(_078_),
    .Y(_079_)
  );


  NOT
  _310_
  (
    .A(_079_),
    .Y(_080_)
  );


  NOR
  _311_
  (
    .A(_074_),
    .B(_078_),
    .Y(_081_)
  );


  NOR
  _312_
  (
    .A(_080_),
    .B(_081_),
    .Y(_082_)
  );


  NOR
  _313_
  (
    .A(_022_),
    .B(_082_),
    .Y(_083_)
  );


  NAND
  _314_
  (
    .A(_167_),
    .B(_022_),
    .Y(_084_)
  );


  NAND
  _315_
  (
    .A(_192_),
    .B(_084_),
    .Y(_085_)
  );


  NOR
  _316_
  (
    .A(_083_),
    .B(_085_),
    .Y(_017_)
  );


  NAND
  _317_
  (
    .A(_076_),
    .B(_079_),
    .Y(_086_)
  );


  NAND
  _318_
  (
    .A(\datapath_module0.product [6]),
    .B(\datapath_module0.multiplicand [6]),
    .Y(_087_)
  );


  NOT
  _319_
  (
    .A(_087_),
    .Y(_088_)
  );


  NOR
  _320_
  (
    .A(\datapath_module0.product [6]),
    .B(\datapath_module0.multiplicand [6]),
    .Y(_089_)
  );


  NOR
  _321_
  (
    .A(_088_),
    .B(_089_),
    .Y(_090_)
  );


  NOR
  _322_
  (
    .A(_086_),
    .B(_090_),
    .Y(_091_)
  );


  NAND
  _323_
  (
    .A(_086_),
    .B(_090_),
    .Y(_092_)
  );


  NOT
  _324_
  (
    .A(_092_),
    .Y(_093_)
  );


  NOR
  _325_
  (
    .A(_091_),
    .B(_093_),
    .Y(_094_)
  );


  NOR
  _326_
  (
    .A(_022_),
    .B(_094_),
    .Y(_095_)
  );


  NAND
  _327_
  (
    .A(_169_),
    .B(_022_),
    .Y(_096_)
  );


  NAND
  _328_
  (
    .A(_192_),
    .B(_096_),
    .Y(_097_)
  );


  NOR
  _329_
  (
    .A(_095_),
    .B(_097_),
    .Y(_018_)
  );


  NAND
  _330_
  (
    .A(_087_),
    .B(_092_),
    .Y(_098_)
  );


  NAND
  _331_
  (
    .A(\datapath_module0.multiplicand [7]),
    .B(_098_),
    .Y(_099_)
  );


  NOR
  _332_
  (
    .A(\datapath_module0.multiplicand [7]),
    .B(_098_),
    .Y(_100_)
  );


  NAND
  _333_
  (
    .A(_023_),
    .B(_099_),
    .Y(_101_)
  );


  NOR
  _334_
  (
    .A(_100_),
    .B(_101_),
    .Y(_102_)
  );


  NAND
  _335_
  (
    .A(\datapath_module0.product [7]),
    .B(_102_),
    .Y(_103_)
  );


  NOR
  _336_
  (
    .A(\datapath_module0.product [7]),
    .B(_102_),
    .Y(_104_)
  );


  NAND
  _337_
  (
    .A(_192_),
    .B(_103_),
    .Y(_105_)
  );


  NOR
  _338_
  (
    .A(_104_),
    .B(_105_),
    .Y(_019_)
  );


  NOR
  _339_
  (
    .A(\control_module0.state ),
    .B(_161_),
    .Y(_106_)
  );


  NOR
  _340_
  (
    .A(_183_),
    .B(_106_),
    .Y(_107_)
  );


  NOR
  _341_
  (
    .A(word0[0]),
    .B(_184_),
    .Y(_108_)
  );


  NOR
  _342_
  (
    .A(_107_),
    .B(_108_),
    .Y(_000_)
  );


  NAND
  _343_
  (
    .A(_158_),
    .B(\datapath_module0.multiplicand [1]),
    .Y(_109_)
  );


  NAND
  _344_
  (
    .A(_194_),
    .B(_109_),
    .Y(_110_)
  );


  NAND
  _345_
  (
    .A(_184_),
    .B(_110_),
    .Y(_111_)
  );


  NAND
  _346_
  (
    .A(word0[1]),
    .B(_183_),
    .Y(_112_)
  );


  NAND
  _347_
  (
    .A(_111_),
    .B(_112_),
    .Y(_001_)
  );


  NAND
  _348_
  (
    .A(_158_),
    .B(\datapath_module0.multiplicand [2]),
    .Y(_113_)
  );


  NAND
  _349_
  (
    .A(\control_module0.state ),
    .B(\datapath_module0.multiplicand [1]),
    .Y(_114_)
  );


  NAND
  _350_
  (
    .A(_113_),
    .B(_114_),
    .Y(_115_)
  );


  NAND
  _351_
  (
    .A(_184_),
    .B(_115_),
    .Y(_116_)
  );


  NAND
  _352_
  (
    .A(word0[2]),
    .B(_183_),
    .Y(_117_)
  );


  NAND
  _353_
  (
    .A(_116_),
    .B(_117_),
    .Y(_002_)
  );


  NAND
  _354_
  (
    .A(_158_),
    .B(\datapath_module0.multiplicand [3]),
    .Y(_118_)
  );


  NAND
  _355_
  (
    .A(\control_module0.state ),
    .B(\datapath_module0.multiplicand [2]),
    .Y(_119_)
  );


  NAND
  _356_
  (
    .A(_118_),
    .B(_119_),
    .Y(_120_)
  );


  NAND
  _357_
  (
    .A(_184_),
    .B(_120_),
    .Y(_121_)
  );


  NAND
  _358_
  (
    .A(word0[3]),
    .B(_183_),
    .Y(_122_)
  );


  NAND
  _359_
  (
    .A(_121_),
    .B(_122_),
    .Y(_003_)
  );


  NOR
  _360_
  (
    .A(\control_module0.state ),
    .B(_166_),
    .Y(_123_)
  );


  NAND
  _361_
  (
    .A(\control_module0.state ),
    .B(\datapath_module0.multiplicand [3]),
    .Y(_124_)
  );


  NOT
  _362_
  (
    .A(_124_),
    .Y(_125_)
  );


  NOR
  _363_
  (
    .A(_123_),
    .B(_125_),
    .Y(_126_)
  );


  NOR
  _364_
  (
    .A(_183_),
    .B(_126_),
    .Y(_004_)
  );


  NOR
  _365_
  (
    .A(\control_module0.state ),
    .B(_168_),
    .Y(_127_)
  );


  NAND
  _366_
  (
    .A(\control_module0.state ),
    .B(\datapath_module0.multiplicand [4]),
    .Y(_128_)
  );


  NOT
  _367_
  (
    .A(_128_),
    .Y(_129_)
  );


  NOR
  _368_
  (
    .A(_127_),
    .B(_129_),
    .Y(_130_)
  );


  NOR
  _369_
  (
    .A(_183_),
    .B(_130_),
    .Y(_005_)
  );


  NOR
  _370_
  (
    .A(\control_module0.state ),
    .B(_170_),
    .Y(_131_)
  );


  NAND
  _371_
  (
    .A(\control_module0.state ),
    .B(\datapath_module0.multiplicand [5]),
    .Y(_132_)
  );


  NOT
  _372_
  (
    .A(_132_),
    .Y(_133_)
  );


  NOR
  _373_
  (
    .A(_131_),
    .B(_133_),
    .Y(_134_)
  );


  NOR
  _374_
  (
    .A(_183_),
    .B(_134_),
    .Y(_006_)
  );


  NOR
  _375_
  (
    .A(\control_module0.state ),
    .B(_171_),
    .Y(_135_)
  );


  NAND
  _376_
  (
    .A(\control_module0.state ),
    .B(\datapath_module0.multiplicand [6]),
    .Y(_136_)
  );


  NOT
  _377_
  (
    .A(_136_),
    .Y(_137_)
  );


  NOR
  _378_
  (
    .A(_135_),
    .B(_137_),
    .Y(_138_)
  );


  NOR
  _379_
  (
    .A(_183_),
    .B(_138_),
    .Y(_007_)
  );


  NAND
  _380_
  (
    .A(_158_),
    .B(\control_module0.m0 ),
    .Y(_139_)
  );


  NAND
  _381_
  (
    .A(\control_module0.state ),
    .B(\datapath_module0.multiplier [1]),
    .Y(_140_)
  );


  NAND
  _382_
  (
    .A(_139_),
    .B(_140_),
    .Y(_141_)
  );


  NAND
  _383_
  (
    .A(_184_),
    .B(_141_),
    .Y(_142_)
  );


  NAND
  _384_
  (
    .A(word1[0]),
    .B(_183_),
    .Y(_143_)
  );


  NAND
  _385_
  (
    .A(_142_),
    .B(_143_),
    .Y(_008_)
  );


  NAND
  _386_
  (
    .A(_158_),
    .B(\datapath_module0.multiplier [1]),
    .Y(_144_)
  );


  NAND
  _387_
  (
    .A(\datapath_module0.multiplier [2]),
    .B(\control_module0.state ),
    .Y(_145_)
  );


  NAND
  _388_
  (
    .A(_144_),
    .B(_145_),
    .Y(_146_)
  );


  NAND
  _389_
  (
    .A(_184_),
    .B(_146_),
    .Y(_147_)
  );


  NAND
  _390_
  (
    .A(word1[1]),
    .B(_183_),
    .Y(_148_)
  );


  NAND
  _391_
  (
    .A(_147_),
    .B(_148_),
    .Y(_009_)
  );


  NOR
  _392_
  (
    .A(_156_),
    .B(\control_module0.state ),
    .Y(_149_)
  );


  NOR
  _393_
  (
    .A(_188_),
    .B(_149_),
    .Y(_150_)
  );


  NOR
  _394_
  (
    .A(word1[2]),
    .B(_184_),
    .Y(_151_)
  );


  NOR
  _395_
  (
    .A(_150_),
    .B(_151_),
    .Y(_010_)
  );


  NOR
  _396_
  (
    .A(_155_),
    .B(\control_module0.state ),
    .Y(_152_)
  );


  NOR
  _397_
  (
    .A(_183_),
    .B(_152_),
    .Y(_153_)
  );


  NOR
  _398_
  (
    .A(word1[3]),
    .B(_184_),
    .Y(_154_)
  );


  NOR
  _399_
  (
    .A(_153_),
    .B(_154_),
    .Y(_011_)
  );

  (* src = "asmd_multiplier.v:13|datapath_unit.v:17" *)

  DFFSR
  _400_
  (
    .C(clk),
    .D((shift)? sin : _012_),
    .Q(\datapath_module0.product [0]),
    .R(reset),
    .S(1'h0)
  );

  (* src = "asmd_multiplier.v:13|datapath_unit.v:17" *)

  DFFSR
  _401_
  (
    .C(clk),
    .D((shift)? \datapath_module0.product [0] : _013_),
    .Q(\datapath_module0.product [1]),
    .R(reset),
    .S(1'h0)
  );

  (* src = "asmd_multiplier.v:13|datapath_unit.v:17" *)

  DFFSR
  _402_
  (
    .C(clk),
    .D((shift)? \datapath_module0.product [1] : _014_),
    .Q(\datapath_module0.product [2]),
    .R(reset),
    .S(1'h0)
  );

  (* src = "asmd_multiplier.v:13|datapath_unit.v:17" *)

  DFFSR
  _403_
  (
    .C(clk),
    .D((shift)? \datapath_module0.product [2] : _015_),
    .Q(\datapath_module0.product [3]),
    .R(reset),
    .S(1'h0)
  );

  (* src = "asmd_multiplier.v:13|datapath_unit.v:17" *)

  DFFSR
  _404_
  (
    .C(clk),
    .D((shift)? \datapath_module0.product [3] : _016_),
    .Q(\datapath_module0.product [4]),
    .R(reset),
    .S(1'h0)
  );

  (* src = "asmd_multiplier.v:13|datapath_unit.v:17" *)

  DFFSR
  _405_
  (
    .C(clk),
    .D((shift)? \datapath_module0.product [4] : _017_),
    .Q(\datapath_module0.product [5]),
    .R(reset),
    .S(1'h0)
  );

  (* src = "asmd_multiplier.v:13|datapath_unit.v:17" *)

  DFFSR
  _406_
  (
    .C(clk),
    .D((shift)? \datapath_module0.product [5] : _018_),
    .Q(\datapath_module0.product [6]),
    .R(reset),
    .S(1'h0)
  );

  (* src = "asmd_multiplier.v:13|datapath_unit.v:17" *)

  DFFSR
  _407_
  (
    .C(clk),
    .D((shift)? \datapath_module0.product [6] : _019_),
    .Q(\datapath_module0.product [7]),
    .R(reset),
    .S(1'h0)
  );

  (* src = "asmd_multiplier.v:13|datapath_unit.v:17" *)

  DFFSR
  _408_
  (
    .C(clk),
    .D((shift)? \datapath_module0.product [7] : _008_),
    .Q(\control_module0.m0 ),
    .R(reset),
    .S(1'h0)
  );

  (* src = "asmd_multiplier.v:13|datapath_unit.v:17" *)

  DFFSR
  _409_
  (
    .C(clk),
    .D((shift)? \control_module0.m0  : _009_),
    .Q(\datapath_module0.multiplier [1]),
    .R(reset),
    .S(1'h0)
  );

  (* src = "asmd_multiplier.v:13|datapath_unit.v:17" *)

  DFFSR
  _410_
  (
    .C(clk),
    .D((shift)? \datapath_module0.multiplier [1] : _010_),
    .Q(\datapath_module0.multiplier [2]),
    .R(reset),
    .S(1'h0)
  );

  (* src = "asmd_multiplier.v:13|datapath_unit.v:17" *)

  DFFSR
  _411_
  (
    .C(clk),
    .D((shift)? \datapath_module0.multiplier [2] : _011_),
    .Q(\datapath_module0.multiplier [3]),
    .R(reset),
    .S(1'h0)
  );

  (* src = "asmd_multiplier.v:13|datapath_unit.v:17" *)

  DFFSR
  _412_
  (
    .C(clk),
    .D((shift)? \datapath_module0.multiplier [3] : _000_),
    .Q(\datapath_module0.multiplicand [0]),
    .R(reset),
    .S(1'h0)
  );

  (* src = "asmd_multiplier.v:13|datapath_unit.v:17" *)

  DFFSR
  _413_
  (
    .C(clk),
    .D((shift)? \datapath_module0.multiplicand [0] : _001_),
    .Q(\datapath_module0.multiplicand [1]),
    .R(reset),
    .S(1'h0)
  );

  (* src = "asmd_multiplier.v:13|datapath_unit.v:17" *)

  DFFSR
  _414_
  (
    .C(clk),
    .D((shift)? \datapath_module0.multiplicand [1] : _002_),
    .Q(\datapath_module0.multiplicand [2]),
    .R(reset),
    .S(1'h0)
  );

  (* src = "asmd_multiplier.v:13|datapath_unit.v:17" *)

  DFFSR
  _415_
  (
    .C(clk),
    .D((shift)? \datapath_module0.multiplicand [2] : _003_),
    .Q(\datapath_module0.multiplicand [3]),
    .R(reset),
    .S(1'h0)
  );

  (* src = "asmd_multiplier.v:13|datapath_unit.v:17" *)

  DFFSR
  _416_
  (
    .C(clk),
    .D((shift)? \datapath_module0.multiplicand [3] : _004_),
    .Q(\datapath_module0.multiplicand [4]),
    .R(reset),
    .S(1'h0)
  );

  (* src = "asmd_multiplier.v:13|datapath_unit.v:17" *)

  DFFSR
  _417_
  (
    .C(clk),
    .D((shift)? \datapath_module0.multiplicand [4] : _005_),
    .Q(\datapath_module0.multiplicand [5]),
    .R(reset),
    .S(1'h0)
  );

  (* src = "asmd_multiplier.v:13|datapath_unit.v:17" *)

  DFFSR
  _418_
  (
    .C(clk),
    .D((shift)? \datapath_module0.multiplicand [5] : _006_),
    .Q(\datapath_module0.multiplicand [6]),
    .R(reset),
    .S(1'h0)
  );

  (* src = "asmd_multiplier.v:13|datapath_unit.v:17" *)

  DFFSR
  _419_
  (
    .C(clk),
    .D((shift)? \datapath_module0.multiplicand [6] : _007_),
    .Q(\datapath_module0.multiplicand [7]),
    .R(reset),
    .S(1'h0)
  );

  (* src = "asmd_multiplier.v:9|control_unit.v:7" *)

  DFFSR
  _420_
  (
    .C(clk),
    .D((shift)? \datapath_module0.multiplicand [7] : \control_module0.next_state ),
    .Q(\control_module0.state ),
    .R(reset),
    .S(1'h0)
  );

  assign \control_module0.clk  = clk;
  assign \control_module0.ready  = ready;
  assign \control_module0.reset  = reset;
  assign \control_module0.start  = start;
  assign \datapath_module0.clk  = clk;
  assign \datapath_module0.m0  = \control_module0.m0 ;
  assign \datapath_module0.multiplier [0] = \control_module0.m0 ;
  assign \datapath_module0.reset  = reset;
  assign \datapath_module0.word0  = word0;
  assign \datapath_module0.word1  = word1;
  assign m0 = \control_module0.m0 ;
  assign product = \datapath_module0.product ;
  assign sout = \control_module0.state ;
  assign __clk_source__ = (test)? tck : clk;

endmodule



module BoundaryScanRegister_input
(
  din,
  dout,
  sin,
  sout,
  clock,
  reset,
  testing,
  shift
);

  input din;
  output dout;
  input sin;
  output sout;
  input clock;input reset;input testing;input shift;
  reg store;

  always @(posedge clock or posedge reset) begin
    if(reset) begin
      store <= 1'b0;
    end else begin
      store <= (shift)? sin : dout;
    end
  end

  assign sout = store;
  assign dout = (testing)? store : din;

endmodule



module BoundaryScanRegister_output
(
  din,
  dout,
  sin,
  sout,
  clock,
  reset,
  testing,
  shift
);

  input din;
  output dout;
  input sin;
  output sout;
  input clock;input reset;input testing;input shift;
  reg store;

  always @(posedge clock or posedge reset) begin
    if(reset) begin
      store <= 1'b0;
    end else begin
      store <= (shift)? sin : dout;
    end
  end

  assign sout = store;
  assign dout = din;

endmodule



module asmd_multiplier_netlist
(
  product,
  ready,
  word0,
  word1,
  start,
  clk,
  reset,
  sin,
  shift,
  sout,
  tck,
  test
);

  wire __sin_0__;
  wire __sin_1__;
  wire __sin_2__;
  wire __sin_3__;
  wire __sin_4__;
  wire __sin_5__;
  wire __sin_6__;
  wire __sin_7__;
  wire __sin_8__;
  wire __sin_9__;
  wire __sin_10__;
  wire __sin_11__;
  wire __sin_12__;
  wire __sin_13__;
  wire __sin_14__;
  wire __sin_15__;
  wire __sin_16__;
  wire __sin_17__;
  wire __sin_18__;
  wire __sin_19__;
  input sin;
  output sout;
  input reset;
  input shift;
  input tck;
  input test;
  input clk;
  assign __sin_0__ = sin;
  input [3:0] word0;
  wire [3:0] word0__dout;

  BoundaryScanRegister_input
  __BoundaryScanRegister_input_0__
  (
    .din(word0[0]),
    .dout(word0__dout[0]),
    .sin(__sin_0__),
    .sout(__sin_1__),
    .clock(tck),
    .reset(reset),
    .testing(test),
    .shift(shift)
  );


  BoundaryScanRegister_input
  __BoundaryScanRegister_input_1__
  (
    .din(word0[1]),
    .dout(word0__dout[1]),
    .sin(__sin_1__),
    .sout(__sin_2__),
    .clock(tck),
    .reset(reset),
    .testing(test),
    .shift(shift)
  );


  BoundaryScanRegister_input
  __BoundaryScanRegister_input_2__
  (
    .din(word0[2]),
    .dout(word0__dout[2]),
    .sin(__sin_2__),
    .sout(__sin_3__),
    .clock(tck),
    .reset(reset),
    .testing(test),
    .shift(shift)
  );


  BoundaryScanRegister_input
  __BoundaryScanRegister_input_3__
  (
    .din(word0[3]),
    .dout(word0__dout[3]),
    .sin(__sin_3__),
    .sout(__sin_4__),
    .clock(tck),
    .reset(reset),
    .testing(test),
    .shift(shift)
  );

  input [3:0] word1;
  wire [3:0] word1__dout;

  BoundaryScanRegister_input
  __BoundaryScanRegister_input_4__
  (
    .din(word1[0]),
    .dout(word1__dout[0]),
    .sin(__sin_4__),
    .sout(__sin_5__),
    .clock(tck),
    .reset(reset),
    .testing(test),
    .shift(shift)
  );


  BoundaryScanRegister_input
  __BoundaryScanRegister_input_5__
  (
    .din(word1[1]),
    .dout(word1__dout[1]),
    .sin(__sin_5__),
    .sout(__sin_6__),
    .clock(tck),
    .reset(reset),
    .testing(test),
    .shift(shift)
  );


  BoundaryScanRegister_input
  __BoundaryScanRegister_input_6__
  (
    .din(word1[2]),
    .dout(word1__dout[2]),
    .sin(__sin_6__),
    .sout(__sin_7__),
    .clock(tck),
    .reset(reset),
    .testing(test),
    .shift(shift)
  );


  BoundaryScanRegister_input
  __BoundaryScanRegister_input_7__
  (
    .din(word1[3]),
    .dout(word1__dout[3]),
    .sin(__sin_7__),
    .sout(__sin_8__),
    .clock(tck),
    .reset(reset),
    .testing(test),
    .shift(shift)
  );

  input start;
  wire start__dout;

  BoundaryScanRegister_input
  __BoundaryScanRegister_input_8__
  (
    .din(start),
    .dout(start__dout),
    .sin(__sin_8__),
    .sout(__sin_9__),
    .clock(tck),
    .reset(reset),
    .testing(test),
    .shift(shift)
  );

  output [7:0] product;
  wire [7:0] product_din;

  BoundaryScanRegister_output
  __BoundaryScanRegister_output_9__
  (
    .din(product_din[0]),
    .dout(product[0]),
    .sin(__sin_10__),
    .sout(__sin_11__),
    .clock(tck),
    .reset(reset),
    .testing(test),
    .shift(shift)
  );


  BoundaryScanRegister_output
  __BoundaryScanRegister_output_10__
  (
    .din(product_din[1]),
    .dout(product[1]),
    .sin(__sin_11__),
    .sout(__sin_12__),
    .clock(tck),
    .reset(reset),
    .testing(test),
    .shift(shift)
  );


  BoundaryScanRegister_output
  __BoundaryScanRegister_output_11__
  (
    .din(product_din[2]),
    .dout(product[2]),
    .sin(__sin_12__),
    .sout(__sin_13__),
    .clock(tck),
    .reset(reset),
    .testing(test),
    .shift(shift)
  );


  BoundaryScanRegister_output
  __BoundaryScanRegister_output_12__
  (
    .din(product_din[3]),
    .dout(product[3]),
    .sin(__sin_13__),
    .sout(__sin_14__),
    .clock(tck),
    .reset(reset),
    .testing(test),
    .shift(shift)
  );


  BoundaryScanRegister_output
  __BoundaryScanRegister_output_13__
  (
    .din(product_din[4]),
    .dout(product[4]),
    .sin(__sin_14__),
    .sout(__sin_15__),
    .clock(tck),
    .reset(reset),
    .testing(test),
    .shift(shift)
  );


  BoundaryScanRegister_output
  __BoundaryScanRegister_output_14__
  (
    .din(product_din[5]),
    .dout(product[5]),
    .sin(__sin_15__),
    .sout(__sin_16__),
    .clock(tck),
    .reset(reset),
    .testing(test),
    .shift(shift)
  );


  BoundaryScanRegister_output
  __BoundaryScanRegister_output_15__
  (
    .din(product_din[6]),
    .dout(product[6]),
    .sin(__sin_16__),
    .sout(__sin_17__),
    .clock(tck),
    .reset(reset),
    .testing(test),
    .shift(shift)
  );


  BoundaryScanRegister_output
  __BoundaryScanRegister_output_16__
  (
    .din(product_din[7]),
    .dout(product[7]),
    .sin(__sin_17__),
    .sout(__sin_18__),
    .clock(tck),
    .reset(reset),
    .testing(test),
    .shift(shift)
  );

  output ready;
  wire ready_din;

  BoundaryScanRegister_output
  __BoundaryScanRegister_output_17__
  (
    .din(ready_din),
    .dout(ready),
    .sin(__sin_18__),
    .sout(__sin_19__),
    .clock(tck),
    .reset(reset),
    .testing(test),
    .shift(shift)
  );


  __UNIT__UNDER__FINANGLING__
  __uuf__
  (
    .word0(word0__dout),
    .word1(word1__dout),
    .start(start__dout),
    .clk(clk),
    .reset(reset),
    .shift(shift),
    .tck(tck),
    .test(test),
    .sin(__sin_9__),
    .sout(__sin_10__),
    .product(product_din),
    .ready(ready_din)
  );

  assign sout = __sin_19__;

endmodule


