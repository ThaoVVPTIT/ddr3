----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/14/2023 09:51:46 AM
-- Design Name: 
-- Module Name: simple_parser - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity simple_parser is
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
    
    ENABLE_COMP_CHECKSUM    : out   std_logic
);
end simple_parser;

architecture Behavioral of simple_parser is

signal data_reg : std_logic_vector (511 downto 0) := (others => '0');

type axis_stream is record
    tvalid  :   std_logic;
    tready  :   std_logic;
    tlast   :   std_logic;
    tdata   :   std_logic_vector (DATA_WIDTH - 1 downto 0);
    tkeep   :   std_logic_vector (DATA_WIDTH / 8 - 1 downto 0);
    tuser   :   std_logic;
end record;

signal rx : axis_stream := (
    tvalid  =>  '0',
    tready  =>  '0',
    tlast   =>  '0',
    tdata   =>  (others => '0'),
    tkeep   =>  (others => '0'),
    tuser   =>  '0'
    );
signal tx : axis_stream:= (
    tvalid  =>  '0',
    tready  =>  '0',
    tlast   =>  '0',
    tdata   =>  (others => '0'),
    tkeep   =>  (others => '0'),
    tuser   =>  '0'
    );

begin

rx.tvalid   <= S_AXIS_TVALID;
rx.tlast    <= S_AXIS_TLAST;
rx.tdata    <= S_AXIS_TDATA;
rx.tkeep    <= S_AXIS_TKEEP;

S_AXIS_TREADY   <= rx.tready;  

data_shift_reg: process(clk)
begin
    if rising_edge(clk) then
        if rx.tvalid = '1' and rx.tready = '1' then
            data_reg <= data_reg (511 - DATA_WIDTH downto 0) & rx.tdata;
        end if;    
    end if;
end process;

end Behavioral;
