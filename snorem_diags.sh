#!/bin/bash

# Welcome message
echo ""
echo -e "Zzzz... Hello there. I'm a sleepy sloth, but I'll try to help you with your system diagnostics. Zzzz...\n"
echo ""
echo ""
echo ""
echo "


     
     
                                                       s##b
                                   ,G .:p               ##  ,sw  *@#b
                             ,s####Q##########p,       ##   ,#b  ]#b
                          s#######################w    77` ,#b   ##w
                       .#############################      *T**
                      #################################              ..,,,,,,
                    ;####################Wb^7||||79@####,    .:N#################Np
                   {###Q#b||||||||||^8b|    ^    ^|||*@##wS##########################N
                  .###b|  |                    ||   |||@################################
                  ###b                      y#######pp, @################################p
                  ##b   ,#######p          ##QQ####@S#####################################N
                 !##os##QQ####@S#b        ^@#8#Q##Q#b######################################b
                 '######8#S##Q#b#b  jsmmm| ^@#8####bQ#######################################
                  @######8####bQb|| *@##b|||||7@#############################################
                   @##########b|   ]Q|||,s#    | ||^*8@######################################,smm#p
                    @######b|       ||||||          y########################################@#####b
                     ^@##p,                     |y###########################################@######
               ##########Q###ppp|        |,,s################################################@######
              @###############QQQ#######QQQQQ###########Q####################################@######
        .G#SSQG@###################################Q########QQQQQQQQQQQQ#######Q############Q@#####b
       %SSSSSSSSGS@###########################N##########@######################Q#############T*^`
             !SSSSG75%W#######################b##########@######################W############b
              @SQS#         ^`@88888######WWWWW###########W%8%TT****7@5GGGGGS### @###########
               *@S            {##########p    @###########           @########## @###########
                              ]##########p    @#######Q###           !Q########  @###########
                              '##########     @QQ#########            @#######b  1##########
                               @########b     '###########            j##QQ@#b    S########
                                jQQQQ@#b       @#########`             #b##@#     ##@QQQQb
                                 ##@#4#b        jQQ###Q@b                *        @#@#b@#
                                 ^`^# ^          ##@##@#b                           j# *^
                                                 1# ##^M
     

"
echo ""
echo ""
echo ""

# Display system information
echo "System Information:"
echo "--------------------"
hostnamectl
echo ""

# Display CPU load

echo "CPU Load over the next 30 seconds:"
for i in {1..6}; do top -bn 1 | grep "^%Cpu" && sleep 5; done
echo ""

# Display processes using more than 60% of CPU

echo "Processes using more than 60% of CPU"
echo "--------------------"
ps aux --sort=-%cpu | awk '{if ($3 > 60.0) print $0}'
echo ""

# Display system load
echo "System Load:"
echo "-------------"
uptime
echo ""

# Display memory usage
echo "Memory Usage:"
echo "-------------"
free -h
echo ""

# Display and rogue processes

echo "Rogue Processes:"
ps aux | awk '$1!="root"&&$1!="USER"&&$3>=50 { print $0 }'
echo ""

# Display disk usage
echo "Disk Usage:"
echo "-----------"
df -h
echo ""

# Display network information
echo "Basic Network Information:"
echo "--------------------"
ip a
echo ""

# Display system throughput IOPs

echo "System throughput IOPS over 30 seconds:"
echo "This test will post the IOPs taken every ten seconds over a thirty second duration..."
iostat -d -m -t -y -N 10 3
echo ""

# Goodbye message
echo -e "Zzzz... That's all folks. Time to go back to sleep. Zzzz...\n"
