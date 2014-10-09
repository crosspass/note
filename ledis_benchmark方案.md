#方案1
调用ledis自带的ledis_becnmark工具进行压力测试

数据操作（读数据，写数据的混合模式还是其单一模式 

统计的数据存放的位置，是否要弄一个http服务存放统计数据，统计的数据在网页上可以展示曲线图等

用tsar收集数据（cpu,mem,io,rps)
#方案2
重新编写leids_benchmark脚本，然后用tsar收集数据
