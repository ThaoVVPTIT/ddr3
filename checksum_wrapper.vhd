----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/13/2023 02:09:05 PM
-- Design Name: 
-- Module Name: checksum_wrapper - Behavioral
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

entity checksum_wrapper is
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
    --
    M_AXIS_TVALID           : out   std_logic;
    M_AXIS_TREADY           : in    std_logic;
    M_AXIS_TLAST            : out   std_logic;
    M_AXIS_TDATA            : out   std_logic_vector (DATA_WIDTH - 1 downto 0);
    M_AXIS_TKEEP            : out   std_logic_vector (DATA_WIDTH/8 - 1 downto 0);
    M_AXIS_TUSER            : out   std_logic;
    --
    TP                      : out   std_logic
    );
end checksum_wrapper;

architecture Behavioral of checksum_wrapper is

component Inet_checksum is
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
end component;

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

signal rx_checksum : axis_stream := (
    tvalid  =>  '0',
    tready  =>  '0',
    tlast   =>  '0',
    tdata   =>  (others => '0'),
    tkeep   =>  (others => '0'),
    tuser   =>  '0'
    );

signal inet_checksum_valid  : std_logic := '0';
signal inet_checksum_value  : std_logic_vector (15 downto 0) := (others => '0');

begin

checksum_inst0: Inet_checksum
generic map(
    DATA_WIDTH              =>  DATA_WIDTH
    )
Port map( 
    CLK                     => CLK,
    RESET                   => RESET,
    --
    S_AXIS_TVALID           => rx_checksum.tvalid,
    S_AXIS_TREADY           => rx_checksum.tready,
    S_AXIS_TDATA            => rx_checksum.tdata,
    S_AXIS_TKEEP            => rx_checksum.tkeep,
    S_AXIS_TLAST            => rx_checksum.tlast,
                            
    INET_CHECKSUM           => inet_checksum_value,
    INET_CHECKSUM_TVALID    => inet_checksum_valid
);



end Behavioral;
