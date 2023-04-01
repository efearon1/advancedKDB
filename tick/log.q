// .log.out:{ -1 (raze string .z.p," USER: ",string .z.u)," ***[INFO]*** ",x,"; Memory stats: ",.Q.s1 .Q.w[];};
// .log.err:{ -2 (raze string .z.p," USER: ",string .z.u)," ***[ERROR]*** ",x,"; Memory stats: ",.Q.s1 .Q.w[];};

.log.out:{-1 (raze string .z.p)," ***[INFO]*** ",x;};

.log.err:{-2 (raze string .z.p)," ***[ERROR]*** ",x;};

.z.po:{.log.out[(raze "Connection opened: ",string .z.w,"; USER: ",string .z.u),"; Memory stats: ",.Q.s1 .Q.w[]]};

.z.po:{.log.out[(raze "Connection closed: ",string .z.w,"; USER: ",string .z.u),"; Memory stats: ",.Q.s1 .Q.w[]]};
