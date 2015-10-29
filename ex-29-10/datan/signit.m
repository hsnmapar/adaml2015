  function [x95,x99,x05,x01] = signit(n,ido)
% keywords: t-distribution
% call: [x95,x99,x05,x01] = signit(n,ido)
% The function computes the above significance points for the
% t distribution with 'n' degrees of freedom.
% NOTE  Here 'n' is supposed to be an integer. The values are accurate
% for 0 < n < 301. For larger values of n the normal distribution is
% used
%
% INPUT       n     the degrees of freeedom
%             ido   1:   the two-sided percentile points are computed
%                        DEFAULT
%                   2:   the one-sided percentile points are computed

sig=[6.3138   31.8205   12.7062   63.6568
    2.9200    6.9646    4.3027    9.9248
    2.3534    4.5407    3.1824    5.8409
    2.1318    3.7470    2.7764    4.6041
    2.0150    3.3649    2.5706    4.0322
    1.9432    3.1427    2.4469    3.7074
    1.8946    2.9980    2.3646    3.4995
    1.8595    2.8965    2.3060    3.3554
    1.8331    2.8214    2.2622    3.2498
    1.8125    2.7638    2.2281    3.1693
    1.7959    2.7181    2.2010    3.1058
    1.7823    2.6810    2.1788    3.0545
    1.7709    2.6503    2.1604    3.0123
    1.7613    2.6245    2.1448    2.9768
    1.7531    2.6025    2.1314    2.9467
    1.7459    2.5835    2.1199    2.9208
    1.7396    2.5669    2.1098    2.8982
    1.7341    2.5524    2.1009    2.8784
    1.7291    2.5395    2.0930    2.8609
    1.7247    2.5280    2.0860    2.8453
    1.7207    2.5176    2.0796    2.8314
    1.7171    2.5083    2.0739    2.8188
    1.7139    2.4999    2.0687    2.8073
    1.7109    2.4922    2.0639    2.7969
    1.7081    2.4851    2.0595    2.7874
    1.7056    2.4786    2.0555    2.7787
    1.7033    2.4727    2.0518    2.7707
    1.7011    2.4671    2.0484    2.7633
    1.6991    2.4620    2.0452    2.7564
    1.6973    2.4573    2.0423    2.7500
    1.6955    2.4528    2.0395    2.7440
    1.6939    2.4487    2.0369    2.7385
    1.6924    2.4448    2.0345    2.7333
    1.6909    2.4411    2.0322    2.7284
    1.6896    2.4377    2.0301    2.7238
    1.6883    2.4345    2.0281    2.7195
    1.6871    2.4314    2.0262    2.7154
    1.6860    2.4286    2.0244    2.7116
    1.6849    2.4258    2.0227    2.7079
    1.6839    2.4233    2.0211    2.7045
    1.6829    2.4208    2.0195    2.7012
    1.6820    2.4185    2.0181    2.6981
    1.6811    2.4163    2.0167    2.6951
    1.6802    2.4141    2.0154    2.6923
    1.6794    2.4121    2.0141    2.6896
    1.6787    2.4102    2.0129    2.6870
    1.6779    2.4083    2.0117    2.6846
    1.6772    2.4066    2.0106    2.6822
    1.6766    2.4049    2.0096    2.6800
    1.6759    2.4033    2.0086    2.6778
    1.6753    2.4017    2.0076    2.6757
    1.6747    2.4002    2.0066    2.6737
    1.6741    2.3988    2.0057    2.6718
    1.6736    2.3974    2.0049    2.6700
    1.6730    2.3961    2.0040    2.6682
    1.6725    2.3948    2.0032    2.6665
    1.6720    2.3936    2.0025    2.6649
    1.6716    2.3924    2.0017    2.6633
    1.6711    2.3912    2.0010    2.6618
    1.6706    2.3901    2.0003    2.6603
    1.6702    2.3890    1.9996    2.6589
    1.6698    2.3880    1.9990    2.6575
    1.6694    2.3870    1.9983    2.6561
    1.6690    2.3860    1.9977    2.6549
    1.6686    2.3851    1.9971    2.6536
    1.6683    2.3842    1.9966    2.6524
    1.6679    2.3833    1.9960    2.6512
    1.6676    2.3824    1.9955    2.6501
    1.6672    2.3816    1.9949    2.6490
    1.6669    2.3808    1.9944    2.6479
    1.6666    2.3800    1.9939    2.6469
    1.6663    2.3793    1.9935    2.6459
    1.6660    2.3785    1.9930    2.6449
    1.6657    2.3778    1.9925    2.6439
    1.6654    2.3771    1.9921    2.6430
    1.6652    2.3764    1.9917    2.6421
    1.6649    2.3758    1.9913    2.6412
    1.6646    2.3751    1.9908    2.6403
    1.6644    2.3745    1.9905    2.6395
    1.6641    2.3739    1.9901    2.6387
    1.6639    2.3733    1.9897    2.6379
    1.6636    2.3727    1.9893    2.6371
    1.6634    2.3721    1.9890    2.6364
    1.6632    2.3716    1.9886    2.6356
    1.6630    2.3710    1.9883    2.6349
    1.6628    2.3705    1.9879    2.6342
    1.6626    2.3700    1.9876    2.6335
    1.6624    2.3695    1.9873    2.6329
    1.6622    2.3690    1.9870    2.6322
    1.6620    2.3685    1.9867    2.6316
    1.6618    2.3680    1.9864    2.6309
    1.6616    2.3676    1.9861    2.6303
    1.6614    2.3671    1.9858    2.6297
    1.6612    2.3667    1.9855    2.6291
    1.6611    2.3662    1.9853    2.6286
    1.6609    2.3658    1.9850    2.6280
    1.6607    2.3654    1.9847    2.6275
    1.6606    2.3650    1.9845    2.6269
    1.6604    2.3646    1.9842    2.6264
    1.6602    2.3642    1.9840    2.6259
    1.6601    2.3638    1.9837    2.6254
    1.6599    2.3635    1.9835    2.6249
    1.6598    2.3631    1.9833    2.6244
    1.6596    2.3627    1.9830    2.6239
    1.6595    2.3624    1.9828    2.6235
    1.6594    2.3620    1.9826    2.6230
    1.6592    2.3617    1.9824    2.6226
    1.6591    2.3614    1.9822    2.6221
    1.6590    2.3610    1.9820    2.6217
    1.6588    2.3607    1.9818    2.6213
    1.6587    2.3604    1.9816    2.6208
    1.6586    2.3601    1.9814    2.6204
    1.6585    2.3598    1.9812    2.6200
    1.6583    2.3595    1.9810    2.6196
    1.6582    2.3592    1.9808    2.6193
    1.6581    2.3589    1.9806    2.6189
    1.6580    2.3586    1.9804    2.6185
    1.6579    2.3584    1.9803    2.6181
    1.6578    2.3581    1.9801    2.6178
    1.6577    2.3578    1.9799    2.6174
    1.6575    2.3576    1.9798    2.6171
    1.6574    2.3573    1.9796    2.6167
    1.6573    2.3570    1.9794    2.6164
    1.6572    2.3568    1.9793    2.6161
    1.6571    2.3565    1.9791    2.6157
    1.6570    2.3563    1.9790    2.6154
    1.6569    2.3561    1.9788    2.6151
    1.6568    2.3558    1.9787    2.6148
    1.6568    2.3556    1.9785    2.6145
    1.6567    2.3554    1.9784    2.6142
    1.6566    2.3552    1.9782    2.6139
    1.6565    2.3549    1.9781    2.6136
    1.6564    2.3547    1.9780    2.6133
    1.6563    2.3545    1.9778    2.6130
    1.6562    2.3543    1.9777    2.6127
    1.6561    2.3541    1.9776    2.6125
    1.6561    2.3539    1.9774    2.6122
    1.6560    2.3537    1.9773    2.6119
    1.6559    2.3535    1.9772    2.6117
    1.6558    2.3533    1.9771    2.6114
    1.6557    2.3531    1.9769    2.6111
    1.6557    2.3529    1.9768    2.6109
    1.6556    2.3527    1.9767    2.6106
    1.6555    2.3525    1.9766    2.6104
    1.6554    2.3523    1.9765    2.6102
    1.6554    2.3522    1.9763    2.6099
    1.6553    2.3520    1.9762    2.6097
    1.6552    2.3518    1.9761    2.6095
    1.6551    2.3516    1.9760    2.6092
    1.6551    2.3515    1.9759    2.6090
    1.6550    2.3513    1.9758    2.6088
    1.6549    2.3511    1.9757    2.6086
    1.6549    2.3510    1.9756    2.6083
    1.6548    2.3508    1.9755    2.6081
    1.6547    2.3506    1.9754    2.6079
    1.6547    2.3505    1.9753    2.6077
    1.6546    2.3503    1.9752    2.6075
    1.6546    2.3502    1.9751    2.6073
    1.6545    2.3500    1.9750    2.6071
    1.6544    2.3499    1.9749    2.6069
    1.6544    2.3497    1.9748    2.6067
    1.6543    2.3496    1.9747    2.6065
    1.6543    2.3494    1.9746    2.6063
    1.6542    2.3493    1.9745    2.6061
    1.6541    2.3492    1.9744    2.6060
    1.6541    2.3490    1.9744    2.6058
    1.6540    2.3489    1.9743    2.6056
    1.6540    2.3487    1.9742    2.6054
    1.6539    2.3486    1.9741    2.6052
    1.6539    2.3485    1.9740    2.6051
    1.6538    2.3484    1.9739    2.6049
    1.6538    2.3482    1.9739    2.6047
    1.6537    2.3481    1.9738    2.6045
    1.6537    2.3480    1.9737    2.6044
    1.6536    2.3478    1.9736    2.6042
    1.6536    2.3477    1.9735    2.6041
    1.6535    2.3476    1.9735    2.6039
    1.6535    2.3475    1.9734    2.6037
    1.6534    2.3474    1.9733    2.6036
    1.6534    2.3472    1.9732    2.6034
    1.6533    2.3471    1.9732    2.6033
    1.6533    2.3470    1.9731    2.6031
    1.6532    2.3469    1.9730    2.6030
    1.6532    2.3468    1.9729    2.6028
    1.6531    2.3467    1.9729    2.6027
    1.6531    2.3466    1.9728    2.6025
    1.6530    2.3465    1.9727    2.6024
    1.6530    2.3463    1.9727    2.6022
    1.6530    2.3462    1.9726    2.6021
    1.6529    2.3461    1.9725    2.6020
    1.6529    2.3460    1.9725    2.6018
    1.6528    2.3459    1.9724    2.6017
    1.6528    2.3458    1.9723    2.6015
    1.6527    2.3457    1.9723    2.6014
    1.6527    2.3456    1.9722    2.6013
    1.6527    2.3455    1.9721    2.6011
    1.6526    2.3454    1.9721    2.6010
    1.6526    2.3453    1.9720    2.6009
    1.6525    2.3452    1.9720    2.6008
    1.6525    2.3451    1.9719    2.6006
    1.6525    2.3450    1.9718    2.6005
    1.6524    2.3449    1.9718    2.6004
    1.6524    2.3449    1.9717    2.6003
    1.6524    2.3448    1.9717    2.6001
    1.6523    2.3447    1.9716    2.6000
    1.6523    2.3446    1.9715    2.5999
    1.6522    2.3445    1.9715    2.5998
    1.6522    2.3444    1.9714    2.5997
    1.6522    2.3443    1.9714    2.5996
    1.6521    2.3442    1.9713    2.5994
    1.6521    2.3442    1.9713    2.5993
    1.6521    2.3441    1.9712    2.5992
    1.6520    2.3440    1.9712    2.5991
    1.6520    2.3439    1.9711    2.5990
    1.6520    2.3438    1.9711    2.5989
    1.6519    2.3437    1.9710    2.5988
    1.6519    2.3437    1.9710    2.5987
    1.6519    2.3436    1.9709    2.5986
    1.6518    2.3435    1.9709    2.5985
    1.6518    2.3434    1.9708    2.5984
    1.6518    2.3433    1.9708    2.5983
    1.6517    2.3433    1.9707    2.5982
    1.6517    2.3432    1.9707    2.5981
    1.6517    2.3431    1.9706    2.5980
    1.6517    2.3430    1.9706    2.5979
    1.6516    2.3430    1.9705    2.5978
    1.6516    2.3429    1.9705    2.5977
    1.6516    2.3428    1.9704    2.5976
    1.6515    2.3427    1.9704    2.5975
    1.6515    2.3427    1.9703    2.5974
    1.6515    2.3426    1.9703    2.5973
    1.6514    2.3425    1.9702    2.5972
    1.6514    2.3425    1.9702    2.5971
    1.6514    2.3424    1.9702    2.5970
    1.6514    2.3423    1.9701    2.5969
    1.6513    2.3423    1.9701    2.5968
    1.6513    2.3422    1.9700    2.5967
    1.6513    2.3421    1.9700    2.5966
    1.6513    2.3421    1.9699    2.5966
    1.6512    2.3420    1.9699    2.5965
    1.6512    2.3419    1.9699    2.5964
    1.6512    2.3419    1.9698    2.5963
    1.6511    2.3418    1.9698    2.5962
    1.6511    2.3417    1.9697    2.5961
    1.6511    2.3417    1.9697    2.5960
    1.6511    2.3416    1.9697    2.5960
    1.6510    2.3415    1.9696    2.5959
    1.6510    2.3415    1.9696    2.5958
    1.6510    2.3414    1.9695    2.5957
    1.6510    2.3414    1.9695    2.5956
    1.6509    2.3413    1.9695    2.5956
    1.6509    2.3412    1.9694    2.5955
    1.6509    2.3412    1.9694    2.5954
    1.6509    2.3411    1.9693    2.5953
    1.6509    2.3411    1.9693    2.5952
    1.6508    2.3410    1.9693    2.5952
    1.6508    2.3409    1.9692    2.5951
    1.6508    2.3409    1.9692    2.5950
    1.6508    2.3408    1.9692    2.5949
    1.6507    2.3408    1.9691    2.5949
    1.6507    2.3407    1.9691    2.5948
    1.6507    2.3407    1.9691    2.5947
    1.6507    2.3406    1.9690    2.5947
    1.6506    2.3406    1.9690    2.5946
    1.6506    2.3405    1.9690    2.5945
    1.6506    2.3404    1.9689    2.5944
    1.6506    2.3404    1.9689    2.5944
    1.6506    2.3403    1.9689    2.5943
    1.6505    2.3403    1.9688    2.5942
    1.6505    2.3402    1.9688    2.5942
    1.6505    2.3402    1.9688    2.5941
    1.6505    2.3401    1.9687    2.5940
    1.6505    2.3401    1.9687    2.5940
    1.6504    2.3400    1.9687    2.5939
    1.6504    2.3400    1.9686    2.5938
    1.6504    2.3399    1.9686    2.5938
    1.6504    2.3399    1.9686    2.5937
    1.6504    2.3398    1.9685    2.5936
    1.6503    2.3398    1.9685    2.5936
    1.6503    2.3397    1.9685    2.5935
    1.6503    2.3397    1.9684    2.5934
    1.6503    2.3396    1.9684    2.5934
    1.6503    2.3396    1.9684    2.5933
    1.6502    2.3395    1.9684    2.5933
    1.6502    2.3395    1.9683    2.5932
    1.6502    2.3395    1.9683    2.5931
    1.6502    2.3394    1.9683    2.5931
    1.6502    2.3394    1.9682    2.5930
    1.6501    2.3393    1.9682    2.5929
    1.6501    2.3393    1.9682    2.5929
    1.6501    2.3392    1.9681    2.5928
    1.6501    2.3392    1.9681    2.5928
    1.6501    2.3391    1.9681    2.5927
    1.6501    2.3391    1.9681    2.5927
    1.6500    2.3391    1.9680    2.5926
    1.6500    2.3390    1.9680    2.5925
    1.6500    2.3390    1.9680    2.5925
    1.6500    2.3389    1.9680    2.5924
    1.6500    2.3389    1.9679    2.5924
    1.6499    2.3388    1.9679    2.5923
    1.6449    2.3263    1.9600    2.5758];

 if n > 300
    x = sig(301,:);    %the normal approximation
 else
    x = sig(n,:);
 end

 if nargin==1 ido = 1; end
 if nargin > 1 & length(ido)==0 ido = 1; end

 if ido==1
    x05 = x(3); x01 = x(4); x95 = -x05; x99 = -x01;
 else
    x05 = x(1); x01 = x(2); x95 = -x05; x99 = -x01;
 end



