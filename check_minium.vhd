----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/17/2023 02:06:12 PM
-- Design Name: 
-- Module Name: check_minium - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
    use IEEE.STD_LOGIC_1164.ALL;
    use IEEE.NUMERIC_STD.ALL;
    entity Find_mind_v3 is
        Port ( i_clk : in STD_LOGIC;
               reset : in STD_LOGIC;
               EN_RUNNING  : in STD_LOGIC;
               J0 : in STD_LOGIC_VECTOR (11 downto 0);
               J1 : in STD_LOGIC_VECTOR (11 downto 0);
               J2 : in STD_LOGIC_VECTOR (11 downto 0);
               J3 : in STD_LOGIC_VECTOR (11 downto 0);
               J4 : in STD_LOGIC_VECTOR (11 downto 0);
               J5 : in STD_LOGIC_VECTOR (11 downto 0);
               J6 : in STD_LOGIC_VECTOR (11 downto 0);
               J7 : in STD_LOGIC_VECTOR (11 downto 0);
               J8 : in STD_LOGIC_VECTOR (11 downto 0);
               J9 : in STD_LOGIC_VECTOR (11 downto 0);
               J10 : in STD_LOGIC_VECTOR (11 downto 0);
               J11 : in STD_LOGIC_VECTOR (11 downto 0);
               J12 : in STD_LOGIC_VECTOR (11 downto 0);
               J13 : in STD_LOGIC_VECTOR (11 downto 0);
               J14 : in STD_LOGIC_VECTOR (11 downto 0);
               J15 : in STD_LOGIC_VECTOR (11 downto 0);
               J16 : in STD_LOGIC_VECTOR (11 downto 0);
               J17 : in STD_LOGIC_VECTOR (11 downto 0);
               J18 : in STD_LOGIC_VECTOR (11 downto 0);
               J_Min_out           : OUT STD_LOGIC_VECTOR (11 downto 0)
               );
    end Find_mind_v3;
    
    architecture Behavioral of Find_mind_v3 is
        TYPE    J_type        IS ARRAY (0 to 18) OF SIGNED(11 downto 0) ;
        SIGNAl  r_J           : J_type;
        SIGNAl  out_min_stage1_0    : SIGNED (11  downto 0);
        SIGNAl  out_min_stage1_1    : SIGNED (11  downto 0);
        SIGNAl  out_min_stage1_2    : SIGNED (11  downto 0);
        SIGNAl  out_min_stage1_3    : SIGNED (11  downto 0);
        SIGNAl  out_min_stage1_4    : SIGNED (11 downto 0);
        SIGNAl  out_min_stage1_5    : SIGNED (11 downto 0);
        SIGNAl  out_min_stage1_6    : SIGNED (11 downto 0);
        SIGNAl  out_min_stage1_7    : SIGNED (11 downto 0);
        SIGNAl  out_min_stage1_8    : SIGNED (11 downto 0);
        SIGNAl  out_min_stage1_9    : SIGNED (11 downto 0);   
        SIGNAl  out_min_stage2_0    : SIGNED (11 downto 0);
        SIGNAl  out_min_stage2_1    : SIGNED (11 downto 0);
        SIGNAl  out_min_stage2_2    : SIGNED (11 downto 0);
        SIGNAl  out_min_stage2_3    : SIGNED (11 downto 0);
        SIGNAl  out_min_stage2_4    : SIGNED (11 downto 0);    
        SIGNAl  out_min_stage3_0    : SIGNED (11 downto 0);
        SIGNAl  out_min_stage3_1    : SIGNED (11 downto 0);
        SIGNAl  out_min_stage3_2    : SIGNED (11 downto 0);        
        SIGNAl  out_min_stage4_0    : SIGNED (11 downto 0);
        SIGNAl  out_min_stage4_1    : SIGNED (11 downto 0);
        SIGNAl  out_min_stage5_0    : SIGNED (11 downto 0);   
    BEGIN
       r_J(0)   <= signed(J0) WHEN EN_RUNNING ='1';
       r_J(1)   <= signed(J1) WHEN EN_RUNNING ='1';
       r_J(2)   <=signed(J2)  WHEN EN_RUNNING ='1';
       r_J(3)   <=signed(J3)  WHEN EN_RUNNING ='1';
       r_J(4)   <=signed(J4)  WHEN EN_RUNNING ='1';
       r_J(5)   <=signed(J5)  WHEN EN_RUNNING ='1';
       r_J(6)   <=signed(J6)  WHEN EN_RUNNING ='1';
       r_J(7)   <=signed(J7)  WHEN EN_RUNNING ='1';
       r_J(8)   <=signed(J8)  WHEN EN_RUNNING ='1';
       r_J(9)   <=signed(J9)  WHEN EN_RUNNING ='1';
       r_J(10)  <=signed(J10) WHEN EN_RUNNING ='1';
       r_J(11)  <=signed(J11) WHEN EN_RUNNING ='1';
       r_J(12)  <=signed(J12) WHEN EN_RUNNING ='1';
       r_J(13)  <=signed(J13) WHEN EN_RUNNING ='1';
       r_J(14)  <=signed(J14) WHEN EN_RUNNING ='1';
       r_J(15)  <=signed(J15) WHEN EN_RUNNING ='1';
       r_J(16)  <=signed(J16) WHEN EN_RUNNING ='1';
       r_J(17)  <=signed(J17) WHEN EN_RUNNING ='1';
       r_J(18)  <=signed(J18) WHEN EN_RUNNING ='1';
    
       PROCESS (i_clk,reset)
       BEGIN
            IF (RISING_EDGE(i_clk)) THEN
                IF  (reset ='0') THEN
                        --out_ind_stage1_0 <= (others => '0');
                        out_min_stage1_0 <= (others => '0');
                          out_min_stage1_0    <= (others => '0');
                          out_min_stage1_1   <= (others => '0');
                          out_min_stage1_2   <= (others => '0');
                          out_min_stage1_3    <= (others => '0');
                          out_min_stage1_4   <= (others => '0');
                          out_min_stage1_5   <= (others => '0');
                          out_min_stage1_6   <= (others => '0');
                          out_min_stage1_7   <= (others => '0');
                          out_min_stage1_8   <= (others => '0');
                          out_min_stage1_9   <= (others => '0');
                    
                          out_min_stage2_0   <= (others => '0');
                          out_min_stage2_1   <= (others => '0');
                          out_min_stage2_2   <= (others => '0');
                          out_min_stage2_3   <= (others => '0');
                          out_min_stage2_4   <= (others => '0');
                    
                          out_min_stage3_0   <= (others => '0');
                          out_min_stage3_1   <= (others => '0');
                          out_min_stage3_2   <= (others => '0');
                        
                          out_min_stage4_0   <= (others => '0');
                          out_min_stage4_1   <= (others => '0');
                    
                          out_min_stage5_0   <= (others => '0');
                ELSE
                   
                        IF (r_J(1)>r_J(0)) THEN
                            out_min_stage1_0 <= r_J(0);
                        ELSE
                            out_min_stage1_0 <= r_J(1);
                        END IF;
                        
                        IF (r_J(3)>r_J(2)) THEN
                               out_min_stage1_1 <= r_J(2);
                        ELSE
                               out_min_stage1_1 <= r_J(3);
                        END IF;
    
                        IF (r_J(5)>r_J(4)) THEN
                            out_min_stage1_2 <= r_J(4);
                        ELSE
                            out_min_stage1_2 <= r_J(5);
                        END IF;
    
                        IF (r_J(7)>r_J(6)) THEN
                            out_min_stage1_3 <= r_J(6);
                        ELSE
                            out_min_stage1_3 <= r_J(7);
                        END IF;
    
                        IF (r_J(9)>r_J(8)) THEN
                            out_min_stage1_4 <= r_J(8);
                        ELSE
                            out_min_stage1_4 <= r_J(9);
                        END IF;
                        
                        IF (r_J(11)>r_J(10)) THEN
                            out_min_stage1_5 <= r_J(10);
                        ELSE
                            out_min_stage1_5 <= r_J(11);
                        END IF;
    
                        IF (r_J(13)>r_J(12)) THEN
                            out_min_stage1_6 <= r_J(12);
                        ELSE
                            out_min_stage1_6 <= r_J(13);
                        END IF;
                        
                        IF (r_J(15)>r_J(14)) THEN
                            out_min_stage1_7 <= r_J(14);
                        ELSE
                            out_min_stage1_7 <= (r_J(15));
                        END IF;
    
                        IF (r_J(17)>r_J(16)) THEN
                            out_min_stage1_8 <= r_J(16);
                        ELSE
                            out_min_stage1_8 <= r_J(17);
                        END IF;
    
                        out_min_stage1_9 <= r_J(18);
                        
                        ---------
                        IF (out_min_stage1_0)> out_min_stage1_1 THEN
                            out_min_stage2_0 <= out_min_stage1_1;
                        ELSE
                            out_min_stage2_0 <= out_min_stage1_0;
                        END IF;
                        
                        IF (out_min_stage1_2)>(out_min_stage1_3) THEN
                            out_min_stage2_1 <= (out_min_stage1_3);
                        ELSE
                            out_min_stage2_1 <= (out_min_stage1_2);
                        END IF;
                        
                        IF (out_min_stage1_4)>out_min_stage1_5 THEN
                            out_min_stage2_2 <= (out_min_stage1_5);
                        ELSE
                            out_min_stage2_2 <= (out_min_stage1_4);
                        END IF;
                        
                        IF (out_min_stage1_6)>(out_min_stage1_7) THEN
                            out_min_stage2_3 <= (out_min_stage1_7);
                        ELSE
                            out_min_stage2_3 <= (out_min_stage1_6);
                        END IF;                        
                        IF (out_min_stage1_8)>out_min_stage1_9 THEN
                            out_min_stage2_4 <= (out_min_stage1_9);
                        ELSE
                            out_min_stage2_4 <= (out_min_stage1_8);
                        END IF;                        
                        ---------STAGE3
                        IF (out_min_stage2_0)>out_min_stage2_1 THEN
                            out_min_stage3_0 <= (out_min_stage2_1);
                        ELSE
                            out_min_stage3_0 <= (out_min_stage2_0);
                        END IF;
                        
                        IF (out_min_stage2_2)>(out_min_stage2_3) THEN
                            out_min_stage3_1 <= (out_min_stage2_3);
                        ELSE
                            out_min_stage3_1 <= (out_min_stage2_2);
                        END IF;                        
                        out_min_stage3_2 <= (out_min_stage2_4);
                        -------------STAGE4
                        
                        IF (out_min_stage3_1)>out_min_stage3_0 THEN
                            out_min_stage4_0 <= (out_min_stage3_0);
                        ELSE
                            out_min_stage4_0 <= (out_min_stage3_1);
                        END IF;                        
                        out_min_stage4_1 <= (out_min_stage3_2);
                     
                        -------------STAGE5
                        IF (out_min_stage4_0)>(out_min_stage4_1)THEN
                            out_min_stage5_0 <= (out_min_stage4_1);
                        ELSE
                            out_min_stage5_0 <= (out_min_stage4_0);
                        END IF;
                        J_Min_out         <= STD_LOGIC_VECTOR(out_min_stage5_0);    
                    END IF;
                END IF;           
       END PROCESS; 
    end Behavioral;
