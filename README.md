# ikuai-openvmtools

适用于爱快系统的open-vm-tools，可以实现运行在ESXi上的爱快接收vmtools关机信号并正常关机

---

## 环境变量

| 变量名称    | 默认值    | 描述
| :-------- | :-----   | :-----
| PORT | 80|爱快端口号|
| USERNAME | admin | 爱快用户名
| PASSWORD | admin | 爱快密码

## 如何使用

拉取镜像
![Image text](https://github.com/bncfbb/ikuai-openvmtools/blob/master/img/1.jpg)
![Image text](https://github.com/bncfbb/ikuai-openvmtools/blob/master/img/2.jpg)

创建容器，勾选开机自启

![Image text](https://github.com/bncfbb/ikuai-openvmtools/blob/master/img/3.jpg)
![Image text](https://github.com/bncfbb/ikuai-openvmtools/blob/master/img/4.jpg)

PORT环境变量可以省略，如果爱快端口不是80的话需要添加PORT环境变量并填写实际端口

![Image text](https://github.com/bncfbb/ikuai-openvmtools/blob/master/img/5.jpg)
![Image text](https://github.com/bncfbb/ikuai-openvmtools/blob/master/img/6.jpg)

在ESXi上点击关机来测试效果

![Image text](https://github.com/bncfbb/ikuai-openvmtools/blob/master/img/7.jpg)

如果出现问题可以查看容器日志排查故障
