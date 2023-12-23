# CS305 Computer Networks

## About

**Instructor:** `Ming TANG (唐茗)`

**TA:** `Qing WANG (王晴)`

**Semester:** `2023 Fall`

**Textbook:** `Computer Networking A Top Down Approach, 7th`

## Content

Folder structure

- [Assignment](./Assignment): Includes two parts
  - [Programming](./Assignment/Programming): Coding practices ~~compact version of project~~
  - [Theory](./Assignment/Theory): Practices on the understanding of network concepts
- [Lab](./Lab): Learning network by doing
- [Slides](./Slides): Lecture slides ~~exclude lab slides since they won't appear in exams~~
- [Project](./Project): Group work to build a HTTP server

## Hands-on Practices

**Lab** section includes the completed reports, recommended for reference.

**Theory assignment** section includes my answers and reference solutions.

**Programming assignment **changes always, not recommended for reference. But you can check my thoughts and techniques.

The coding practices use `Python` and it's suggested to start learning socket programming eariler.

Lab | Content| Assignment | Content 
-- | --|-- |-- 
lab1 | [Basic commands related to network](Lab/lab1/lab1.md) | Theory 1 | [Core & Application](Assignment/Theory/A1/assignment1.pdf) 
lab2 | [Python and Wireshark](Lab/lab2/lab2.md) | Theory 2 |[Transport](Assignment/Theory/A2/assignment2.pdf)
lab3 | [HTTP and HTTPS](Lab/lab3/lab3.md) | Theory 3 |[Network](Assignment/Theory/A3/cs305_homework3.pdf)
lab4 | [HTTP and HTTPS Advanced](Lab/lab4/lab4.md) | Programming 1 |[SMTP POP3 server](Assignment/Programming/PA1_for_CS305_2023_Fall_SMTP_Server/src/report.md)
lab5 | [DNS](Lab/lab5/lab5.md) | Programming 2 |[Topoloty on ENSP](Assignment/Programming/PA2)
lab6 | [CDN & WebSocket](Lab/lab6/lab6.md) | |
lab7 | [TCP/UDP](Lab/lab7/lab7.md) | Project |[HTTP File Manager](Project/)
lab8 | [TCP Congestion Control](Lab/lab8/lab8.md) |  |
lab9 | [Network Simulation](Lab/lab9/lab9.md) | |
lab10 | [Static Routing](Lab/lab10/lab20.md) | |
lab11 | [IP/ICMP](Lab/lab11/lab11.md) | |
lab12 | [RIP & OCSP](Lab/lab12/lab12.md) | |

## Theory

The course introduces the OSI 5 Layer concept

| Layer        | Content                                                      | Note                                                         |
| ------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| Network Core | Packet Switching<br>Circuit Switching<br>Latency and Throughput | Computing Latency                                            |
| Application  | HTTP/HTTPS<br>SMTP<br>POP<br>DNS<br>P2P Bittorrent<br>Video Stream | Formats, Characteristics and Features.                       |
| Transport    | Reliable Data Transfer Concept<br>TCP<br>UDP                 | **Hardest Part** Focus on the details of RDT and TCP. Congestion control algorithm |
| Network      | Router<br/>Data Plane (IP, NAT)<br>Control Plane (Routing, OSPF, BGP)<br/>ICMP<br>SDN |                                                              |
| Link         | Switch<br>LAN<br>Addressing<br>Wireless                      |                                                              |
