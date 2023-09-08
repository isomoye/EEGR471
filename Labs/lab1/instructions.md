# Instructions for week 1.

open link to https://morganstate.cloud.com

- Select BearGeneral
- On the Windows Machine, Click X2Go by clicking on logo

     ![x2go](x2go.jpeg)


Follow the instructions on [Set Up ECE Remote Server](<Setting up X2Go for your account for Hannah .docx>)


The default password for the linux machine is: first 3 letters of the first name + first 3 letters of the last name + 01

Example: hudson defoe
Username: hudson
Password: huddef01


** ``PLEASE`` change your password as soon as you log in**
- In a terminal use the command ``passwd``


## Local VM

Follow **ONLY**  if you're using a local ubunty VM.

Otherwise, skip to [Install Teros](#Install-Teros).

Inside you ubuntu VM.

## install visual studio code (VScode).

```sudo snap install --classic code```

## install icarus verilog 

``sudo apt-get update``

``sudo apt-get install iverilog``

## install yosys

``sudo apt-get install yosys``

## install verible

```wget https://github.com/chipsalliance/verible/releases/download/v0.0-3410-g398a8505/verible-v0.0-3410-g398a8505-Ubuntu-20.04-focal-x86_64.tar.gz```

```tar -xf verible-v0.0-3410-g398a8505-Ubuntu-20.04-focal-x86_64.tar.gz ```

```mv verible-v0.0-3410-g398a8505 verible```

```export PATH=$PATH:`pwd`/verible```


## Install yowasp
In order to get the Teros to display pretty schematics we will need something in between yosys synthesis tool and Teros to help them "talk".

Make sure python and pip are installed. Then run the command.

```pip install yowasp-yosys```


## Install TerosHDL <a id='Install-Teros'></a>

TerosHDL is a helper extension that makes RTL design much easier. 

In VScode, install TerosHDL. Follow link below

[Teros Install Directions](https://terostechnology.github.io/terosHDLdoc/docs/intro)

## Test
From  here you should be able to display a schematic.

- open VScode. 
- Add the course directory folder to your workspace.
- Navigate to Week1/src
- Open [control_unit.v](../../asmd/src/control_unit.v)
- On the Top-Right side of the screen, you'll see an option "Schematic Viewer". Select and Inspect the image.
- Click [asmd_multiplier.v](../../asmd/src/asmd_multiplier.v)
- On the same Top-Right side of the screen, you'll see an option "Generate Template". Select and drop down to `Verilog Testbench`.
- This will add a verilog testbench template to your clipboard.
- Navigate to [tb/tb_asmd_multipler.v](../../asmd/tb/tb_asmd_multipler.v) and past the template.


## Submit

Make sure you are on your own branch.

``git status``

This should show your name as the branch.


Add the work you just did to your remote repository

``git add *``

Push your work to your branch

```git commit -a -m '[firstname_lastname week1 submission]```

`` git push --set-upstream origin firstname_lastname`` 





