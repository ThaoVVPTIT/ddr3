----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/30/2022 02:59:40 PM
-- Design Name: 
-- Module Name: Inet_checksum - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Inet_checksum is
generic (
    DATA_WIDTH              : integer := 64
    );
Port ( 
    CLK                     : in    std_logic;
    RESET                   : in    std_logic;
    --
    S_AXIS_TVALID           : in    std_logic; 
    S_AXIS_TREADY           : out   std_logic; 
    S_AXIS_TDATA            : in    std_logic_vector (DATA_WIDTH - 1 downto 0);
    S_AXIS_TKEEP            : in    std_logic_vector (DATA_WIDTH/8 - 1 downto 0);
    S_AXIS_TLAST            : in    std_logic;
    
    INET_CHECKSUM           : out   std_logic_vector (15 downto 0);
    INET_CHECKSUM_TVALID    : out   std_logic
);
end Inet_checksum;

architecture Behavioral of Inet_checksum is

signal i_temp_1             : std_logic_vector (31 downto 0) := (others => '0');
signal i_temp_2             : std_logic_vector (31 downto 0) := (others => '0');
signal i_temp_3             : std_logic_vector (31 downto 0) := (others => '0');
signal i_temp_4             : std_logic_vector (31 downto 0) := (others => '0');
signal i_temp_5             : std_logic_vector (31 downto 0) := (others => '0');
signal i_temp_6             : std_logic_vector (31 downto 0) := (others => '0');
signal i_temp_7             : std_logic_vector (31 downto 0) := (others => '0');
signal i_temp_8             : std_logic_vector (31 downto 0) := (others => '0');
signal sum_temp             : std_logic_vector (31 downto 0) := (others => '0');
signal sum                  : std_logic_vector (31 downto 0) := (others => '0');
signal checksum_temp        : std_logic_vector (15 downto 0) := (others => '0');

signal data_local           : std_logic_vector (127 downto 0) := (others => '0');

signal checksum_vl_temp     : std_logic;
signal sum_pseudo_ip_header : std_logic_vector (31 downto 0) := (others => '0');

begin

data_local (DATA_WIDTH - 1 downto 0) <= S_AXIS_TDATA;

S_AXIS_TREADY            <= '1' when RESET = '0' else '0';
i_temp_1 (15 downto 0)   <= data_local (15 downto 0);
i_temp_2 (15 downto 0)   <= data_local (31 downto 16);
i_temp_3 (15 downto 0)   <= data_local (47 downto 32);
i_temp_4 (15 downto 0)   <= data_local (63 downto 48);
i_temp_5 (15 downto 0)   <= data_local (79 downto 64);
i_temp_6 (15 downto 0)   <= data_local (95 downto 80);
i_temp_7 (15 downto 0)   <= data_local (111 downto 96);
i_temp_8 (15 downto 0)   <= data_local (127 downto 112);

sum_temp    <= i_temp_1 + i_temp_2 + i_temp_3 + i_temp_4 +
               i_temp_5 + i_temp_6 + i_temp_7 + i_temp_8;

sum_pr: process (CLK)
begin
   if rising_edge (CLK) then 
       if RESET = '1' then
           sum <= (others => '0');
       elsif S_AXIS_TVALID = '1' then
           sum <= sum + sum_temp;
       elsif checksum_vl_temp = '1' then
           sum <= (others => '0');
       end if;
   end if; 
end process;

checksum_temp <= not (sum (31 downto 16) + sum (15 downto 0));

cs_pr: process (CLK)
begin
    if rising_edge (CLK) then
    checksum_vl_temp <= S_AXIS_TLAST and S_AXIS_TVALID;
        if checksum_vl_temp = '1' then 
            INET_CHECKSUM_TVALID <= '1';
            INET_CHECKSUM <= checksum_temp;
        else
            INET_CHECKSUM_TVALID <= '0';
        end if;
    end if;
end process;
end Behavioral;
