#import "template.typ": *

#show: project.with(
  title: "Computer Organization Homework 4",
  authors: (
    (
      name: "陈贲(12212231)",
    ),
  ),
)

#problem[
#set enum(numbering: "a)")
	For a 256 bytes data cache, 8 word per block, direct mapped design with a 32-bit address, beginning from power on, the following byte-addressed cache references are recorded.
#align(center, table(
	columns: 13,
	[Hex], [00], [04], [10], [84], [E8], [A0], [400], [1E], [8C], [C1C], [B4], [884],
	[Dec], [0], [4], [16], [132], [232], [160], [1024], [30], [140], [3100], [180], [2180]
))
 + Calculate the range of bits used for Tag, index and offset.
 + For each reference, list (1) its tag, and offset, (2) whether it is a hit or a miss, and (3) which bytes were replaced.
 + What is the hit ratio?
 + List the final state of the cache, with each valid entry represented as a record of \<index, tag, data\>.
]

#solution[
#show table.cell.where(y: 0) : strong
#set enum(numbering: "a)")
	+ Since the cache is 256 bytes and each block is 8 words, the cache has 8 blocks and 32 bytes per block and the rest of the bits in address are used for tag. Thus, offset: 4-0, index: 7-5, tag: 31-8.

	+ The list is shown below #align(center, table(columns: 6, fill: (x, y) => if y == 0 {luma(200)}, inset: (x : 1em), table.header("Address", "Tag", "Index", "Offset", "Hit/Miss", "Replaced"), [0x00], [0x0], [0x0], [0x00], [Miss], [], [0x04], [0x0], [0x0], [0x04], [Hit], [], [0x10], [0x0], [0x0], [0x10], [Hit], [], [0x84], [0x0], [0x4], [0x04], [Miss], [], [0xE8], [0x0], [0x7], [0x08], [Miss], [], [0xA0], [0x0], [0x5], [0x00], [Miss], [], [0x400], [0x4], [0x0], [0x00], [Miss], [0x00-0x1F], [0x1E], [0x0], [0x0], [0x1E], [Miss], [0x400-0x41F], [0x8C], [0x0], [0x4], [0x0C], [Hit], [], [0xC1C], [0xC], [0x0], [0x1C], [Miss], [0x00-0x1F], [0xB4], [0x0], [0x5], [0x14], [Hit], [], [0x884], [0x8], [0x4], [0x04], [Miss], [0x80-0x9F]))
	+ The hit rate is $4 slash 12 = 33.3% $
	+ The final cache is #align(center, table(columns: 2, inset: (x : 1em), table.header("<index, tag, data>", "<index, tag, data>"), "<0, C, 0xC00-0xC1F>", "<4, 8, 0x880-0x89F>", "<5, 0, 0x0A0-0x0BF>", "<7, 0, 0x0E0-0x0FF>"))
]

#problem[
#set enum(numbering: "a)")
This exercise examines the effect of different cache designs, specifically comparing associative caches to the direct-mapped caches. For these exercises, refer to the sequence of word address shown blow.
#align(center, table(
	columns: 14,
	[0x03], [0xB4], [0x2B], [0x02], [0xBE], [0x58], [0xBF], [0x0E], [0x1F], [0xB5], [0xBF], [0xBA], [0x2E], [0xCE]
))
  + For a three-way set associative cache with two-word blocks and a total size of 48 words. Which bits represent index and which bits represent tag in 32 bit memory adddress.
	+ Using the given sequence, show the final cache contents for a three way set associative cache with two word blocks and a total size of 24 words. Use LRU replacement. For each reference identify the index bits, the tag bits, the block of set bits, and if it is a hit or a miss. For invalid blocks use NA as content.
	+ For a fully associative cache with one word blocks and a total size of 8 words, using the given sequence, show the final cache contents for a fully associative cache with one word blocks and a total size of 8 words. Use LRU replacement. For each reference identify the index bits, the tag bits, and if it is a hit or a miss.
]

#solution[
#set enum(numbering: "a)")
#show table.cell.where(y: 0) : strong
	+ Since the cache is 24 words and each block is 2 words, the cache has 12 blocks and 4 groups of 3 blocks. Thus, offset: 0, index: 2-1, tag: 31-3.
	+ In the three ways, $D(x)$ is the data of index $x$ and the order is by recent access #align(center, table(columns: 8, align: horizon, fill: (x, y) => if y == 0 {luma(200)}, table.header("Address", "Tag", "Index", "Offset", "Hit/Miss", "Way 0", "Way 1", "Way 2"), [0x03], [0x00], [0x1], [0x1], [Miss], [D(1)=0x02], [], [], [0xB4], [0x17], [0x2], [0x0], [Miss], [D(1)=0x02 \ D(2)=0xB4], [], [], [0x2B], [0x5], [0x1], [0x1], [Miss], [D(1)=0x02 \ D(2)=0xB4], [D(1)=0x2A], [], [0x02], [0x00], [0x1], [0x0], [Hit], [D(1)=0x02 \ D(2)=0xB4], [D(1)=0x2A], [], [0xBE], [0x18], [0x3], [0x0], [Miss], [D(1)=0x02 \ D(2)=0xB4 \ D(3)=0xBE], [D(1)=0x2A], [], [0x58], [0x16], [0x0], [0x0], [Miss], [D(1)=0x02 \ D(2)=0xB4 \ D(3)=0xBE \ D(0)=0x58], [D(1)=0x2A], [], [0xBF], [0x18], [0x3], [0x1], [Hit], [D(1)=0x02 \ D(2)=0xB4 \ D(3)=0xBE \ D(0)=0x58], [D(1)=0x2A], [], [0x0E], [0x02], [0x3], [0x0], [Miss], [D(1)=0x02 \ D(2)=0xB4 \ D(3)=0xBE \ D(0)=0x58], [D(1)=0x2A \ D(3)=0x0E], [], [0x1F], [0x4], [0x3], [0x1], [Miss], [D(1)=0x02 \ D(2)=0xB4 \ D(3)=0xBE \ D(0)=0x58], [D(1)=0x2A \ D(3)=0x0E], [D(3)=0x1F], [0xB5], [0x17], [0x2], [0x1], [Hit], [D(1)=0x02 \ D(2)=0xB4 \ D(3)=0xBE \ D(0)=0x58], [D(1)=0x2A \ D(3)=0x0E], [D(3)=0x1F], [0xBF], [0x18], [0x3], [0x1], [Hit], [D(1)=0x02 \ D(2)=0xB4 \ D(3)=0xBE \ D(0)=0x58], [D(1)=0x2A \ D(3)=0x0E], [D(3)=0x1F], [0xBA], [0x17], [0x1], [0x0], [Miss], [D(1)=0x02 \ D(2)=0xB4 \ D(3)=0xBE \ D(0)=0x58], [D(1)=0x2A \ D(3)=0x0E], [D(3)=0x1F \ D(1)=0xBA], [0x2E], [0x06], [0x3], [0x0], [Miss], [D(1)=0x02 \ D(2)=0xB4 \ D(0)=0x58 \ D(3)=0x2E], [D(1)=0x2A \ D(3)=0x0E], [D(3)=0x1F \ D(1)=0xBA], [0xCE], [0x1A], [0x3], [0x0], [Miss], [D(1)=0x02 \ D(2)=0xB4 \ D(0)=0x58 \ D(3)=0x2E], [D(1)=0x2A \ D(3)=0xCE], [D(3)=0x1F \ D(1)=0xBA]))
	+ The final cache is shown at the last line, index bits and offset bits are all zero #align(center, table(columns: 4, align: horizon, inset: (x: 1.5em), fill: (x, y) => if y == 0 {luma(200)}, table.header("Address", "Tag", "Hit/Miss", "Cache"), [0x03], [0x03], [Miss], [03], [0xB4], [0xB4], [Miss], [03, B4], [0x2B], [0x2B], [Miss], [03, B4, 2B], [0x02], [0x02], [Miss], [03, B4, 2B, 02], [0xBE], [0xBE], [Miss], [03, B4, 2B, 02, BE], [0x58], [0x58], [Miss], [03, B4, 2B, 02, BE, 58], [0xBF], [0xBF], [Miss], [03, B4, 2B, 02, BE, 58, BF], [0x0E], [0x0E], [Miss], [03, B4, 2B, 02, BE, 58, BF, 0E], [0x1F], [0x1F], [Miss], [B4, 2B, 02, BE, 58, BF, 0E, 1F], [0xB5], [0xB5], [Miss], [2B, 02, BE, 58, BF, 0E, 1F, B5], [0xBF], [0xBF], [Hit], [2B, 02, BE, 58, 0E, 1F, B5, BF], [0xBA], [0xBA], [Miss], [02, BE, 58, 0E, 1F, B5, BF, BA], [0x2E], [0x2E], [Miss], [BE, 58, 0E, 1F, B5, BF, BA, 2E], [0xCE], [0xCE], [Miss], [58, 0E, 1F, B5, BF, BA, 2E, CE]))
]

#problem[
#set enum(numbering: "a)")
	Multilevel caching is an important technique to overcome the limited amount of space that a first-level cache can provide while still maintaining its speed. Consider a processor with the following parameters and the miss rate are global miss:
	#align(center, table(
		columns: 8,
		align: horizon,
		"CPI", "Speed", [Memory \ Delay], [L1 \ Miss Rate], [Direct L2 \ Speed], [Direct L2 \ Miss Rate], [8-Way L2 \ Speed], [8-Way L2 \ Miss Rate],
		[1.5], [2GHz], [100ns], [7%], [12 cycles], [3.5%], [28 cycles], [1.5%]
	))
	Calculate the CPI for the processor in the table using:
	+ only a first-level cache
	+ a second-level direct-mapped cache, and
	+ a second-level 8-way set associative cache.
	+ How do the CPI calculated in b) change if all miss rates in table become local miss rate?
]

#solution[
#set enum(numbering: "a)")
	The memory delay is 100 ns, which is $100 slash (1" s" slash 2" GHz") = 200$ clocks.
	+ The CPI for the first-level cache is $1.5 + 7% times 200 = 15.5$
	+ For the second-level direct-mapped cache is $1.5 + 7% times 12 + 3.5% times 200 = 9.34 $
	+ For the second-level 8-way set associative cache is $1.5 + 7% times 28 + 1.5% times 200 = 6.46$
	+ The CPI will becomes $1.5 + 7% times (12 + 3.5% times 200) = 2.83$
]

#problem[
#set enum(numbering: "a)")
	This exercise examines the single error correcting, double error detecting (SEC/DED) Hamming code.
	+ What is the minimum number of parity bits required to protect a 128-bit word using the SEC/DED code?
	+ Consider a SEC code that protects 8 bit words with 4 parity bits. If we read the value 0x375, is there an error? If so, correct the error.
]

#solution[
#set enum(numbering: "a)")
#show table.cell.where(x: 0) : strong
	+ Solving $2^r gt.eq n + r + 1$ with $n = 128$ will get $r = 8$, then we one more bit for SEC/DED, so 9 bits are all we need for parity.
	+ The data in binary presentation is #align(center, table(columns: 13, inset: (x: 0.5em), [Position], [12], [11], [10], [9], [8], [7], [6], [5], [4], [3], [2], [1], [Bit], [0], [0], [1], [1], [*0*], [1], [1], [1], [*0*], [1], [*0*], [*1*]))
	For the first parity bit, $1 xor 1 xor 1 xor 1 xor 1 xor 0 = 1$, no error.
	
	For the second parity bit, $0 xor 1 xor 1 xor 1 xor 0 xor 1 = 0$, error detected.

	For the third parity bit, $0 xor 1 xor 1 xor xor 1 xor 0 = 1$, no error.

	For the fourth parity bit, $0 xor 0 xor 1 xor 1 xor 0 = 0$, error detected.

	The error bit is 0101, which is 5 in decimal, so the correct data is 0x365.
]

#problem[
#set enum(numbering: "a)")
	Virtual memory uses a page table to track the mapping of virtual addresses to physical addresses (in unit of byte). This exercise shows how this table must be updated as addresses are accessed. The following data constitute a stream of virtual byte addresses as seen on a system. Assume 4 KiB pages, a four entry fully associative TLB, and true LRU replacement. If pages must be brought in from disk, increment the next largest page number. i.e. If the current maximum physical page number is 12, then the next physical page brought in from disk has a page number of 13.
	#align(center, table(
		columns: 8,
		inset: (x: 0.8em),
		[*Decimal*], [4669], [2227], [13916], [34587], [48870], [12608], [49225], [*Hex*], [0x123D], [0x08B3], [0x365C], [0x871B], [0xBEE6], [0x3140], [0xC049]
	))
	TLB
	#align(center, table(
		columns: 4,
		inset: (x: 1em),
		fill: (x, y) => if y == 0 {luma(200)},
		[*Valid*], [*Tag*], [*Physical Page*], [*Time Since Last Access*],
		[1], [0xB], [12], [4],
		[1], [0x7], [4], [1],
		[1], [0x3], [6], [3],
		[0], [0x4], [9], [7]
	))
	Page Table
	#align(center, table(
		columns: 2,
		inset: (x: 2em),
		fill: (x, y) => if y == 0 {luma(200)},
		[*Valid*], [*Physical Page or in Disk*],
		[1], [5],
		[0], [Disk],
		[0], [Disk],
		[1], [6],	
		[1], [9],
		[1], [11],
		[0], [Disk],
		[1], [4],
		[0], [Disk],
		[0], [Disk],
		[1], [3],
		[1], [12]
	))
	+ For each access shown above, fill up the following table, and then show the final of the TLB and page table.
	+ Fill up the following table for each access, but this time use 4KiB pages and a two-way set associative TLB, and then show the final state of the TLB (Assume the first two rows of previous TLB are set-index 0 and last two rows are set-index 1, and true LRU replacement
]

#solution[
#show table.cell.where(y: 0) : strong
#set enum(numbering: "a)")
	+ The table is shown below #align(center, table(columns: 3, inset: (x: 1em), fill: (x, y) => if y == 0 {luma(200)}, table.header("Address", "Virtual Page", "TLB Hit/Miss, Page Table Hit/Miss, Page fault"), [0x123D], [0x1], [TLB Miss, PT Hit, Page Fault],
	[0x08B3], [0x0], [TLB Miss, PT Hit, No Page Fault],
	[0x365C], [0x3], [TLB Hit, PT Hit, No Page Fault],
	[0x871B], [0x8], [TLB Miss, PT Hit, Page Fault],
	[0xBEE6], [0xB], [TLB Miss, PT Miss, Page Fault],
	[0x3140], [0x3], [TLB Hit, PT Hit, No Page Fault],
	[0xC049], [0xC], [TLB Miss, PT Miss, Page Fault]))
	The final state of TLB would be
	#align(center, table(
		columns: 4,
		inset: (x: 1em),
		fill: (x, y) => if y == 0 {luma(200)},
		[*Valid*], [*Tag*], [*Physical Page*], [*Time Since Last Access*],
		[1], [0xC], [16], [0],
		[1], [0x8], [14], [2],
		[1], [0x3], [6], [3],
		[1], [0xB], [15], [1]
	))
	And the final state of page table would be #align(center, table(
		columns: 2,
		inset: (x: 2em),
		fill: (x, y) => if y == 0 {luma(200)},
		[*Valid*], [*Physical Page or in Disk*],
		[1], [5],
		[1], [13],
		[0], [Disk],
		[1], [6],	
		[1], [9],
		[1], [11],
		[0], [Disk],
		[1], [4],
		[1], [14],
		[0], [Disk],
		[1], [3],
		[1], [12],
		[1], [15],
		[1], [16]
	))
	b)  The table is shown below #align(center, table(columns: 5, fill: (x, y) => if y == 0 {luma(200)}, table.header("Address", "Virtual Page", "Index", "Tag", "TLB Hit/Miss, PT Hit/Miss, Page fault"), [0x123D], [0x1], [0x1], [0x0], [TLB Miss, PT Hit, Page Fault],
	[0x08B3], [0x0], [0x0], [0x0], [TLB Miss, PT Hit, No Page Fault],
	[0x365C], [0x3], [0x1], [0x1], [TLB Hit, PT Hit, No Page Fault],
	[0x871B], [0x8], [0x0], [0x4], [TLB Miss, PT Hit, Page Fault],
	[0xBEE6], [0xB], [0x1], [0x5], [TLB Miss, PT Miss, Page Fault],
	[0x3140], [0x3], [0x1], [0x1], [TLB Hit, PT Hit, No Page Fault],
	[0xC049], [0xC], [0x0], [0x6], [TLB Miss, PT Miss, Page Fault]))
	so the final state of TLB would be
	#align(center, table(
		columns: 4,
		inset: (x: 1em),
		fill: (x, y) => if y == 0 {luma(200)},
		[*Valid*], [*Tag*], [*Physical Page*], [*Time Since Last Access*],
		[1], [0xC], [16], [0],
		[1], [0x8], [14], [3],
		[1], [0x3], [6], [1],
		[1], [0xB], [15], [2]
	))
]