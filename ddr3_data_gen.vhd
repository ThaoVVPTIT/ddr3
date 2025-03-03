----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/28/2022 02:24:53 PM
-- Design Name: 
-- Module Name: ddr3_data_gen - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ddr3_data_gen is
Port (
    rx_axis_aclk            : in    std_logic;
    rx_axis_tvalid          : in    std_logic;
    rx_axis_tlast           : in    std_logic;
    rx_axis_tready          : out   std_logic;
    rx_axis_tdata           : in    std_logic_vector (63 downto 0);
    rx_axis_tkeep           : in    std_logic_vector (7 downto 0);
    --
    tx_axis_aclk            : in    std_logic;
    tx_axis_tvalid          : out   std_logic;
    tx_axis_tlast           : out   std_logic;
    tx_axis_tready          : in    std_logic;
    tx_axis_tdata           : out   std_logic_vector (63 downto 0);
    tx_axis_tkeep           : out   std_logic_vector (7 downto 0);
    --
    S_AXI_0_araddr          : out    STD_LOGIC_VECTOR ( 30 downto 0 );
    S_AXI_0_arburst         : out    STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_0_arcache         : out    STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_0_arid            : out    STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_0_arlen           : out    STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_0_arlock          : out    STD_LOGIC;
    S_AXI_0_arprot          : out    STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_0_arqos           : out    STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_0_arready         : in     STD_LOGIC;
    S_AXI_0_arsize          : out    STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_0_arvalid         : out    STD_LOGIC;
    S_AXI_0_awaddr          : out    STD_LOGIC_VECTOR ( 30 downto 0 );
    S_AXI_0_awburst         : out    STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_0_awcache         : out    STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_0_awid            : out    STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_0_awlen           : out    STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_0_awlock          : out    STD_LOGIC;
    S_AXI_0_awprot          : out    STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_0_awqos           : out    STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_0_awready         : in     STD_LOGIC;
    S_AXI_0_awsize          : out    STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_0_awvalid         : out    STD_LOGIC;
    S_AXI_0_bid             : in     STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_0_bready          : out    STD_LOGIC;
    S_AXI_0_bresp           : in     STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_0_bvalid          : in     STD_LOGIC;
    S_AXI_0_rdata           : in     STD_LOGIC_VECTOR ( 511 downto 0 );
    S_AXI_0_rid             : in     STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_0_rlast           : in     STD_LOGIC;
    S_AXI_0_rready          : out    STD_LOGIC;
    S_AXI_0_rresp           : in     STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_0_rvalid          : in     STD_LOGIC;
    S_AXI_0_wdata           : out    STD_LOGIC_VECTOR ( 511 downto 0 );
    S_AXI_0_wlast           : out    STD_LOGIC;
    S_AXI_0_wready          : in     STD_LOGIC;
    S_AXI_0_wstrb           : out    STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXI_0_wvalid          : out    STD_LOGIC;
    init_calib_complete_0   : in     STD_LOGIC;
    reset_rtl_0             : in     STD_LOGIC;
    ui_clk_0                : in     STD_LOGIC
);
end ddr3_data_gen;

architecture Behavioral of ddr3_data_gen is

COMPONENT axis_interconnect_8_512
  PORT (
    ACLK : IN STD_LOGIC;
    ARESETN : IN STD_LOGIC;
    S00_AXIS_ACLK : IN STD_LOGIC;
    S00_AXIS_ARESETN : IN STD_LOGIC;
    S00_AXIS_TVALID : IN STD_LOGIC;
    S00_AXIS_TREADY : OUT STD_LOGIC;
    S00_AXIS_TDATA : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    S00_AXIS_TKEEP : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    S00_AXIS_TLAST : IN STD_LOGIC;
    M00_AXIS_ACLK : IN STD_LOGIC;
    M00_AXIS_ARESETN : IN STD_LOGIC;
    M00_AXIS_TVALID : OUT STD_LOGIC;
    M00_AXIS_TREADY : IN STD_LOGIC;
    M00_AXIS_TDATA : OUT STD_LOGIC_VECTOR(511 DOWNTO 0);
    M00_AXIS_TKEEP : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    M00_AXIS_TLAST : OUT STD_LOGIC;
    S00_FIFO_DATA_COUNT : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    M00_FIFO_DATA_COUNT : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END COMPONENT;

COMPONENT fifo_generator_0
  PORT (
    clk : IN STD_LOGIC;
    srst : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    full : OUT STD_LOGIC;
    empty : OUT STD_LOGIC
  );
END COMPONENT;

signal fifo_din     : std_logic_vector (63 downto 0) := (others => '0');
signal fifo_wr_en   : std_logic := '0';
signal fifo_rd_en   : std_logic := '0';
signal fifo_dout    : std_logic_vector (63 downto 0) := (others => '0');
signal fifo_full    : std_logic := '0';
signal fifo_empty   : std_logic := '0';

signal S_AXI_araddr          :  STD_LOGIC_VECTOR ( 30 downto 0 ) := (others => '0');
signal araddr                :  STD_LOGIC_VECTOR ( 30 downto 0 ) := (others => '0');
signal S_AXI_arburst         :  STD_LOGIC_VECTOR ( 1 downto 0 ) := (others => '0');
signal S_AXI_arcache         :  STD_LOGIC_VECTOR ( 3 downto 0 ) := (others => '0');
signal S_AXI_arid            :  STD_LOGIC_VECTOR ( 3 downto 0 ) := (others => '0');
signal S_AXI_arlen           :  STD_LOGIC_VECTOR ( 7 downto 0 ) := (others => '0');
signal S_AXI_arlock          :  STD_LOGIC := '0';
signal S_AXI_arprot          :  STD_LOGIC_VECTOR ( 2 downto 0 ) := (others => '0');
signal S_AXI_arqos           :  STD_LOGIC_VECTOR ( 3 downto 0 ) := (others => '0');
signal S_AXI_arready         :  STD_LOGIC := '0';
signal S_AXI_arsize          :  STD_LOGIC_VECTOR ( 2 downto 0 ) := (others => '0');
signal S_AXI_arvalid         :  STD_LOGIC := '0';
signal arvalid               :  STD_LOGIC := '0';
signal S_AXI_awaddr          :  STD_LOGIC_VECTOR ( 30 downto 0 ) := (others => '0');
signal awaddr                :  STD_LOGIC_VECTOR ( 30 downto 0 ) := (others => '0');
signal S_AXI_awburst         :  STD_LOGIC_VECTOR ( 1 downto 0 ) := (others => '0');
signal S_AXI_awcache         :  STD_LOGIC_VECTOR ( 3 downto 0 ) := (others => '0');
signal S_AXI_awid            :  STD_LOGIC_VECTOR ( 3 downto 0 ) := (others => '0');
signal S_AXI_awlen           :  STD_LOGIC_VECTOR ( 7 downto 0 ) := (others => '0');
signal S_AXI_awlock          :  STD_LOGIC := '0';
signal S_AXI_awprot          :  STD_LOGIC_VECTOR ( 2 downto 0 ) := (others => '0');
signal S_AXI_awqos           :  STD_LOGIC_VECTOR ( 3 downto 0 ) := (others => '0');
signal S_AXI_awready         :  STD_LOGIC := '0';
signal S_AXI_awsize          :  STD_LOGIC_VECTOR ( 2 downto 0 ) := (others => '0');
signal S_AXI_awvalid         :  STD_LOGIC := '0';
signal awvalid               :  STD_LOGIC := '0';
signal S_AXI_bid             :  STD_LOGIC_VECTOR ( 3 downto 0 ) := (others => '0');
signal S_AXI_bready          :  STD_LOGIC := '0';
signal S_AXI_bresp           :  STD_LOGIC_VECTOR ( 1 downto 0 ) := (others => '0');
signal S_AXI_bvalid          :  STD_LOGIC := '0';
signal S_AXI_rdata           :  STD_LOGIC_VECTOR ( 511 downto 0 ) := (others => '0');
signal S_AXI_rid             :  STD_LOGIC_VECTOR ( 3 downto 0 ) := (others => '0');
signal S_AXI_rlast           :  STD_LOGIC := '0';
signal S_AXI_rready          :  STD_LOGIC := '0';
signal S_AXI_rresp           :  STD_LOGIC_VECTOR ( 1 downto 0 ) := (others => '0');
signal S_AXI_rvalid          :  STD_LOGIC := '0';
signal S_AXI_wdata           :  STD_LOGIC_VECTOR ( 511 downto 0 ) := (others => '0');
signal wdata                 :  STD_LOGIC_VECTOR ( 511 downto 0 ) := (others => '0');
signal S_AXI_wlast           :  STD_LOGIC := '0';
signal wlast                 :  STD_LOGIC := '0';
signal S_AXI_wready          :  STD_LOGIC := '0';
signal S_AXI_wstrb           :  STD_LOGIC_VECTOR ( 63 downto 0 ) := (others => '0');
signal wstrb                 :  STD_LOGIC_VECTOR ( 63 downto 0 ) := (others => '0');
signal S_AXI_wvalid          :  STD_LOGIC := '0';
signal wvalid                :  STD_LOGIC := '0';
signal init_calib_complete   :  STD_LOGIC := '0';
signal reset_rtl             :  STD_LOGIC := '0';
signal ui_clk                :  STD_LOGIC := '0';
signal ui_clk_sync_rst       :  STD_LOGIC := '0';

signal clk : std_logic := '0';
signal reset : std_logic := '0';
signal resetn : std_logic := '0';

signal S00_AXIS_TVALID  :  STD_LOGIC;
signal S00_AXIS_TREADY  :  STD_LOGIC;
signal S00_AXIS_TDATA   :  STD_LOGIC_VECTOR(63 DOWNTO 0);
signal S00_AXIS_TSTRB   :  STD_LOGIC_VECTOR(7 DOWNTO 0);
signal S00_AXIS_TLAST   :  STD_LOGIC;
signal M00_AXIS_ACLK    :  STD_LOGIC;
signal M00_AXIS_ARESETN :  STD_LOGIC;
signal M00_AXIS_TVALID  :  STD_LOGIC;
signal M00_AXIS_TREADY  :  STD_LOGIC;
signal M00_AXIS_TDATA   :  STD_LOGIC_VECTOR(511 DOWNTO 0);
signal M00_AXIS_TSTRB   :  STD_LOGIC_VECTOR(63 DOWNTO 0);
signal M00_AXIS_TLAST   :  STD_LOGIC;

constant simulation : std_logic := '1';

signal awlen : std_logic_vector (7 downto 0) := (others => '0');
signal bready : std_logic := '0';

signal arid : std_logic_vector (3 downto 0) := (others => '0');
signal awid : std_logic_vector (3 downto 0) := (others => '0');
signal rready : std_logic := '0';

signal state : integer := 0;
signal cnt_valid : integer := 0;

signal cnt_byte : std_logic_vector (31 downto 0) := (others => '0');
signal tkeep_conv : integer := 0;
constant number_of_block : integer := 5;
signal cnt_block : integer := 0;

function convert_tkeep (
    TKEEP_IN : std_logic_vector (8 downto 0)) return integer is
    variable tkeep_c : integer := 0;
begin
    for i in 0 to 8 loop
       if tkeep_in (i) = '1' then
        tkeep_c := i;
       end if;
    end loop;    
    return tkeep_c;
end function;

signal cnt_timer : std_logic_vector (31 downto 0) := (others => '0');
constant timer_1s: integer := 30;--_000_000;

signal cnt_num_addr          : integer := 0;
signal cnt_rd_num_addr       : integer := 0;
signal awr_state             : integer := 0;
signal wr_state              : integer := 0;
signal cnt_awr_period        : integer := 0;
signal cnt_wr_period         : integer := 0;
constant increamentation_def   : integer := 400;
signal ar_state              : integer := 0;
signal cnt_ar_period         : integer := 0;

signal cnt_time              : std_logic_vector (31 downto 0) := (others => '0');
signal cnt_number_read       : std_logic_vector (31 downto 0) := (others => '0');
signal cnt_clk_delay_read    : std_logic_vector (31 downto 0) := (others => '0');
signal first_read            : std_logic := '0';

begin

count_number_of_read_req: process(clk)
begin
    if rising_edge(clk) then
        if reset = '1' then
            cnt_number_read <= (others => '0');
        elsif s_axi_arvalid = '1' and s_axi_arready = '1' then
            cnt_number_read <= cnt_number_read + 1;
        end if;
    end if;
end process;

clk <= ui_clk;
reset <= reset_rtl;
resetn <= not reset;

--S00_AXIS_TVALID <= rx_axis_tvalid;
--S00_AXIS_TLAST  <= rx_axis_tlast;
--S00_AXIS_TDATA  <= rx_axis_tdata;
--S00_AXIS_TSTRB  <= rx_axis_tkeep;
--rx_axis_tready  <= S00_AXIS_TREADY;

cnt_byte_pr: process(rx_axis_aclk)
begin
    if rising_edge(rx_axis_aclk) then
        if reset = '1' then
            cnt_byte <= (others => '0');
        elsif S00_AXIS_TVALID = '1' and S00_AXIS_TREADY = '1' and S00_AXIS_TLAST = '0' then
            cnt_byte <= cnt_byte + 1;
        elsif S00_AXIS_TVALID = '1' and S00_AXIS_TREADY = '1' and S00_AXIS_TLAST = '1' then
            cnt_byte <= (others => '0');
        end if;
    end if;
end process;

awlen_pr: process(rx_axis_aclk)
begin
    if rising_edge(rx_axis_aclk) then
        if reset = '1' then
            awlen <= (others => '0');
        elsif S00_AXIS_TVALID = '1' and S00_AXIS_TREADY = '1' and S00_AXIS_TLAST = '1' then
            awlen <= "000" & cnt_byte (7 downto 3);
        end if;
    end if;
end process;

counter_timer_pr: process(clk)
begin
    if rising_edge(clk) then
        if reset = '1' then
            cnt_timer <= (others => '0');
        elsif init_calib_complete = '1' then
            if cnt_timer < timer_1s then
                cnt_timer <= cnt_timer + 1;
            else
                cnt_timer <= (others => '0');
            end if;    
        end if;
    end if;
end process;

M00_AXIS_TREADY <= S_AXI_wready;

fifo_wr_en <= S_AXI_awvalid;
fifo_din (8 + 31 - 1 downto 0)  <= S_AXI_awlen & S_AXI_awaddr;

rd_en: process(clk)
begin
    if rising_edge(clk) then
        if reset = '1' then
            fifo_rd_en <= '0';
        elsif cnt_timer = timer_1s - 1 and fifo_empty = '0' then
            fifo_rd_en <= '1';
        else
            fifo_rd_en <= '0';
        end if;
    end if;
end process;

arid_control: process(clk)
begin
    if rising_edge(clk) then
        if reset = '1' then
            arid <= (others => '0');
        elsif arvalid = '1' then
            arid <= arid + 2;
        end if;
    end if;
end process;

awid_control: process(clk)
begin
    if rising_edge(clk) then
        if reset = '1' then
            awid <= (others => '0');
        elsif awvalid = '1' and s_axi_awready = '1' then
            awid <= awid + 1;
        end if;
    end if;
end process;


bready_control: process(clk)
begin
    if rising_edge(clk) then
        if reset = '1' then
            bready <= '0';
        elsif s_axi_wlast = '1' and s_axi_wvalid = '1' and s_axi_wready = '1' then
            bready <= '1';
        elsif s_axi_bvalid = '1' then
            bready <= '0';
        end if;
    end if;
end process;

--rready_control: process(clk)
--begin
--    if rising_edge(clk) then
--        if reset = '1' then
--            rready <= '0';
--        elsif s_axi_rlast = '1' and s_axi_rvalid = '1' and s_axi_rready = '1' then
--            rready <= '0';
--        elsif s_axi_arvalid = '1' and s_axi_arready = '1' and s_axi_rready = '0' then
            rready <= '1';
--        end if;
--    end if;
--end process;

awvalid_pr: process(clk)
begin
    if rising_edge(clk) then
        if reset = '1' then
            awr_state <= 0;
        else
            case awr_state is
                when 0 =>
                    if init_calib_complete_0 = '1' then
                        awr_state <= 1;
                    end if;
                when 1 =>
                    if cnt_wr_period < timer_1s then
                        cnt_wr_period <= cnt_wr_period + 1;
                    else
                        cnt_wr_period <= 0;
                        awr_state <= 2;
                    end if;
                when 2 =>
                    if awvalid = '0' and s_axi_awready = '1' then
                        awvalid <= '1';
                    elsif awvalid = '1' and s_axi_awready = '1' then
                        awvalid <= '0';
                        awr_state <= 1;
                    end if;
                when others =>
                    awr_state <= 0;
            end case;
        end if;    
    end if;
end process;

wvalid_control: process(clk)
begin
    if rising_edge(clk) then
        if reset = '1' then
            wr_state <= 0;
        else
            case wr_state is
                when 0 =>
                    if awvalid = '1' and s_axi_awready = '1' then
                        wr_state <= 1;
                    end if;
                when 1 =>
                    if s_axi_wready = '1' then
                        wvalid <= '1';
                        if cnt_block < number_of_block - 1 then
                            cnt_block <= cnt_block + 1;
                            wdata     <= wdata + 1;
                        else
                            wdata     <= wdata + 1;
                            cnt_block <= 0;
                            wlast <= '1';
                            wr_state <= 2;
                        end if;
                    end if;
                when 2 =>
                    if s_axi_wready = '1' then
                        wvalid <= '0';
                        wlast <= '0';
                        wr_state <= 0;
                        if cnt_num_addr < 15 then
                            cnt_num_addr <= cnt_num_addr + 1;
                        else
                            wr_state <= 3;
                            cnt_num_addr <= 0;
                        end if;
                    end if;
                when others =>
                    wr_state <= 3;
            end case;    
        end if;
    end if;
end process;

awaddr_pr: process(clk)
begin
    if rising_edge(clk) then
        if reset = '1' then
            awaddr <= (others => '0');
        elsif awvalid = '1' and s_axi_awready = '1' then
            awaddr <= awaddr + increamentation_def;
        end if;
    end if;
end process;

wstrb <= (others => '1');

araddr_pr: process(clk)
begin
    if rising_edge(clk) then
        if reset = '1' then
            araddr <= (others => '0');
        elsif arvalid = '1' and araddr < awaddr then
            araddr <= araddr + increamentation_def;
        elsif arvalid = '1' and araddr <= awaddr then           
            araddr <= (others => '0');
        end if;
    end if;
end process;

arvalid_control: process(clk)
begin
    if rising_edge(clk) then
        if reset = '1' then
            ar_state <= 0;
        else
            case ar_state is
                when 0 =>
                    if wr_state = 3 then
                        ar_state <= 1;
                    end if;   
                when 1 =>
                     if s_axi_arready = '1' then
                        arvalid <= '1';
                        ar_state <= 2;
                     end if;
                when 2 =>
                    arvalid <= '0';
--                    if cnt_rd_num_addr < 2 then
--                        cnt_rd_num_addr <= cnt_rd_num_addr + 1;
--                        ar_state        <= 2;
--                    else                    
                        ar_state <= 0;
--                    end if;
                when others => 
                    ar_state <= 0;
            end case;
        end if;
    end if;
end process;

S_AXI_awlock    <= '0';
S_AXI_awprot    <= (others => '0');
S_AXI_awcache   <= (others => '0');
S_AXI_awqos     <= (others => '0');
S_AXI_awburst   <= "01";
S_AXI_awsize    <= "110";
S_AXI_awid      <= awid;
S_AXI_awvalid   <= awvalid;
S_AXI_awaddr    <= awaddr;
S_AXI_awlen     <= x"04";
S_AXI_wvalid    <= wvalid;
S_AXI_wlast     <= wlast;
S_AXI_wstrb     <= wstrb;
S_AXI_wdata     <= wdata;
S_AXI_bready    <= bready;

S_AXI_arid      <= arid;
S_AXI_araddr    <= araddr;
S_AXI_arlen     <= x"04";
S_AXI_arsize    <= "110";
S_AXI_arburst   <= "01";
S_AXI_arlock    <= '0';
S_AXI_arcache   <= (others => '0');
S_AXI_arprot    <= (others => '0');
S_AXI_arqos     <= (others => '0');
S_AXI_arvalid   <= arvalid;
S_AXI_rready    <= rready;

S_AXI_0_araddr          <= S_AXI_araddr         ;
S_AXI_0_arburst         <= S_AXI_arburst        ;
S_AXI_0_arcache         <= S_AXI_arcache        ;
S_AXI_0_arid            <= S_AXI_arid           ;
S_AXI_0_arlen           <= S_AXI_arlen          ;
S_AXI_0_arlock          <= S_AXI_arlock         ;
S_AXI_0_arprot          <= S_AXI_arprot         ;
S_AXI_0_arqos           <= S_AXI_arqos          ;
S_AXI_arready           <= S_AXI_0_arready      ;
S_AXI_0_arsize          <= S_AXI_arsize         ;
S_AXI_0_arvalid         <= S_AXI_arvalid        ;
S_AXI_0_awaddr          <= S_AXI_awaddr         ;
S_AXI_0_awburst         <= S_AXI_awburst        ;
S_AXI_0_awcache         <= S_AXI_awcache        ;
S_AXI_0_awid            <= S_AXI_awid           ;
S_AXI_0_awlen           <= S_AXI_awlen          ;
S_AXI_0_awlock          <= S_AXI_awlock         ;
S_AXI_0_awprot          <= S_AXI_awprot         ;
S_AXI_0_awqos           <= S_AXI_awqos          ;
S_AXI_awready           <= S_AXI_0_awready      ;
S_AXI_0_awsize          <= S_AXI_awsize         ;
S_AXI_0_awvalid         <= S_AXI_awvalid        ;
S_AXI_bid               <= S_AXI_0_bid          ;
S_AXI_0_bready          <= S_AXI_bready         ;
S_AXI_bresp             <= S_AXI_0_bresp        ;
S_AXI_bvalid            <= S_AXI_0_bvalid       ;
S_AXI_rdata             <= S_AXI_0_rdata        ;
S_AXI_rid               <= S_AXI_0_rid          ;
S_AXI_rlast             <= S_AXI_0_rlast        ;
S_AXI_0_rready          <= S_AXI_rready         ;
S_AXI_rresp             <= S_AXI_0_rresp        ;
S_AXI_rvalid            <= S_AXI_0_rvalid       ;
S_AXI_0_wdata           <= S_AXI_wdata          ;
S_AXI_0_wlast           <= S_AXI_wlast          ;
S_AXI_wready            <= S_AXI_0_wready       ;
S_AXI_0_wstrb           <= S_AXI_wstrb          ;
S_AXI_0_wvalid          <= S_AXI_wvalid         ;
init_calib_complete     <= init_calib_complete_0;
reset_rtl               <= reset_rtl_0          ;
ui_clk                  <= ui_clk_0             ;



end Behavioral;
