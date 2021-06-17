# FFT_32_cooly_tukey_verilog
## Algorithm used 
implementation of 32- point fft using verilog HDL the algorism used is butterfly algorithm
the algorism shown in the image below it depend on radix-2 fft 

![image](https://user-images.githubusercontent.com/68570192/122472321-b9095880-cfc0-11eb-822e-3ef944f5f27c.png)




## Hardware design 
the requirements is to achive sample rate = 10 MSPS we used zybo board 
32-point fft required 16 block of radix-2 fft and eachh has 2 multipliers that for a single stahe 
and it consists of 5 stages this MEAN WE need 160 multipliers in order to decrease this numper
we apply time sharing we used only 16 of radix-2 block and reuse them to apply the 80 radix-2 operations
the block diagram is shown in image below 

![image](https://user-images.githubusercontent.com/68570192/122474428-7e54ef80-cfc3-11eb-89bc-626511c01370.png)




## Behavioural simulation 
the behavioural simulation shows results consistant with the results from the soft ware modeling for system 

![image](https://user-images.githubusercontent.com/68570192/122474952-34203e00-cfc4-11eb-9972-cc26a7c62b19.png)
![image](https://user-images.githubusercontent.com/68570192/122474962-3a161f00-cfc4-11eb-9be6-e8b5d9ea71ef.png)





## synthesis 
the design synthesised and appling the constrains on clock duration and io delays 
the utilization and time report shown below 

![image](https://user-images.githubusercontent.com/68570192/122475236-a7c24b00-cfc4-11eb-86ac-47694e5b34be.png)

![image](https://user-images.githubusercontent.com/68570192/122475242-aabd3b80-cfc4-11eb-8118-51055ac89b3e.png)

![image](https://user-images.githubusercontent.com/68570192/122475252-ad1f9580-cfc4-11eb-843e-ef9beb83d38b.png)




## post-synthesis functional simulation 
then  we run post synthesis simulation and the results is also as expected and consistant with the results 
of behavioral simulation and software implementation 

![image](https://user-images.githubusercontent.com/68570192/122475621-38009000-cfc5-11eb-915c-1fcc8cd8a9df.png)

![image](https://user-images.githubusercontent.com/68570192/122475630-3cc54400-cfc5-11eb-90ca-9741c0b9de3e.png)
