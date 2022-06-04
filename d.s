
vmlinux:     file format elf64-littleriscv


Disassembly of section .text:

ffffffe000200000 <_skernel>:
ffffffe000200000:	00006117          	auipc	sp,0x6
ffffffe000200004:	00010113          	mv	sp,sp
ffffffe000200008:	fbf0031b          	addiw	t1,zero,-65
ffffffe00020000c:	01f31313          	slli	t1,t1,0x1f
ffffffe000200010:	00000297          	auipc	t0,0x0
ffffffe000200014:	08428293          	addi	t0,t0,132 # ffffffe000200094 <_traps>
ffffffe000200018:	006282b3          	add	t0,t0,t1
ffffffe00020001c:	10529073          	csrw	stvec,t0
ffffffe000200020:	000402b7          	lui	t0,0x40
ffffffe000200024:	1002a073          	csrs	sstatus,t0
ffffffe000200028:	3b9010ef          	jal	ra,ffffffe000201be0 <setup_vm_first>
ffffffe00020002c:	034000ef          	jal	ra,ffffffe000200060 <relocate>
ffffffe000200030:	530000ef          	jal	ra,ffffffe000200560 <mm_init>
ffffffe000200034:	66d010ef          	jal	ra,ffffffe000201ea0 <setup_vm_second>
ffffffe000200038:	7fc000ef          	jal	ra,ffffffe000200834 <task_init>
ffffffe00020003c:	10017073          	csrci	sstatus,2
ffffffe000200040:	00000893          	li	a7,0
ffffffe000200044:	00000813          	li	a6,0
ffffffe000200048:	00989537          	lui	a0,0x989
ffffffe00020004c:	6805051b          	addiw	a0,a0,1664
ffffffe000200050:	00000073          	ecall
ffffffe000200054:	02000293          	li	t0,32
ffffffe000200058:	1042a073          	csrs	sie,t0
ffffffe00020005c:	75d0106f          	j	ffffffe000201fb8 <start_kernel>

ffffffe000200060 <relocate>:
ffffffe000200060:	fbf0029b          	addiw	t0,zero,-65
ffffffe000200064:	01f29293          	slli	t0,t0,0x1f
ffffffe000200068:	005080b3          	add	ra,ra,t0
ffffffe00020006c:	00510133          	add	sp,sp,t0
ffffffe000200070:	00007397          	auipc	t2,0x7
ffffffe000200074:	f9038393          	addi	t2,t2,-112 # ffffffe000207000 <first_page_table>
ffffffe000200078:	00c3d393          	srli	t2,t2,0xc
ffffffe00020007c:	fff0031b          	addiw	t1,zero,-1
ffffffe000200080:	03f31313          	slli	t1,t1,0x3f
ffffffe000200084:	00736333          	or	t1,t1,t2
ffffffe000200088:	18031073          	csrw	satp,t1

ffffffe00020008c <relocate_after_set_satp>:
ffffffe00020008c:	12000073          	sfence.vma
ffffffe000200090:	00008067          	ret

ffffffe000200094 <_traps>:
ffffffe000200094:	140292f3          	csrrw	t0,sscratch,t0
ffffffe000200098:	00029663          	bnez	t0,ffffffe0002000a4 <_L1>
ffffffe00020009c:	140292f3          	csrrw	t0,sscratch,t0
ffffffe0002000a0:	00c0006f          	j	ffffffe0002000ac <_save_context>

ffffffe0002000a4 <_L1>:
ffffffe0002000a4:	140292f3          	csrrw	t0,sscratch,t0
ffffffe0002000a8:	14011173          	csrrw	sp,sscratch,sp

ffffffe0002000ac <_save_context>:
ffffffe0002000ac:	ee810113          	addi	sp,sp,-280 # ffffffe000205ee8 <_sbss+0xee8>

ffffffe0002000b0 <_save_ord_regs>:
ffffffe0002000b0:	00013023          	sd	zero,0(sp)
ffffffe0002000b4:	00113423          	sd	ra,8(sp)
ffffffe0002000b8:	00213823          	sd	sp,16(sp)
ffffffe0002000bc:	00313c23          	sd	gp,24(sp)
ffffffe0002000c0:	02413023          	sd	tp,32(sp)
ffffffe0002000c4:	02513423          	sd	t0,40(sp)
ffffffe0002000c8:	02613823          	sd	t1,48(sp)
ffffffe0002000cc:	02713c23          	sd	t2,56(sp)
ffffffe0002000d0:	04813023          	sd	s0,64(sp)
ffffffe0002000d4:	04913423          	sd	s1,72(sp)
ffffffe0002000d8:	04a13823          	sd	a0,80(sp)
ffffffe0002000dc:	04b13c23          	sd	a1,88(sp)
ffffffe0002000e0:	06c13023          	sd	a2,96(sp)
ffffffe0002000e4:	06d13423          	sd	a3,104(sp)
ffffffe0002000e8:	06e13823          	sd	a4,112(sp)
ffffffe0002000ec:	06f13c23          	sd	a5,120(sp)
ffffffe0002000f0:	09013023          	sd	a6,128(sp)
ffffffe0002000f4:	09113423          	sd	a7,136(sp)
ffffffe0002000f8:	09213823          	sd	s2,144(sp)
ffffffe0002000fc:	09313c23          	sd	s3,152(sp)
ffffffe000200100:	0b413023          	sd	s4,160(sp)
ffffffe000200104:	0b513423          	sd	s5,168(sp)
ffffffe000200108:	0b613823          	sd	s6,176(sp)
ffffffe00020010c:	0b713c23          	sd	s7,184(sp)
ffffffe000200110:	0d813023          	sd	s8,192(sp)
ffffffe000200114:	0d913423          	sd	s9,200(sp)
ffffffe000200118:	0da13823          	sd	s10,208(sp)
ffffffe00020011c:	0db13c23          	sd	s11,216(sp)
ffffffe000200120:	0fc13023          	sd	t3,224(sp)
ffffffe000200124:	0fd13423          	sd	t4,232(sp)
ffffffe000200128:	0fe13823          	sd	t5,240(sp)
ffffffe00020012c:	0ff13c23          	sd	t6,248(sp)

ffffffe000200130 <_save_special_regs>:
ffffffe000200130:	141022f3          	csrr	t0,sepc
ffffffe000200134:	10513023          	sd	t0,256(sp)
ffffffe000200138:	140012f3          	csrrw	t0,sscratch,zero
ffffffe00020013c:	10513423          	sd	t0,264(sp)
ffffffe000200140:	143022f3          	csrr	t0,stval
ffffffe000200144:	10513823          	sd	t0,272(sp)

ffffffe000200148 <_call_trap_handler>:
ffffffe000200148:	14202573          	csrr	a0,scause
ffffffe00020014c:	00010593          	mv	a1,sp
ffffffe000200150:	48c010ef          	jal	ra,ffffffe0002015dc <trap_handler>

ffffffe000200154 <_restore_context>:
ffffffe000200154:	11013283          	ld	t0,272(sp)
ffffffe000200158:	14329073          	csrw	stval,t0
ffffffe00020015c:	10813283          	ld	t0,264(sp)
ffffffe000200160:	14029073          	csrw	sscratch,t0
ffffffe000200164:	10013283          	ld	t0,256(sp)
ffffffe000200168:	14129073          	csrw	sepc,t0

ffffffe00020016c <_restore_ord_regs>:
ffffffe00020016c:	00013003          	ld	zero,0(sp)
ffffffe000200170:	00813083          	ld	ra,8(sp)
ffffffe000200174:	01013103          	ld	sp,16(sp)
ffffffe000200178:	01813183          	ld	gp,24(sp)
ffffffe00020017c:	02013203          	ld	tp,32(sp)
ffffffe000200180:	02813283          	ld	t0,40(sp)
ffffffe000200184:	03013303          	ld	t1,48(sp)
ffffffe000200188:	03813383          	ld	t2,56(sp)
ffffffe00020018c:	04013403          	ld	s0,64(sp)
ffffffe000200190:	04813483          	ld	s1,72(sp)
ffffffe000200194:	05013503          	ld	a0,80(sp)
ffffffe000200198:	05813583          	ld	a1,88(sp)
ffffffe00020019c:	06013603          	ld	a2,96(sp)
ffffffe0002001a0:	06813683          	ld	a3,104(sp)
ffffffe0002001a4:	07013703          	ld	a4,112(sp)
ffffffe0002001a8:	07813783          	ld	a5,120(sp)
ffffffe0002001ac:	08013803          	ld	a6,128(sp)
ffffffe0002001b0:	08813883          	ld	a7,136(sp)
ffffffe0002001b4:	09013903          	ld	s2,144(sp)
ffffffe0002001b8:	09813983          	ld	s3,152(sp)
ffffffe0002001bc:	0a013a03          	ld	s4,160(sp)
ffffffe0002001c0:	0a813a83          	ld	s5,168(sp)
ffffffe0002001c4:	0b013b03          	ld	s6,176(sp)
ffffffe0002001c8:	0b813b83          	ld	s7,184(sp)
ffffffe0002001cc:	0c013c03          	ld	s8,192(sp)
ffffffe0002001d0:	0c813c83          	ld	s9,200(sp)
ffffffe0002001d4:	0d013d03          	ld	s10,208(sp)
ffffffe0002001d8:	0d813d83          	ld	s11,216(sp)
ffffffe0002001dc:	0e013e03          	ld	t3,224(sp)
ffffffe0002001e0:	0e813e83          	ld	t4,232(sp)
ffffffe0002001e4:	0f013f03          	ld	t5,240(sp)
ffffffe0002001e8:	0f813f83          	ld	t6,248(sp)

ffffffe0002001ec <_restore_stack_pointer>:
ffffffe0002001ec:	11810113          	addi	sp,sp,280
ffffffe0002001f0:	140292f3          	csrrw	t0,sscratch,t0
ffffffe0002001f4:	00029663          	bnez	t0,ffffffe000200200 <_L2>
ffffffe0002001f8:	140292f3          	csrrw	t0,sscratch,t0
ffffffe0002001fc:	00c0006f          	j	ffffffe000200208 <_sret_from_traps>

ffffffe000200200 <_L2>:
ffffffe000200200:	140292f3          	csrrw	t0,sscratch,t0
ffffffe000200204:	14011173          	csrrw	sp,sscratch,sp

ffffffe000200208 <_sret_from_traps>:
ffffffe000200208:	10200073          	sret

ffffffe00020020c <__dummy>:
ffffffe00020020c:	14101073          	csrw	sepc,zero
ffffffe000200210:	14011173          	csrrw	sp,sscratch,sp
ffffffe000200214:	10200073          	sret

ffffffe000200218 <__switch_to>:
ffffffe000200218:	02850513          	addi	a0,a0,40 # 989028 <_skernel-0xffffffdfff876fd8>
ffffffe00020021c:	00153023          	sd	ra,0(a0)
ffffffe000200220:	00253423          	sd	sp,8(a0)
ffffffe000200224:	00853823          	sd	s0,16(a0)
ffffffe000200228:	00953c23          	sd	s1,24(a0)
ffffffe00020022c:	03253023          	sd	s2,32(a0)
ffffffe000200230:	03353423          	sd	s3,40(a0)
ffffffe000200234:	03453823          	sd	s4,48(a0)
ffffffe000200238:	03553c23          	sd	s5,56(a0)
ffffffe00020023c:	05653023          	sd	s6,64(a0)
ffffffe000200240:	05753423          	sd	s7,72(a0)
ffffffe000200244:	05853823          	sd	s8,80(a0)
ffffffe000200248:	05953c23          	sd	s9,88(a0)
ffffffe00020024c:	07a53023          	sd	s10,96(a0)
ffffffe000200250:	07b53423          	sd	s11,104(a0)
ffffffe000200254:	141022f3          	csrr	t0,sepc
ffffffe000200258:	06553823          	sd	t0,112(a0)
ffffffe00020025c:	100022f3          	csrr	t0,sstatus
ffffffe000200260:	06553c23          	sd	t0,120(a0)
ffffffe000200264:	140022f3          	csrr	t0,sscratch
ffffffe000200268:	08553023          	sd	t0,128(a0)
ffffffe00020026c:	02858593          	addi	a1,a1,40
ffffffe000200270:	0005b083          	ld	ra,0(a1)
ffffffe000200274:	0085b103          	ld	sp,8(a1)
ffffffe000200278:	0105b403          	ld	s0,16(a1)
ffffffe00020027c:	0185b483          	ld	s1,24(a1)
ffffffe000200280:	0205b903          	ld	s2,32(a1)
ffffffe000200284:	0285b983          	ld	s3,40(a1)
ffffffe000200288:	0305ba03          	ld	s4,48(a1)
ffffffe00020028c:	0385ba83          	ld	s5,56(a1)
ffffffe000200290:	0405bb03          	ld	s6,64(a1)
ffffffe000200294:	0485bb83          	ld	s7,72(a1)
ffffffe000200298:	0505bc03          	ld	s8,80(a1)
ffffffe00020029c:	0585bc83          	ld	s9,88(a1)
ffffffe0002002a0:	0605bd03          	ld	s10,96(a1)
ffffffe0002002a4:	0685bd83          	ld	s11,104(a1)
ffffffe0002002a8:	0705b283          	ld	t0,112(a1)
ffffffe0002002ac:	14129073          	csrw	sepc,t0
ffffffe0002002b0:	0785b283          	ld	t0,120(a1)
ffffffe0002002b4:	10029073          	csrw	sstatus,t0
ffffffe0002002b8:	0805b283          	ld	t0,128(a1)
ffffffe0002002bc:	14029073          	csrw	sscratch,t0
ffffffe0002002c0:	08858593          	addi	a1,a1,136
ffffffe0002002c4:	0005b283          	ld	t0,0(a1)
ffffffe0002002c8:	00c2d293          	srli	t0,t0,0xc
ffffffe0002002cc:	fff0031b          	addiw	t1,zero,-1
ffffffe0002002d0:	03f31313          	slli	t1,t1,0x3f
ffffffe0002002d4:	0062e2b3          	or	t0,t0,t1
ffffffe0002002d8:	18029073          	csrw	satp,t0
ffffffe0002002dc:	12000073          	sfence.vma
ffffffe0002002e0:	00008067          	ret

ffffffe0002002e4 <_child_ret_from_clone>:
ffffffe0002002e4:	11053283          	ld	t0,272(a0)
ffffffe0002002e8:	14329073          	csrw	stval,t0
ffffffe0002002ec:	10853283          	ld	t0,264(a0)
ffffffe0002002f0:	14029073          	csrw	sscratch,t0
ffffffe0002002f4:	10053283          	ld	t0,256(a0)
ffffffe0002002f8:	14129073          	csrw	sepc,t0
ffffffe0002002fc:	00053003          	ld	zero,0(a0)
ffffffe000200300:	00853083          	ld	ra,8(a0)
ffffffe000200304:	01853183          	ld	gp,24(a0)
ffffffe000200308:	02053203          	ld	tp,32(a0)
ffffffe00020030c:	02853283          	ld	t0,40(a0)
ffffffe000200310:	03053303          	ld	t1,48(a0)
ffffffe000200314:	03853383          	ld	t2,56(a0)
ffffffe000200318:	04053403          	ld	s0,64(a0)
ffffffe00020031c:	04853483          	ld	s1,72(a0)
ffffffe000200320:	05853583          	ld	a1,88(a0)
ffffffe000200324:	06053603          	ld	a2,96(a0)
ffffffe000200328:	06853683          	ld	a3,104(a0)
ffffffe00020032c:	07053703          	ld	a4,112(a0)
ffffffe000200330:	07853783          	ld	a5,120(a0)
ffffffe000200334:	08053803          	ld	a6,128(a0)
ffffffe000200338:	08853883          	ld	a7,136(a0)
ffffffe00020033c:	09053903          	ld	s2,144(a0)
ffffffe000200340:	09853983          	ld	s3,152(a0)
ffffffe000200344:	0a053a03          	ld	s4,160(a0)
ffffffe000200348:	0a853a83          	ld	s5,168(a0)
ffffffe00020034c:	0b053b03          	ld	s6,176(a0)
ffffffe000200350:	0b853b83          	ld	s7,184(a0)
ffffffe000200354:	0c053c03          	ld	s8,192(a0)
ffffffe000200358:	0c853c83          	ld	s9,200(a0)
ffffffe00020035c:	0d053d03          	ld	s10,208(a0)
ffffffe000200360:	0d853d83          	ld	s11,216(a0)
ffffffe000200364:	0e053e03          	ld	t3,224(a0)
ffffffe000200368:	0e853e83          	ld	t4,232(a0)
ffffffe00020036c:	0f053f03          	ld	t5,240(a0)
ffffffe000200370:	0f853f83          	ld	t6,248(a0)
ffffffe000200374:	05053503          	ld	a0,80(a0)
ffffffe000200378:	14011173          	csrrw	sp,sscratch,sp
ffffffe00020037c:	10200073          	sret

ffffffe000200380 <get_timer>:
ffffffe000200380:	fe010113          	addi	sp,sp,-32
ffffffe000200384:	00813c23          	sd	s0,24(sp)
ffffffe000200388:	02010413          	addi	s0,sp,32
ffffffe00020038c:	c01027f3          	rdtime	a5
ffffffe000200390:	fef43423          	sd	a5,-24(s0)
ffffffe000200394:	fe843783          	ld	a5,-24(s0)
ffffffe000200398:	00078513          	mv	a0,a5
ffffffe00020039c:	01813403          	ld	s0,24(sp)
ffffffe0002003a0:	02010113          	addi	sp,sp,32
ffffffe0002003a4:	00008067          	ret

ffffffe0002003a8 <clock_set_next_event>:
ffffffe0002003a8:	fe010113          	addi	sp,sp,-32
ffffffe0002003ac:	00113c23          	sd	ra,24(sp)
ffffffe0002003b0:	00813823          	sd	s0,16(sp)
ffffffe0002003b4:	02010413          	addi	s0,sp,32
ffffffe0002003b8:	fc9ff0ef          	jal	ra,ffffffe000200380 <get_timer>
ffffffe0002003bc:	fea43423          	sd	a0,-24(s0)
ffffffe0002003c0:	000f47b7          	lui	a5,0xf4
ffffffe0002003c4:	24078793          	addi	a5,a5,576 # f4240 <_skernel-0xffffffe00010bdc0>
ffffffe0002003c8:	fe843703          	ld	a4,-24(s0)
ffffffe0002003cc:	00f707b3          	add	a5,a4,a5
ffffffe0002003d0:	fef43023          	sd	a5,-32(s0)
ffffffe0002003d4:	00000893          	li	a7,0
ffffffe0002003d8:	00000813          	li	a6,0
ffffffe0002003dc:	00000793          	li	a5,0
ffffffe0002003e0:	00000713          	li	a4,0
ffffffe0002003e4:	00000693          	li	a3,0
ffffffe0002003e8:	fe043603          	ld	a2,-32(s0)
ffffffe0002003ec:	00000593          	li	a1,0
ffffffe0002003f0:	00000513          	li	a0,0
ffffffe0002003f4:	281000ef          	jal	ra,ffffffe000200e74 <sbi_ecall>
ffffffe0002003f8:	00000013          	nop
ffffffe0002003fc:	01813083          	ld	ra,24(sp)
ffffffe000200400:	01013403          	ld	s0,16(sp)
ffffffe000200404:	02010113          	addi	sp,sp,32
ffffffe000200408:	00008067          	ret

ffffffe00020040c <kalloc>:
ffffffe00020040c:	fe010113          	addi	sp,sp,-32
ffffffe000200410:	00113c23          	sd	ra,24(sp)
ffffffe000200414:	00813823          	sd	s0,16(sp)
ffffffe000200418:	02010413          	addi	s0,sp,32
ffffffe00020041c:	00006797          	auipc	a5,0x6
ffffffe000200420:	be478793          	addi	a5,a5,-1052 # ffffffe000206000 <kmem>
ffffffe000200424:	0007b783          	ld	a5,0(a5)
ffffffe000200428:	fef43423          	sd	a5,-24(s0)
ffffffe00020042c:	fe843783          	ld	a5,-24(s0)
ffffffe000200430:	0007b703          	ld	a4,0(a5)
ffffffe000200434:	00006797          	auipc	a5,0x6
ffffffe000200438:	bcc78793          	addi	a5,a5,-1076 # ffffffe000206000 <kmem>
ffffffe00020043c:	00e7b023          	sd	a4,0(a5)
ffffffe000200440:	00001637          	lui	a2,0x1
ffffffe000200444:	00000593          	li	a1,0
ffffffe000200448:	fe843503          	ld	a0,-24(s0)
ffffffe00020044c:	4cc020ef          	jal	ra,ffffffe000202918 <memset>
ffffffe000200450:	fe843783          	ld	a5,-24(s0)
ffffffe000200454:	00078513          	mv	a0,a5
ffffffe000200458:	01813083          	ld	ra,24(sp)
ffffffe00020045c:	01013403          	ld	s0,16(sp)
ffffffe000200460:	02010113          	addi	sp,sp,32
ffffffe000200464:	00008067          	ret

ffffffe000200468 <kfree>:
ffffffe000200468:	fd010113          	addi	sp,sp,-48
ffffffe00020046c:	02113423          	sd	ra,40(sp)
ffffffe000200470:	02813023          	sd	s0,32(sp)
ffffffe000200474:	03010413          	addi	s0,sp,48
ffffffe000200478:	fca43c23          	sd	a0,-40(s0)
ffffffe00020047c:	fd843703          	ld	a4,-40(s0)
ffffffe000200480:	fffff7b7          	lui	a5,0xfffff
ffffffe000200484:	00f777b3          	and	a5,a4,a5
ffffffe000200488:	fcf43c23          	sd	a5,-40(s0)
ffffffe00020048c:	fd843783          	ld	a5,-40(s0)
ffffffe000200490:	00001637          	lui	a2,0x1
ffffffe000200494:	00000593          	li	a1,0
ffffffe000200498:	00078513          	mv	a0,a5
ffffffe00020049c:	47c020ef          	jal	ra,ffffffe000202918 <memset>
ffffffe0002004a0:	fd843783          	ld	a5,-40(s0)
ffffffe0002004a4:	fef43423          	sd	a5,-24(s0)
ffffffe0002004a8:	00006797          	auipc	a5,0x6
ffffffe0002004ac:	b5878793          	addi	a5,a5,-1192 # ffffffe000206000 <kmem>
ffffffe0002004b0:	0007b703          	ld	a4,0(a5)
ffffffe0002004b4:	fe843783          	ld	a5,-24(s0)
ffffffe0002004b8:	00e7b023          	sd	a4,0(a5)
ffffffe0002004bc:	00006797          	auipc	a5,0x6
ffffffe0002004c0:	b4478793          	addi	a5,a5,-1212 # ffffffe000206000 <kmem>
ffffffe0002004c4:	fe843703          	ld	a4,-24(s0)
ffffffe0002004c8:	00e7b023          	sd	a4,0(a5)
ffffffe0002004cc:	00000013          	nop
ffffffe0002004d0:	02813083          	ld	ra,40(sp)
ffffffe0002004d4:	02013403          	ld	s0,32(sp)
ffffffe0002004d8:	03010113          	addi	sp,sp,48
ffffffe0002004dc:	00008067          	ret

ffffffe0002004e0 <kfreerange>:
ffffffe0002004e0:	fd010113          	addi	sp,sp,-48
ffffffe0002004e4:	02113423          	sd	ra,40(sp)
ffffffe0002004e8:	02813023          	sd	s0,32(sp)
ffffffe0002004ec:	03010413          	addi	s0,sp,48
ffffffe0002004f0:	fca43c23          	sd	a0,-40(s0)
ffffffe0002004f4:	fcb43823          	sd	a1,-48(s0)
ffffffe0002004f8:	fd843703          	ld	a4,-40(s0)
ffffffe0002004fc:	000017b7          	lui	a5,0x1
ffffffe000200500:	fff78793          	addi	a5,a5,-1 # fff <_skernel-0xffffffe0001ff001>
ffffffe000200504:	00f70733          	add	a4,a4,a5
ffffffe000200508:	fffff7b7          	lui	a5,0xfffff
ffffffe00020050c:	00f777b3          	and	a5,a4,a5
ffffffe000200510:	fef43423          	sd	a5,-24(s0)
ffffffe000200514:	0200006f          	j	ffffffe000200534 <kfreerange+0x54>
ffffffe000200518:	fe843783          	ld	a5,-24(s0)
ffffffe00020051c:	00078513          	mv	a0,a5
ffffffe000200520:	f49ff0ef          	jal	ra,ffffffe000200468 <kfree>
ffffffe000200524:	fe843703          	ld	a4,-24(s0)
ffffffe000200528:	000017b7          	lui	a5,0x1
ffffffe00020052c:	00f707b3          	add	a5,a4,a5
ffffffe000200530:	fef43423          	sd	a5,-24(s0)
ffffffe000200534:	fe843703          	ld	a4,-24(s0)
ffffffe000200538:	000017b7          	lui	a5,0x1
ffffffe00020053c:	00f70733          	add	a4,a4,a5
ffffffe000200540:	fd043783          	ld	a5,-48(s0)
ffffffe000200544:	fce7fae3          	bgeu	a5,a4,ffffffe000200518 <kfreerange+0x38>
ffffffe000200548:	00000013          	nop
ffffffe00020054c:	00000013          	nop
ffffffe000200550:	02813083          	ld	ra,40(sp)
ffffffe000200554:	02013403          	ld	s0,32(sp)
ffffffe000200558:	03010113          	addi	sp,sp,48
ffffffe00020055c:	00008067          	ret

ffffffe000200560 <mm_init>:
ffffffe000200560:	ff010113          	addi	sp,sp,-16
ffffffe000200564:	00113423          	sd	ra,8(sp)
ffffffe000200568:	00813023          	sd	s0,0(sp)
ffffffe00020056c:	01010413          	addi	s0,sp,16
ffffffe000200570:	c0100793          	li	a5,-1023
ffffffe000200574:	01b79593          	slli	a1,a5,0x1b
ffffffe000200578:	0000a517          	auipc	a0,0xa
ffffffe00020057c:	a2850513          	addi	a0,a0,-1496 # ffffffe000209fa0 <_ebss>
ffffffe000200580:	f61ff0ef          	jal	ra,ffffffe0002004e0 <kfreerange>
ffffffe000200584:	00003517          	auipc	a0,0x3
ffffffe000200588:	a8450513          	addi	a0,a0,-1404 # ffffffe000203008 <TIMECLOCK+0x8>
ffffffe00020058c:	7b5010ef          	jal	ra,ffffffe000202540 <printk>
ffffffe000200590:	00000013          	nop
ffffffe000200594:	00813083          	ld	ra,8(sp)
ffffffe000200598:	00013403          	ld	s0,0(sp)
ffffffe00020059c:	01010113          	addi	sp,sp,16
ffffffe0002005a0:	00008067          	ret

ffffffe0002005a4 <panic>:
ffffffe0002005a4:	fe010113          	addi	sp,sp,-32
ffffffe0002005a8:	00113c23          	sd	ra,24(sp)
ffffffe0002005ac:	00813823          	sd	s0,16(sp)
ffffffe0002005b0:	02010413          	addi	s0,sp,32
ffffffe0002005b4:	fea43423          	sd	a0,-24(s0)
ffffffe0002005b8:	fe843583          	ld	a1,-24(s0)
ffffffe0002005bc:	00003517          	auipc	a0,0x3
ffffffe0002005c0:	a6450513          	addi	a0,a0,-1436 # ffffffe000203020 <TIMECLOCK+0x20>
ffffffe0002005c4:	77d010ef          	jal	ra,ffffffe000202540 <printk>
ffffffe0002005c8:	0000006f          	j	ffffffe0002005c8 <panic+0x24>

ffffffe0002005cc <create_user_page_table>:
ffffffe0002005cc:	fe010113          	addi	sp,sp,-32
ffffffe0002005d0:	00113c23          	sd	ra,24(sp)
ffffffe0002005d4:	00813823          	sd	s0,16(sp)
ffffffe0002005d8:	02010413          	addi	s0,sp,32
ffffffe0002005dc:	e31ff0ef          	jal	ra,ffffffe00020040c <kalloc>
ffffffe0002005e0:	00050793          	mv	a5,a0
ffffffe0002005e4:	fef43423          	sd	a5,-24(s0)
ffffffe0002005e8:	00001637          	lui	a2,0x1
ffffffe0002005ec:	00008597          	auipc	a1,0x8
ffffffe0002005f0:	a1458593          	addi	a1,a1,-1516 # ffffffe000208000 <second_page_table>
ffffffe0002005f4:	fe843503          	ld	a0,-24(s0)
ffffffe0002005f8:	38c020ef          	jal	ra,ffffffe000202984 <memcpy>
ffffffe0002005fc:	fe843783          	ld	a5,-24(s0)
ffffffe000200600:	00078513          	mv	a0,a5
ffffffe000200604:	01813083          	ld	ra,24(sp)
ffffffe000200608:	01013403          	ld	s0,16(sp)
ffffffe00020060c:	02010113          	addi	sp,sp,32
ffffffe000200610:	00008067          	ret

ffffffe000200614 <create_task>:
ffffffe000200614:	fe010113          	addi	sp,sp,-32
ffffffe000200618:	00113c23          	sd	ra,24(sp)
ffffffe00020061c:	00813823          	sd	s0,16(sp)
ffffffe000200620:	02010413          	addi	s0,sp,32
ffffffe000200624:	00006797          	auipc	a5,0x6
ffffffe000200628:	9f478793          	addi	a5,a5,-1548 # ffffffe000206018 <tot_task>
ffffffe00020062c:	0007b783          	ld	a5,0(a5)
ffffffe000200630:	00178713          	addi	a4,a5,1
ffffffe000200634:	00006797          	auipc	a5,0x6
ffffffe000200638:	9e478793          	addi	a5,a5,-1564 # ffffffe000206018 <tot_task>
ffffffe00020063c:	00e7b023          	sd	a4,0(a5)
ffffffe000200640:	00006797          	auipc	a5,0x6
ffffffe000200644:	9d878793          	addi	a5,a5,-1576 # ffffffe000206018 <tot_task>
ffffffe000200648:	0007b783          	ld	a5,0(a5)
ffffffe00020064c:	fef43423          	sd	a5,-24(s0)
ffffffe000200650:	dbdff0ef          	jal	ra,ffffffe00020040c <kalloc>
ffffffe000200654:	00050793          	mv	a5,a0
ffffffe000200658:	fef43023          	sd	a5,-32(s0)
ffffffe00020065c:	fe043783          	ld	a5,-32(s0)
ffffffe000200660:	0007b423          	sd	zero,8(a5)
ffffffe000200664:	fe043783          	ld	a5,-32(s0)
ffffffe000200668:	0007b823          	sd	zero,16(a5)
ffffffe00020066c:	00a00593          	li	a1,10
ffffffe000200670:	00100513          	li	a0,1
ffffffe000200674:	24c020ef          	jal	ra,ffffffe0002028c0 <rand_range>
ffffffe000200678:	00050713          	mv	a4,a0
ffffffe00020067c:	fe043783          	ld	a5,-32(s0)
ffffffe000200680:	00e7bc23          	sd	a4,24(a5)
ffffffe000200684:	fe043783          	ld	a5,-32(s0)
ffffffe000200688:	fe843703          	ld	a4,-24(s0)
ffffffe00020068c:	02e7b023          	sd	a4,32(a5)
ffffffe000200690:	d7dff0ef          	jal	ra,ffffffe00020040c <kalloc>
ffffffe000200694:	00050793          	mv	a5,a0
ffffffe000200698:	00078713          	mv	a4,a5
ffffffe00020069c:	fe043783          	ld	a5,-32(s0)
ffffffe0002006a0:	00e7b023          	sd	a4,0(a5)
ffffffe0002006a4:	fe043783          	ld	a5,-32(s0)
ffffffe0002006a8:	0007b783          	ld	a5,0(a5)
ffffffe0002006ac:	0007b023          	sd	zero,0(a5)
ffffffe0002006b0:	d5dff0ef          	jal	ra,ffffffe00020040c <kalloc>
ffffffe0002006b4:	00050793          	mv	a5,a0
ffffffe0002006b8:	00078713          	mv	a4,a5
ffffffe0002006bc:	fe043783          	ld	a5,-32(s0)
ffffffe0002006c0:	0ae7bc23          	sd	a4,184(a5)
ffffffe0002006c4:	d49ff0ef          	jal	ra,ffffffe00020040c <kalloc>
ffffffe0002006c8:	00050793          	mv	a5,a0
ffffffe0002006cc:	00078713          	mv	a4,a5
ffffffe0002006d0:	fe043783          	ld	a5,-32(s0)
ffffffe0002006d4:	0ce7b023          	sd	a4,192(a5)
ffffffe0002006d8:	fe043783          	ld	a5,-32(s0)
ffffffe0002006dc:	0207b783          	ld	a5,32(a5)
ffffffe0002006e0:	00006717          	auipc	a4,0x6
ffffffe0002006e4:	95070713          	addi	a4,a4,-1712 # ffffffe000206030 <task>
ffffffe0002006e8:	00379793          	slli	a5,a5,0x3
ffffffe0002006ec:	00f707b3          	add	a5,a4,a5
ffffffe0002006f0:	fe043703          	ld	a4,-32(s0)
ffffffe0002006f4:	00e7b023          	sd	a4,0(a5)
ffffffe0002006f8:	fe043783          	ld	a5,-32(s0)
ffffffe0002006fc:	00078513          	mv	a0,a5
ffffffe000200700:	01813083          	ld	ra,24(sp)
ffffffe000200704:	01013403          	ld	s0,16(sp)
ffffffe000200708:	02010113          	addi	sp,sp,32
ffffffe00020070c:	00008067          	ret

ffffffe000200710 <create_first_task>:
ffffffe000200710:	fd010113          	addi	sp,sp,-48
ffffffe000200714:	02113423          	sd	ra,40(sp)
ffffffe000200718:	02813023          	sd	s0,32(sp)
ffffffe00020071c:	03010413          	addi	s0,sp,48
ffffffe000200720:	ef5ff0ef          	jal	ra,ffffffe000200614 <create_task>
ffffffe000200724:	fea43423          	sd	a0,-24(s0)
ffffffe000200728:	00000717          	auipc	a4,0x0
ffffffe00020072c:	ae470713          	addi	a4,a4,-1308 # ffffffe00020020c <__dummy>
ffffffe000200730:	fe843783          	ld	a5,-24(s0)
ffffffe000200734:	02e7b423          	sd	a4,40(a5)
ffffffe000200738:	fe843703          	ld	a4,-24(s0)
ffffffe00020073c:	000017b7          	lui	a5,0x1
ffffffe000200740:	00f70733          	add	a4,a4,a5
ffffffe000200744:	fe843783          	ld	a5,-24(s0)
ffffffe000200748:	02e7b823          	sd	a4,48(a5) # 1030 <_skernel-0xffffffe0001fefd0>
ffffffe00020074c:	fe843783          	ld	a5,-24(s0)
ffffffe000200750:	0807bc23          	sd	zero,152(a5)
ffffffe000200754:	fe843783          	ld	a5,-24(s0)
ffffffe000200758:	00040737          	lui	a4,0x40
ffffffe00020075c:	02070713          	addi	a4,a4,32 # 40020 <_skernel-0xffffffe0001bffe0>
ffffffe000200760:	0ae7b023          	sd	a4,160(a5)
ffffffe000200764:	fe843783          	ld	a5,-24(s0)
ffffffe000200768:	00100713          	li	a4,1
ffffffe00020076c:	02671713          	slli	a4,a4,0x26
ffffffe000200770:	0ae7b423          	sd	a4,168(a5)
ffffffe000200774:	e59ff0ef          	jal	ra,ffffffe0002005cc <create_user_page_table>
ffffffe000200778:	00050793          	mv	a5,a0
ffffffe00020077c:	00078513          	mv	a0,a5
ffffffe000200780:	260010ef          	jal	ra,ffffffe0002019e0 <va_to_pa>
ffffffe000200784:	00050713          	mv	a4,a0
ffffffe000200788:	fe843783          	ld	a5,-24(s0)
ffffffe00020078c:	0ae7b823          	sd	a4,176(a5)
ffffffe000200790:	00004797          	auipc	a5,0x4
ffffffe000200794:	87078793          	addi	a5,a5,-1936 # ffffffe000204000 <_edata>
ffffffe000200798:	fef43023          	sd	a5,-32(s0)
ffffffe00020079c:	00004797          	auipc	a5,0x4
ffffffe0002007a0:	07c78793          	addi	a5,a5,124 # ffffffe000204818 <uapp_end>
ffffffe0002007a4:	fcf43c23          	sd	a5,-40(s0)
ffffffe0002007a8:	fd843703          	ld	a4,-40(s0)
ffffffe0002007ac:	fe043783          	ld	a5,-32(s0)
ffffffe0002007b0:	40f707b3          	sub	a5,a4,a5
ffffffe0002007b4:	fcf43823          	sd	a5,-48(s0)
ffffffe0002007b8:	fe843783          	ld	a5,-24(s0)
ffffffe0002007bc:	0b87b503          	ld	a0,184(a5)
ffffffe0002007c0:	fd843703          	ld	a4,-40(s0)
ffffffe0002007c4:	fe043783          	ld	a5,-32(s0)
ffffffe0002007c8:	40f707b3          	sub	a5,a4,a5
ffffffe0002007cc:	00700693          	li	a3,7
ffffffe0002007d0:	00078613          	mv	a2,a5
ffffffe0002007d4:	00000593          	li	a1,0
ffffffe0002007d8:	0c8010ef          	jal	ra,ffffffe0002018a0 <do_mmap>
ffffffe0002007dc:	fe843783          	ld	a5,-24(s0)
ffffffe0002007e0:	0b87b703          	ld	a4,184(a5)
ffffffe0002007e4:	00300693          	li	a3,3
ffffffe0002007e8:	00001637          	lui	a2,0x1
ffffffe0002007ec:	040007b7          	lui	a5,0x4000
ffffffe0002007f0:	fff78793          	addi	a5,a5,-1 # 3ffffff <_skernel-0xffffffdffc200001>
ffffffe0002007f4:	00c79593          	slli	a1,a5,0xc
ffffffe0002007f8:	00070513          	mv	a0,a4
ffffffe0002007fc:	0a4010ef          	jal	ra,ffffffe0002018a0 <do_mmap>
ffffffe000200800:	fe843783          	ld	a5,-24(s0)
ffffffe000200804:	0207b783          	ld	a5,32(a5)
ffffffe000200808:	00006717          	auipc	a4,0x6
ffffffe00020080c:	82870713          	addi	a4,a4,-2008 # ffffffe000206030 <task>
ffffffe000200810:	00379793          	slli	a5,a5,0x3
ffffffe000200814:	00f707b3          	add	a5,a4,a5
ffffffe000200818:	fe843703          	ld	a4,-24(s0)
ffffffe00020081c:	00e7b023          	sd	a4,0(a5)
ffffffe000200820:	00000013          	nop
ffffffe000200824:	02813083          	ld	ra,40(sp)
ffffffe000200828:	02013403          	ld	s0,32(sp)
ffffffe00020082c:	03010113          	addi	sp,sp,48
ffffffe000200830:	00008067          	ret

ffffffe000200834 <task_init>:
ffffffe000200834:	fe010113          	addi	sp,sp,-32
ffffffe000200838:	00113c23          	sd	ra,24(sp)
ffffffe00020083c:	00813823          	sd	s0,16(sp)
ffffffe000200840:	02010413          	addi	s0,sp,32
ffffffe000200844:	bc9ff0ef          	jal	ra,ffffffe00020040c <kalloc>
ffffffe000200848:	00050793          	mv	a5,a0
ffffffe00020084c:	00078713          	mv	a4,a5
ffffffe000200850:	00005797          	auipc	a5,0x5
ffffffe000200854:	7b878793          	addi	a5,a5,1976 # ffffffe000206008 <idle>
ffffffe000200858:	00e7b023          	sd	a4,0(a5)
ffffffe00020085c:	00005797          	auipc	a5,0x5
ffffffe000200860:	7ac78793          	addi	a5,a5,1964 # ffffffe000206008 <idle>
ffffffe000200864:	0007b783          	ld	a5,0(a5)
ffffffe000200868:	0007b423          	sd	zero,8(a5)
ffffffe00020086c:	00005797          	auipc	a5,0x5
ffffffe000200870:	79c78793          	addi	a5,a5,1948 # ffffffe000206008 <idle>
ffffffe000200874:	0007b783          	ld	a5,0(a5)
ffffffe000200878:	0007b823          	sd	zero,16(a5)
ffffffe00020087c:	00005797          	auipc	a5,0x5
ffffffe000200880:	78c78793          	addi	a5,a5,1932 # ffffffe000206008 <idle>
ffffffe000200884:	0007b783          	ld	a5,0(a5)
ffffffe000200888:	0007bc23          	sd	zero,24(a5)
ffffffe00020088c:	00005797          	auipc	a5,0x5
ffffffe000200890:	77c78793          	addi	a5,a5,1916 # ffffffe000206008 <idle>
ffffffe000200894:	0007b783          	ld	a5,0(a5)
ffffffe000200898:	0207b023          	sd	zero,32(a5)
ffffffe00020089c:	00005797          	auipc	a5,0x5
ffffffe0002008a0:	76c78793          	addi	a5,a5,1900 # ffffffe000206008 <idle>
ffffffe0002008a4:	0007b703          	ld	a4,0(a5)
ffffffe0002008a8:	00005797          	auipc	a5,0x5
ffffffe0002008ac:	78878793          	addi	a5,a5,1928 # ffffffe000206030 <task>
ffffffe0002008b0:	00e7b023          	sd	a4,0(a5)
ffffffe0002008b4:	00005797          	auipc	a5,0x5
ffffffe0002008b8:	77c78793          	addi	a5,a5,1916 # ffffffe000206030 <task>
ffffffe0002008bc:	0007b703          	ld	a4,0(a5)
ffffffe0002008c0:	00005797          	auipc	a5,0x5
ffffffe0002008c4:	75078793          	addi	a5,a5,1872 # ffffffe000206010 <current>
ffffffe0002008c8:	00e7b023          	sd	a4,0(a5)
ffffffe0002008cc:	00100793          	li	a5,1
ffffffe0002008d0:	fef42623          	sw	a5,-20(s0)
ffffffe0002008d4:	0280006f          	j	ffffffe0002008fc <task_init+0xc8>
ffffffe0002008d8:	00005717          	auipc	a4,0x5
ffffffe0002008dc:	75870713          	addi	a4,a4,1880 # ffffffe000206030 <task>
ffffffe0002008e0:	fec42783          	lw	a5,-20(s0)
ffffffe0002008e4:	00379793          	slli	a5,a5,0x3
ffffffe0002008e8:	00f707b3          	add	a5,a4,a5
ffffffe0002008ec:	0007b023          	sd	zero,0(a5)
ffffffe0002008f0:	fec42783          	lw	a5,-20(s0)
ffffffe0002008f4:	0017879b          	addiw	a5,a5,1
ffffffe0002008f8:	fef42623          	sw	a5,-20(s0)
ffffffe0002008fc:	fec42783          	lw	a5,-20(s0)
ffffffe000200900:	0007871b          	sext.w	a4,a5
ffffffe000200904:	00400793          	li	a5,4
ffffffe000200908:	fce7d8e3          	bge	a5,a4,ffffffe0002008d8 <task_init+0xa4>
ffffffe00020090c:	e05ff0ef          	jal	ra,ffffffe000200710 <create_first_task>
ffffffe000200910:	00002517          	auipc	a0,0x2
ffffffe000200914:	72050513          	addi	a0,a0,1824 # ffffffe000203030 <TIMECLOCK+0x30>
ffffffe000200918:	429010ef          	jal	ra,ffffffe000202540 <printk>
ffffffe00020091c:	00000013          	nop
ffffffe000200920:	01813083          	ld	ra,24(sp)
ffffffe000200924:	01013403          	ld	s0,16(sp)
ffffffe000200928:	02010113          	addi	sp,sp,32
ffffffe00020092c:	00008067          	ret

ffffffe000200930 <dummy>:
ffffffe000200930:	fd010113          	addi	sp,sp,-48
ffffffe000200934:	02113423          	sd	ra,40(sp)
ffffffe000200938:	02813023          	sd	s0,32(sp)
ffffffe00020093c:	03010413          	addi	s0,sp,48
ffffffe000200940:	3b9ad7b7          	lui	a5,0x3b9ad
ffffffe000200944:	a0778793          	addi	a5,a5,-1529 # 3b9aca07 <_skernel-0xffffffdfc48535f9>
ffffffe000200948:	fcf43c23          	sd	a5,-40(s0)
ffffffe00020094c:	fe043423          	sd	zero,-24(s0)
ffffffe000200950:	fff00793          	li	a5,-1
ffffffe000200954:	fef43023          	sd	a5,-32(s0)
ffffffe000200958:	fe043703          	ld	a4,-32(s0)
ffffffe00020095c:	fff00793          	li	a5,-1
ffffffe000200960:	00f70e63          	beq	a4,a5,ffffffe00020097c <dummy+0x4c>
ffffffe000200964:	00005797          	auipc	a5,0x5
ffffffe000200968:	6ac78793          	addi	a5,a5,1708 # ffffffe000206010 <current>
ffffffe00020096c:	0007b783          	ld	a5,0(a5)
ffffffe000200970:	0107b783          	ld	a5,16(a5)
ffffffe000200974:	fe043703          	ld	a4,-32(s0)
ffffffe000200978:	fef700e3          	beq	a4,a5,ffffffe000200958 <dummy+0x28>
ffffffe00020097c:	00005797          	auipc	a5,0x5
ffffffe000200980:	69478793          	addi	a5,a5,1684 # ffffffe000206010 <current>
ffffffe000200984:	0007b783          	ld	a5,0(a5)
ffffffe000200988:	0107b783          	ld	a5,16(a5)
ffffffe00020098c:	fef43023          	sd	a5,-32(s0)
ffffffe000200990:	fe843783          	ld	a5,-24(s0)
ffffffe000200994:	00178713          	addi	a4,a5,1
ffffffe000200998:	fd843783          	ld	a5,-40(s0)
ffffffe00020099c:	02f777b3          	remu	a5,a4,a5
ffffffe0002009a0:	fef43423          	sd	a5,-24(s0)
ffffffe0002009a4:	00005797          	auipc	a5,0x5
ffffffe0002009a8:	66c78793          	addi	a5,a5,1644 # ffffffe000206010 <current>
ffffffe0002009ac:	0007b783          	ld	a5,0(a5)
ffffffe0002009b0:	0207b783          	ld	a5,32(a5)
ffffffe0002009b4:	fe843603          	ld	a2,-24(s0)
ffffffe0002009b8:	00078593          	mv	a1,a5
ffffffe0002009bc:	00002517          	auipc	a0,0x2
ffffffe0002009c0:	68c50513          	addi	a0,a0,1676 # ffffffe000203048 <TIMECLOCK+0x48>
ffffffe0002009c4:	37d010ef          	jal	ra,ffffffe000202540 <printk>
ffffffe0002009c8:	f91ff06f          	j	ffffffe000200958 <dummy+0x28>

ffffffe0002009cc <switch_to>:
ffffffe0002009cc:	fd010113          	addi	sp,sp,-48
ffffffe0002009d0:	02113423          	sd	ra,40(sp)
ffffffe0002009d4:	02813023          	sd	s0,32(sp)
ffffffe0002009d8:	03010413          	addi	s0,sp,48
ffffffe0002009dc:	fca43c23          	sd	a0,-40(s0)
ffffffe0002009e0:	00005797          	auipc	a5,0x5
ffffffe0002009e4:	63078793          	addi	a5,a5,1584 # ffffffe000206010 <current>
ffffffe0002009e8:	0007b783          	ld	a5,0(a5)
ffffffe0002009ec:	fd843703          	ld	a4,-40(s0)
ffffffe0002009f0:	04f70e63          	beq	a4,a5,ffffffe000200a4c <switch_to+0x80>
ffffffe0002009f4:	00005797          	auipc	a5,0x5
ffffffe0002009f8:	61c78793          	addi	a5,a5,1564 # ffffffe000206010 <current>
ffffffe0002009fc:	0007b783          	ld	a5,0(a5)
ffffffe000200a00:	fef43423          	sd	a5,-24(s0)
ffffffe000200a04:	00005797          	auipc	a5,0x5
ffffffe000200a08:	60c78793          	addi	a5,a5,1548 # ffffffe000206010 <current>
ffffffe000200a0c:	fd843703          	ld	a4,-40(s0)
ffffffe000200a10:	00e7b023          	sd	a4,0(a5)
ffffffe000200a14:	fd843783          	ld	a5,-40(s0)
ffffffe000200a18:	0207b703          	ld	a4,32(a5)
ffffffe000200a1c:	fd843783          	ld	a5,-40(s0)
ffffffe000200a20:	0187b603          	ld	a2,24(a5)
ffffffe000200a24:	fd843783          	ld	a5,-40(s0)
ffffffe000200a28:	0107b783          	ld	a5,16(a5)
ffffffe000200a2c:	00078693          	mv	a3,a5
ffffffe000200a30:	00070593          	mv	a1,a4
ffffffe000200a34:	00002517          	auipc	a0,0x2
ffffffe000200a38:	63c50513          	addi	a0,a0,1596 # ffffffe000203070 <TIMECLOCK+0x70>
ffffffe000200a3c:	305010ef          	jal	ra,ffffffe000202540 <printk>
ffffffe000200a40:	fd843583          	ld	a1,-40(s0)
ffffffe000200a44:	fe843503          	ld	a0,-24(s0)
ffffffe000200a48:	fd0ff0ef          	jal	ra,ffffffe000200218 <__switch_to>
ffffffe000200a4c:	00000013          	nop
ffffffe000200a50:	02813083          	ld	ra,40(sp)
ffffffe000200a54:	02013403          	ld	s0,32(sp)
ffffffe000200a58:	03010113          	addi	sp,sp,48
ffffffe000200a5c:	00008067          	ret

ffffffe000200a60 <do_timer>:
ffffffe000200a60:	ff010113          	addi	sp,sp,-16
ffffffe000200a64:	00113423          	sd	ra,8(sp)
ffffffe000200a68:	00813023          	sd	s0,0(sp)
ffffffe000200a6c:	01010413          	addi	s0,sp,16
ffffffe000200a70:	00005797          	auipc	a5,0x5
ffffffe000200a74:	5a078793          	addi	a5,a5,1440 # ffffffe000206010 <current>
ffffffe000200a78:	0007b703          	ld	a4,0(a5)
ffffffe000200a7c:	00005797          	auipc	a5,0x5
ffffffe000200a80:	58c78793          	addi	a5,a5,1420 # ffffffe000206008 <idle>
ffffffe000200a84:	0007b783          	ld	a5,0(a5)
ffffffe000200a88:	02f70263          	beq	a4,a5,ffffffe000200aac <do_timer+0x4c>
ffffffe000200a8c:	00005797          	auipc	a5,0x5
ffffffe000200a90:	58478793          	addi	a5,a5,1412 # ffffffe000206010 <current>
ffffffe000200a94:	0007b783          	ld	a5,0(a5)
ffffffe000200a98:	0107b703          	ld	a4,16(a5)
ffffffe000200a9c:	fff70713          	addi	a4,a4,-1
ffffffe000200aa0:	00e7b823          	sd	a4,16(a5)
ffffffe000200aa4:	0107b783          	ld	a5,16(a5)
ffffffe000200aa8:	00079463          	bnez	a5,ffffffe000200ab0 <do_timer+0x50>
ffffffe000200aac:	37c000ef          	jal	ra,ffffffe000200e28 <schedule>
ffffffe000200ab0:	00000013          	nop
ffffffe000200ab4:	00813083          	ld	ra,8(sp)
ffffffe000200ab8:	00013403          	ld	s0,0(sp)
ffffffe000200abc:	01010113          	addi	sp,sp,16
ffffffe000200ac0:	00008067          	ret

ffffffe000200ac4 <schedule_sjf>:
ffffffe000200ac4:	fc010113          	addi	sp,sp,-64
ffffffe000200ac8:	02113c23          	sd	ra,56(sp)
ffffffe000200acc:	02813823          	sd	s0,48(sp)
ffffffe000200ad0:	02913423          	sd	s1,40(sp)
ffffffe000200ad4:	04010413          	addi	s0,sp,64
ffffffe000200ad8:	fc043c23          	sd	zero,-40(s0)
ffffffe000200adc:	fc043823          	sd	zero,-48(s0)
ffffffe000200ae0:	00100793          	li	a5,1
ffffffe000200ae4:	fcf42623          	sw	a5,-52(s0)
ffffffe000200ae8:	0a00006f          	j	ffffffe000200b88 <schedule_sjf+0xc4>
ffffffe000200aec:	00005717          	auipc	a4,0x5
ffffffe000200af0:	54470713          	addi	a4,a4,1348 # ffffffe000206030 <task>
ffffffe000200af4:	fcc42783          	lw	a5,-52(s0)
ffffffe000200af8:	00379793          	slli	a5,a5,0x3
ffffffe000200afc:	00f707b3          	add	a5,a4,a5
ffffffe000200b00:	0007b783          	ld	a5,0(a5)
ffffffe000200b04:	06078c63          	beqz	a5,ffffffe000200b7c <schedule_sjf+0xb8>
ffffffe000200b08:	00005717          	auipc	a4,0x5
ffffffe000200b0c:	52870713          	addi	a4,a4,1320 # ffffffe000206030 <task>
ffffffe000200b10:	fcc42783          	lw	a5,-52(s0)
ffffffe000200b14:	00379793          	slli	a5,a5,0x3
ffffffe000200b18:	00f707b3          	add	a5,a4,a5
ffffffe000200b1c:	0007b783          	ld	a5,0(a5)
ffffffe000200b20:	0107b783          	ld	a5,16(a5)
ffffffe000200b24:	04078c63          	beqz	a5,ffffffe000200b7c <schedule_sjf+0xb8>
ffffffe000200b28:	fd843783          	ld	a5,-40(s0)
ffffffe000200b2c:	02078463          	beqz	a5,ffffffe000200b54 <schedule_sjf+0x90>
ffffffe000200b30:	00005717          	auipc	a4,0x5
ffffffe000200b34:	50070713          	addi	a4,a4,1280 # ffffffe000206030 <task>
ffffffe000200b38:	fcc42783          	lw	a5,-52(s0)
ffffffe000200b3c:	00379793          	slli	a5,a5,0x3
ffffffe000200b40:	00f707b3          	add	a5,a4,a5
ffffffe000200b44:	0007b783          	ld	a5,0(a5)
ffffffe000200b48:	0107b783          	ld	a5,16(a5)
ffffffe000200b4c:	fd843703          	ld	a4,-40(s0)
ffffffe000200b50:	02e7f663          	bgeu	a5,a4,ffffffe000200b7c <schedule_sjf+0xb8>
ffffffe000200b54:	00005717          	auipc	a4,0x5
ffffffe000200b58:	4dc70713          	addi	a4,a4,1244 # ffffffe000206030 <task>
ffffffe000200b5c:	fcc42783          	lw	a5,-52(s0)
ffffffe000200b60:	00379793          	slli	a5,a5,0x3
ffffffe000200b64:	00f707b3          	add	a5,a4,a5
ffffffe000200b68:	0007b783          	ld	a5,0(a5)
ffffffe000200b6c:	0107b783          	ld	a5,16(a5)
ffffffe000200b70:	fcf43c23          	sd	a5,-40(s0)
ffffffe000200b74:	fcc42783          	lw	a5,-52(s0)
ffffffe000200b78:	fcf43823          	sd	a5,-48(s0)
ffffffe000200b7c:	fcc42783          	lw	a5,-52(s0)
ffffffe000200b80:	0017879b          	addiw	a5,a5,1
ffffffe000200b84:	fcf42623          	sw	a5,-52(s0)
ffffffe000200b88:	fcc42783          	lw	a5,-52(s0)
ffffffe000200b8c:	0007871b          	sext.w	a4,a5
ffffffe000200b90:	00400793          	li	a5,4
ffffffe000200b94:	f4e7dce3          	bge	a5,a4,ffffffe000200aec <schedule_sjf+0x28>
ffffffe000200b98:	fd843783          	ld	a5,-40(s0)
ffffffe000200b9c:	00078663          	beqz	a5,ffffffe000200ba8 <schedule_sjf+0xe4>
ffffffe000200ba0:	fd043783          	ld	a5,-48(s0)
ffffffe000200ba4:	0cc0006f          	j	ffffffe000200c70 <schedule_sjf+0x1ac>
ffffffe000200ba8:	00100793          	li	a5,1
ffffffe000200bac:	fcf42423          	sw	a5,-56(s0)
ffffffe000200bb0:	0a80006f          	j	ffffffe000200c58 <schedule_sjf+0x194>
ffffffe000200bb4:	00005717          	auipc	a4,0x5
ffffffe000200bb8:	47c70713          	addi	a4,a4,1148 # ffffffe000206030 <task>
ffffffe000200bbc:	fc842783          	lw	a5,-56(s0)
ffffffe000200bc0:	00379793          	slli	a5,a5,0x3
ffffffe000200bc4:	00f707b3          	add	a5,a4,a5
ffffffe000200bc8:	0007b783          	ld	a5,0(a5)
ffffffe000200bcc:	08078063          	beqz	a5,ffffffe000200c4c <schedule_sjf+0x188>
ffffffe000200bd0:	00005717          	auipc	a4,0x5
ffffffe000200bd4:	46070713          	addi	a4,a4,1120 # ffffffe000206030 <task>
ffffffe000200bd8:	fc842783          	lw	a5,-56(s0)
ffffffe000200bdc:	00379793          	slli	a5,a5,0x3
ffffffe000200be0:	00f707b3          	add	a5,a4,a5
ffffffe000200be4:	0007b483          	ld	s1,0(a5)
ffffffe000200be8:	00400593          	li	a1,4
ffffffe000200bec:	00200513          	li	a0,2
ffffffe000200bf0:	4d1010ef          	jal	ra,ffffffe0002028c0 <rand_range>
ffffffe000200bf4:	00050793          	mv	a5,a0
ffffffe000200bf8:	00f4b823          	sd	a5,16(s1)
ffffffe000200bfc:	00005717          	auipc	a4,0x5
ffffffe000200c00:	43470713          	addi	a4,a4,1076 # ffffffe000206030 <task>
ffffffe000200c04:	fc842783          	lw	a5,-56(s0)
ffffffe000200c08:	00379793          	slli	a5,a5,0x3
ffffffe000200c0c:	00f707b3          	add	a5,a4,a5
ffffffe000200c10:	0007b783          	ld	a5,0(a5)
ffffffe000200c14:	0187b603          	ld	a2,24(a5)
ffffffe000200c18:	00005717          	auipc	a4,0x5
ffffffe000200c1c:	41870713          	addi	a4,a4,1048 # ffffffe000206030 <task>
ffffffe000200c20:	fc842783          	lw	a5,-56(s0)
ffffffe000200c24:	00379793          	slli	a5,a5,0x3
ffffffe000200c28:	00f707b3          	add	a5,a4,a5
ffffffe000200c2c:	0007b783          	ld	a5,0(a5)
ffffffe000200c30:	0107b703          	ld	a4,16(a5)
ffffffe000200c34:	fc842783          	lw	a5,-56(s0)
ffffffe000200c38:	00070693          	mv	a3,a4
ffffffe000200c3c:	00078593          	mv	a1,a5
ffffffe000200c40:	00002517          	auipc	a0,0x2
ffffffe000200c44:	46850513          	addi	a0,a0,1128 # ffffffe0002030a8 <TIMECLOCK+0xa8>
ffffffe000200c48:	0f9010ef          	jal	ra,ffffffe000202540 <printk>
ffffffe000200c4c:	fc842783          	lw	a5,-56(s0)
ffffffe000200c50:	0017879b          	addiw	a5,a5,1
ffffffe000200c54:	fcf42423          	sw	a5,-56(s0)
ffffffe000200c58:	fc842783          	lw	a5,-56(s0)
ffffffe000200c5c:	0007871b          	sext.w	a4,a5
ffffffe000200c60:	00400793          	li	a5,4
ffffffe000200c64:	f4e7d8e3          	bge	a5,a4,ffffffe000200bb4 <schedule_sjf+0xf0>
ffffffe000200c68:	e5dff0ef          	jal	ra,ffffffe000200ac4 <schedule_sjf>
ffffffe000200c6c:	00050793          	mv	a5,a0
ffffffe000200c70:	00078513          	mv	a0,a5
ffffffe000200c74:	03813083          	ld	ra,56(sp)
ffffffe000200c78:	03013403          	ld	s0,48(sp)
ffffffe000200c7c:	02813483          	ld	s1,40(sp)
ffffffe000200c80:	04010113          	addi	sp,sp,64
ffffffe000200c84:	00008067          	ret

ffffffe000200c88 <schedule_priority>:
ffffffe000200c88:	fd010113          	addi	sp,sp,-48
ffffffe000200c8c:	02113423          	sd	ra,40(sp)
ffffffe000200c90:	02813023          	sd	s0,32(sp)
ffffffe000200c94:	03010413          	addi	s0,sp,48
ffffffe000200c98:	fe043423          	sd	zero,-24(s0)
ffffffe000200c9c:	fe043023          	sd	zero,-32(s0)
ffffffe000200ca0:	00100793          	li	a5,1
ffffffe000200ca4:	fcf42e23          	sw	a5,-36(s0)
ffffffe000200ca8:	0780006f          	j	ffffffe000200d20 <schedule_priority+0x98>
ffffffe000200cac:	00005717          	auipc	a4,0x5
ffffffe000200cb0:	38470713          	addi	a4,a4,900 # ffffffe000206030 <task>
ffffffe000200cb4:	fdc42783          	lw	a5,-36(s0)
ffffffe000200cb8:	00379793          	slli	a5,a5,0x3
ffffffe000200cbc:	00f707b3          	add	a5,a4,a5
ffffffe000200cc0:	0007b783          	ld	a5,0(a5)
ffffffe000200cc4:	04078863          	beqz	a5,ffffffe000200d14 <schedule_priority+0x8c>
ffffffe000200cc8:	00005717          	auipc	a4,0x5
ffffffe000200ccc:	36870713          	addi	a4,a4,872 # ffffffe000206030 <task>
ffffffe000200cd0:	fdc42783          	lw	a5,-36(s0)
ffffffe000200cd4:	00379793          	slli	a5,a5,0x3
ffffffe000200cd8:	00f707b3          	add	a5,a4,a5
ffffffe000200cdc:	0007b783          	ld	a5,0(a5)
ffffffe000200ce0:	0107b783          	ld	a5,16(a5)
ffffffe000200ce4:	fe843703          	ld	a4,-24(s0)
ffffffe000200ce8:	02f77663          	bgeu	a4,a5,ffffffe000200d14 <schedule_priority+0x8c>
ffffffe000200cec:	00005717          	auipc	a4,0x5
ffffffe000200cf0:	34470713          	addi	a4,a4,836 # ffffffe000206030 <task>
ffffffe000200cf4:	fdc42783          	lw	a5,-36(s0)
ffffffe000200cf8:	00379793          	slli	a5,a5,0x3
ffffffe000200cfc:	00f707b3          	add	a5,a4,a5
ffffffe000200d00:	0007b783          	ld	a5,0(a5)
ffffffe000200d04:	0107b783          	ld	a5,16(a5)
ffffffe000200d08:	fef43423          	sd	a5,-24(s0)
ffffffe000200d0c:	fdc42783          	lw	a5,-36(s0)
ffffffe000200d10:	fef43023          	sd	a5,-32(s0)
ffffffe000200d14:	fdc42783          	lw	a5,-36(s0)
ffffffe000200d18:	0017879b          	addiw	a5,a5,1
ffffffe000200d1c:	fcf42e23          	sw	a5,-36(s0)
ffffffe000200d20:	fdc42783          	lw	a5,-36(s0)
ffffffe000200d24:	0007871b          	sext.w	a4,a5
ffffffe000200d28:	00400793          	li	a5,4
ffffffe000200d2c:	f8e7d0e3          	bge	a5,a4,ffffffe000200cac <schedule_priority+0x24>
ffffffe000200d30:	fe843783          	ld	a5,-24(s0)
ffffffe000200d34:	00078663          	beqz	a5,ffffffe000200d40 <schedule_priority+0xb8>
ffffffe000200d38:	fe043783          	ld	a5,-32(s0)
ffffffe000200d3c:	0d80006f          	j	ffffffe000200e14 <schedule_priority+0x18c>
ffffffe000200d40:	00100793          	li	a5,1
ffffffe000200d44:	fcf42c23          	sw	a5,-40(s0)
ffffffe000200d48:	0b40006f          	j	ffffffe000200dfc <schedule_priority+0x174>
ffffffe000200d4c:	00005717          	auipc	a4,0x5
ffffffe000200d50:	2e470713          	addi	a4,a4,740 # ffffffe000206030 <task>
ffffffe000200d54:	fd842783          	lw	a5,-40(s0)
ffffffe000200d58:	00379793          	slli	a5,a5,0x3
ffffffe000200d5c:	00f707b3          	add	a5,a4,a5
ffffffe000200d60:	0007b783          	ld	a5,0(a5)
ffffffe000200d64:	08078663          	beqz	a5,ffffffe000200df0 <schedule_priority+0x168>
ffffffe000200d68:	00005717          	auipc	a4,0x5
ffffffe000200d6c:	2c870713          	addi	a4,a4,712 # ffffffe000206030 <task>
ffffffe000200d70:	fd842783          	lw	a5,-40(s0)
ffffffe000200d74:	00379793          	slli	a5,a5,0x3
ffffffe000200d78:	00f707b3          	add	a5,a4,a5
ffffffe000200d7c:	0007b703          	ld	a4,0(a5)
ffffffe000200d80:	00005697          	auipc	a3,0x5
ffffffe000200d84:	2b068693          	addi	a3,a3,688 # ffffffe000206030 <task>
ffffffe000200d88:	fd842783          	lw	a5,-40(s0)
ffffffe000200d8c:	00379793          	slli	a5,a5,0x3
ffffffe000200d90:	00f687b3          	add	a5,a3,a5
ffffffe000200d94:	0007b783          	ld	a5,0(a5)
ffffffe000200d98:	01873703          	ld	a4,24(a4)
ffffffe000200d9c:	00e7b823          	sd	a4,16(a5)
ffffffe000200da0:	00005717          	auipc	a4,0x5
ffffffe000200da4:	29070713          	addi	a4,a4,656 # ffffffe000206030 <task>
ffffffe000200da8:	fd842783          	lw	a5,-40(s0)
ffffffe000200dac:	00379793          	slli	a5,a5,0x3
ffffffe000200db0:	00f707b3          	add	a5,a4,a5
ffffffe000200db4:	0007b783          	ld	a5,0(a5)
ffffffe000200db8:	0187b603          	ld	a2,24(a5)
ffffffe000200dbc:	00005717          	auipc	a4,0x5
ffffffe000200dc0:	27470713          	addi	a4,a4,628 # ffffffe000206030 <task>
ffffffe000200dc4:	fd842783          	lw	a5,-40(s0)
ffffffe000200dc8:	00379793          	slli	a5,a5,0x3
ffffffe000200dcc:	00f707b3          	add	a5,a4,a5
ffffffe000200dd0:	0007b783          	ld	a5,0(a5)
ffffffe000200dd4:	0107b703          	ld	a4,16(a5)
ffffffe000200dd8:	fd842783          	lw	a5,-40(s0)
ffffffe000200ddc:	00070693          	mv	a3,a4
ffffffe000200de0:	00078593          	mv	a1,a5
ffffffe000200de4:	00002517          	auipc	a0,0x2
ffffffe000200de8:	2c450513          	addi	a0,a0,708 # ffffffe0002030a8 <TIMECLOCK+0xa8>
ffffffe000200dec:	754010ef          	jal	ra,ffffffe000202540 <printk>
ffffffe000200df0:	fd842783          	lw	a5,-40(s0)
ffffffe000200df4:	0017879b          	addiw	a5,a5,1
ffffffe000200df8:	fcf42c23          	sw	a5,-40(s0)
ffffffe000200dfc:	fd842783          	lw	a5,-40(s0)
ffffffe000200e00:	0007871b          	sext.w	a4,a5
ffffffe000200e04:	00400793          	li	a5,4
ffffffe000200e08:	f4e7d2e3          	bge	a5,a4,ffffffe000200d4c <schedule_priority+0xc4>
ffffffe000200e0c:	e7dff0ef          	jal	ra,ffffffe000200c88 <schedule_priority>
ffffffe000200e10:	00050793          	mv	a5,a0
ffffffe000200e14:	00078513          	mv	a0,a5
ffffffe000200e18:	02813083          	ld	ra,40(sp)
ffffffe000200e1c:	02013403          	ld	s0,32(sp)
ffffffe000200e20:	03010113          	addi	sp,sp,48
ffffffe000200e24:	00008067          	ret

ffffffe000200e28 <schedule>:
ffffffe000200e28:	fe010113          	addi	sp,sp,-32
ffffffe000200e2c:	00113c23          	sd	ra,24(sp)
ffffffe000200e30:	00813823          	sd	s0,16(sp)
ffffffe000200e34:	02010413          	addi	s0,sp,32
ffffffe000200e38:	c8dff0ef          	jal	ra,ffffffe000200ac4 <schedule_sjf>
ffffffe000200e3c:	fea43423          	sd	a0,-24(s0)
ffffffe000200e40:	00005717          	auipc	a4,0x5
ffffffe000200e44:	1f070713          	addi	a4,a4,496 # ffffffe000206030 <task>
ffffffe000200e48:	fe843783          	ld	a5,-24(s0)
ffffffe000200e4c:	00379793          	slli	a5,a5,0x3
ffffffe000200e50:	00f707b3          	add	a5,a4,a5
ffffffe000200e54:	0007b783          	ld	a5,0(a5)
ffffffe000200e58:	00078513          	mv	a0,a5
ffffffe000200e5c:	b71ff0ef          	jal	ra,ffffffe0002009cc <switch_to>
ffffffe000200e60:	00000013          	nop
ffffffe000200e64:	01813083          	ld	ra,24(sp)
ffffffe000200e68:	01013403          	ld	s0,16(sp)
ffffffe000200e6c:	02010113          	addi	sp,sp,32
ffffffe000200e70:	00008067          	ret

ffffffe000200e74 <sbi_ecall>:
ffffffe000200e74:	f9010113          	addi	sp,sp,-112
ffffffe000200e78:	06813423          	sd	s0,104(sp)
ffffffe000200e7c:	07010413          	addi	s0,sp,112
ffffffe000200e80:	fcc43023          	sd	a2,-64(s0)
ffffffe000200e84:	fad43c23          	sd	a3,-72(s0)
ffffffe000200e88:	fae43823          	sd	a4,-80(s0)
ffffffe000200e8c:	faf43423          	sd	a5,-88(s0)
ffffffe000200e90:	fb043023          	sd	a6,-96(s0)
ffffffe000200e94:	f9143c23          	sd	a7,-104(s0)
ffffffe000200e98:	00050793          	mv	a5,a0
ffffffe000200e9c:	fcf42623          	sw	a5,-52(s0)
ffffffe000200ea0:	00058793          	mv	a5,a1
ffffffe000200ea4:	fcf42423          	sw	a5,-56(s0)
ffffffe000200ea8:	fcc42883          	lw	a7,-52(s0)
ffffffe000200eac:	fc842803          	lw	a6,-56(s0)
ffffffe000200eb0:	fc043503          	ld	a0,-64(s0)
ffffffe000200eb4:	fb843583          	ld	a1,-72(s0)
ffffffe000200eb8:	fb043603          	ld	a2,-80(s0)
ffffffe000200ebc:	fa843683          	ld	a3,-88(s0)
ffffffe000200ec0:	fa043703          	ld	a4,-96(s0)
ffffffe000200ec4:	f9843783          	ld	a5,-104(s0)
ffffffe000200ec8:	00000073          	ecall
ffffffe000200ecc:	fca43823          	sd	a0,-48(s0)
ffffffe000200ed0:	fcb43c23          	sd	a1,-40(s0)
ffffffe000200ed4:	fd043783          	ld	a5,-48(s0)
ffffffe000200ed8:	fef43023          	sd	a5,-32(s0)
ffffffe000200edc:	fd843783          	ld	a5,-40(s0)
ffffffe000200ee0:	fef43423          	sd	a5,-24(s0)
ffffffe000200ee4:	fe043703          	ld	a4,-32(s0)
ffffffe000200ee8:	fe843783          	ld	a5,-24(s0)
ffffffe000200eec:	00070313          	mv	t1,a4
ffffffe000200ef0:	00078393          	mv	t2,a5
ffffffe000200ef4:	00030713          	mv	a4,t1
ffffffe000200ef8:	00038793          	mv	a5,t2
ffffffe000200efc:	00070513          	mv	a0,a4
ffffffe000200f00:	00078593          	mv	a1,a5
ffffffe000200f04:	06813403          	ld	s0,104(sp)
ffffffe000200f08:	07010113          	addi	sp,sp,112
ffffffe000200f0c:	00008067          	ret

ffffffe000200f10 <syscall>:
ffffffe000200f10:	fd010113          	addi	sp,sp,-48
ffffffe000200f14:	02113423          	sd	ra,40(sp)
ffffffe000200f18:	02813023          	sd	s0,32(sp)
ffffffe000200f1c:	03010413          	addi	s0,sp,48
ffffffe000200f20:	fca43c23          	sd	a0,-40(s0)
ffffffe000200f24:	fd843783          	ld	a5,-40(s0)
ffffffe000200f28:	0887b783          	ld	a5,136(a5)
ffffffe000200f2c:	fef43423          	sd	a5,-24(s0)
ffffffe000200f30:	fe843703          	ld	a4,-24(s0)
ffffffe000200f34:	0dc00793          	li	a5,220
ffffffe000200f38:	04f70263          	beq	a4,a5,ffffffe000200f7c <syscall+0x6c>
ffffffe000200f3c:	fe843703          	ld	a4,-24(s0)
ffffffe000200f40:	0dc00793          	li	a5,220
ffffffe000200f44:	04e7e263          	bltu	a5,a4,ffffffe000200f88 <syscall+0x78>
ffffffe000200f48:	fe843703          	ld	a4,-24(s0)
ffffffe000200f4c:	04000793          	li	a5,64
ffffffe000200f50:	00f70a63          	beq	a4,a5,ffffffe000200f64 <syscall+0x54>
ffffffe000200f54:	fe843703          	ld	a4,-24(s0)
ffffffe000200f58:	0ac00793          	li	a5,172
ffffffe000200f5c:	00f70a63          	beq	a4,a5,ffffffe000200f70 <syscall+0x60>
ffffffe000200f60:	0280006f          	j	ffffffe000200f88 <syscall+0x78>
ffffffe000200f64:	fd843503          	ld	a0,-40(s0)
ffffffe000200f68:	06c000ef          	jal	ra,ffffffe000200fd4 <sys_write>
ffffffe000200f6c:	01c0006f          	j	ffffffe000200f88 <syscall+0x78>
ffffffe000200f70:	fd843503          	ld	a0,-40(s0)
ffffffe000200f74:	028000ef          	jal	ra,ffffffe000200f9c <sys_getpid>
ffffffe000200f78:	0100006f          	j	ffffffe000200f88 <syscall+0x78>
ffffffe000200f7c:	fd843503          	ld	a0,-40(s0)
ffffffe000200f80:	120000ef          	jal	ra,ffffffe0002010a0 <sys_clone>
ffffffe000200f84:	00000013          	nop
ffffffe000200f88:	00000013          	nop
ffffffe000200f8c:	02813083          	ld	ra,40(sp)
ffffffe000200f90:	02013403          	ld	s0,32(sp)
ffffffe000200f94:	03010113          	addi	sp,sp,48
ffffffe000200f98:	00008067          	ret

ffffffe000200f9c <sys_getpid>:
ffffffe000200f9c:	fe010113          	addi	sp,sp,-32
ffffffe000200fa0:	00813c23          	sd	s0,24(sp)
ffffffe000200fa4:	02010413          	addi	s0,sp,32
ffffffe000200fa8:	fea43423          	sd	a0,-24(s0)
ffffffe000200fac:	00005797          	auipc	a5,0x5
ffffffe000200fb0:	06478793          	addi	a5,a5,100 # ffffffe000206010 <current>
ffffffe000200fb4:	0007b783          	ld	a5,0(a5)
ffffffe000200fb8:	0207b703          	ld	a4,32(a5)
ffffffe000200fbc:	fe843783          	ld	a5,-24(s0)
ffffffe000200fc0:	04e7b823          	sd	a4,80(a5)
ffffffe000200fc4:	00000013          	nop
ffffffe000200fc8:	01813403          	ld	s0,24(sp)
ffffffe000200fcc:	02010113          	addi	sp,sp,32
ffffffe000200fd0:	00008067          	ret

ffffffe000200fd4 <sys_write>:
ffffffe000200fd4:	fc010113          	addi	sp,sp,-64
ffffffe000200fd8:	02113c23          	sd	ra,56(sp)
ffffffe000200fdc:	02813823          	sd	s0,48(sp)
ffffffe000200fe0:	04010413          	addi	s0,sp,64
ffffffe000200fe4:	fca43423          	sd	a0,-56(s0)
ffffffe000200fe8:	fc843783          	ld	a5,-56(s0)
ffffffe000200fec:	0507b783          	ld	a5,80(a5)
ffffffe000200ff0:	fcf43c23          	sd	a5,-40(s0)
ffffffe000200ff4:	fc843783          	ld	a5,-56(s0)
ffffffe000200ff8:	0587b783          	ld	a5,88(a5)
ffffffe000200ffc:	fef43423          	sd	a5,-24(s0)
ffffffe000201000:	fc843783          	ld	a5,-56(s0)
ffffffe000201004:	0607b783          	ld	a5,96(a5)
ffffffe000201008:	fcf43823          	sd	a5,-48(s0)
ffffffe00020100c:	fd043783          	ld	a5,-48(s0)
ffffffe000201010:	fef43023          	sd	a5,-32(s0)
ffffffe000201014:	0200006f          	j	ffffffe000201034 <sys_write+0x60>
ffffffe000201018:	fe843783          	ld	a5,-24(s0)
ffffffe00020101c:	0007c783          	lbu	a5,0(a5)
ffffffe000201020:	00078513          	mv	a0,a5
ffffffe000201024:	7f1000ef          	jal	ra,ffffffe000202014 <putc>
ffffffe000201028:	fe843783          	ld	a5,-24(s0)
ffffffe00020102c:	00178793          	addi	a5,a5,1
ffffffe000201030:	fef43423          	sd	a5,-24(s0)
ffffffe000201034:	fe043783          	ld	a5,-32(s0)
ffffffe000201038:	fff78713          	addi	a4,a5,-1
ffffffe00020103c:	fee43023          	sd	a4,-32(s0)
ffffffe000201040:	fc079ce3          	bnez	a5,ffffffe000201018 <sys_write+0x44>
ffffffe000201044:	fc843783          	ld	a5,-56(s0)
ffffffe000201048:	fd043703          	ld	a4,-48(s0)
ffffffe00020104c:	04e7b823          	sd	a4,80(a5)
ffffffe000201050:	00000013          	nop
ffffffe000201054:	03813083          	ld	ra,56(sp)
ffffffe000201058:	03013403          	ld	s0,48(sp)
ffffffe00020105c:	04010113          	addi	sp,sp,64
ffffffe000201060:	00008067          	ret

ffffffe000201064 <child_ret_from_clone>:
ffffffe000201064:	ff010113          	addi	sp,sp,-16
ffffffe000201068:	00113423          	sd	ra,8(sp)
ffffffe00020106c:	00813023          	sd	s0,0(sp)
ffffffe000201070:	01010413          	addi	s0,sp,16
ffffffe000201074:	00005797          	auipc	a5,0x5
ffffffe000201078:	f9c78793          	addi	a5,a5,-100 # ffffffe000206010 <current>
ffffffe00020107c:	0007b783          	ld	a5,0(a5)
ffffffe000201080:	0c07b783          	ld	a5,192(a5)
ffffffe000201084:	00078513          	mv	a0,a5
ffffffe000201088:	a5cff0ef          	jal	ra,ffffffe0002002e4 <_child_ret_from_clone>
ffffffe00020108c:	00000013          	nop
ffffffe000201090:	00813083          	ld	ra,8(sp)
ffffffe000201094:	00013403          	ld	s0,0(sp)
ffffffe000201098:	01010113          	addi	sp,sp,16
ffffffe00020109c:	00008067          	ret

ffffffe0002010a0 <sys_clone>:
ffffffe0002010a0:	fa010113          	addi	sp,sp,-96
ffffffe0002010a4:	04113c23          	sd	ra,88(sp)
ffffffe0002010a8:	04813823          	sd	s0,80(sp)
ffffffe0002010ac:	04913423          	sd	s1,72(sp)
ffffffe0002010b0:	06010413          	addi	s0,sp,96
ffffffe0002010b4:	faa43423          	sd	a0,-88(s0)
ffffffe0002010b8:	d5cff0ef          	jal	ra,ffffffe000200614 <create_task>
ffffffe0002010bc:	fca43423          	sd	a0,-56(s0)
ffffffe0002010c0:	b4cff0ef          	jal	ra,ffffffe00020040c <kalloc>
ffffffe0002010c4:	00050793          	mv	a5,a0
ffffffe0002010c8:	fcf43023          	sd	a5,-64(s0)
ffffffe0002010cc:	00001637          	lui	a2,0x1
ffffffe0002010d0:	040007b7          	lui	a5,0x4000
ffffffe0002010d4:	fff78793          	addi	a5,a5,-1 # 3ffffff <_skernel-0xffffffdffc200001>
ffffffe0002010d8:	00c79593          	slli	a1,a5,0xc
ffffffe0002010dc:	fc043503          	ld	a0,-64(s0)
ffffffe0002010e0:	0a5010ef          	jal	ra,ffffffe000202984 <memcpy>
ffffffe0002010e4:	fc043703          	ld	a4,-64(s0)
ffffffe0002010e8:	fc843783          	ld	a5,-56(s0)
ffffffe0002010ec:	0007b483          	ld	s1,0(a5)
ffffffe0002010f0:	00070513          	mv	a0,a4
ffffffe0002010f4:	0ed000ef          	jal	ra,ffffffe0002019e0 <va_to_pa>
ffffffe0002010f8:	00050793          	mv	a5,a0
ffffffe0002010fc:	00f4b023          	sd	a5,0(s1)
ffffffe000201100:	00000717          	auipc	a4,0x0
ffffffe000201104:	f6470713          	addi	a4,a4,-156 # ffffffe000201064 <child_ret_from_clone>
ffffffe000201108:	fc843783          	ld	a5,-56(s0)
ffffffe00020110c:	02e7b423          	sd	a4,40(a5)
ffffffe000201110:	fc843703          	ld	a4,-56(s0)
ffffffe000201114:	000017b7          	lui	a5,0x1
ffffffe000201118:	00f70733          	add	a4,a4,a5
ffffffe00020111c:	fc843783          	ld	a5,-56(s0)
ffffffe000201120:	02e7b823          	sd	a4,48(a5) # 1030 <_skernel-0xffffffe0001fefd0>
ffffffe000201124:	00005797          	auipc	a5,0x5
ffffffe000201128:	eec78793          	addi	a5,a5,-276 # ffffffe000206010 <current>
ffffffe00020112c:	0007b783          	ld	a5,0(a5)
ffffffe000201130:	0a07b703          	ld	a4,160(a5)
ffffffe000201134:	fc843783          	ld	a5,-56(s0)
ffffffe000201138:	0ae7b023          	sd	a4,160(a5)
ffffffe00020113c:	c90ff0ef          	jal	ra,ffffffe0002005cc <create_user_page_table>
ffffffe000201140:	00050793          	mv	a5,a0
ffffffe000201144:	00078513          	mv	a0,a5
ffffffe000201148:	099000ef          	jal	ra,ffffffe0002019e0 <va_to_pa>
ffffffe00020114c:	00050713          	mv	a4,a0
ffffffe000201150:	fc843783          	ld	a5,-56(s0)
ffffffe000201154:	0ae7b823          	sd	a4,176(a5)
ffffffe000201158:	00005797          	auipc	a5,0x5
ffffffe00020115c:	eb878793          	addi	a5,a5,-328 # ffffffe000206010 <current>
ffffffe000201160:	0007b783          	ld	a5,0(a5)
ffffffe000201164:	0b87b783          	ld	a5,184(a5)
ffffffe000201168:	0007b783          	ld	a5,0(a5)
ffffffe00020116c:	fcf43c23          	sd	a5,-40(s0)
ffffffe000201170:	fd843783          	ld	a5,-40(s0)
ffffffe000201174:	00079a63          	bnez	a5,ffffffe000201188 <sys_clone+0xe8>
ffffffe000201178:	fc843783          	ld	a5,-56(s0)
ffffffe00020117c:	0b87b783          	ld	a5,184(a5)
ffffffe000201180:	0007b023          	sd	zero,0(a5)
ffffffe000201184:	1100006f          	j	ffffffe000201294 <sys_clone+0x1f4>
ffffffe000201188:	a84ff0ef          	jal	ra,ffffffe00020040c <kalloc>
ffffffe00020118c:	00050793          	mv	a5,a0
ffffffe000201190:	fcf43823          	sd	a5,-48(s0)
ffffffe000201194:	fc843783          	ld	a5,-56(s0)
ffffffe000201198:	0b87b783          	ld	a5,184(a5)
ffffffe00020119c:	fd043703          	ld	a4,-48(s0)
ffffffe0002011a0:	00e7b023          	sd	a4,0(a5)
ffffffe0002011a4:	fc843783          	ld	a5,-56(s0)
ffffffe0002011a8:	0b87b703          	ld	a4,184(a5)
ffffffe0002011ac:	fd043783          	ld	a5,-48(s0)
ffffffe0002011b0:	00e7b023          	sd	a4,0(a5)
ffffffe0002011b4:	fd843783          	ld	a5,-40(s0)
ffffffe0002011b8:	0087b703          	ld	a4,8(a5)
ffffffe0002011bc:	fd043783          	ld	a5,-48(s0)
ffffffe0002011c0:	00e7b423          	sd	a4,8(a5)
ffffffe0002011c4:	fd843783          	ld	a5,-40(s0)
ffffffe0002011c8:	0107b703          	ld	a4,16(a5)
ffffffe0002011cc:	fd043783          	ld	a5,-48(s0)
ffffffe0002011d0:	00e7b823          	sd	a4,16(a5)
ffffffe0002011d4:	fd043783          	ld	a5,-48(s0)
ffffffe0002011d8:	0007bc23          	sd	zero,24(a5)
ffffffe0002011dc:	fd043783          	ld	a5,-48(s0)
ffffffe0002011e0:	0187b703          	ld	a4,24(a5)
ffffffe0002011e4:	fd043783          	ld	a5,-48(s0)
ffffffe0002011e8:	02e7b023          	sd	a4,32(a5)
ffffffe0002011ec:	fd843783          	ld	a5,-40(s0)
ffffffe0002011f0:	0287b703          	ld	a4,40(a5)
ffffffe0002011f4:	fd043783          	ld	a5,-48(s0)
ffffffe0002011f8:	02e7b423          	sd	a4,40(a5)
ffffffe0002011fc:	fd843783          	ld	a5,-40(s0)
ffffffe000201200:	0187b783          	ld	a5,24(a5)
ffffffe000201204:	fcf43c23          	sd	a5,-40(s0)
ffffffe000201208:	0840006f          	j	ffffffe00020128c <sys_clone+0x1ec>
ffffffe00020120c:	a00ff0ef          	jal	ra,ffffffe00020040c <kalloc>
ffffffe000201210:	00050793          	mv	a5,a0
ffffffe000201214:	faf43c23          	sd	a5,-72(s0)
ffffffe000201218:	fc843783          	ld	a5,-56(s0)
ffffffe00020121c:	0b87b703          	ld	a4,184(a5)
ffffffe000201220:	fb843783          	ld	a5,-72(s0)
ffffffe000201224:	00e7b023          	sd	a4,0(a5)
ffffffe000201228:	fd843783          	ld	a5,-40(s0)
ffffffe00020122c:	0087b703          	ld	a4,8(a5)
ffffffe000201230:	fb843783          	ld	a5,-72(s0)
ffffffe000201234:	00e7b423          	sd	a4,8(a5)
ffffffe000201238:	fd843783          	ld	a5,-40(s0)
ffffffe00020123c:	0107b703          	ld	a4,16(a5)
ffffffe000201240:	fb843783          	ld	a5,-72(s0)
ffffffe000201244:	00e7b823          	sd	a4,16(a5)
ffffffe000201248:	fb843783          	ld	a5,-72(s0)
ffffffe00020124c:	0007bc23          	sd	zero,24(a5)
ffffffe000201250:	fb843783          	ld	a5,-72(s0)
ffffffe000201254:	fd043703          	ld	a4,-48(s0)
ffffffe000201258:	02e7b023          	sd	a4,32(a5)
ffffffe00020125c:	fd843783          	ld	a5,-40(s0)
ffffffe000201260:	0287b703          	ld	a4,40(a5)
ffffffe000201264:	fb843783          	ld	a5,-72(s0)
ffffffe000201268:	02e7b423          	sd	a4,40(a5)
ffffffe00020126c:	fd043783          	ld	a5,-48(s0)
ffffffe000201270:	fb843703          	ld	a4,-72(s0)
ffffffe000201274:	00e7bc23          	sd	a4,24(a5)
ffffffe000201278:	fb843783          	ld	a5,-72(s0)
ffffffe00020127c:	fcf43823          	sd	a5,-48(s0)
ffffffe000201280:	fd843783          	ld	a5,-40(s0)
ffffffe000201284:	0187b783          	ld	a5,24(a5)
ffffffe000201288:	fcf43c23          	sd	a5,-40(s0)
ffffffe00020128c:	fd843783          	ld	a5,-40(s0)
ffffffe000201290:	f6079ee3          	bnez	a5,ffffffe00020120c <sys_clone+0x16c>
ffffffe000201294:	fc843783          	ld	a5,-56(s0)
ffffffe000201298:	0c07b703          	ld	a4,192(a5)
ffffffe00020129c:	fa843783          	ld	a5,-88(s0)
ffffffe0002012a0:	00078693          	mv	a3,a5
ffffffe0002012a4:	11800793          	li	a5,280
ffffffe0002012a8:	00078613          	mv	a2,a5
ffffffe0002012ac:	00068593          	mv	a1,a3
ffffffe0002012b0:	00070513          	mv	a0,a4
ffffffe0002012b4:	6d0010ef          	jal	ra,ffffffe000202984 <memcpy>
ffffffe0002012b8:	fc843783          	ld	a5,-56(s0)
ffffffe0002012bc:	0c07b783          	ld	a5,192(a5)
ffffffe0002012c0:	0407b823          	sd	zero,80(a5)
ffffffe0002012c4:	fa843783          	ld	a5,-88(s0)
ffffffe0002012c8:	1007b703          	ld	a4,256(a5)
ffffffe0002012cc:	fc843783          	ld	a5,-56(s0)
ffffffe0002012d0:	0c07b783          	ld	a5,192(a5)
ffffffe0002012d4:	00470713          	addi	a4,a4,4
ffffffe0002012d8:	10e7b023          	sd	a4,256(a5)
ffffffe0002012dc:	fc843783          	ld	a5,-56(s0)
ffffffe0002012e0:	0207b703          	ld	a4,32(a5)
ffffffe0002012e4:	fa843783          	ld	a5,-88(s0)
ffffffe0002012e8:	04e7b823          	sd	a4,80(a5)
ffffffe0002012ec:	00000013          	nop
ffffffe0002012f0:	05813083          	ld	ra,88(sp)
ffffffe0002012f4:	05013403          	ld	s0,80(sp)
ffffffe0002012f8:	04813483          	ld	s1,72(sp)
ffffffe0002012fc:	06010113          	addi	sp,sp,96
ffffffe000201300:	00008067          	ret

ffffffe000201304 <exception_code_to_vm_flags>:
ffffffe000201304:	fe010113          	addi	sp,sp,-32
ffffffe000201308:	00813c23          	sd	s0,24(sp)
ffffffe00020130c:	02010413          	addi	s0,sp,32
ffffffe000201310:	fea43423          	sd	a0,-24(s0)
ffffffe000201314:	fe843703          	ld	a4,-24(s0)
ffffffe000201318:	00f00793          	li	a5,15
ffffffe00020131c:	02f70e63          	beq	a4,a5,ffffffe000201358 <exception_code_to_vm_flags+0x54>
ffffffe000201320:	fe843703          	ld	a4,-24(s0)
ffffffe000201324:	00f00793          	li	a5,15
ffffffe000201328:	02e7ec63          	bltu	a5,a4,ffffffe000201360 <exception_code_to_vm_flags+0x5c>
ffffffe00020132c:	fe843703          	ld	a4,-24(s0)
ffffffe000201330:	00c00793          	li	a5,12
ffffffe000201334:	00f70a63          	beq	a4,a5,ffffffe000201348 <exception_code_to_vm_flags+0x44>
ffffffe000201338:	fe843703          	ld	a4,-24(s0)
ffffffe00020133c:	00d00793          	li	a5,13
ffffffe000201340:	00f70863          	beq	a4,a5,ffffffe000201350 <exception_code_to_vm_flags+0x4c>
ffffffe000201344:	01c0006f          	j	ffffffe000201360 <exception_code_to_vm_flags+0x5c>
ffffffe000201348:	00400793          	li	a5,4
ffffffe00020134c:	0180006f          	j	ffffffe000201364 <exception_code_to_vm_flags+0x60>
ffffffe000201350:	00100793          	li	a5,1
ffffffe000201354:	0100006f          	j	ffffffe000201364 <exception_code_to_vm_flags+0x60>
ffffffe000201358:	00200793          	li	a5,2
ffffffe00020135c:	0080006f          	j	ffffffe000201364 <exception_code_to_vm_flags+0x60>
ffffffe000201360:	00000793          	li	a5,0
ffffffe000201364:	00078513          	mv	a0,a5
ffffffe000201368:	01813403          	ld	s0,24(sp)
ffffffe00020136c:	02010113          	addi	sp,sp,32
ffffffe000201370:	00008067          	ret

ffffffe000201374 <handle_page_fault>:
ffffffe000201374:	fa010113          	addi	sp,sp,-96
ffffffe000201378:	04113c23          	sd	ra,88(sp)
ffffffe00020137c:	04813823          	sd	s0,80(sp)
ffffffe000201380:	04913423          	sd	s1,72(sp)
ffffffe000201384:	05213023          	sd	s2,64(sp)
ffffffe000201388:	03313c23          	sd	s3,56(sp)
ffffffe00020138c:	06010413          	addi	s0,sp,96
ffffffe000201390:	faa43423          	sd	a0,-88(s0)
ffffffe000201394:	fab43023          	sd	a1,-96(s0)
ffffffe000201398:	fa043783          	ld	a5,-96(s0)
ffffffe00020139c:	1107b783          	ld	a5,272(a5)
ffffffe0002013a0:	fcf43023          	sd	a5,-64(s0)
ffffffe0002013a4:	00005797          	auipc	a5,0x5
ffffffe0002013a8:	c6c78793          	addi	a5,a5,-916 # ffffffe000206010 <current>
ffffffe0002013ac:	0007b783          	ld	a5,0(a5)
ffffffe0002013b0:	0b87b783          	ld	a5,184(a5)
ffffffe0002013b4:	fc043583          	ld	a1,-64(s0)
ffffffe0002013b8:	00078513          	mv	a0,a5
ffffffe0002013bc:	35c000ef          	jal	ra,ffffffe000201718 <find_vma>
ffffffe0002013c0:	faa43c23          	sd	a0,-72(s0)
ffffffe0002013c4:	fb843783          	ld	a5,-72(s0)
ffffffe0002013c8:	00079863          	bnez	a5,ffffffe0002013d8 <handle_page_fault+0x64>
ffffffe0002013cc:	00002517          	auipc	a0,0x2
ffffffe0002013d0:	d0c50513          	addi	a0,a0,-756 # ffffffe0002030d8 <TIMECLOCK+0xd8>
ffffffe0002013d4:	9d0ff0ef          	jal	ra,ffffffe0002005a4 <panic>
ffffffe0002013d8:	fa843503          	ld	a0,-88(s0)
ffffffe0002013dc:	f29ff0ef          	jal	ra,ffffffe000201304 <exception_code_to_vm_flags>
ffffffe0002013e0:	faa43823          	sd	a0,-80(s0)
ffffffe0002013e4:	fb843783          	ld	a5,-72(s0)
ffffffe0002013e8:	0287b703          	ld	a4,40(a5)
ffffffe0002013ec:	fb043783          	ld	a5,-80(s0)
ffffffe0002013f0:	00f777b3          	and	a5,a4,a5
ffffffe0002013f4:	fb043703          	ld	a4,-80(s0)
ffffffe0002013f8:	00f70863          	beq	a4,a5,ffffffe000201408 <handle_page_fault+0x94>
ffffffe0002013fc:	00002517          	auipc	a0,0x2
ffffffe000201400:	cfc50513          	addi	a0,a0,-772 # ffffffe0002030f8 <TIMECLOCK+0xf8>
ffffffe000201404:	9a0ff0ef          	jal	ra,ffffffe0002005a4 <panic>
ffffffe000201408:	fc043423          	sd	zero,-56(s0)
ffffffe00020140c:	00003717          	auipc	a4,0x3
ffffffe000201410:	40c70713          	addi	a4,a4,1036 # ffffffe000204818 <uapp_end>
ffffffe000201414:	00003797          	auipc	a5,0x3
ffffffe000201418:	bec78793          	addi	a5,a5,-1044 # ffffffe000204000 <_edata>
ffffffe00020141c:	40f707b3          	sub	a5,a4,a5
ffffffe000201420:	fc043703          	ld	a4,-64(s0)
ffffffe000201424:	00f77e63          	bgeu	a4,a5,ffffffe000201440 <handle_page_fault+0xcc>
ffffffe000201428:	00003797          	auipc	a5,0x3
ffffffe00020142c:	bd878793          	addi	a5,a5,-1064 # ffffffe000204000 <_edata>
ffffffe000201430:	00078513          	mv	a0,a5
ffffffe000201434:	5ac000ef          	jal	ra,ffffffe0002019e0 <va_to_pa>
ffffffe000201438:	fca43423          	sd	a0,-56(s0)
ffffffe00020143c:	0380006f          	j	ffffffe000201474 <handle_page_fault+0x100>
ffffffe000201440:	00005797          	auipc	a5,0x5
ffffffe000201444:	bd078793          	addi	a5,a5,-1072 # ffffffe000206010 <current>
ffffffe000201448:	0007b783          	ld	a5,0(a5)
ffffffe00020144c:	0007b783          	ld	a5,0(a5)
ffffffe000201450:	0007b783          	ld	a5,0(a5)
ffffffe000201454:	fcf43423          	sd	a5,-56(s0)
ffffffe000201458:	fc843783          	ld	a5,-56(s0)
ffffffe00020145c:	00079c63          	bnez	a5,ffffffe000201474 <handle_page_fault+0x100>
ffffffe000201460:	fadfe0ef          	jal	ra,ffffffe00020040c <kalloc>
ffffffe000201464:	00050793          	mv	a5,a0
ffffffe000201468:	00078513          	mv	a0,a5
ffffffe00020146c:	574000ef          	jal	ra,ffffffe0002019e0 <va_to_pa>
ffffffe000201470:	fca43423          	sd	a0,-56(s0)
ffffffe000201474:	00005797          	auipc	a5,0x5
ffffffe000201478:	b9c78793          	addi	a5,a5,-1124 # ffffffe000206010 <current>
ffffffe00020147c:	0007b783          	ld	a5,0(a5)
ffffffe000201480:	0b07b783          	ld	a5,176(a5)
ffffffe000201484:	00078513          	mv	a0,a5
ffffffe000201488:	588000ef          	jal	ra,ffffffe000201a10 <pa_to_va>
ffffffe00020148c:	00050793          	mv	a5,a0
ffffffe000201490:	00078993          	mv	s3,a5
ffffffe000201494:	fb843783          	ld	a5,-72(s0)
ffffffe000201498:	0087b483          	ld	s1,8(a5)
ffffffe00020149c:	fb843783          	ld	a5,-72(s0)
ffffffe0002014a0:	0107b903          	ld	s2,16(a5)
ffffffe0002014a4:	fb843783          	ld	a5,-72(s0)
ffffffe0002014a8:	0287b783          	ld	a5,40(a5)
ffffffe0002014ac:	00078513          	mv	a0,a5
ffffffe0002014b0:	590000ef          	jal	ra,ffffffe000201a40 <vm_flags_to_pte_flags>
ffffffe0002014b4:	00050793          	mv	a5,a0
ffffffe0002014b8:	0107e793          	ori	a5,a5,16
ffffffe0002014bc:	00078713          	mv	a4,a5
ffffffe0002014c0:	fc843683          	ld	a3,-56(s0)
ffffffe0002014c4:	00090613          	mv	a2,s2
ffffffe0002014c8:	00048593          	mv	a1,s1
ffffffe0002014cc:	00098513          	mv	a0,s3
ffffffe0002014d0:	011000ef          	jal	ra,ffffffe000201ce0 <map_range>
ffffffe0002014d4:	00000013          	nop
ffffffe0002014d8:	05813083          	ld	ra,88(sp)
ffffffe0002014dc:	05013403          	ld	s0,80(sp)
ffffffe0002014e0:	04813483          	ld	s1,72(sp)
ffffffe0002014e4:	04013903          	ld	s2,64(sp)
ffffffe0002014e8:	03813983          	ld	s3,56(sp)
ffffffe0002014ec:	06010113          	addi	sp,sp,96
ffffffe0002014f0:	00008067          	ret

ffffffe0002014f4 <print_trap>:
ffffffe0002014f4:	fd010113          	addi	sp,sp,-48
ffffffe0002014f8:	02113423          	sd	ra,40(sp)
ffffffe0002014fc:	02813023          	sd	s0,32(sp)
ffffffe000201500:	03010413          	addi	s0,sp,48
ffffffe000201504:	fca43c23          	sd	a0,-40(s0)
ffffffe000201508:	fcb43823          	sd	a1,-48(s0)
ffffffe00020150c:	00002797          	auipc	a5,0x2
ffffffe000201510:	c0c78793          	addi	a5,a5,-1012 # ffffffe000203118 <TIMECLOCK+0x118>
ffffffe000201514:	fef43423          	sd	a5,-24(s0)
ffffffe000201518:	fd843783          	ld	a5,-40(s0)
ffffffe00020151c:	00078e63          	beqz	a5,ffffffe000201538 <print_trap+0x44>
ffffffe000201520:	fd043703          	ld	a4,-48(s0)
ffffffe000201524:	00500793          	li	a5,5
ffffffe000201528:	00f71863          	bne	a4,a5,ffffffe000201538 <print_trap+0x44>
ffffffe00020152c:	00002797          	auipc	a5,0x2
ffffffe000201530:	bf478793          	addi	a5,a5,-1036 # ffffffe000203120 <TIMECLOCK+0x120>
ffffffe000201534:	fef43423          	sd	a5,-24(s0)
ffffffe000201538:	fd843783          	ld	a5,-40(s0)
ffffffe00020153c:	00079e63          	bnez	a5,ffffffe000201558 <print_trap+0x64>
ffffffe000201540:	fd043703          	ld	a4,-48(s0)
ffffffe000201544:	00c00793          	li	a5,12
ffffffe000201548:	00f71863          	bne	a4,a5,ffffffe000201558 <print_trap+0x64>
ffffffe00020154c:	00002797          	auipc	a5,0x2
ffffffe000201550:	be478793          	addi	a5,a5,-1052 # ffffffe000203130 <TIMECLOCK+0x130>
ffffffe000201554:	fef43423          	sd	a5,-24(s0)
ffffffe000201558:	fd843783          	ld	a5,-40(s0)
ffffffe00020155c:	00079e63          	bnez	a5,ffffffe000201578 <print_trap+0x84>
ffffffe000201560:	fd043703          	ld	a4,-48(s0)
ffffffe000201564:	00d00793          	li	a5,13
ffffffe000201568:	00f71863          	bne	a4,a5,ffffffe000201578 <print_trap+0x84>
ffffffe00020156c:	00002797          	auipc	a5,0x2
ffffffe000201570:	bdc78793          	addi	a5,a5,-1060 # ffffffe000203148 <TIMECLOCK+0x148>
ffffffe000201574:	fef43423          	sd	a5,-24(s0)
ffffffe000201578:	fd843783          	ld	a5,-40(s0)
ffffffe00020157c:	00079e63          	bnez	a5,ffffffe000201598 <print_trap+0xa4>
ffffffe000201580:	fd043703          	ld	a4,-48(s0)
ffffffe000201584:	00f00793          	li	a5,15
ffffffe000201588:	00f71863          	bne	a4,a5,ffffffe000201598 <print_trap+0xa4>
ffffffe00020158c:	00002797          	auipc	a5,0x2
ffffffe000201590:	bcc78793          	addi	a5,a5,-1076 # ffffffe000203158 <TIMECLOCK+0x158>
ffffffe000201594:	fef43423          	sd	a5,-24(s0)
ffffffe000201598:	fd843783          	ld	a5,-40(s0)
ffffffe00020159c:	00079e63          	bnez	a5,ffffffe0002015b8 <print_trap+0xc4>
ffffffe0002015a0:	fd043703          	ld	a4,-48(s0)
ffffffe0002015a4:	00800793          	li	a5,8
ffffffe0002015a8:	00f71863          	bne	a4,a5,ffffffe0002015b8 <print_trap+0xc4>
ffffffe0002015ac:	00002797          	auipc	a5,0x2
ffffffe0002015b0:	bc478793          	addi	a5,a5,-1084 # ffffffe000203170 <TIMECLOCK+0x170>
ffffffe0002015b4:	fef43423          	sd	a5,-24(s0)
ffffffe0002015b8:	fe843583          	ld	a1,-24(s0)
ffffffe0002015bc:	00002517          	auipc	a0,0x2
ffffffe0002015c0:	bcc50513          	addi	a0,a0,-1076 # ffffffe000203188 <TIMECLOCK+0x188>
ffffffe0002015c4:	77d000ef          	jal	ra,ffffffe000202540 <printk>
ffffffe0002015c8:	00000013          	nop
ffffffe0002015cc:	02813083          	ld	ra,40(sp)
ffffffe0002015d0:	02013403          	ld	s0,32(sp)
ffffffe0002015d4:	03010113          	addi	sp,sp,48
ffffffe0002015d8:	00008067          	ret

ffffffe0002015dc <trap_handler>:
ffffffe0002015dc:	fd010113          	addi	sp,sp,-48
ffffffe0002015e0:	02113423          	sd	ra,40(sp)
ffffffe0002015e4:	02813023          	sd	s0,32(sp)
ffffffe0002015e8:	03010413          	addi	s0,sp,48
ffffffe0002015ec:	fca43c23          	sd	a0,-40(s0)
ffffffe0002015f0:	fcb43823          	sd	a1,-48(s0)
ffffffe0002015f4:	fd843783          	ld	a5,-40(s0)
ffffffe0002015f8:	03f7d793          	srli	a5,a5,0x3f
ffffffe0002015fc:	fef43423          	sd	a5,-24(s0)
ffffffe000201600:	fd843783          	ld	a5,-40(s0)
ffffffe000201604:	01f7f793          	andi	a5,a5,31
ffffffe000201608:	fef43023          	sd	a5,-32(s0)
ffffffe00020160c:	fe043583          	ld	a1,-32(s0)
ffffffe000201610:	fe843503          	ld	a0,-24(s0)
ffffffe000201614:	ee1ff0ef          	jal	ra,ffffffe0002014f4 <print_trap>
ffffffe000201618:	fe843783          	ld	a5,-24(s0)
ffffffe00020161c:	06079463          	bnez	a5,ffffffe000201684 <trap_handler+0xa8>
ffffffe000201620:	fe043703          	ld	a4,-32(s0)
ffffffe000201624:	00c00793          	li	a5,12
ffffffe000201628:	04f71e63          	bne	a4,a5,ffffffe000201684 <trap_handler+0xa8>
ffffffe00020162c:	00005797          	auipc	a5,0x5
ffffffe000201630:	9f478793          	addi	a5,a5,-1548 # ffffffe000206020 <first_page_fault>
ffffffe000201634:	0007a783          	lw	a5,0(a5)
ffffffe000201638:	04079663          	bnez	a5,ffffffe000201684 <trap_handler+0xa8>
ffffffe00020163c:	fd043783          	ld	a5,-48(s0)
ffffffe000201640:	1007b783          	ld	a5,256(a5)
ffffffe000201644:	00078593          	mv	a1,a5
ffffffe000201648:	00002517          	auipc	a0,0x2
ffffffe00020164c:	b5050513          	addi	a0,a0,-1200 # ffffffe000203198 <TIMECLOCK+0x198>
ffffffe000201650:	6f1000ef          	jal	ra,ffffffe000202540 <printk>
ffffffe000201654:	fd043783          	ld	a5,-48(s0)
ffffffe000201658:	1007b703          	ld	a4,256(a5)
ffffffe00020165c:	fbf00793          	li	a5,-65
ffffffe000201660:	01f79793          	slli	a5,a5,0x1f
ffffffe000201664:	00f70733          	add	a4,a4,a5
ffffffe000201668:	fd043783          	ld	a5,-48(s0)
ffffffe00020166c:	10e7b023          	sd	a4,256(a5)
ffffffe000201670:	00005797          	auipc	a5,0x5
ffffffe000201674:	9b078793          	addi	a5,a5,-1616 # ffffffe000206020 <first_page_fault>
ffffffe000201678:	00100713          	li	a4,1
ffffffe00020167c:	00e7a023          	sw	a4,0(a5)
ffffffe000201680:	0880006f          	j	ffffffe000201708 <trap_handler+0x12c>
ffffffe000201684:	fe843783          	ld	a5,-24(s0)
ffffffe000201688:	00078c63          	beqz	a5,ffffffe0002016a0 <trap_handler+0xc4>
ffffffe00020168c:	fe043703          	ld	a4,-32(s0)
ffffffe000201690:	00500793          	li	a5,5
ffffffe000201694:	00f71663          	bne	a4,a5,ffffffe0002016a0 <trap_handler+0xc4>
ffffffe000201698:	d11fe0ef          	jal	ra,ffffffe0002003a8 <clock_set_next_event>
ffffffe00020169c:	bc4ff0ef          	jal	ra,ffffffe000200a60 <do_timer>
ffffffe0002016a0:	fe843783          	ld	a5,-24(s0)
ffffffe0002016a4:	02079a63          	bnez	a5,ffffffe0002016d8 <trap_handler+0xfc>
ffffffe0002016a8:	fe043703          	ld	a4,-32(s0)
ffffffe0002016ac:	00c00793          	li	a5,12
ffffffe0002016b0:	00f70e63          	beq	a4,a5,ffffffe0002016cc <trap_handler+0xf0>
ffffffe0002016b4:	fe043703          	ld	a4,-32(s0)
ffffffe0002016b8:	00d00793          	li	a5,13
ffffffe0002016bc:	00f70863          	beq	a4,a5,ffffffe0002016cc <trap_handler+0xf0>
ffffffe0002016c0:	fe043703          	ld	a4,-32(s0)
ffffffe0002016c4:	00f00793          	li	a5,15
ffffffe0002016c8:	00f71863          	bne	a4,a5,ffffffe0002016d8 <trap_handler+0xfc>
ffffffe0002016cc:	fd043583          	ld	a1,-48(s0)
ffffffe0002016d0:	fe043503          	ld	a0,-32(s0)
ffffffe0002016d4:	ca1ff0ef          	jal	ra,ffffffe000201374 <handle_page_fault>
ffffffe0002016d8:	fe843783          	ld	a5,-24(s0)
ffffffe0002016dc:	02079663          	bnez	a5,ffffffe000201708 <trap_handler+0x12c>
ffffffe0002016e0:	fe043703          	ld	a4,-32(s0)
ffffffe0002016e4:	00800793          	li	a5,8
ffffffe0002016e8:	02f71063          	bne	a4,a5,ffffffe000201708 <trap_handler+0x12c>
ffffffe0002016ec:	fd043503          	ld	a0,-48(s0)
ffffffe0002016f0:	821ff0ef          	jal	ra,ffffffe000200f10 <syscall>
ffffffe0002016f4:	fd043783          	ld	a5,-48(s0)
ffffffe0002016f8:	1007b783          	ld	a5,256(a5)
ffffffe0002016fc:	00478713          	addi	a4,a5,4
ffffffe000201700:	fd043783          	ld	a5,-48(s0)
ffffffe000201704:	10e7b023          	sd	a4,256(a5)
ffffffe000201708:	02813083          	ld	ra,40(sp)
ffffffe00020170c:	02013403          	ld	s0,32(sp)
ffffffe000201710:	03010113          	addi	sp,sp,48
ffffffe000201714:	00008067          	ret

ffffffe000201718 <find_vma>:
ffffffe000201718:	fd010113          	addi	sp,sp,-48
ffffffe00020171c:	02813423          	sd	s0,40(sp)
ffffffe000201720:	03010413          	addi	s0,sp,48
ffffffe000201724:	fca43c23          	sd	a0,-40(s0)
ffffffe000201728:	fcb43823          	sd	a1,-48(s0)
ffffffe00020172c:	fd843783          	ld	a5,-40(s0)
ffffffe000201730:	0007b783          	ld	a5,0(a5)
ffffffe000201734:	fef43423          	sd	a5,-24(s0)
ffffffe000201738:	0300006f          	j	ffffffe000201768 <find_vma+0x50>
ffffffe00020173c:	fe843783          	ld	a5,-24(s0)
ffffffe000201740:	0087b783          	ld	a5,8(a5)
ffffffe000201744:	fd043703          	ld	a4,-48(s0)
ffffffe000201748:	00f76a63          	bltu	a4,a5,ffffffe00020175c <find_vma+0x44>
ffffffe00020174c:	fe843783          	ld	a5,-24(s0)
ffffffe000201750:	0107b783          	ld	a5,16(a5)
ffffffe000201754:	fd043703          	ld	a4,-48(s0)
ffffffe000201758:	00f76e63          	bltu	a4,a5,ffffffe000201774 <find_vma+0x5c>
ffffffe00020175c:	fe843783          	ld	a5,-24(s0)
ffffffe000201760:	0187b783          	ld	a5,24(a5)
ffffffe000201764:	fef43423          	sd	a5,-24(s0)
ffffffe000201768:	fe843783          	ld	a5,-24(s0)
ffffffe00020176c:	fc0798e3          	bnez	a5,ffffffe00020173c <find_vma+0x24>
ffffffe000201770:	0080006f          	j	ffffffe000201778 <find_vma+0x60>
ffffffe000201774:	00000013          	nop
ffffffe000201778:	fe843783          	ld	a5,-24(s0)
ffffffe00020177c:	00078513          	mv	a0,a5
ffffffe000201780:	02813403          	ld	s0,40(sp)
ffffffe000201784:	03010113          	addi	sp,sp,48
ffffffe000201788:	00008067          	ret

ffffffe00020178c <intersect>:
ffffffe00020178c:	fc010113          	addi	sp,sp,-64
ffffffe000201790:	02813c23          	sd	s0,56(sp)
ffffffe000201794:	04010413          	addi	s0,sp,64
ffffffe000201798:	fca43c23          	sd	a0,-40(s0)
ffffffe00020179c:	fcb43823          	sd	a1,-48(s0)
ffffffe0002017a0:	fcc43423          	sd	a2,-56(s0)
ffffffe0002017a4:	fd843783          	ld	a5,-40(s0)
ffffffe0002017a8:	0007b783          	ld	a5,0(a5)
ffffffe0002017ac:	fef43423          	sd	a5,-24(s0)
ffffffe0002017b0:	0380006f          	j	ffffffe0002017e8 <intersect+0x5c>
ffffffe0002017b4:	fe843783          	ld	a5,-24(s0)
ffffffe0002017b8:	0087b783          	ld	a5,8(a5)
ffffffe0002017bc:	fc843703          	ld	a4,-56(s0)
ffffffe0002017c0:	00e7fe63          	bgeu	a5,a4,ffffffe0002017dc <intersect+0x50>
ffffffe0002017c4:	fe843783          	ld	a5,-24(s0)
ffffffe0002017c8:	0107b783          	ld	a5,16(a5)
ffffffe0002017cc:	fd043703          	ld	a4,-48(s0)
ffffffe0002017d0:	00f77663          	bgeu	a4,a5,ffffffe0002017dc <intersect+0x50>
ffffffe0002017d4:	00100793          	li	a5,1
ffffffe0002017d8:	01c0006f          	j	ffffffe0002017f4 <intersect+0x68>
ffffffe0002017dc:	fe843783          	ld	a5,-24(s0)
ffffffe0002017e0:	0187b783          	ld	a5,24(a5)
ffffffe0002017e4:	fef43423          	sd	a5,-24(s0)
ffffffe0002017e8:	fe843783          	ld	a5,-24(s0)
ffffffe0002017ec:	fc0794e3          	bnez	a5,ffffffe0002017b4 <intersect+0x28>
ffffffe0002017f0:	00000793          	li	a5,0
ffffffe0002017f4:	00078513          	mv	a0,a5
ffffffe0002017f8:	03813403          	ld	s0,56(sp)
ffffffe0002017fc:	04010113          	addi	sp,sp,64
ffffffe000201800:	00008067          	ret

ffffffe000201804 <insert>:
ffffffe000201804:	fd010113          	addi	sp,sp,-48
ffffffe000201808:	02813423          	sd	s0,40(sp)
ffffffe00020180c:	03010413          	addi	s0,sp,48
ffffffe000201810:	fca43c23          	sd	a0,-40(s0)
ffffffe000201814:	fcb43823          	sd	a1,-48(s0)
ffffffe000201818:	fd843783          	ld	a5,-40(s0)
ffffffe00020181c:	0007b783          	ld	a5,0(a5)
ffffffe000201820:	02079663          	bnez	a5,ffffffe00020184c <insert+0x48>
ffffffe000201824:	fd843783          	ld	a5,-40(s0)
ffffffe000201828:	fd043703          	ld	a4,-48(s0)
ffffffe00020182c:	00e7b023          	sd	a4,0(a5)
ffffffe000201830:	fd043783          	ld	a5,-48(s0)
ffffffe000201834:	0007bc23          	sd	zero,24(a5)
ffffffe000201838:	fd043783          	ld	a5,-48(s0)
ffffffe00020183c:	0187b703          	ld	a4,24(a5)
ffffffe000201840:	fd043783          	ld	a5,-48(s0)
ffffffe000201844:	02e7b023          	sd	a4,32(a5)
ffffffe000201848:	04c0006f          	j	ffffffe000201894 <insert+0x90>
ffffffe00020184c:	fd843783          	ld	a5,-40(s0)
ffffffe000201850:	0007b783          	ld	a5,0(a5)
ffffffe000201854:	fef43423          	sd	a5,-24(s0)
ffffffe000201858:	0100006f          	j	ffffffe000201868 <insert+0x64>
ffffffe00020185c:	fe843783          	ld	a5,-24(s0)
ffffffe000201860:	0187b783          	ld	a5,24(a5)
ffffffe000201864:	fef43423          	sd	a5,-24(s0)
ffffffe000201868:	fe843783          	ld	a5,-24(s0)
ffffffe00020186c:	0187b783          	ld	a5,24(a5)
ffffffe000201870:	fe0796e3          	bnez	a5,ffffffe00020185c <insert+0x58>
ffffffe000201874:	fe843783          	ld	a5,-24(s0)
ffffffe000201878:	fd043703          	ld	a4,-48(s0)
ffffffe00020187c:	00e7bc23          	sd	a4,24(a5)
ffffffe000201880:	fd043783          	ld	a5,-48(s0)
ffffffe000201884:	fe843703          	ld	a4,-24(s0)
ffffffe000201888:	02e7b023          	sd	a4,32(a5)
ffffffe00020188c:	fd043783          	ld	a5,-48(s0)
ffffffe000201890:	0007bc23          	sd	zero,24(a5)
ffffffe000201894:	02813403          	ld	s0,40(sp)
ffffffe000201898:	03010113          	addi	sp,sp,48
ffffffe00020189c:	00008067          	ret

ffffffe0002018a0 <do_mmap>:
ffffffe0002018a0:	fc010113          	addi	sp,sp,-64
ffffffe0002018a4:	02113c23          	sd	ra,56(sp)
ffffffe0002018a8:	02813823          	sd	s0,48(sp)
ffffffe0002018ac:	04010413          	addi	s0,sp,64
ffffffe0002018b0:	fca43c23          	sd	a0,-40(s0)
ffffffe0002018b4:	fcb43823          	sd	a1,-48(s0)
ffffffe0002018b8:	fcc43423          	sd	a2,-56(s0)
ffffffe0002018bc:	00068793          	mv	a5,a3
ffffffe0002018c0:	fcf42223          	sw	a5,-60(s0)
ffffffe0002018c4:	fc843603          	ld	a2,-56(s0)
ffffffe0002018c8:	fd043583          	ld	a1,-48(s0)
ffffffe0002018cc:	00002517          	auipc	a0,0x2
ffffffe0002018d0:	8fc50513          	addi	a0,a0,-1796 # ffffffe0002031c8 <TIMECLOCK+0x1c8>
ffffffe0002018d4:	46d000ef          	jal	ra,ffffffe000202540 <printk>
ffffffe0002018d8:	fd043703          	ld	a4,-48(s0)
ffffffe0002018dc:	fc843783          	ld	a5,-56(s0)
ffffffe0002018e0:	00f707b3          	add	a5,a4,a5
ffffffe0002018e4:	00078613          	mv	a2,a5
ffffffe0002018e8:	fd043583          	ld	a1,-48(s0)
ffffffe0002018ec:	fd843503          	ld	a0,-40(s0)
ffffffe0002018f0:	e9dff0ef          	jal	ra,ffffffe00020178c <intersect>
ffffffe0002018f4:	00050793          	mv	a5,a0
ffffffe0002018f8:	00078a63          	beqz	a5,ffffffe00020190c <do_mmap+0x6c>
ffffffe0002018fc:	fc843583          	ld	a1,-56(s0)
ffffffe000201900:	fd843503          	ld	a0,-40(s0)
ffffffe000201904:	070000ef          	jal	ra,ffffffe000201974 <get_unmapped_area>
ffffffe000201908:	fca43823          	sd	a0,-48(s0)
ffffffe00020190c:	b01fe0ef          	jal	ra,ffffffe00020040c <kalloc>
ffffffe000201910:	00050793          	mv	a5,a0
ffffffe000201914:	fef43423          	sd	a5,-24(s0)
ffffffe000201918:	fe843783          	ld	a5,-24(s0)
ffffffe00020191c:	fd043703          	ld	a4,-48(s0)
ffffffe000201920:	00e7b423          	sd	a4,8(a5)
ffffffe000201924:	fd043703          	ld	a4,-48(s0)
ffffffe000201928:	fc843783          	ld	a5,-56(s0)
ffffffe00020192c:	00f70733          	add	a4,a4,a5
ffffffe000201930:	fe843783          	ld	a5,-24(s0)
ffffffe000201934:	00e7b823          	sd	a4,16(a5)
ffffffe000201938:	fc442703          	lw	a4,-60(s0)
ffffffe00020193c:	fe843783          	ld	a5,-24(s0)
ffffffe000201940:	02e7b423          	sd	a4,40(a5)
ffffffe000201944:	fe843783          	ld	a5,-24(s0)
ffffffe000201948:	fd843703          	ld	a4,-40(s0)
ffffffe00020194c:	00e7b023          	sd	a4,0(a5)
ffffffe000201950:	fe843583          	ld	a1,-24(s0)
ffffffe000201954:	fd843503          	ld	a0,-40(s0)
ffffffe000201958:	eadff0ef          	jal	ra,ffffffe000201804 <insert>
ffffffe00020195c:	00000013          	nop
ffffffe000201960:	00078513          	mv	a0,a5
ffffffe000201964:	03813083          	ld	ra,56(sp)
ffffffe000201968:	03013403          	ld	s0,48(sp)
ffffffe00020196c:	04010113          	addi	sp,sp,64
ffffffe000201970:	00008067          	ret

ffffffe000201974 <get_unmapped_area>:
ffffffe000201974:	fd010113          	addi	sp,sp,-48
ffffffe000201978:	02113423          	sd	ra,40(sp)
ffffffe00020197c:	02813023          	sd	s0,32(sp)
ffffffe000201980:	03010413          	addi	s0,sp,48
ffffffe000201984:	fca43c23          	sd	a0,-40(s0)
ffffffe000201988:	fcb43823          	sd	a1,-48(s0)
ffffffe00020198c:	fe043423          	sd	zero,-24(s0)
ffffffe000201990:	0140006f          	j	ffffffe0002019a4 <get_unmapped_area+0x30>
ffffffe000201994:	fe843703          	ld	a4,-24(s0)
ffffffe000201998:	000017b7          	lui	a5,0x1
ffffffe00020199c:	00f707b3          	add	a5,a4,a5
ffffffe0002019a0:	fef43423          	sd	a5,-24(s0)
ffffffe0002019a4:	fe843703          	ld	a4,-24(s0)
ffffffe0002019a8:	fd043783          	ld	a5,-48(s0)
ffffffe0002019ac:	00f707b3          	add	a5,a4,a5
ffffffe0002019b0:	00078613          	mv	a2,a5
ffffffe0002019b4:	fe843583          	ld	a1,-24(s0)
ffffffe0002019b8:	fd843503          	ld	a0,-40(s0)
ffffffe0002019bc:	dd1ff0ef          	jal	ra,ffffffe00020178c <intersect>
ffffffe0002019c0:	00050793          	mv	a5,a0
ffffffe0002019c4:	fc0798e3          	bnez	a5,ffffffe000201994 <get_unmapped_area+0x20>
ffffffe0002019c8:	fe843783          	ld	a5,-24(s0)
ffffffe0002019cc:	00078513          	mv	a0,a5
ffffffe0002019d0:	02813083          	ld	ra,40(sp)
ffffffe0002019d4:	02013403          	ld	s0,32(sp)
ffffffe0002019d8:	03010113          	addi	sp,sp,48
ffffffe0002019dc:	00008067          	ret

ffffffe0002019e0 <va_to_pa>:
ffffffe0002019e0:	fe010113          	addi	sp,sp,-32
ffffffe0002019e4:	00813c23          	sd	s0,24(sp)
ffffffe0002019e8:	02010413          	addi	s0,sp,32
ffffffe0002019ec:	fea43423          	sd	a0,-24(s0)
ffffffe0002019f0:	fe843703          	ld	a4,-24(s0)
ffffffe0002019f4:	04100793          	li	a5,65
ffffffe0002019f8:	01f79793          	slli	a5,a5,0x1f
ffffffe0002019fc:	00f707b3          	add	a5,a4,a5
ffffffe000201a00:	00078513          	mv	a0,a5
ffffffe000201a04:	01813403          	ld	s0,24(sp)
ffffffe000201a08:	02010113          	addi	sp,sp,32
ffffffe000201a0c:	00008067          	ret

ffffffe000201a10 <pa_to_va>:
ffffffe000201a10:	fe010113          	addi	sp,sp,-32
ffffffe000201a14:	00813c23          	sd	s0,24(sp)
ffffffe000201a18:	02010413          	addi	s0,sp,32
ffffffe000201a1c:	fea43423          	sd	a0,-24(s0)
ffffffe000201a20:	fe843703          	ld	a4,-24(s0)
ffffffe000201a24:	fbf00793          	li	a5,-65
ffffffe000201a28:	01f79793          	slli	a5,a5,0x1f
ffffffe000201a2c:	00f707b3          	add	a5,a4,a5
ffffffe000201a30:	00078513          	mv	a0,a5
ffffffe000201a34:	01813403          	ld	s0,24(sp)
ffffffe000201a38:	02010113          	addi	sp,sp,32
ffffffe000201a3c:	00008067          	ret

ffffffe000201a40 <vm_flags_to_pte_flags>:
ffffffe000201a40:	fd010113          	addi	sp,sp,-48
ffffffe000201a44:	02813423          	sd	s0,40(sp)
ffffffe000201a48:	03010413          	addi	s0,sp,48
ffffffe000201a4c:	fca43c23          	sd	a0,-40(s0)
ffffffe000201a50:	fe043423          	sd	zero,-24(s0)
ffffffe000201a54:	fd843783          	ld	a5,-40(s0)
ffffffe000201a58:	0017f793          	andi	a5,a5,1
ffffffe000201a5c:	00078863          	beqz	a5,ffffffe000201a6c <vm_flags_to_pte_flags+0x2c>
ffffffe000201a60:	fe843783          	ld	a5,-24(s0)
ffffffe000201a64:	0027e793          	ori	a5,a5,2
ffffffe000201a68:	fef43423          	sd	a5,-24(s0)
ffffffe000201a6c:	fd843783          	ld	a5,-40(s0)
ffffffe000201a70:	0027f793          	andi	a5,a5,2
ffffffe000201a74:	00078863          	beqz	a5,ffffffe000201a84 <vm_flags_to_pte_flags+0x44>
ffffffe000201a78:	fe843783          	ld	a5,-24(s0)
ffffffe000201a7c:	0047e793          	ori	a5,a5,4
ffffffe000201a80:	fef43423          	sd	a5,-24(s0)
ffffffe000201a84:	fd843783          	ld	a5,-40(s0)
ffffffe000201a88:	0047f793          	andi	a5,a5,4
ffffffe000201a8c:	00078863          	beqz	a5,ffffffe000201a9c <vm_flags_to_pte_flags+0x5c>
ffffffe000201a90:	fe843783          	ld	a5,-24(s0)
ffffffe000201a94:	0087e793          	ori	a5,a5,8
ffffffe000201a98:	fef43423          	sd	a5,-24(s0)
ffffffe000201a9c:	fe843783          	ld	a5,-24(s0)
ffffffe000201aa0:	00078513          	mv	a0,a5
ffffffe000201aa4:	02813403          	ld	s0,40(sp)
ffffffe000201aa8:	03010113          	addi	sp,sp,48
ffffffe000201aac:	00008067          	ret

ffffffe000201ab0 <pte_to_pa>:
ffffffe000201ab0:	fe010113          	addi	sp,sp,-32
ffffffe000201ab4:	00813c23          	sd	s0,24(sp)
ffffffe000201ab8:	02010413          	addi	s0,sp,32
ffffffe000201abc:	fea43423          	sd	a0,-24(s0)
ffffffe000201ac0:	fe843783          	ld	a5,-24(s0)
ffffffe000201ac4:	00a7d793          	srli	a5,a5,0xa
ffffffe000201ac8:	00c79713          	slli	a4,a5,0xc
ffffffe000201acc:	fff007b7          	lui	a5,0xfff00
ffffffe000201ad0:	0087d793          	srli	a5,a5,0x8
ffffffe000201ad4:	00f777b3          	and	a5,a4,a5
ffffffe000201ad8:	00078513          	mv	a0,a5
ffffffe000201adc:	01813403          	ld	s0,24(sp)
ffffffe000201ae0:	02010113          	addi	sp,sp,32
ffffffe000201ae4:	00008067          	ret

ffffffe000201ae8 <pte_to_va>:
ffffffe000201ae8:	fe010113          	addi	sp,sp,-32
ffffffe000201aec:	00113c23          	sd	ra,24(sp)
ffffffe000201af0:	00813823          	sd	s0,16(sp)
ffffffe000201af4:	02010413          	addi	s0,sp,32
ffffffe000201af8:	fea43423          	sd	a0,-24(s0)
ffffffe000201afc:	fe843503          	ld	a0,-24(s0)
ffffffe000201b00:	fb1ff0ef          	jal	ra,ffffffe000201ab0 <pte_to_pa>
ffffffe000201b04:	00050793          	mv	a5,a0
ffffffe000201b08:	00078513          	mv	a0,a5
ffffffe000201b0c:	f05ff0ef          	jal	ra,ffffffe000201a10 <pa_to_va>
ffffffe000201b10:	00050793          	mv	a5,a0
ffffffe000201b14:	00078513          	mv	a0,a5
ffffffe000201b18:	01813083          	ld	ra,24(sp)
ffffffe000201b1c:	01013403          	ld	s0,16(sp)
ffffffe000201b20:	02010113          	addi	sp,sp,32
ffffffe000201b24:	00008067          	ret

ffffffe000201b28 <compose_pte>:
ffffffe000201b28:	fd010113          	addi	sp,sp,-48
ffffffe000201b2c:	02813423          	sd	s0,40(sp)
ffffffe000201b30:	03010413          	addi	s0,sp,48
ffffffe000201b34:	fca43c23          	sd	a0,-40(s0)
ffffffe000201b38:	fcb43823          	sd	a1,-48(s0)
ffffffe000201b3c:	fd843783          	ld	a5,-40(s0)
ffffffe000201b40:	00c7d713          	srli	a4,a5,0xc
ffffffe000201b44:	fff00793          	li	a5,-1
ffffffe000201b48:	0147d793          	srli	a5,a5,0x14
ffffffe000201b4c:	00f777b3          	and	a5,a4,a5
ffffffe000201b50:	fef43423          	sd	a5,-24(s0)
ffffffe000201b54:	fe843783          	ld	a5,-24(s0)
ffffffe000201b58:	00a79713          	slli	a4,a5,0xa
ffffffe000201b5c:	fd043783          	ld	a5,-48(s0)
ffffffe000201b60:	00f767b3          	or	a5,a4,a5
ffffffe000201b64:	00078513          	mv	a0,a5
ffffffe000201b68:	02813403          	ld	s0,40(sp)
ffffffe000201b6c:	03010113          	addi	sp,sp,48
ffffffe000201b70:	00008067          	ret

ffffffe000201b74 <first_map>:
ffffffe000201b74:	fc010113          	addi	sp,sp,-64
ffffffe000201b78:	02113c23          	sd	ra,56(sp)
ffffffe000201b7c:	02813823          	sd	s0,48(sp)
ffffffe000201b80:	04010413          	addi	s0,sp,64
ffffffe000201b84:	fca43c23          	sd	a0,-40(s0)
ffffffe000201b88:	fcb43823          	sd	a1,-48(s0)
ffffffe000201b8c:	fcc43423          	sd	a2,-56(s0)
ffffffe000201b90:	fc843783          	ld	a5,-56(s0)
ffffffe000201b94:	0017e793          	ori	a5,a5,1
ffffffe000201b98:	00078593          	mv	a1,a5
ffffffe000201b9c:	fd043503          	ld	a0,-48(s0)
ffffffe000201ba0:	f89ff0ef          	jal	ra,ffffffe000201b28 <compose_pte>
ffffffe000201ba4:	fea43423          	sd	a0,-24(s0)
ffffffe000201ba8:	fd843783          	ld	a5,-40(s0)
ffffffe000201bac:	01e7d793          	srli	a5,a5,0x1e
ffffffe000201bb0:	1ff7f793          	andi	a5,a5,511
ffffffe000201bb4:	00005717          	auipc	a4,0x5
ffffffe000201bb8:	44c70713          	addi	a4,a4,1100 # ffffffe000207000 <first_page_table>
ffffffe000201bbc:	00379793          	slli	a5,a5,0x3
ffffffe000201bc0:	00f707b3          	add	a5,a4,a5
ffffffe000201bc4:	fe843703          	ld	a4,-24(s0)
ffffffe000201bc8:	00e7b023          	sd	a4,0(a5) # fffffffffff00000 <_ebss+0x1fffcf6060>
ffffffe000201bcc:	00000013          	nop
ffffffe000201bd0:	03813083          	ld	ra,56(sp)
ffffffe000201bd4:	03013403          	ld	s0,48(sp)
ffffffe000201bd8:	04010113          	addi	sp,sp,64
ffffffe000201bdc:	00008067          	ret

ffffffe000201be0 <setup_vm_first>:
ffffffe000201be0:	fe010113          	addi	sp,sp,-32
ffffffe000201be4:	00113c23          	sd	ra,24(sp)
ffffffe000201be8:	00813823          	sd	s0,16(sp)
ffffffe000201bec:	02010413          	addi	s0,sp,32
ffffffe000201bf0:	00001637          	lui	a2,0x1
ffffffe000201bf4:	00000593          	li	a1,0
ffffffe000201bf8:	00005517          	auipc	a0,0x5
ffffffe000201bfc:	40850513          	addi	a0,a0,1032 # ffffffe000207000 <first_page_table>
ffffffe000201c00:	519000ef          	jal	ra,ffffffe000202918 <memset>
ffffffe000201c04:	00100793          	li	a5,1
ffffffe000201c08:	01f79793          	slli	a5,a5,0x1f
ffffffe000201c0c:	fef43423          	sd	a5,-24(s0)
ffffffe000201c10:	fff00793          	li	a5,-1
ffffffe000201c14:	02579793          	slli	a5,a5,0x25
ffffffe000201c18:	fef43023          	sd	a5,-32(s0)
ffffffe000201c1c:	00e00613          	li	a2,14
ffffffe000201c20:	fe843583          	ld	a1,-24(s0)
ffffffe000201c24:	fe043503          	ld	a0,-32(s0)
ffffffe000201c28:	f4dff0ef          	jal	ra,ffffffe000201b74 <first_map>
ffffffe000201c2c:	00000013          	nop
ffffffe000201c30:	01813083          	ld	ra,24(sp)
ffffffe000201c34:	01013403          	ld	s0,16(sp)
ffffffe000201c38:	02010113          	addi	sp,sp,32
ffffffe000201c3c:	00008067          	ret

ffffffe000201c40 <get_or_create_internal_entry>:
ffffffe000201c40:	fc010113          	addi	sp,sp,-64
ffffffe000201c44:	02113c23          	sd	ra,56(sp)
ffffffe000201c48:	02813823          	sd	s0,48(sp)
ffffffe000201c4c:	04010413          	addi	s0,sp,64
ffffffe000201c50:	fca43423          	sd	a0,-56(s0)
ffffffe000201c54:	fcb43023          	sd	a1,-64(s0)
ffffffe000201c58:	fc043783          	ld	a5,-64(s0)
ffffffe000201c5c:	00379793          	slli	a5,a5,0x3
ffffffe000201c60:	fc843703          	ld	a4,-56(s0)
ffffffe000201c64:	00f707b3          	add	a5,a4,a5
ffffffe000201c68:	0007b783          	ld	a5,0(a5)
ffffffe000201c6c:	0017f793          	andi	a5,a5,1
ffffffe000201c70:	00078e63          	beqz	a5,ffffffe000201c8c <get_or_create_internal_entry+0x4c>
ffffffe000201c74:	fc043783          	ld	a5,-64(s0)
ffffffe000201c78:	00379793          	slli	a5,a5,0x3
ffffffe000201c7c:	fc843703          	ld	a4,-56(s0)
ffffffe000201c80:	00f707b3          	add	a5,a4,a5
ffffffe000201c84:	0007b783          	ld	a5,0(a5)
ffffffe000201c88:	0440006f          	j	ffffffe000201ccc <get_or_create_internal_entry+0x8c>
ffffffe000201c8c:	f80fe0ef          	jal	ra,ffffffe00020040c <kalloc>
ffffffe000201c90:	fea43423          	sd	a0,-24(s0)
ffffffe000201c94:	fe843503          	ld	a0,-24(s0)
ffffffe000201c98:	d49ff0ef          	jal	ra,ffffffe0002019e0 <va_to_pa>
ffffffe000201c9c:	fea43023          	sd	a0,-32(s0)
ffffffe000201ca0:	00100593          	li	a1,1
ffffffe000201ca4:	fe043503          	ld	a0,-32(s0)
ffffffe000201ca8:	e81ff0ef          	jal	ra,ffffffe000201b28 <compose_pte>
ffffffe000201cac:	fca43c23          	sd	a0,-40(s0)
ffffffe000201cb0:	fc043783          	ld	a5,-64(s0)
ffffffe000201cb4:	00379793          	slli	a5,a5,0x3
ffffffe000201cb8:	fc843703          	ld	a4,-56(s0)
ffffffe000201cbc:	00f707b3          	add	a5,a4,a5
ffffffe000201cc0:	fd843703          	ld	a4,-40(s0)
ffffffe000201cc4:	00e7b023          	sd	a4,0(a5)
ffffffe000201cc8:	fd843783          	ld	a5,-40(s0)
ffffffe000201ccc:	00078513          	mv	a0,a5
ffffffe000201cd0:	03813083          	ld	ra,56(sp)
ffffffe000201cd4:	03013403          	ld	s0,48(sp)
ffffffe000201cd8:	04010113          	addi	sp,sp,64
ffffffe000201cdc:	00008067          	ret

ffffffe000201ce0 <map_range>:
ffffffe000201ce0:	f7010113          	addi	sp,sp,-144
ffffffe000201ce4:	08113423          	sd	ra,136(sp)
ffffffe000201ce8:	08813023          	sd	s0,128(sp)
ffffffe000201cec:	06913c23          	sd	s1,120(sp)
ffffffe000201cf0:	09010413          	addi	s0,sp,144
ffffffe000201cf4:	f8a43c23          	sd	a0,-104(s0)
ffffffe000201cf8:	f8b43823          	sd	a1,-112(s0)
ffffffe000201cfc:	f8c43423          	sd	a2,-120(s0)
ffffffe000201d00:	f8d43023          	sd	a3,-128(s0)
ffffffe000201d04:	f6e43c23          	sd	a4,-136(s0)
ffffffe000201d08:	1080006f          	j	ffffffe000201e10 <map_range+0x130>
ffffffe000201d0c:	f9043783          	ld	a5,-112(s0)
ffffffe000201d10:	00c7d793          	srli	a5,a5,0xc
ffffffe000201d14:	fcf43c23          	sd	a5,-40(s0)
ffffffe000201d18:	f9843783          	ld	a5,-104(s0)
ffffffe000201d1c:	fcf43823          	sd	a5,-48(s0)
ffffffe000201d20:	fc042623          	sw	zero,-52(s0)
ffffffe000201d24:	0380006f          	j	ffffffe000201d5c <map_range+0x7c>
ffffffe000201d28:	fd843783          	ld	a5,-40(s0)
ffffffe000201d2c:	1ff7f713          	andi	a4,a5,511
ffffffe000201d30:	fcc42783          	lw	a5,-52(s0)
ffffffe000201d34:	00379793          	slli	a5,a5,0x3
ffffffe000201d38:	fe078793          	addi	a5,a5,-32
ffffffe000201d3c:	008787b3          	add	a5,a5,s0
ffffffe000201d40:	fce7b423          	sd	a4,-56(a5)
ffffffe000201d44:	fcc42783          	lw	a5,-52(s0)
ffffffe000201d48:	0017879b          	addiw	a5,a5,1
ffffffe000201d4c:	fcf42623          	sw	a5,-52(s0)
ffffffe000201d50:	fd843783          	ld	a5,-40(s0)
ffffffe000201d54:	0097d793          	srli	a5,a5,0x9
ffffffe000201d58:	fcf43c23          	sd	a5,-40(s0)
ffffffe000201d5c:	fcc42783          	lw	a5,-52(s0)
ffffffe000201d60:	0007871b          	sext.w	a4,a5
ffffffe000201d64:	00200793          	li	a5,2
ffffffe000201d68:	fce7d0e3          	bge	a5,a4,ffffffe000201d28 <map_range+0x48>
ffffffe000201d6c:	00200793          	li	a5,2
ffffffe000201d70:	fcf42423          	sw	a5,-56(s0)
ffffffe000201d74:	0440006f          	j	ffffffe000201db8 <map_range+0xd8>
ffffffe000201d78:	fc842783          	lw	a5,-56(s0)
ffffffe000201d7c:	00379793          	slli	a5,a5,0x3
ffffffe000201d80:	fe078793          	addi	a5,a5,-32
ffffffe000201d84:	008787b3          	add	a5,a5,s0
ffffffe000201d88:	fc87b783          	ld	a5,-56(a5)
ffffffe000201d8c:	00078593          	mv	a1,a5
ffffffe000201d90:	fd043503          	ld	a0,-48(s0)
ffffffe000201d94:	eadff0ef          	jal	ra,ffffffe000201c40 <get_or_create_internal_entry>
ffffffe000201d98:	fca43023          	sd	a0,-64(s0)
ffffffe000201d9c:	fc043503          	ld	a0,-64(s0)
ffffffe000201da0:	d49ff0ef          	jal	ra,ffffffe000201ae8 <pte_to_va>
ffffffe000201da4:	00050793          	mv	a5,a0
ffffffe000201da8:	fcf43823          	sd	a5,-48(s0)
ffffffe000201dac:	fc842783          	lw	a5,-56(s0)
ffffffe000201db0:	fff7879b          	addiw	a5,a5,-1
ffffffe000201db4:	fcf42423          	sw	a5,-56(s0)
ffffffe000201db8:	fc842783          	lw	a5,-56(s0)
ffffffe000201dbc:	0007879b          	sext.w	a5,a5
ffffffe000201dc0:	faf04ce3          	bgtz	a5,ffffffe000201d78 <map_range+0x98>
ffffffe000201dc4:	f7843783          	ld	a5,-136(s0)
ffffffe000201dc8:	0017e693          	ori	a3,a5,1
ffffffe000201dcc:	fa843783          	ld	a5,-88(s0)
ffffffe000201dd0:	00379793          	slli	a5,a5,0x3
ffffffe000201dd4:	fd043703          	ld	a4,-48(s0)
ffffffe000201dd8:	00f704b3          	add	s1,a4,a5
ffffffe000201ddc:	00068593          	mv	a1,a3
ffffffe000201de0:	f8043503          	ld	a0,-128(s0)
ffffffe000201de4:	d45ff0ef          	jal	ra,ffffffe000201b28 <compose_pte>
ffffffe000201de8:	00050793          	mv	a5,a0
ffffffe000201dec:	00f4b023          	sd	a5,0(s1)
ffffffe000201df0:	f9043703          	ld	a4,-112(s0)
ffffffe000201df4:	000017b7          	lui	a5,0x1
ffffffe000201df8:	00f707b3          	add	a5,a4,a5
ffffffe000201dfc:	f8f43823          	sd	a5,-112(s0)
ffffffe000201e00:	f8043703          	ld	a4,-128(s0)
ffffffe000201e04:	000017b7          	lui	a5,0x1
ffffffe000201e08:	00f707b3          	add	a5,a4,a5
ffffffe000201e0c:	f8f43023          	sd	a5,-128(s0)
ffffffe000201e10:	f9043703          	ld	a4,-112(s0)
ffffffe000201e14:	f8843783          	ld	a5,-120(s0)
ffffffe000201e18:	eef76ae3          	bltu	a4,a5,ffffffe000201d0c <map_range+0x2c>
ffffffe000201e1c:	00000013          	nop
ffffffe000201e20:	00000013          	nop
ffffffe000201e24:	08813083          	ld	ra,136(sp)
ffffffe000201e28:	08013403          	ld	s0,128(sp)
ffffffe000201e2c:	07813483          	ld	s1,120(sp)
ffffffe000201e30:	09010113          	addi	sp,sp,144
ffffffe000201e34:	00008067          	ret

ffffffe000201e38 <second_map_range>:
ffffffe000201e38:	fa010113          	addi	sp,sp,-96
ffffffe000201e3c:	04113c23          	sd	ra,88(sp)
ffffffe000201e40:	04813823          	sd	s0,80(sp)
ffffffe000201e44:	06010413          	addi	s0,sp,96
ffffffe000201e48:	fca43423          	sd	a0,-56(s0)
ffffffe000201e4c:	fcb43023          	sd	a1,-64(s0)
ffffffe000201e50:	fac43c23          	sd	a2,-72(s0)
ffffffe000201e54:	fad43823          	sd	a3,-80(s0)
ffffffe000201e58:	fae43423          	sd	a4,-88(s0)
ffffffe000201e5c:	fc043783          	ld	a5,-64(s0)
ffffffe000201e60:	fef43423          	sd	a5,-24(s0)
ffffffe000201e64:	fb843783          	ld	a5,-72(s0)
ffffffe000201e68:	fef43023          	sd	a5,-32(s0)
ffffffe000201e6c:	fb043783          	ld	a5,-80(s0)
ffffffe000201e70:	fcf43c23          	sd	a5,-40(s0)
ffffffe000201e74:	fa843703          	ld	a4,-88(s0)
ffffffe000201e78:	fd843683          	ld	a3,-40(s0)
ffffffe000201e7c:	fe043603          	ld	a2,-32(s0)
ffffffe000201e80:	fe843583          	ld	a1,-24(s0)
ffffffe000201e84:	fc843503          	ld	a0,-56(s0)
ffffffe000201e88:	e59ff0ef          	jal	ra,ffffffe000201ce0 <map_range>
ffffffe000201e8c:	00000013          	nop
ffffffe000201e90:	05813083          	ld	ra,88(sp)
ffffffe000201e94:	05013403          	ld	s0,80(sp)
ffffffe000201e98:	06010113          	addi	sp,sp,96
ffffffe000201e9c:	00008067          	ret

ffffffe000201ea0 <setup_vm_second>:
ffffffe000201ea0:	fe010113          	addi	sp,sp,-32
ffffffe000201ea4:	00113c23          	sd	ra,24(sp)
ffffffe000201ea8:	00813823          	sd	s0,16(sp)
ffffffe000201eac:	02010413          	addi	s0,sp,32
ffffffe000201eb0:	00001637          	lui	a2,0x1
ffffffe000201eb4:	00000593          	li	a1,0
ffffffe000201eb8:	00006517          	auipc	a0,0x6
ffffffe000201ebc:	14850513          	addi	a0,a0,328 # ffffffe000208000 <second_page_table>
ffffffe000201ec0:	259000ef          	jal	ra,ffffffe000202918 <memset>
ffffffe000201ec4:	ffffe717          	auipc	a4,0xffffe
ffffffe000201ec8:	13c70713          	addi	a4,a4,316 # ffffffe000200000 <_skernel>
ffffffe000201ecc:	04100793          	li	a5,65
ffffffe000201ed0:	01f79793          	slli	a5,a5,0x1f
ffffffe000201ed4:	00f707b3          	add	a5,a4,a5
ffffffe000201ed8:	00a00713          	li	a4,10
ffffffe000201edc:	00078693          	mv	a3,a5
ffffffe000201ee0:	00001617          	auipc	a2,0x1
ffffffe000201ee4:	b1c60613          	addi	a2,a2,-1252 # ffffffe0002029fc <_etext>
ffffffe000201ee8:	ffffe597          	auipc	a1,0xffffe
ffffffe000201eec:	11858593          	addi	a1,a1,280 # ffffffe000200000 <_skernel>
ffffffe000201ef0:	00006517          	auipc	a0,0x6
ffffffe000201ef4:	11050513          	addi	a0,a0,272 # ffffffe000208000 <second_page_table>
ffffffe000201ef8:	f41ff0ef          	jal	ra,ffffffe000201e38 <second_map_range>
ffffffe000201efc:	00001717          	auipc	a4,0x1
ffffffe000201f00:	10470713          	addi	a4,a4,260 # ffffffe000203000 <TIMECLOCK>
ffffffe000201f04:	04100793          	li	a5,65
ffffffe000201f08:	01f79793          	slli	a5,a5,0x1f
ffffffe000201f0c:	00f707b3          	add	a5,a4,a5
ffffffe000201f10:	00200713          	li	a4,2
ffffffe000201f14:	00078693          	mv	a3,a5
ffffffe000201f18:	00001617          	auipc	a2,0x1
ffffffe000201f1c:	33860613          	addi	a2,a2,824 # ffffffe000203250 <_erodata>
ffffffe000201f20:	00001597          	auipc	a1,0x1
ffffffe000201f24:	0e058593          	addi	a1,a1,224 # ffffffe000203000 <TIMECLOCK>
ffffffe000201f28:	00006517          	auipc	a0,0x6
ffffffe000201f2c:	0d850513          	addi	a0,a0,216 # ffffffe000208000 <second_page_table>
ffffffe000201f30:	f09ff0ef          	jal	ra,ffffffe000201e38 <second_map_range>
ffffffe000201f34:	00002717          	auipc	a4,0x2
ffffffe000201f38:	0cc70713          	addi	a4,a4,204 # ffffffe000204000 <_edata>
ffffffe000201f3c:	04100793          	li	a5,65
ffffffe000201f40:	01f79793          	slli	a5,a5,0x1f
ffffffe000201f44:	00f707b3          	add	a5,a4,a5
ffffffe000201f48:	00600713          	li	a4,6
ffffffe000201f4c:	00078693          	mv	a3,a5
ffffffe000201f50:	c0100793          	li	a5,-1023
ffffffe000201f54:	01b79613          	slli	a2,a5,0x1b
ffffffe000201f58:	00002597          	auipc	a1,0x2
ffffffe000201f5c:	0a858593          	addi	a1,a1,168 # ffffffe000204000 <_edata>
ffffffe000201f60:	00006517          	auipc	a0,0x6
ffffffe000201f64:	0a050513          	addi	a0,a0,160 # ffffffe000208000 <second_page_table>
ffffffe000201f68:	ed1ff0ef          	jal	ra,ffffffe000201e38 <second_map_range>
ffffffe000201f6c:	00006717          	auipc	a4,0x6
ffffffe000201f70:	09470713          	addi	a4,a4,148 # ffffffe000208000 <second_page_table>
ffffffe000201f74:	04100793          	li	a5,65
ffffffe000201f78:	01f79793          	slli	a5,a5,0x1f
ffffffe000201f7c:	00f707b3          	add	a5,a4,a5
ffffffe000201f80:	fef43423          	sd	a5,-24(s0)
ffffffe000201f84:	fe843783          	ld	a5,-24(s0)
ffffffe000201f88:	00078393          	mv	t2,a5
ffffffe000201f8c:	00c3d393          	srli	t2,t2,0xc
ffffffe000201f90:	fff0031b          	addiw	t1,zero,-1
ffffffe000201f94:	03f31313          	slli	t1,t1,0x3f
ffffffe000201f98:	00736333          	or	t1,t1,t2
ffffffe000201f9c:	18031073          	csrw	satp,t1
ffffffe000201fa0:	12000073          	sfence.vma
ffffffe000201fa4:	00000013          	nop
ffffffe000201fa8:	01813083          	ld	ra,24(sp)
ffffffe000201fac:	01013403          	ld	s0,16(sp)
ffffffe000201fb0:	02010113          	addi	sp,sp,32
ffffffe000201fb4:	00008067          	ret

ffffffe000201fb8 <start_kernel>:
ffffffe000201fb8:	ff010113          	addi	sp,sp,-16
ffffffe000201fbc:	00113423          	sd	ra,8(sp)
ffffffe000201fc0:	00813023          	sd	s0,0(sp)
ffffffe000201fc4:	01010413          	addi	s0,sp,16
ffffffe000201fc8:	7e600593          	li	a1,2022
ffffffe000201fcc:	00001517          	auipc	a0,0x1
ffffffe000201fd0:	21450513          	addi	a0,a0,532 # ffffffe0002031e0 <TIMECLOCK+0x1e0>
ffffffe000201fd4:	56c000ef          	jal	ra,ffffffe000202540 <printk>
ffffffe000201fd8:	00001517          	auipc	a0,0x1
ffffffe000201fdc:	21050513          	addi	a0,a0,528 # ffffffe0002031e8 <TIMECLOCK+0x1e8>
ffffffe000201fe0:	560000ef          	jal	ra,ffffffe000202540 <printk>
ffffffe000201fe4:	e45fe0ef          	jal	ra,ffffffe000200e28 <schedule>
ffffffe000201fe8:	01c000ef          	jal	ra,ffffffe000202004 <test>
ffffffe000201fec:	00000793          	li	a5,0
ffffffe000201ff0:	00078513          	mv	a0,a5
ffffffe000201ff4:	00813083          	ld	ra,8(sp)
ffffffe000201ff8:	00013403          	ld	s0,0(sp)
ffffffe000201ffc:	01010113          	addi	sp,sp,16
ffffffe000202000:	00008067          	ret

ffffffe000202004 <test>:
ffffffe000202004:	ff010113          	addi	sp,sp,-16
ffffffe000202008:	00813423          	sd	s0,8(sp)
ffffffe00020200c:	01010413          	addi	s0,sp,16
ffffffe000202010:	0000006f          	j	ffffffe000202010 <test+0xc>

ffffffe000202014 <putc>:
ffffffe000202014:	fe010113          	addi	sp,sp,-32
ffffffe000202018:	00113c23          	sd	ra,24(sp)
ffffffe00020201c:	00813823          	sd	s0,16(sp)
ffffffe000202020:	02010413          	addi	s0,sp,32
ffffffe000202024:	00050793          	mv	a5,a0
ffffffe000202028:	fef407a3          	sb	a5,-17(s0)
ffffffe00020202c:	fef44603          	lbu	a2,-17(s0)
ffffffe000202030:	00000893          	li	a7,0
ffffffe000202034:	00000813          	li	a6,0
ffffffe000202038:	00000793          	li	a5,0
ffffffe00020203c:	00000713          	li	a4,0
ffffffe000202040:	00000693          	li	a3,0
ffffffe000202044:	00000593          	li	a1,0
ffffffe000202048:	00100513          	li	a0,1
ffffffe00020204c:	e29fe0ef          	jal	ra,ffffffe000200e74 <sbi_ecall>
ffffffe000202050:	00000013          	nop
ffffffe000202054:	01813083          	ld	ra,24(sp)
ffffffe000202058:	01013403          	ld	s0,16(sp)
ffffffe00020205c:	02010113          	addi	sp,sp,32
ffffffe000202060:	00008067          	ret

ffffffe000202064 <vprintfmt>:
ffffffe000202064:	f2010113          	addi	sp,sp,-224
ffffffe000202068:	0c113c23          	sd	ra,216(sp)
ffffffe00020206c:	0c813823          	sd	s0,208(sp)
ffffffe000202070:	0e010413          	addi	s0,sp,224
ffffffe000202074:	f2a43c23          	sd	a0,-200(s0)
ffffffe000202078:	f2b43823          	sd	a1,-208(s0)
ffffffe00020207c:	f2c43423          	sd	a2,-216(s0)
ffffffe000202080:	fe042623          	sw	zero,-20(s0)
ffffffe000202084:	fe042423          	sw	zero,-24(s0)
ffffffe000202088:	fe043023          	sd	zero,-32(s0)
ffffffe00020208c:	48c0006f          	j	ffffffe000202518 <vprintfmt+0x4b4>
ffffffe000202090:	fec42783          	lw	a5,-20(s0)
ffffffe000202094:	0007879b          	sext.w	a5,a5
ffffffe000202098:	42078663          	beqz	a5,ffffffe0002024c4 <vprintfmt+0x460>
ffffffe00020209c:	f3043783          	ld	a5,-208(s0)
ffffffe0002020a0:	0007c783          	lbu	a5,0(a5) # 1000 <_skernel-0xffffffe0001ff000>
ffffffe0002020a4:	0007879b          	sext.w	a5,a5
ffffffe0002020a8:	f9d7869b          	addiw	a3,a5,-99
ffffffe0002020ac:	0006871b          	sext.w	a4,a3
ffffffe0002020b0:	01500793          	li	a5,21
ffffffe0002020b4:	44e7ea63          	bltu	a5,a4,ffffffe000202508 <vprintfmt+0x4a4>
ffffffe0002020b8:	02069793          	slli	a5,a3,0x20
ffffffe0002020bc:	0207d793          	srli	a5,a5,0x20
ffffffe0002020c0:	00279713          	slli	a4,a5,0x2
ffffffe0002020c4:	00001797          	auipc	a5,0x1
ffffffe0002020c8:	13478793          	addi	a5,a5,308 # ffffffe0002031f8 <TIMECLOCK+0x1f8>
ffffffe0002020cc:	00f707b3          	add	a5,a4,a5
ffffffe0002020d0:	0007a783          	lw	a5,0(a5)
ffffffe0002020d4:	0007871b          	sext.w	a4,a5
ffffffe0002020d8:	00001797          	auipc	a5,0x1
ffffffe0002020dc:	12078793          	addi	a5,a5,288 # ffffffe0002031f8 <TIMECLOCK+0x1f8>
ffffffe0002020e0:	00f707b3          	add	a5,a4,a5
ffffffe0002020e4:	00078067          	jr	a5
ffffffe0002020e8:	00100793          	li	a5,1
ffffffe0002020ec:	fef42423          	sw	a5,-24(s0)
ffffffe0002020f0:	41c0006f          	j	ffffffe00020250c <vprintfmt+0x4a8>
ffffffe0002020f4:	fe842783          	lw	a5,-24(s0)
ffffffe0002020f8:	0007879b          	sext.w	a5,a5
ffffffe0002020fc:	00078c63          	beqz	a5,ffffffe000202114 <vprintfmt+0xb0>
ffffffe000202100:	f2843783          	ld	a5,-216(s0)
ffffffe000202104:	00878713          	addi	a4,a5,8
ffffffe000202108:	f2e43423          	sd	a4,-216(s0)
ffffffe00020210c:	0007b783          	ld	a5,0(a5)
ffffffe000202110:	0140006f          	j	ffffffe000202124 <vprintfmt+0xc0>
ffffffe000202114:	f2843783          	ld	a5,-216(s0)
ffffffe000202118:	00878713          	addi	a4,a5,8
ffffffe00020211c:	f2e43423          	sd	a4,-216(s0)
ffffffe000202120:	0007a783          	lw	a5,0(a5)
ffffffe000202124:	f8f43c23          	sd	a5,-104(s0)
ffffffe000202128:	fe842783          	lw	a5,-24(s0)
ffffffe00020212c:	0007879b          	sext.w	a5,a5
ffffffe000202130:	00078663          	beqz	a5,ffffffe00020213c <vprintfmt+0xd8>
ffffffe000202134:	00f00793          	li	a5,15
ffffffe000202138:	0080006f          	j	ffffffe000202140 <vprintfmt+0xdc>
ffffffe00020213c:	00700793          	li	a5,7
ffffffe000202140:	f8f42a23          	sw	a5,-108(s0)
ffffffe000202144:	f9442783          	lw	a5,-108(s0)
ffffffe000202148:	fcf42e23          	sw	a5,-36(s0)
ffffffe00020214c:	0840006f          	j	ffffffe0002021d0 <vprintfmt+0x16c>
ffffffe000202150:	fdc42783          	lw	a5,-36(s0)
ffffffe000202154:	0027979b          	slliw	a5,a5,0x2
ffffffe000202158:	0007879b          	sext.w	a5,a5
ffffffe00020215c:	f9843703          	ld	a4,-104(s0)
ffffffe000202160:	40f757b3          	sra	a5,a4,a5
ffffffe000202164:	0007879b          	sext.w	a5,a5
ffffffe000202168:	00f7f793          	andi	a5,a5,15
ffffffe00020216c:	f8f42823          	sw	a5,-112(s0)
ffffffe000202170:	f9042783          	lw	a5,-112(s0)
ffffffe000202174:	0007871b          	sext.w	a4,a5
ffffffe000202178:	00900793          	li	a5,9
ffffffe00020217c:	00e7cc63          	blt	a5,a4,ffffffe000202194 <vprintfmt+0x130>
ffffffe000202180:	f9042783          	lw	a5,-112(s0)
ffffffe000202184:	0ff7f793          	zext.b	a5,a5
ffffffe000202188:	0307879b          	addiw	a5,a5,48
ffffffe00020218c:	0ff7f793          	zext.b	a5,a5
ffffffe000202190:	0140006f          	j	ffffffe0002021a4 <vprintfmt+0x140>
ffffffe000202194:	f9042783          	lw	a5,-112(s0)
ffffffe000202198:	0ff7f793          	zext.b	a5,a5
ffffffe00020219c:	0577879b          	addiw	a5,a5,87
ffffffe0002021a0:	0ff7f793          	zext.b	a5,a5
ffffffe0002021a4:	f8f407a3          	sb	a5,-113(s0)
ffffffe0002021a8:	f8f44783          	lbu	a5,-113(s0)
ffffffe0002021ac:	f3843703          	ld	a4,-200(s0)
ffffffe0002021b0:	00078513          	mv	a0,a5
ffffffe0002021b4:	000700e7          	jalr	a4
ffffffe0002021b8:	fe043783          	ld	a5,-32(s0)
ffffffe0002021bc:	00178793          	addi	a5,a5,1
ffffffe0002021c0:	fef43023          	sd	a5,-32(s0)
ffffffe0002021c4:	fdc42783          	lw	a5,-36(s0)
ffffffe0002021c8:	fff7879b          	addiw	a5,a5,-1
ffffffe0002021cc:	fcf42e23          	sw	a5,-36(s0)
ffffffe0002021d0:	fdc42783          	lw	a5,-36(s0)
ffffffe0002021d4:	0007879b          	sext.w	a5,a5
ffffffe0002021d8:	f607dce3          	bgez	a5,ffffffe000202150 <vprintfmt+0xec>
ffffffe0002021dc:	fe042423          	sw	zero,-24(s0)
ffffffe0002021e0:	fe042623          	sw	zero,-20(s0)
ffffffe0002021e4:	3280006f          	j	ffffffe00020250c <vprintfmt+0x4a8>
ffffffe0002021e8:	fe842783          	lw	a5,-24(s0)
ffffffe0002021ec:	0007879b          	sext.w	a5,a5
ffffffe0002021f0:	00078c63          	beqz	a5,ffffffe000202208 <vprintfmt+0x1a4>
ffffffe0002021f4:	f2843783          	ld	a5,-216(s0)
ffffffe0002021f8:	00878713          	addi	a4,a5,8
ffffffe0002021fc:	f2e43423          	sd	a4,-216(s0)
ffffffe000202200:	0007b783          	ld	a5,0(a5)
ffffffe000202204:	0140006f          	j	ffffffe000202218 <vprintfmt+0x1b4>
ffffffe000202208:	f2843783          	ld	a5,-216(s0)
ffffffe00020220c:	00878713          	addi	a4,a5,8
ffffffe000202210:	f2e43423          	sd	a4,-216(s0)
ffffffe000202214:	0007a783          	lw	a5,0(a5)
ffffffe000202218:	fcf43823          	sd	a5,-48(s0)
ffffffe00020221c:	fd043783          	ld	a5,-48(s0)
ffffffe000202220:	0207d463          	bgez	a5,ffffffe000202248 <vprintfmt+0x1e4>
ffffffe000202224:	fd043783          	ld	a5,-48(s0)
ffffffe000202228:	40f007b3          	neg	a5,a5
ffffffe00020222c:	fcf43823          	sd	a5,-48(s0)
ffffffe000202230:	f3843783          	ld	a5,-200(s0)
ffffffe000202234:	02d00513          	li	a0,45
ffffffe000202238:	000780e7          	jalr	a5
ffffffe00020223c:	fe043783          	ld	a5,-32(s0)
ffffffe000202240:	00178793          	addi	a5,a5,1
ffffffe000202244:	fef43023          	sd	a5,-32(s0)
ffffffe000202248:	fc042623          	sw	zero,-52(s0)
ffffffe00020224c:	03000793          	li	a5,48
ffffffe000202250:	f6f43023          	sd	a5,-160(s0)
ffffffe000202254:	f6043423          	sd	zero,-152(s0)
ffffffe000202258:	f6043823          	sd	zero,-144(s0)
ffffffe00020225c:	f6040c23          	sb	zero,-136(s0)
ffffffe000202260:	fd043783          	ld	a5,-48(s0)
ffffffe000202264:	fcf43023          	sd	a5,-64(s0)
ffffffe000202268:	0480006f          	j	ffffffe0002022b0 <vprintfmt+0x24c>
ffffffe00020226c:	fc043703          	ld	a4,-64(s0)
ffffffe000202270:	00a00793          	li	a5,10
ffffffe000202274:	02f767b3          	rem	a5,a4,a5
ffffffe000202278:	0ff7f793          	zext.b	a5,a5
ffffffe00020227c:	0307879b          	addiw	a5,a5,48
ffffffe000202280:	0ff7f713          	zext.b	a4,a5
ffffffe000202284:	fcc42783          	lw	a5,-52(s0)
ffffffe000202288:	ff078793          	addi	a5,a5,-16
ffffffe00020228c:	008787b3          	add	a5,a5,s0
ffffffe000202290:	f6e78823          	sb	a4,-144(a5)
ffffffe000202294:	fc043703          	ld	a4,-64(s0)
ffffffe000202298:	00a00793          	li	a5,10
ffffffe00020229c:	02f747b3          	div	a5,a4,a5
ffffffe0002022a0:	fcf43023          	sd	a5,-64(s0)
ffffffe0002022a4:	fcc42783          	lw	a5,-52(s0)
ffffffe0002022a8:	0017879b          	addiw	a5,a5,1
ffffffe0002022ac:	fcf42623          	sw	a5,-52(s0)
ffffffe0002022b0:	fc043783          	ld	a5,-64(s0)
ffffffe0002022b4:	fa079ce3          	bnez	a5,ffffffe00020226c <vprintfmt+0x208>
ffffffe0002022b8:	fcc42783          	lw	a5,-52(s0)
ffffffe0002022bc:	faf42e23          	sw	a5,-68(s0)
ffffffe0002022c0:	02c0006f          	j	ffffffe0002022ec <vprintfmt+0x288>
ffffffe0002022c4:	fbc42783          	lw	a5,-68(s0)
ffffffe0002022c8:	ff078793          	addi	a5,a5,-16
ffffffe0002022cc:	008787b3          	add	a5,a5,s0
ffffffe0002022d0:	f707c783          	lbu	a5,-144(a5)
ffffffe0002022d4:	f3843703          	ld	a4,-200(s0)
ffffffe0002022d8:	00078513          	mv	a0,a5
ffffffe0002022dc:	000700e7          	jalr	a4
ffffffe0002022e0:	fbc42783          	lw	a5,-68(s0)
ffffffe0002022e4:	fff7879b          	addiw	a5,a5,-1
ffffffe0002022e8:	faf42e23          	sw	a5,-68(s0)
ffffffe0002022ec:	fbc42783          	lw	a5,-68(s0)
ffffffe0002022f0:	0007879b          	sext.w	a5,a5
ffffffe0002022f4:	fc07d8e3          	bgez	a5,ffffffe0002022c4 <vprintfmt+0x260>
ffffffe0002022f8:	fcc42783          	lw	a5,-52(s0)
ffffffe0002022fc:	0017879b          	addiw	a5,a5,1
ffffffe000202300:	0007879b          	sext.w	a5,a5
ffffffe000202304:	00078713          	mv	a4,a5
ffffffe000202308:	fe043783          	ld	a5,-32(s0)
ffffffe00020230c:	00e787b3          	add	a5,a5,a4
ffffffe000202310:	fef43023          	sd	a5,-32(s0)
ffffffe000202314:	fe042423          	sw	zero,-24(s0)
ffffffe000202318:	fe042623          	sw	zero,-20(s0)
ffffffe00020231c:	1f00006f          	j	ffffffe00020250c <vprintfmt+0x4a8>
ffffffe000202320:	fe842783          	lw	a5,-24(s0)
ffffffe000202324:	0007879b          	sext.w	a5,a5
ffffffe000202328:	00078c63          	beqz	a5,ffffffe000202340 <vprintfmt+0x2dc>
ffffffe00020232c:	f2843783          	ld	a5,-216(s0)
ffffffe000202330:	00878713          	addi	a4,a5,8
ffffffe000202334:	f2e43423          	sd	a4,-216(s0)
ffffffe000202338:	0007b783          	ld	a5,0(a5)
ffffffe00020233c:	0140006f          	j	ffffffe000202350 <vprintfmt+0x2ec>
ffffffe000202340:	f2843783          	ld	a5,-216(s0)
ffffffe000202344:	00878713          	addi	a4,a5,8
ffffffe000202348:	f2e43423          	sd	a4,-216(s0)
ffffffe00020234c:	0007a783          	lw	a5,0(a5)
ffffffe000202350:	f8f43023          	sd	a5,-128(s0)
ffffffe000202354:	fa042c23          	sw	zero,-72(s0)
ffffffe000202358:	03000793          	li	a5,48
ffffffe00020235c:	f4f43023          	sd	a5,-192(s0)
ffffffe000202360:	f4043423          	sd	zero,-184(s0)
ffffffe000202364:	f4043823          	sd	zero,-176(s0)
ffffffe000202368:	f4040c23          	sb	zero,-168(s0)
ffffffe00020236c:	f8043783          	ld	a5,-128(s0)
ffffffe000202370:	faf43823          	sd	a5,-80(s0)
ffffffe000202374:	0480006f          	j	ffffffe0002023bc <vprintfmt+0x358>
ffffffe000202378:	fb043703          	ld	a4,-80(s0)
ffffffe00020237c:	00a00793          	li	a5,10
ffffffe000202380:	02f767b3          	rem	a5,a4,a5
ffffffe000202384:	0ff7f793          	zext.b	a5,a5
ffffffe000202388:	0307879b          	addiw	a5,a5,48
ffffffe00020238c:	0ff7f713          	zext.b	a4,a5
ffffffe000202390:	fb842783          	lw	a5,-72(s0)
ffffffe000202394:	ff078793          	addi	a5,a5,-16
ffffffe000202398:	008787b3          	add	a5,a5,s0
ffffffe00020239c:	f4e78823          	sb	a4,-176(a5)
ffffffe0002023a0:	fb043703          	ld	a4,-80(s0)
ffffffe0002023a4:	00a00793          	li	a5,10
ffffffe0002023a8:	02f747b3          	div	a5,a4,a5
ffffffe0002023ac:	faf43823          	sd	a5,-80(s0)
ffffffe0002023b0:	fb842783          	lw	a5,-72(s0)
ffffffe0002023b4:	0017879b          	addiw	a5,a5,1
ffffffe0002023b8:	faf42c23          	sw	a5,-72(s0)
ffffffe0002023bc:	fb043783          	ld	a5,-80(s0)
ffffffe0002023c0:	fa079ce3          	bnez	a5,ffffffe000202378 <vprintfmt+0x314>
ffffffe0002023c4:	fb842783          	lw	a5,-72(s0)
ffffffe0002023c8:	faf42623          	sw	a5,-84(s0)
ffffffe0002023cc:	02c0006f          	j	ffffffe0002023f8 <vprintfmt+0x394>
ffffffe0002023d0:	fac42783          	lw	a5,-84(s0)
ffffffe0002023d4:	ff078793          	addi	a5,a5,-16
ffffffe0002023d8:	008787b3          	add	a5,a5,s0
ffffffe0002023dc:	f507c783          	lbu	a5,-176(a5)
ffffffe0002023e0:	f3843703          	ld	a4,-200(s0)
ffffffe0002023e4:	00078513          	mv	a0,a5
ffffffe0002023e8:	000700e7          	jalr	a4
ffffffe0002023ec:	fac42783          	lw	a5,-84(s0)
ffffffe0002023f0:	fff7879b          	addiw	a5,a5,-1
ffffffe0002023f4:	faf42623          	sw	a5,-84(s0)
ffffffe0002023f8:	fac42783          	lw	a5,-84(s0)
ffffffe0002023fc:	0007879b          	sext.w	a5,a5
ffffffe000202400:	fc07d8e3          	bgez	a5,ffffffe0002023d0 <vprintfmt+0x36c>
ffffffe000202404:	fb842783          	lw	a5,-72(s0)
ffffffe000202408:	0017879b          	addiw	a5,a5,1
ffffffe00020240c:	0007879b          	sext.w	a5,a5
ffffffe000202410:	00078713          	mv	a4,a5
ffffffe000202414:	fe043783          	ld	a5,-32(s0)
ffffffe000202418:	00e787b3          	add	a5,a5,a4
ffffffe00020241c:	fef43023          	sd	a5,-32(s0)
ffffffe000202420:	fe042423          	sw	zero,-24(s0)
ffffffe000202424:	fe042623          	sw	zero,-20(s0)
ffffffe000202428:	0e40006f          	j	ffffffe00020250c <vprintfmt+0x4a8>
ffffffe00020242c:	f2843783          	ld	a5,-216(s0)
ffffffe000202430:	00878713          	addi	a4,a5,8
ffffffe000202434:	f2e43423          	sd	a4,-216(s0)
ffffffe000202438:	0007b783          	ld	a5,0(a5)
ffffffe00020243c:	faf43023          	sd	a5,-96(s0)
ffffffe000202440:	0300006f          	j	ffffffe000202470 <vprintfmt+0x40c>
ffffffe000202444:	fa043783          	ld	a5,-96(s0)
ffffffe000202448:	0007c783          	lbu	a5,0(a5)
ffffffe00020244c:	f3843703          	ld	a4,-200(s0)
ffffffe000202450:	00078513          	mv	a0,a5
ffffffe000202454:	000700e7          	jalr	a4
ffffffe000202458:	fe043783          	ld	a5,-32(s0)
ffffffe00020245c:	00178793          	addi	a5,a5,1
ffffffe000202460:	fef43023          	sd	a5,-32(s0)
ffffffe000202464:	fa043783          	ld	a5,-96(s0)
ffffffe000202468:	00178793          	addi	a5,a5,1
ffffffe00020246c:	faf43023          	sd	a5,-96(s0)
ffffffe000202470:	fa043783          	ld	a5,-96(s0)
ffffffe000202474:	0007c783          	lbu	a5,0(a5)
ffffffe000202478:	fc0796e3          	bnez	a5,ffffffe000202444 <vprintfmt+0x3e0>
ffffffe00020247c:	fe042423          	sw	zero,-24(s0)
ffffffe000202480:	fe042623          	sw	zero,-20(s0)
ffffffe000202484:	0880006f          	j	ffffffe00020250c <vprintfmt+0x4a8>
ffffffe000202488:	f2843783          	ld	a5,-216(s0)
ffffffe00020248c:	00878713          	addi	a4,a5,8
ffffffe000202490:	f2e43423          	sd	a4,-216(s0)
ffffffe000202494:	0007a783          	lw	a5,0(a5)
ffffffe000202498:	f6f40fa3          	sb	a5,-129(s0)
ffffffe00020249c:	f7f44783          	lbu	a5,-129(s0)
ffffffe0002024a0:	f3843703          	ld	a4,-200(s0)
ffffffe0002024a4:	00078513          	mv	a0,a5
ffffffe0002024a8:	000700e7          	jalr	a4
ffffffe0002024ac:	fe043783          	ld	a5,-32(s0)
ffffffe0002024b0:	00178793          	addi	a5,a5,1
ffffffe0002024b4:	fef43023          	sd	a5,-32(s0)
ffffffe0002024b8:	fe042423          	sw	zero,-24(s0)
ffffffe0002024bc:	fe042623          	sw	zero,-20(s0)
ffffffe0002024c0:	04c0006f          	j	ffffffe00020250c <vprintfmt+0x4a8>
ffffffe0002024c4:	f3043783          	ld	a5,-208(s0)
ffffffe0002024c8:	0007c783          	lbu	a5,0(a5)
ffffffe0002024cc:	00078713          	mv	a4,a5
ffffffe0002024d0:	02500793          	li	a5,37
ffffffe0002024d4:	00f71863          	bne	a4,a5,ffffffe0002024e4 <vprintfmt+0x480>
ffffffe0002024d8:	00100793          	li	a5,1
ffffffe0002024dc:	fef42623          	sw	a5,-20(s0)
ffffffe0002024e0:	02c0006f          	j	ffffffe00020250c <vprintfmt+0x4a8>
ffffffe0002024e4:	f3043783          	ld	a5,-208(s0)
ffffffe0002024e8:	0007c783          	lbu	a5,0(a5)
ffffffe0002024ec:	f3843703          	ld	a4,-200(s0)
ffffffe0002024f0:	00078513          	mv	a0,a5
ffffffe0002024f4:	000700e7          	jalr	a4
ffffffe0002024f8:	fe043783          	ld	a5,-32(s0)
ffffffe0002024fc:	00178793          	addi	a5,a5,1
ffffffe000202500:	fef43023          	sd	a5,-32(s0)
ffffffe000202504:	0080006f          	j	ffffffe00020250c <vprintfmt+0x4a8>
ffffffe000202508:	00000013          	nop
ffffffe00020250c:	f3043783          	ld	a5,-208(s0)
ffffffe000202510:	00178793          	addi	a5,a5,1
ffffffe000202514:	f2f43823          	sd	a5,-208(s0)
ffffffe000202518:	f3043783          	ld	a5,-208(s0)
ffffffe00020251c:	0007c783          	lbu	a5,0(a5)
ffffffe000202520:	b60798e3          	bnez	a5,ffffffe000202090 <vprintfmt+0x2c>
ffffffe000202524:	fe043783          	ld	a5,-32(s0)
ffffffe000202528:	0007879b          	sext.w	a5,a5
ffffffe00020252c:	00078513          	mv	a0,a5
ffffffe000202530:	0d813083          	ld	ra,216(sp)
ffffffe000202534:	0d013403          	ld	s0,208(sp)
ffffffe000202538:	0e010113          	addi	sp,sp,224
ffffffe00020253c:	00008067          	ret

ffffffe000202540 <printk>:
ffffffe000202540:	f9010113          	addi	sp,sp,-112
ffffffe000202544:	02113423          	sd	ra,40(sp)
ffffffe000202548:	02813023          	sd	s0,32(sp)
ffffffe00020254c:	03010413          	addi	s0,sp,48
ffffffe000202550:	fca43c23          	sd	a0,-40(s0)
ffffffe000202554:	00b43423          	sd	a1,8(s0)
ffffffe000202558:	00c43823          	sd	a2,16(s0)
ffffffe00020255c:	00d43c23          	sd	a3,24(s0)
ffffffe000202560:	02e43023          	sd	a4,32(s0)
ffffffe000202564:	02f43423          	sd	a5,40(s0)
ffffffe000202568:	03043823          	sd	a6,48(s0)
ffffffe00020256c:	03143c23          	sd	a7,56(s0)
ffffffe000202570:	fe042623          	sw	zero,-20(s0)
ffffffe000202574:	04040793          	addi	a5,s0,64
ffffffe000202578:	fcf43823          	sd	a5,-48(s0)
ffffffe00020257c:	fd043783          	ld	a5,-48(s0)
ffffffe000202580:	fc878793          	addi	a5,a5,-56
ffffffe000202584:	fef43023          	sd	a5,-32(s0)
ffffffe000202588:	fe043783          	ld	a5,-32(s0)
ffffffe00020258c:	00078613          	mv	a2,a5
ffffffe000202590:	fd843583          	ld	a1,-40(s0)
ffffffe000202594:	00000517          	auipc	a0,0x0
ffffffe000202598:	a8050513          	addi	a0,a0,-1408 # ffffffe000202014 <putc>
ffffffe00020259c:	ac9ff0ef          	jal	ra,ffffffe000202064 <vprintfmt>
ffffffe0002025a0:	00050793          	mv	a5,a0
ffffffe0002025a4:	fef42623          	sw	a5,-20(s0)
ffffffe0002025a8:	fec42783          	lw	a5,-20(s0)
ffffffe0002025ac:	00078513          	mv	a0,a5
ffffffe0002025b0:	02813083          	ld	ra,40(sp)
ffffffe0002025b4:	02013403          	ld	s0,32(sp)
ffffffe0002025b8:	07010113          	addi	sp,sp,112
ffffffe0002025bc:	00008067          	ret

ffffffe0002025c0 <rand>:
ffffffe0002025c0:	fe010113          	addi	sp,sp,-32
ffffffe0002025c4:	00813c23          	sd	s0,24(sp)
ffffffe0002025c8:	02010413          	addi	s0,sp,32
ffffffe0002025cc:	00004797          	auipc	a5,0x4
ffffffe0002025d0:	a5878793          	addi	a5,a5,-1448 # ffffffe000206024 <initialize>
ffffffe0002025d4:	0007a783          	lw	a5,0(a5)
ffffffe0002025d8:	1e079463          	bnez	a5,ffffffe0002027c0 <rand+0x200>
ffffffe0002025dc:	00007797          	auipc	a5,0x7
ffffffe0002025e0:	a2478793          	addi	a5,a5,-1500 # ffffffe000209000 <r>
ffffffe0002025e4:	00d00713          	li	a4,13
ffffffe0002025e8:	00e7a023          	sw	a4,0(a5)
ffffffe0002025ec:	00100793          	li	a5,1
ffffffe0002025f0:	fef42623          	sw	a5,-20(s0)
ffffffe0002025f4:	0c40006f          	j	ffffffe0002026b8 <rand+0xf8>
ffffffe0002025f8:	fec42783          	lw	a5,-20(s0)
ffffffe0002025fc:	fff7879b          	addiw	a5,a5,-1
ffffffe000202600:	0007879b          	sext.w	a5,a5
ffffffe000202604:	00007717          	auipc	a4,0x7
ffffffe000202608:	9fc70713          	addi	a4,a4,-1540 # ffffffe000209000 <r>
ffffffe00020260c:	00279793          	slli	a5,a5,0x2
ffffffe000202610:	00f707b3          	add	a5,a4,a5
ffffffe000202614:	0007a783          	lw	a5,0(a5)
ffffffe000202618:	00078713          	mv	a4,a5
ffffffe00020261c:	000047b7          	lui	a5,0x4
ffffffe000202620:	1a778793          	addi	a5,a5,423 # 41a7 <_skernel-0xffffffe0001fbe59>
ffffffe000202624:	02f70733          	mul	a4,a4,a5
ffffffe000202628:	800007b7          	lui	a5,0x80000
ffffffe00020262c:	fff7c793          	not	a5,a5
ffffffe000202630:	02f767b3          	rem	a5,a4,a5
ffffffe000202634:	0007871b          	sext.w	a4,a5
ffffffe000202638:	00007697          	auipc	a3,0x7
ffffffe00020263c:	9c868693          	addi	a3,a3,-1592 # ffffffe000209000 <r>
ffffffe000202640:	fec42783          	lw	a5,-20(s0)
ffffffe000202644:	00279793          	slli	a5,a5,0x2
ffffffe000202648:	00f687b3          	add	a5,a3,a5
ffffffe00020264c:	00e7a023          	sw	a4,0(a5) # ffffffff80000000 <_ebss+0x1f7fdf6060>
ffffffe000202650:	00007717          	auipc	a4,0x7
ffffffe000202654:	9b070713          	addi	a4,a4,-1616 # ffffffe000209000 <r>
ffffffe000202658:	fec42783          	lw	a5,-20(s0)
ffffffe00020265c:	00279793          	slli	a5,a5,0x2
ffffffe000202660:	00f707b3          	add	a5,a4,a5
ffffffe000202664:	0007a783          	lw	a5,0(a5)
ffffffe000202668:	0407d263          	bgez	a5,ffffffe0002026ac <rand+0xec>
ffffffe00020266c:	00007717          	auipc	a4,0x7
ffffffe000202670:	99470713          	addi	a4,a4,-1644 # ffffffe000209000 <r>
ffffffe000202674:	fec42783          	lw	a5,-20(s0)
ffffffe000202678:	00279793          	slli	a5,a5,0x2
ffffffe00020267c:	00f707b3          	add	a5,a4,a5
ffffffe000202680:	0007a703          	lw	a4,0(a5)
ffffffe000202684:	800007b7          	lui	a5,0x80000
ffffffe000202688:	fff7c793          	not	a5,a5
ffffffe00020268c:	00f707bb          	addw	a5,a4,a5
ffffffe000202690:	0007871b          	sext.w	a4,a5
ffffffe000202694:	00007697          	auipc	a3,0x7
ffffffe000202698:	96c68693          	addi	a3,a3,-1684 # ffffffe000209000 <r>
ffffffe00020269c:	fec42783          	lw	a5,-20(s0)
ffffffe0002026a0:	00279793          	slli	a5,a5,0x2
ffffffe0002026a4:	00f687b3          	add	a5,a3,a5
ffffffe0002026a8:	00e7a023          	sw	a4,0(a5) # ffffffff80000000 <_ebss+0x1f7fdf6060>
ffffffe0002026ac:	fec42783          	lw	a5,-20(s0)
ffffffe0002026b0:	0017879b          	addiw	a5,a5,1
ffffffe0002026b4:	fef42623          	sw	a5,-20(s0)
ffffffe0002026b8:	fec42783          	lw	a5,-20(s0)
ffffffe0002026bc:	0007871b          	sext.w	a4,a5
ffffffe0002026c0:	01e00793          	li	a5,30
ffffffe0002026c4:	f2e7dae3          	bge	a5,a4,ffffffe0002025f8 <rand+0x38>
ffffffe0002026c8:	01f00793          	li	a5,31
ffffffe0002026cc:	fef42623          	sw	a5,-20(s0)
ffffffe0002026d0:	0480006f          	j	ffffffe000202718 <rand+0x158>
ffffffe0002026d4:	fec42783          	lw	a5,-20(s0)
ffffffe0002026d8:	fe17879b          	addiw	a5,a5,-31
ffffffe0002026dc:	0007879b          	sext.w	a5,a5
ffffffe0002026e0:	00007717          	auipc	a4,0x7
ffffffe0002026e4:	92070713          	addi	a4,a4,-1760 # ffffffe000209000 <r>
ffffffe0002026e8:	00279793          	slli	a5,a5,0x2
ffffffe0002026ec:	00f707b3          	add	a5,a4,a5
ffffffe0002026f0:	0007a703          	lw	a4,0(a5)
ffffffe0002026f4:	00007697          	auipc	a3,0x7
ffffffe0002026f8:	90c68693          	addi	a3,a3,-1780 # ffffffe000209000 <r>
ffffffe0002026fc:	fec42783          	lw	a5,-20(s0)
ffffffe000202700:	00279793          	slli	a5,a5,0x2
ffffffe000202704:	00f687b3          	add	a5,a3,a5
ffffffe000202708:	00e7a023          	sw	a4,0(a5)
ffffffe00020270c:	fec42783          	lw	a5,-20(s0)
ffffffe000202710:	0017879b          	addiw	a5,a5,1
ffffffe000202714:	fef42623          	sw	a5,-20(s0)
ffffffe000202718:	fec42783          	lw	a5,-20(s0)
ffffffe00020271c:	0007871b          	sext.w	a4,a5
ffffffe000202720:	02100793          	li	a5,33
ffffffe000202724:	fae7d8e3          	bge	a5,a4,ffffffe0002026d4 <rand+0x114>
ffffffe000202728:	02200793          	li	a5,34
ffffffe00020272c:	fef42623          	sw	a5,-20(s0)
ffffffe000202730:	0700006f          	j	ffffffe0002027a0 <rand+0x1e0>
ffffffe000202734:	fec42783          	lw	a5,-20(s0)
ffffffe000202738:	fe17879b          	addiw	a5,a5,-31
ffffffe00020273c:	0007879b          	sext.w	a5,a5
ffffffe000202740:	00007717          	auipc	a4,0x7
ffffffe000202744:	8c070713          	addi	a4,a4,-1856 # ffffffe000209000 <r>
ffffffe000202748:	00279793          	slli	a5,a5,0x2
ffffffe00020274c:	00f707b3          	add	a5,a4,a5
ffffffe000202750:	0007a703          	lw	a4,0(a5)
ffffffe000202754:	fec42783          	lw	a5,-20(s0)
ffffffe000202758:	ffd7879b          	addiw	a5,a5,-3
ffffffe00020275c:	0007879b          	sext.w	a5,a5
ffffffe000202760:	00007697          	auipc	a3,0x7
ffffffe000202764:	8a068693          	addi	a3,a3,-1888 # ffffffe000209000 <r>
ffffffe000202768:	00279793          	slli	a5,a5,0x2
ffffffe00020276c:	00f687b3          	add	a5,a3,a5
ffffffe000202770:	0007a783          	lw	a5,0(a5)
ffffffe000202774:	00f707bb          	addw	a5,a4,a5
ffffffe000202778:	0007871b          	sext.w	a4,a5
ffffffe00020277c:	00007697          	auipc	a3,0x7
ffffffe000202780:	88468693          	addi	a3,a3,-1916 # ffffffe000209000 <r>
ffffffe000202784:	fec42783          	lw	a5,-20(s0)
ffffffe000202788:	00279793          	slli	a5,a5,0x2
ffffffe00020278c:	00f687b3          	add	a5,a3,a5
ffffffe000202790:	00e7a023          	sw	a4,0(a5)
ffffffe000202794:	fec42783          	lw	a5,-20(s0)
ffffffe000202798:	0017879b          	addiw	a5,a5,1
ffffffe00020279c:	fef42623          	sw	a5,-20(s0)
ffffffe0002027a0:	fec42783          	lw	a5,-20(s0)
ffffffe0002027a4:	0007871b          	sext.w	a4,a5
ffffffe0002027a8:	15700793          	li	a5,343
ffffffe0002027ac:	f8e7d4e3          	bge	a5,a4,ffffffe000202734 <rand+0x174>
ffffffe0002027b0:	00004797          	auipc	a5,0x4
ffffffe0002027b4:	87478793          	addi	a5,a5,-1932 # ffffffe000206024 <initialize>
ffffffe0002027b8:	00100713          	li	a4,1
ffffffe0002027bc:	00e7a023          	sw	a4,0(a5)
ffffffe0002027c0:	00004797          	auipc	a5,0x4
ffffffe0002027c4:	86878793          	addi	a5,a5,-1944 # ffffffe000206028 <t>
ffffffe0002027c8:	0007a783          	lw	a5,0(a5)
ffffffe0002027cc:	00078713          	mv	a4,a5
ffffffe0002027d0:	29000793          	li	a5,656
ffffffe0002027d4:	02f767bb          	remw	a5,a4,a5
ffffffe0002027d8:	0007871b          	sext.w	a4,a5
ffffffe0002027dc:	00004797          	auipc	a5,0x4
ffffffe0002027e0:	84c78793          	addi	a5,a5,-1972 # ffffffe000206028 <t>
ffffffe0002027e4:	00e7a023          	sw	a4,0(a5)
ffffffe0002027e8:	00004797          	auipc	a5,0x4
ffffffe0002027ec:	84078793          	addi	a5,a5,-1984 # ffffffe000206028 <t>
ffffffe0002027f0:	0007a783          	lw	a5,0(a5)
ffffffe0002027f4:	1397879b          	addiw	a5,a5,313
ffffffe0002027f8:	0007879b          	sext.w	a5,a5
ffffffe0002027fc:	00007717          	auipc	a4,0x7
ffffffe000202800:	80470713          	addi	a4,a4,-2044 # ffffffe000209000 <r>
ffffffe000202804:	00279793          	slli	a5,a5,0x2
ffffffe000202808:	00f707b3          	add	a5,a4,a5
ffffffe00020280c:	0007a683          	lw	a3,0(a5)
ffffffe000202810:	00004797          	auipc	a5,0x4
ffffffe000202814:	81878793          	addi	a5,a5,-2024 # ffffffe000206028 <t>
ffffffe000202818:	0007a783          	lw	a5,0(a5)
ffffffe00020281c:	1557879b          	addiw	a5,a5,341
ffffffe000202820:	0007879b          	sext.w	a5,a5
ffffffe000202824:	00006717          	auipc	a4,0x6
ffffffe000202828:	7dc70713          	addi	a4,a4,2012 # ffffffe000209000 <r>
ffffffe00020282c:	00279793          	slli	a5,a5,0x2
ffffffe000202830:	00f707b3          	add	a5,a4,a5
ffffffe000202834:	0007a703          	lw	a4,0(a5)
ffffffe000202838:	00003797          	auipc	a5,0x3
ffffffe00020283c:	7f078793          	addi	a5,a5,2032 # ffffffe000206028 <t>
ffffffe000202840:	0007a783          	lw	a5,0(a5)
ffffffe000202844:	1587879b          	addiw	a5,a5,344
ffffffe000202848:	0007879b          	sext.w	a5,a5
ffffffe00020284c:	00e6873b          	addw	a4,a3,a4
ffffffe000202850:	0007071b          	sext.w	a4,a4
ffffffe000202854:	00006697          	auipc	a3,0x6
ffffffe000202858:	7ac68693          	addi	a3,a3,1964 # ffffffe000209000 <r>
ffffffe00020285c:	00279793          	slli	a5,a5,0x2
ffffffe000202860:	00f687b3          	add	a5,a3,a5
ffffffe000202864:	00e7a023          	sw	a4,0(a5)
ffffffe000202868:	00003797          	auipc	a5,0x3
ffffffe00020286c:	7c078793          	addi	a5,a5,1984 # ffffffe000206028 <t>
ffffffe000202870:	0007a783          	lw	a5,0(a5)
ffffffe000202874:	0017879b          	addiw	a5,a5,1
ffffffe000202878:	0007871b          	sext.w	a4,a5
ffffffe00020287c:	00003797          	auipc	a5,0x3
ffffffe000202880:	7ac78793          	addi	a5,a5,1964 # ffffffe000206028 <t>
ffffffe000202884:	00e7a023          	sw	a4,0(a5)
ffffffe000202888:	00003797          	auipc	a5,0x3
ffffffe00020288c:	7a078793          	addi	a5,a5,1952 # ffffffe000206028 <t>
ffffffe000202890:	0007a783          	lw	a5,0(a5)
ffffffe000202894:	1577879b          	addiw	a5,a5,343
ffffffe000202898:	0007879b          	sext.w	a5,a5
ffffffe00020289c:	00006717          	auipc	a4,0x6
ffffffe0002028a0:	76470713          	addi	a4,a4,1892 # ffffffe000209000 <r>
ffffffe0002028a4:	00279793          	slli	a5,a5,0x2
ffffffe0002028a8:	00f707b3          	add	a5,a4,a5
ffffffe0002028ac:	0007a783          	lw	a5,0(a5)
ffffffe0002028b0:	00078513          	mv	a0,a5
ffffffe0002028b4:	01813403          	ld	s0,24(sp)
ffffffe0002028b8:	02010113          	addi	sp,sp,32
ffffffe0002028bc:	00008067          	ret

ffffffe0002028c0 <rand_range>:
ffffffe0002028c0:	fd010113          	addi	sp,sp,-48
ffffffe0002028c4:	02113423          	sd	ra,40(sp)
ffffffe0002028c8:	02813023          	sd	s0,32(sp)
ffffffe0002028cc:	03010413          	addi	s0,sp,48
ffffffe0002028d0:	fca43c23          	sd	a0,-40(s0)
ffffffe0002028d4:	fcb43823          	sd	a1,-48(s0)
ffffffe0002028d8:	fd043703          	ld	a4,-48(s0)
ffffffe0002028dc:	fd843783          	ld	a5,-40(s0)
ffffffe0002028e0:	40f707b3          	sub	a5,a4,a5
ffffffe0002028e4:	00178793          	addi	a5,a5,1
ffffffe0002028e8:	fef43423          	sd	a5,-24(s0)
ffffffe0002028ec:	cd5ff0ef          	jal	ra,ffffffe0002025c0 <rand>
ffffffe0002028f0:	00050713          	mv	a4,a0
ffffffe0002028f4:	fe843783          	ld	a5,-24(s0)
ffffffe0002028f8:	02f77733          	remu	a4,a4,a5
ffffffe0002028fc:	fd843783          	ld	a5,-40(s0)
ffffffe000202900:	00f707b3          	add	a5,a4,a5
ffffffe000202904:	00078513          	mv	a0,a5
ffffffe000202908:	02813083          	ld	ra,40(sp)
ffffffe00020290c:	02013403          	ld	s0,32(sp)
ffffffe000202910:	03010113          	addi	sp,sp,48
ffffffe000202914:	00008067          	ret

ffffffe000202918 <memset>:
ffffffe000202918:	fc010113          	addi	sp,sp,-64
ffffffe00020291c:	02813c23          	sd	s0,56(sp)
ffffffe000202920:	04010413          	addi	s0,sp,64
ffffffe000202924:	fca43c23          	sd	a0,-40(s0)
ffffffe000202928:	00058793          	mv	a5,a1
ffffffe00020292c:	fcc43423          	sd	a2,-56(s0)
ffffffe000202930:	fcf40ba3          	sb	a5,-41(s0)
ffffffe000202934:	fd843783          	ld	a5,-40(s0)
ffffffe000202938:	fef43023          	sd	a5,-32(s0)
ffffffe00020293c:	fe043423          	sd	zero,-24(s0)
ffffffe000202940:	0240006f          	j	ffffffe000202964 <memset+0x4c>
ffffffe000202944:	fe043703          	ld	a4,-32(s0)
ffffffe000202948:	fe843783          	ld	a5,-24(s0)
ffffffe00020294c:	00f707b3          	add	a5,a4,a5
ffffffe000202950:	fd744703          	lbu	a4,-41(s0)
ffffffe000202954:	00e78023          	sb	a4,0(a5)
ffffffe000202958:	fe843783          	ld	a5,-24(s0)
ffffffe00020295c:	00178793          	addi	a5,a5,1
ffffffe000202960:	fef43423          	sd	a5,-24(s0)
ffffffe000202964:	fe843703          	ld	a4,-24(s0)
ffffffe000202968:	fc843783          	ld	a5,-56(s0)
ffffffe00020296c:	fcf76ce3          	bltu	a4,a5,ffffffe000202944 <memset+0x2c>
ffffffe000202970:	fd843783          	ld	a5,-40(s0)
ffffffe000202974:	00078513          	mv	a0,a5
ffffffe000202978:	03813403          	ld	s0,56(sp)
ffffffe00020297c:	04010113          	addi	sp,sp,64
ffffffe000202980:	00008067          	ret

ffffffe000202984 <memcpy>:
ffffffe000202984:	fc010113          	addi	sp,sp,-64
ffffffe000202988:	02813c23          	sd	s0,56(sp)
ffffffe00020298c:	04010413          	addi	s0,sp,64
ffffffe000202990:	fca43c23          	sd	a0,-40(s0)
ffffffe000202994:	fcb43823          	sd	a1,-48(s0)
ffffffe000202998:	fcc43423          	sd	a2,-56(s0)
ffffffe00020299c:	fd843783          	ld	a5,-40(s0)
ffffffe0002029a0:	fef43423          	sd	a5,-24(s0)
ffffffe0002029a4:	fd043783          	ld	a5,-48(s0)
ffffffe0002029a8:	fef43023          	sd	a5,-32(s0)
ffffffe0002029ac:	02c0006f          	j	ffffffe0002029d8 <memcpy+0x54>
ffffffe0002029b0:	fe043783          	ld	a5,-32(s0)
ffffffe0002029b4:	0007c703          	lbu	a4,0(a5)
ffffffe0002029b8:	fe843783          	ld	a5,-24(s0)
ffffffe0002029bc:	00e78023          	sb	a4,0(a5)
ffffffe0002029c0:	fe843783          	ld	a5,-24(s0)
ffffffe0002029c4:	00178793          	addi	a5,a5,1
ffffffe0002029c8:	fef43423          	sd	a5,-24(s0)
ffffffe0002029cc:	fe043783          	ld	a5,-32(s0)
ffffffe0002029d0:	00178793          	addi	a5,a5,1
ffffffe0002029d4:	fef43023          	sd	a5,-32(s0)
ffffffe0002029d8:	fc843783          	ld	a5,-56(s0)
ffffffe0002029dc:	fff78713          	addi	a4,a5,-1
ffffffe0002029e0:	fce43423          	sd	a4,-56(s0)
ffffffe0002029e4:	fc0796e3          	bnez	a5,ffffffe0002029b0 <memcpy+0x2c>
ffffffe0002029e8:	fd843783          	ld	a5,-40(s0)
ffffffe0002029ec:	00078513          	mv	a0,a5
ffffffe0002029f0:	03813403          	ld	s0,56(sp)
ffffffe0002029f4:	04010113          	addi	sp,sp,64
ffffffe0002029f8:	00008067          	ret

Disassembly of section .rodata:

ffffffe000203000 <TIMECLOCK>:
ffffffe000203000:	4240                	lw	s0,4(a2)
ffffffe000203002:	0000000f          	fence	unknown,unknown
ffffffe000203006:	0000                	unimp
ffffffe000203008:	2e2e                	fld	ft8,200(sp)
ffffffe00020300a:	6d2e                	ld	s10,200(sp)
ffffffe00020300c:	5f6d                	li	t5,-5
ffffffe00020300e:	6e69                	lui	t3,0x1a
ffffffe000203010:	7469                	lui	s0,0xffffa
ffffffe000203012:	6420                	ld	s0,72(s0)
ffffffe000203014:	21656e6f          	jal	t3,ffffffe00025922a <_ebss+0x4f28a>
ffffffe000203018:	000a                	c.slli	zero,0x2
ffffffe00020301a:	0000                	unimp
ffffffe00020301c:	0000                	unimp
ffffffe00020301e:	0000                	unimp
ffffffe000203020:	6170                	ld	a2,192(a0)
ffffffe000203022:	696e                	ld	s2,216(sp)
ffffffe000203024:	25203a63          	0x25203a63
ffffffe000203028:	00000a73          	0xa73
ffffffe00020302c:	0000                	unimp
ffffffe00020302e:	0000                	unimp
ffffffe000203030:	2e2e                	fld	ft8,200(sp)
ffffffe000203032:	702e                	0x702e
ffffffe000203034:	6f72                	ld	t5,280(sp)
ffffffe000203036:	6e695f63          	bge	s2,t1,ffffffe000203734 <_erodata+0x4e4>
ffffffe00020303a:	7469                	lui	s0,0xffffa
ffffffe00020303c:	6420                	ld	s0,72(s0)
ffffffe00020303e:	21656e6f          	jal	t3,ffffffe000259254 <_ebss+0x4f2b4>
ffffffe000203042:	000a                	c.slli	zero,0x2
ffffffe000203044:	0000                	unimp
ffffffe000203046:	0000                	unimp
ffffffe000203048:	4449545b          	0x4449545b
ffffffe00020304c:	3d20                	fld	fs0,120(a0)
ffffffe00020304e:	2520                	fld	fs0,72(a0)
ffffffe000203050:	756c                	ld	a1,232(a0)
ffffffe000203052:	205d                	0x205d
ffffffe000203054:	7572                	ld	a0,312(sp)
ffffffe000203056:	6e6e                	ld	t3,216(sp)
ffffffe000203058:	6e69                	lui	t3,0x1a
ffffffe00020305a:	69202c67          	0x69202c67
ffffffe00020305e:	636e                	ld	t1,216(sp)
ffffffe000203060:	7265                	lui	tp,0xffff9
ffffffe000203062:	3d20                	fld	fs0,120(a0)
ffffffe000203064:	2520                	fld	fs0,72(a0)
ffffffe000203066:	756c                	ld	a1,232(a0)
ffffffe000203068:	000a                	c.slli	zero,0x2
ffffffe00020306a:	0000                	unimp
ffffffe00020306c:	0000                	unimp
ffffffe00020306e:	0000                	unimp
ffffffe000203070:	74697773          	csrrci	a4,0x746,18
ffffffe000203074:	74206863          	bltu	zero,sp,ffffffe0002037c4 <_erodata+0x574>
ffffffe000203078:	545b206f          	j	ffffffe0002b5dbc <_ebss+0xabe1c>
ffffffe00020307c:	4449                	li	s0,18
ffffffe00020307e:	3d20                	fld	fs0,120(a0)
ffffffe000203080:	2520                	fld	fs0,72(a0)
ffffffe000203082:	756c                	ld	a1,232(a0)
ffffffe000203084:	202c                	fld	fa1,64(s0)
ffffffe000203086:	7250                	ld	a2,160(a2)
ffffffe000203088:	6f69                	lui	t5,0x1a
ffffffe00020308a:	6972                	ld	s2,280(sp)
ffffffe00020308c:	7974                	ld	a3,240(a0)
ffffffe00020308e:	3d20                	fld	fs0,120(a0)
ffffffe000203090:	2520                	fld	fs0,72(a0)
ffffffe000203092:	756c                	ld	a1,232(a0)
ffffffe000203094:	202c                	fld	fa1,64(s0)
ffffffe000203096:	6e756f43          	fmadd.q	ft10,fa0,ft7,fa3,unknown
ffffffe00020309a:	6574                	ld	a3,200(a0)
ffffffe00020309c:	2072                	fld	ft0,280(sp)
ffffffe00020309e:	203d                	0x203d
ffffffe0002030a0:	6c25                	lui	s8,0x9
ffffffe0002030a2:	5d75                	li	s10,-3
ffffffe0002030a4:	000a                	c.slli	zero,0x2
ffffffe0002030a6:	0000                	unimp
ffffffe0002030a8:	20544553          	0x20544553
ffffffe0002030ac:	4449545b          	0x4449545b
ffffffe0002030b0:	3d20                	fld	fs0,120(a0)
ffffffe0002030b2:	2520                	fld	fs0,72(a0)
ffffffe0002030b4:	2c64                	fld	fs1,216(s0)
ffffffe0002030b6:	5020                	lw	s0,96(s0)
ffffffe0002030b8:	6972                	ld	s2,280(sp)
ffffffe0002030ba:	7469726f          	jal	tp,ffffffe00029a800 <_ebss+0x90860>
ffffffe0002030be:	2079                	0x2079
ffffffe0002030c0:	203d                	0x203d
ffffffe0002030c2:	6c25                	lui	s8,0x9
ffffffe0002030c4:	2c75                	addiw	s8,s8,29
ffffffe0002030c6:	4320                	lw	s0,64(a4)
ffffffe0002030c8:	746e756f          	jal	a0,ffffffe0002ea80e <_ebss+0xe086e>
ffffffe0002030cc:	7265                	lui	tp,0xffff9
ffffffe0002030ce:	3c20                	fld	fs0,120(s0)
ffffffe0002030d0:	202d                	0x202d
ffffffe0002030d2:	6c25                	lui	s8,0x9
ffffffe0002030d4:	5d75                	li	s10,-3
ffffffe0002030d6:	000a                	c.slli	zero,0x2
ffffffe0002030d8:	6170                	ld	a2,192(a0)
ffffffe0002030da:	66206567          	0x66206567
ffffffe0002030de:	7561                	lui	a0,0xffff8
ffffffe0002030e0:	746c                	ld	a1,232(s0)
ffffffe0002030e2:	202c                	fld	fa1,64(s0)
ffffffe0002030e4:	6361                	lui	t1,0x18
ffffffe0002030e6:	73736563          	bltu	t1,s7,ffffffe000203810 <_erodata+0x5c0>
ffffffe0002030ea:	6e20                	ld	s0,88(a2)
ffffffe0002030ec:	6920746f          	jal	s0,ffffffe00020a77e <_ebss+0x7de>
ffffffe0002030f0:	206e                	fld	ft0,216(sp)
ffffffe0002030f2:	6d76                	ld	s10,344(sp)
ffffffe0002030f4:	7361                	lui	t1,0xffff8
ffffffe0002030f6:	0000                	unimp
ffffffe0002030f8:	6170                	ld	a2,192(a0)
ffffffe0002030fa:	66206567          	0x66206567
ffffffe0002030fe:	7561                	lui	a0,0xffff8
ffffffe000203100:	746c                	ld	a1,232(s0)
ffffffe000203102:	202c                	fld	fa1,64(s0)
ffffffe000203104:	6c69                	lui	s8,0x1a
ffffffe000203106:	656c                	ld	a1,200(a0)
ffffffe000203108:	206c6167          	0x206c6167
ffffffe00020310c:	6361                	lui	t1,0x18
ffffffe00020310e:	73736563          	bltu	t1,s7,ffffffe000203838 <_erodata+0x5e8>
ffffffe000203112:	6d20                	ld	s0,88(a0)
ffffffe000203114:	0065646f          	jal	s0,ffffffe00025911a <_ebss+0x4f17a>
ffffffe000203118:	6e75                	lui	t3,0x1d
ffffffe00020311a:	776f6e6b          	0x776f6e6b
ffffffe00020311e:	006e                	c.slli	zero,0x1b
ffffffe000203120:	6974                	ld	a3,208(a0)
ffffffe000203122:	656d                	lui	a0,0x1b
ffffffe000203124:	2072                	fld	ft0,280(sp)
ffffffe000203126:	6e69                	lui	t3,0x1a
ffffffe000203128:	6574                	ld	a3,200(a0)
ffffffe00020312a:	7272                	ld	tp,312(sp)
ffffffe00020312c:	7075                	c.lui	zero,0xffffd
ffffffe00020312e:	0074                	addi	a3,sp,12
ffffffe000203130:	6e69                	lui	t3,0x1a
ffffffe000203132:	75727473          	csrrci	s0,0x757,4
ffffffe000203136:	6f697463          	bgeu	s2,s6,ffffffe00020381e <_erodata+0x5ce>
ffffffe00020313a:	206e                	fld	ft0,216(sp)
ffffffe00020313c:	6170                	ld	a2,192(a0)
ffffffe00020313e:	66206567          	0x66206567
ffffffe000203142:	7561                	lui	a0,0xffff8
ffffffe000203144:	746c                	ld	a1,232(s0)
ffffffe000203146:	0000                	unimp
ffffffe000203148:	6f6c                	ld	a1,216(a4)
ffffffe00020314a:	6461                	lui	s0,0x18
ffffffe00020314c:	7020                	ld	s0,96(s0)
ffffffe00020314e:	6761                	lui	a4,0x18
ffffffe000203150:	2065                	0x2065
ffffffe000203152:	6166                	ld	sp,88(sp)
ffffffe000203154:	6c75                	lui	s8,0x1d
ffffffe000203156:	0074                	addi	a3,sp,12
ffffffe000203158:	726f7473          	csrrci	s0,0x726,30
ffffffe00020315c:	2065                	0x2065
ffffffe00020315e:	6170                	ld	a2,192(a0)
ffffffe000203160:	66206567          	0x66206567
ffffffe000203164:	7561                	lui	a0,0xffff8
ffffffe000203166:	746c                	ld	a1,232(s0)
	...
ffffffe000203170:	6365                	lui	t1,0x19
ffffffe000203172:	6c61                	lui	s8,0x18
ffffffe000203174:	206c                	fld	fa1,192(s0)
ffffffe000203176:	7266                	ld	tp,120(sp)
ffffffe000203178:	55206d6f          	jal	s10,ffffffe0002096ca <r+0x6ca>
ffffffe00020317c:	6d2d                	lui	s10,0xb
ffffffe00020317e:	0065646f          	jal	s0,ffffffe000259184 <_ebss+0x4f1e4>
ffffffe000203182:	0000                	unimp
ffffffe000203184:	0000                	unimp
ffffffe000203186:	0000                	unimp
ffffffe000203188:	7274                	ld	a3,224(a2)
ffffffe00020318a:	7061                	c.lui	zero,0xffff8
ffffffe00020318c:	203a                	fld	ft0,392(sp)
ffffffe00020318e:	7325                	lui	t1,0xfffe9
ffffffe000203190:	000a                	c.slli	zero,0x2
ffffffe000203192:	0000                	unimp
ffffffe000203194:	0000                	unimp
ffffffe000203196:	0000                	unimp
ffffffe000203198:	6966                	ld	s2,88(sp)
ffffffe00020319a:	7372                	ld	t1,312(sp)
ffffffe00020319c:	2074                	fld	fa3,192(s0)
ffffffe00020319e:	6e49                	lui	t3,0x12
ffffffe0002031a0:	75727473          	csrrci	s0,0x757,4
ffffffe0002031a4:	6f697463          	bgeu	s2,s6,ffffffe00020388c <_erodata+0x63c>
ffffffe0002031a8:	206e                	fld	ft0,216(sp)
ffffffe0002031aa:	6150                	ld	a2,128(a0)
ffffffe0002031ac:	46206567          	0x46206567
ffffffe0002031b0:	7561                	lui	a0,0xffff8
ffffffe0002031b2:	746c                	ld	a1,232(s0)
ffffffe0002031b4:	6120                	ld	s0,64(a0)
ffffffe0002031b6:	2074                	fld	fa3,192(s0)
ffffffe0002031b8:	4350                	lw	a2,4(a4)
ffffffe0002031ba:	3d20                	fld	fs0,120(a0)
ffffffe0002031bc:	2520                	fld	fs0,72(a0)
ffffffe0002031be:	3130                	fld	fa2,96(a0)
ffffffe0002031c0:	6c36                	ld	s8,328(sp)
ffffffe0002031c2:	0a78                	addi	a4,sp,284
ffffffe0002031c4:	0000                	unimp
ffffffe0002031c6:	0000                	unimp
ffffffe0002031c8:	6f64                	ld	s1,216(a4)
ffffffe0002031ca:	6d5f 616d 2870      	0x2870616d6d5f
ffffffe0002031d0:	6c25                	lui	s8,0x9
ffffffe0002031d2:	2c75                	addiw	s8,s8,29
ffffffe0002031d4:	2520                	fld	fs0,72(a0)
ffffffe0002031d6:	756c                	ld	a1,232(a0)
ffffffe0002031d8:	0a29                	addi	s4,s4,10
ffffffe0002031da:	0000                	unimp
ffffffe0002031dc:	0000                	unimp
ffffffe0002031de:	0000                	unimp
ffffffe0002031e0:	6425                	lui	s0,0x9
ffffffe0002031e2:	000a                	c.slli	zero,0x2
ffffffe0002031e4:	0000                	unimp
ffffffe0002031e6:	0000                	unimp
ffffffe0002031e8:	6548                	ld	a0,136(a0)
ffffffe0002031ea:	6c6c                	ld	a1,216(s0)
ffffffe0002031ec:	4952206f          	j	ffffffe000225e80 <_ebss+0x1bee0>
ffffffe0002031f0:	562d4353          	0x562d4353
ffffffe0002031f4:	000a                	c.slli	zero,0x2
ffffffe0002031f6:	0000                	unimp
ffffffe0002031f8:	f290                	sd	a2,32(a3)
ffffffe0002031fa:	ffff                	0xffff
ffffffe0002031fc:	eff0                	sd	a2,216(a5)
ffffffe0002031fe:	ffff                	0xffff
ffffffe000203200:	f310                	sd	a2,32(a4)
ffffffe000203202:	ffff                	0xffff
ffffffe000203204:	f310                	sd	a2,32(a4)
ffffffe000203206:	ffff                	0xffff
ffffffe000203208:	f310                	sd	a2,32(a4)
ffffffe00020320a:	ffff                	0xffff
ffffffe00020320c:	f310                	sd	a2,32(a4)
ffffffe00020320e:	ffff                	0xffff
ffffffe000203210:	f310                	sd	a2,32(a4)
ffffffe000203212:	ffff                	0xffff
ffffffe000203214:	f310                	sd	a2,32(a4)
ffffffe000203216:	ffff                	0xffff
ffffffe000203218:	f310                	sd	a2,32(a4)
ffffffe00020321a:	ffff                	0xffff
ffffffe00020321c:	eef0                	sd	a2,216(a3)
ffffffe00020321e:	ffff                	0xffff
ffffffe000203220:	f310                	sd	a2,32(a4)
ffffffe000203222:	ffff                	0xffff
ffffffe000203224:	f310                	sd	a2,32(a4)
ffffffe000203226:	ffff                	0xffff
ffffffe000203228:	f310                	sd	a2,32(a4)
ffffffe00020322a:	ffff                	0xffff
ffffffe00020322c:	f310                	sd	a2,32(a4)
ffffffe00020322e:	ffff                	0xffff
ffffffe000203230:	f310                	sd	a2,32(a4)
ffffffe000203232:	ffff                	0xffff
ffffffe000203234:	f310                	sd	a2,32(a4)
ffffffe000203236:	ffff                	0xffff
ffffffe000203238:	f234                	sd	a3,96(a2)
ffffffe00020323a:	ffff                	0xffff
ffffffe00020323c:	f310                	sd	a2,32(a4)
ffffffe00020323e:	ffff                	0xffff
ffffffe000203240:	f128                	sd	a0,96(a0)
ffffffe000203242:	ffff                	0xffff
ffffffe000203244:	f310                	sd	a2,32(a4)
ffffffe000203246:	ffff                	0xffff
ffffffe000203248:	f310                	sd	a2,32(a4)
ffffffe00020324a:	ffff                	0xffff
ffffffe00020324c:	eefc                	sd	a5,216(a3)
ffffffe00020324e:	ffff                	0xffff

Disassembly of section .data:

ffffffe000204000 <_edata>:
ffffffe000204000:	06c0006f          	j	ffffffe00020406c <_edata+0x6c>
ffffffe000204004:	fe010113          	addi	sp,sp,-32
ffffffe000204008:	00813c23          	sd	s0,24(sp)
ffffffe00020400c:	02010413          	addi	s0,sp,32
ffffffe000204010:	fe843783          	ld	a5,-24(s0) # 8fe8 <BASE_ADDR-0xffffffe0001f7018>
ffffffe000204014:	0ac00893          	li	a7,172
ffffffe000204018:	00000073          	ecall
ffffffe00020401c:	00050793          	mv	a5,a0
ffffffe000204020:	fef43423          	sd	a5,-24(s0)
ffffffe000204024:	fe843783          	ld	a5,-24(s0)
ffffffe000204028:	00078513          	mv	a0,a5
ffffffe00020402c:	01813403          	ld	s0,24(sp)
ffffffe000204030:	02010113          	addi	sp,sp,32
ffffffe000204034:	00008067          	ret
ffffffe000204038:	fe010113          	addi	sp,sp,-32
ffffffe00020403c:	00813c23          	sd	s0,24(sp)
ffffffe000204040:	02010413          	addi	s0,sp,32
ffffffe000204044:	fe843783          	ld	a5,-24(s0)
ffffffe000204048:	0dc00893          	li	a7,220
ffffffe00020404c:	00000073          	ecall
ffffffe000204050:	00050793          	mv	a5,a0
ffffffe000204054:	fef43423          	sd	a5,-24(s0)
ffffffe000204058:	fe843783          	ld	a5,-24(s0)
ffffffe00020405c:	00078513          	mv	a0,a5
ffffffe000204060:	01813403          	ld	s0,24(sp)
ffffffe000204064:	02010113          	addi	sp,sp,32
ffffffe000204068:	00008067          	ret
ffffffe00020406c:	fe010113          	addi	sp,sp,-32
ffffffe000204070:	00113c23          	sd	ra,24(sp)
ffffffe000204074:	00813823          	sd	s0,16(sp)
ffffffe000204078:	02010413          	addi	s0,sp,32
ffffffe00020407c:	fbdff0ef          	jal	ra,ffffffe000204038 <_edata+0x38>
ffffffe000204080:	00050793          	mv	a5,a0
ffffffe000204084:	fef42423          	sw	a5,-24(s0)
ffffffe000204088:	fe842783          	lw	a5,-24(s0)
ffffffe00020408c:	0007879b          	sext.w	a5,a5
ffffffe000204090:	02f05063          	blez	a5,ffffffe0002040b0 <_edata+0xb0>
ffffffe000204094:	f71ff0ef          	jal	ra,ffffffe000204004 <_edata+0x4>
ffffffe000204098:	00050713          	mv	a4,a0
ffffffe00020409c:	fe842783          	lw	a5,-24(s0)
ffffffe0002040a0:	00078613          	mv	a2,a5
ffffffe0002040a4:	00070593          	mv	a1,a4
ffffffe0002040a8:	78800513          	li	a0,1928
ffffffe0002040ac:	64c000ef          	jal	ra,ffffffe0002046f8 <_edata+0x6f8>
ffffffe0002040b0:	f89ff0ef          	jal	ra,ffffffe000204038 <_edata+0x38>
ffffffe0002040b4:	00050793          	mv	a5,a0
ffffffe0002040b8:	fef42423          	sw	a5,-24(s0)
ffffffe0002040bc:	fe842783          	lw	a5,-24(s0)
ffffffe0002040c0:	0007879b          	sext.w	a5,a5
ffffffe0002040c4:	02f05063          	blez	a5,ffffffe0002040e4 <_edata+0xe4>
ffffffe0002040c8:	f3dff0ef          	jal	ra,ffffffe000204004 <_edata+0x4>
ffffffe0002040cc:	00050713          	mv	a4,a0
ffffffe0002040d0:	fe842783          	lw	a5,-24(s0)
ffffffe0002040d4:	00078613          	mv	a2,a5
ffffffe0002040d8:	00070593          	mv	a1,a4
ffffffe0002040dc:	78800513          	li	a0,1928
ffffffe0002040e0:	618000ef          	jal	ra,ffffffe0002046f8 <_edata+0x6f8>
ffffffe0002040e4:	f21ff0ef          	jal	ra,ffffffe000204004 <_edata+0x4>
ffffffe0002040e8:	00050793          	mv	a5,a0
ffffffe0002040ec:	00078593          	mv	a1,a5
ffffffe0002040f0:	7a800513          	li	a0,1960
ffffffe0002040f4:	604000ef          	jal	ra,ffffffe0002046f8 <_edata+0x6f8>
ffffffe0002040f8:	fe042623          	sw	zero,-20(s0)
ffffffe0002040fc:	0100006f          	j	ffffffe00020410c <_edata+0x10c>
ffffffe000204100:	fec42783          	lw	a5,-20(s0)
ffffffe000204104:	0017879b          	addiw	a5,a5,1
ffffffe000204108:	fef42623          	sw	a5,-20(s0)
ffffffe00020410c:	fec42783          	lw	a5,-20(s0)
ffffffe000204110:	0007871b          	sext.w	a4,a5
ffffffe000204114:	500007b7          	lui	a5,0x50000
ffffffe000204118:	ffe78793          	addi	a5,a5,-2 # 4ffffffe <BASE_ADDR-0xffffffdfb0200002>
ffffffe00020411c:	fee7f2e3          	bgeu	a5,a4,ffffffe000204100 <_edata+0x100>
ffffffe000204120:	fc5ff06f          	j	ffffffe0002040e4 <_edata+0xe4>
ffffffe000204124:	fe010113          	addi	sp,sp,-32
ffffffe000204128:	00813c23          	sd	s0,24(sp)
ffffffe00020412c:	02010413          	addi	s0,sp,32
ffffffe000204130:	00050793          	mv	a5,a0
ffffffe000204134:	fef407a3          	sb	a5,-17(s0)
ffffffe000204138:	00000797          	auipc	a5,0x0
ffffffe00020413c:	6e078793          	addi	a5,a5,1760 # ffffffe000204818 <uapp_end>
ffffffe000204140:	0007a783          	lw	a5,0(a5)
ffffffe000204144:	0017871b          	addiw	a4,a5,1
ffffffe000204148:	0007069b          	sext.w	a3,a4
ffffffe00020414c:	00000717          	auipc	a4,0x0
ffffffe000204150:	6cc70713          	addi	a4,a4,1740 # ffffffe000204818 <uapp_end>
ffffffe000204154:	00d72023          	sw	a3,0(a4)
ffffffe000204158:	00000717          	auipc	a4,0x0
ffffffe00020415c:	6c870713          	addi	a4,a4,1736 # ffffffe000204820 <uapp_end+0x8>
ffffffe000204160:	00f707b3          	add	a5,a4,a5
ffffffe000204164:	fef44703          	lbu	a4,-17(s0)
ffffffe000204168:	00e78023          	sb	a4,0(a5)
ffffffe00020416c:	00000013          	nop
ffffffe000204170:	01813403          	ld	s0,24(sp)
ffffffe000204174:	02010113          	addi	sp,sp,32
ffffffe000204178:	00008067          	ret
ffffffe00020417c:	f1010113          	addi	sp,sp,-240
ffffffe000204180:	0e113423          	sd	ra,232(sp)
ffffffe000204184:	0e813023          	sd	s0,224(sp)
ffffffe000204188:	0f010413          	addi	s0,sp,240
ffffffe00020418c:	f2a43423          	sd	a0,-216(s0)
ffffffe000204190:	f2b43023          	sd	a1,-224(s0)
ffffffe000204194:	f0c43c23          	sd	a2,-232(s0)
ffffffe000204198:	fe042623          	sw	zero,-20(s0)
ffffffe00020419c:	fe042423          	sw	zero,-24(s0)
ffffffe0002041a0:	fe043023          	sd	zero,-32(s0)
ffffffe0002041a4:	4bc0006f          	j	ffffffe000204660 <_edata+0x660>
ffffffe0002041a8:	fec42783          	lw	a5,-20(s0)
ffffffe0002041ac:	0007879b          	sext.w	a5,a5
ffffffe0002041b0:	44078e63          	beqz	a5,ffffffe00020460c <_edata+0x60c>
ffffffe0002041b4:	f2043783          	ld	a5,-224(s0)
ffffffe0002041b8:	0007c783          	lbu	a5,0(a5)
ffffffe0002041bc:	0007879b          	sext.w	a5,a5
ffffffe0002041c0:	f9d7869b          	addiw	a3,a5,-99
ffffffe0002041c4:	0006871b          	sext.w	a4,a3
ffffffe0002041c8:	01500793          	li	a5,21
ffffffe0002041cc:	48e7e263          	bltu	a5,a4,ffffffe000204650 <_edata+0x650>
ffffffe0002041d0:	02069793          	slli	a5,a3,0x20
ffffffe0002041d4:	0207d793          	srli	a5,a5,0x20
ffffffe0002041d8:	00279713          	slli	a4,a5,0x2
ffffffe0002041dc:	7c000793          	li	a5,1984
ffffffe0002041e0:	00f707b3          	add	a5,a4,a5
ffffffe0002041e4:	0007a783          	lw	a5,0(a5)
ffffffe0002041e8:	0007871b          	sext.w	a4,a5
ffffffe0002041ec:	7c000793          	li	a5,1984
ffffffe0002041f0:	00f707b3          	add	a5,a4,a5
ffffffe0002041f4:	00078067          	jr	a5
ffffffe0002041f8:	00100793          	li	a5,1
ffffffe0002041fc:	fef42423          	sw	a5,-24(s0)
ffffffe000204200:	4540006f          	j	ffffffe000204654 <_edata+0x654>
ffffffe000204204:	fe842783          	lw	a5,-24(s0)
ffffffe000204208:	0007879b          	sext.w	a5,a5
ffffffe00020420c:	00078c63          	beqz	a5,ffffffe000204224 <_edata+0x224>
ffffffe000204210:	f1843783          	ld	a5,-232(s0)
ffffffe000204214:	00878713          	addi	a4,a5,8
ffffffe000204218:	f0e43c23          	sd	a4,-232(s0)
ffffffe00020421c:	0007b783          	ld	a5,0(a5)
ffffffe000204220:	0140006f          	j	ffffffe000204234 <_edata+0x234>
ffffffe000204224:	f1843783          	ld	a5,-232(s0)
ffffffe000204228:	00878713          	addi	a4,a5,8
ffffffe00020422c:	f0e43c23          	sd	a4,-232(s0)
ffffffe000204230:	0007a783          	lw	a5,0(a5)
ffffffe000204234:	f8f43423          	sd	a5,-120(s0)
ffffffe000204238:	fe842783          	lw	a5,-24(s0)
ffffffe00020423c:	0007879b          	sext.w	a5,a5
ffffffe000204240:	00078663          	beqz	a5,ffffffe00020424c <_edata+0x24c>
ffffffe000204244:	00f00793          	li	a5,15
ffffffe000204248:	0080006f          	j	ffffffe000204250 <_edata+0x250>
ffffffe00020424c:	00700793          	li	a5,7
ffffffe000204250:	f8f42223          	sw	a5,-124(s0)
ffffffe000204254:	f8442783          	lw	a5,-124(s0)
ffffffe000204258:	fcf42e23          	sw	a5,-36(s0)
ffffffe00020425c:	0840006f          	j	ffffffe0002042e0 <_edata+0x2e0>
ffffffe000204260:	fdc42783          	lw	a5,-36(s0)
ffffffe000204264:	0027979b          	slliw	a5,a5,0x2
ffffffe000204268:	0007879b          	sext.w	a5,a5
ffffffe00020426c:	f8843703          	ld	a4,-120(s0)
ffffffe000204270:	40f757b3          	sra	a5,a4,a5
ffffffe000204274:	0007879b          	sext.w	a5,a5
ffffffe000204278:	00f7f793          	andi	a5,a5,15
ffffffe00020427c:	f8f42023          	sw	a5,-128(s0)
ffffffe000204280:	f8042783          	lw	a5,-128(s0)
ffffffe000204284:	0007871b          	sext.w	a4,a5
ffffffe000204288:	00900793          	li	a5,9
ffffffe00020428c:	00e7cc63          	blt	a5,a4,ffffffe0002042a4 <_edata+0x2a4>
ffffffe000204290:	f8042783          	lw	a5,-128(s0)
ffffffe000204294:	0ff7f793          	zext.b	a5,a5
ffffffe000204298:	0307879b          	addiw	a5,a5,48
ffffffe00020429c:	0ff7f793          	zext.b	a5,a5
ffffffe0002042a0:	0140006f          	j	ffffffe0002042b4 <_edata+0x2b4>
ffffffe0002042a4:	f8042783          	lw	a5,-128(s0)
ffffffe0002042a8:	0ff7f793          	zext.b	a5,a5
ffffffe0002042ac:	0577879b          	addiw	a5,a5,87
ffffffe0002042b0:	0ff7f793          	zext.b	a5,a5
ffffffe0002042b4:	f6f40fa3          	sb	a5,-129(s0)
ffffffe0002042b8:	f7f44783          	lbu	a5,-129(s0)
ffffffe0002042bc:	f2843703          	ld	a4,-216(s0)
ffffffe0002042c0:	00078513          	mv	a0,a5
ffffffe0002042c4:	000700e7          	jalr	a4
ffffffe0002042c8:	fe043783          	ld	a5,-32(s0)
ffffffe0002042cc:	00178793          	addi	a5,a5,1
ffffffe0002042d0:	fef43023          	sd	a5,-32(s0)
ffffffe0002042d4:	fdc42783          	lw	a5,-36(s0)
ffffffe0002042d8:	fff7879b          	addiw	a5,a5,-1
ffffffe0002042dc:	fcf42e23          	sw	a5,-36(s0)
ffffffe0002042e0:	fdc42783          	lw	a5,-36(s0)
ffffffe0002042e4:	0007879b          	sext.w	a5,a5
ffffffe0002042e8:	f607dce3          	bgez	a5,ffffffe000204260 <_edata+0x260>
ffffffe0002042ec:	fe042423          	sw	zero,-24(s0)
ffffffe0002042f0:	fe042623          	sw	zero,-20(s0)
ffffffe0002042f4:	3600006f          	j	ffffffe000204654 <_edata+0x654>
ffffffe0002042f8:	fe842783          	lw	a5,-24(s0)
ffffffe0002042fc:	0007879b          	sext.w	a5,a5
ffffffe000204300:	00078c63          	beqz	a5,ffffffe000204318 <_edata+0x318>
ffffffe000204304:	f1843783          	ld	a5,-232(s0)
ffffffe000204308:	00878713          	addi	a4,a5,8
ffffffe00020430c:	f0e43c23          	sd	a4,-232(s0)
ffffffe000204310:	0007b783          	ld	a5,0(a5)
ffffffe000204314:	0140006f          	j	ffffffe000204328 <_edata+0x328>
ffffffe000204318:	f1843783          	ld	a5,-232(s0)
ffffffe00020431c:	00878713          	addi	a4,a5,8
ffffffe000204320:	f0e43c23          	sd	a4,-232(s0)
ffffffe000204324:	0007a783          	lw	a5,0(a5)
ffffffe000204328:	fcf43823          	sd	a5,-48(s0)
ffffffe00020432c:	fd043783          	ld	a5,-48(s0)
ffffffe000204330:	0207d463          	bgez	a5,ffffffe000204358 <_edata+0x358>
ffffffe000204334:	fd043783          	ld	a5,-48(s0)
ffffffe000204338:	40f007b3          	neg	a5,a5
ffffffe00020433c:	fcf43823          	sd	a5,-48(s0)
ffffffe000204340:	f2843783          	ld	a5,-216(s0)
ffffffe000204344:	02d00513          	li	a0,45
ffffffe000204348:	000780e7          	jalr	a5
ffffffe00020434c:	fe043783          	ld	a5,-32(s0)
ffffffe000204350:	00178793          	addi	a5,a5,1
ffffffe000204354:	fef43023          	sd	a5,-32(s0)
ffffffe000204358:	fc042623          	sw	zero,-52(s0)
ffffffe00020435c:	03000793          	li	a5,48
ffffffe000204360:	f4f43823          	sd	a5,-176(s0)
ffffffe000204364:	f4043c23          	sd	zero,-168(s0)
ffffffe000204368:	f6043023          	sd	zero,-160(s0)
ffffffe00020436c:	f6040423          	sb	zero,-152(s0)
ffffffe000204370:	fd043783          	ld	a5,-48(s0)
ffffffe000204374:	fcf43023          	sd	a5,-64(s0)
ffffffe000204378:	0480006f          	j	ffffffe0002043c0 <_edata+0x3c0>
ffffffe00020437c:	fc043703          	ld	a4,-64(s0)
ffffffe000204380:	00a00793          	li	a5,10
ffffffe000204384:	02f767b3          	rem	a5,a4,a5
ffffffe000204388:	0ff7f793          	zext.b	a5,a5
ffffffe00020438c:	0307879b          	addiw	a5,a5,48
ffffffe000204390:	0ff7f713          	zext.b	a4,a5
ffffffe000204394:	fcc42783          	lw	a5,-52(s0)
ffffffe000204398:	ff078793          	addi	a5,a5,-16
ffffffe00020439c:	008787b3          	add	a5,a5,s0
ffffffe0002043a0:	f6e78023          	sb	a4,-160(a5)
ffffffe0002043a4:	fc043703          	ld	a4,-64(s0)
ffffffe0002043a8:	00a00793          	li	a5,10
ffffffe0002043ac:	02f747b3          	div	a5,a4,a5
ffffffe0002043b0:	fcf43023          	sd	a5,-64(s0)
ffffffe0002043b4:	fcc42783          	lw	a5,-52(s0)
ffffffe0002043b8:	0017879b          	addiw	a5,a5,1
ffffffe0002043bc:	fcf42623          	sw	a5,-52(s0)
ffffffe0002043c0:	fc043783          	ld	a5,-64(s0)
ffffffe0002043c4:	fa079ce3          	bnez	a5,ffffffe00020437c <_edata+0x37c>
ffffffe0002043c8:	fcc42783          	lw	a5,-52(s0)
ffffffe0002043cc:	0007879b          	sext.w	a5,a5
ffffffe0002043d0:	00079863          	bnez	a5,ffffffe0002043e0 <_edata+0x3e0>
ffffffe0002043d4:	fcc42783          	lw	a5,-52(s0)
ffffffe0002043d8:	0017879b          	addiw	a5,a5,1
ffffffe0002043dc:	fcf42623          	sw	a5,-52(s0)
ffffffe0002043e0:	fcc42783          	lw	a5,-52(s0)
ffffffe0002043e4:	fff7879b          	addiw	a5,a5,-1
ffffffe0002043e8:	faf42e23          	sw	a5,-68(s0)
ffffffe0002043ec:	02c0006f          	j	ffffffe000204418 <_edata+0x418>
ffffffe0002043f0:	fbc42783          	lw	a5,-68(s0)
ffffffe0002043f4:	ff078793          	addi	a5,a5,-16
ffffffe0002043f8:	008787b3          	add	a5,a5,s0
ffffffe0002043fc:	f607c783          	lbu	a5,-160(a5)
ffffffe000204400:	f2843703          	ld	a4,-216(s0)
ffffffe000204404:	00078513          	mv	a0,a5
ffffffe000204408:	000700e7          	jalr	a4
ffffffe00020440c:	fbc42783          	lw	a5,-68(s0)
ffffffe000204410:	fff7879b          	addiw	a5,a5,-1
ffffffe000204414:	faf42e23          	sw	a5,-68(s0)
ffffffe000204418:	fbc42783          	lw	a5,-68(s0)
ffffffe00020441c:	0007879b          	sext.w	a5,a5
ffffffe000204420:	fc07d8e3          	bgez	a5,ffffffe0002043f0 <_edata+0x3f0>
ffffffe000204424:	fcc42783          	lw	a5,-52(s0)
ffffffe000204428:	0017879b          	addiw	a5,a5,1
ffffffe00020442c:	0007879b          	sext.w	a5,a5
ffffffe000204430:	00078713          	mv	a4,a5
ffffffe000204434:	fe043783          	ld	a5,-32(s0)
ffffffe000204438:	00e787b3          	add	a5,a5,a4
ffffffe00020443c:	fef43023          	sd	a5,-32(s0)
ffffffe000204440:	fe042423          	sw	zero,-24(s0)
ffffffe000204444:	fe042623          	sw	zero,-20(s0)
ffffffe000204448:	20c0006f          	j	ffffffe000204654 <_edata+0x654>
ffffffe00020444c:	fe842783          	lw	a5,-24(s0)
ffffffe000204450:	0007879b          	sext.w	a5,a5
ffffffe000204454:	00078c63          	beqz	a5,ffffffe00020446c <_edata+0x46c>
ffffffe000204458:	f1843783          	ld	a5,-232(s0)
ffffffe00020445c:	00878713          	addi	a4,a5,8
ffffffe000204460:	f0e43c23          	sd	a4,-232(s0)
ffffffe000204464:	0007b783          	ld	a5,0(a5)
ffffffe000204468:	0140006f          	j	ffffffe00020447c <_edata+0x47c>
ffffffe00020446c:	f1843783          	ld	a5,-232(s0)
ffffffe000204470:	00878713          	addi	a4,a5,8
ffffffe000204474:	f0e43c23          	sd	a4,-232(s0)
ffffffe000204478:	0007a783          	lw	a5,0(a5)
ffffffe00020447c:	f6f43823          	sd	a5,-144(s0)
ffffffe000204480:	fa042c23          	sw	zero,-72(s0)
ffffffe000204484:	03000793          	li	a5,48
ffffffe000204488:	f2f43823          	sd	a5,-208(s0)
ffffffe00020448c:	f2043c23          	sd	zero,-200(s0)
ffffffe000204490:	f4043023          	sd	zero,-192(s0)
ffffffe000204494:	f4040423          	sb	zero,-184(s0)
ffffffe000204498:	f7043783          	ld	a5,-144(s0)
ffffffe00020449c:	faf43823          	sd	a5,-80(s0)
ffffffe0002044a0:	0480006f          	j	ffffffe0002044e8 <_edata+0x4e8>
ffffffe0002044a4:	fb043703          	ld	a4,-80(s0)
ffffffe0002044a8:	00a00793          	li	a5,10
ffffffe0002044ac:	02f767b3          	rem	a5,a4,a5
ffffffe0002044b0:	0ff7f793          	zext.b	a5,a5
ffffffe0002044b4:	0307879b          	addiw	a5,a5,48
ffffffe0002044b8:	0ff7f713          	zext.b	a4,a5
ffffffe0002044bc:	fb842783          	lw	a5,-72(s0)
ffffffe0002044c0:	ff078793          	addi	a5,a5,-16
ffffffe0002044c4:	008787b3          	add	a5,a5,s0
ffffffe0002044c8:	f4e78023          	sb	a4,-192(a5)
ffffffe0002044cc:	fb043703          	ld	a4,-80(s0)
ffffffe0002044d0:	00a00793          	li	a5,10
ffffffe0002044d4:	02f747b3          	div	a5,a4,a5
ffffffe0002044d8:	faf43823          	sd	a5,-80(s0)
ffffffe0002044dc:	fb842783          	lw	a5,-72(s0)
ffffffe0002044e0:	0017879b          	addiw	a5,a5,1
ffffffe0002044e4:	faf42c23          	sw	a5,-72(s0)
ffffffe0002044e8:	fb043783          	ld	a5,-80(s0)
ffffffe0002044ec:	fa079ce3          	bnez	a5,ffffffe0002044a4 <_edata+0x4a4>
ffffffe0002044f0:	fb842783          	lw	a5,-72(s0)
ffffffe0002044f4:	0007879b          	sext.w	a5,a5
ffffffe0002044f8:	00079863          	bnez	a5,ffffffe000204508 <_edata+0x508>
ffffffe0002044fc:	fb842783          	lw	a5,-72(s0)
ffffffe000204500:	0017879b          	addiw	a5,a5,1
ffffffe000204504:	faf42c23          	sw	a5,-72(s0)
ffffffe000204508:	fb842783          	lw	a5,-72(s0)
ffffffe00020450c:	fff7879b          	addiw	a5,a5,-1
ffffffe000204510:	faf42623          	sw	a5,-84(s0)
ffffffe000204514:	02c0006f          	j	ffffffe000204540 <_edata+0x540>
ffffffe000204518:	fac42783          	lw	a5,-84(s0)
ffffffe00020451c:	ff078793          	addi	a5,a5,-16
ffffffe000204520:	008787b3          	add	a5,a5,s0
ffffffe000204524:	f407c783          	lbu	a5,-192(a5)
ffffffe000204528:	f2843703          	ld	a4,-216(s0)
ffffffe00020452c:	00078513          	mv	a0,a5
ffffffe000204530:	000700e7          	jalr	a4
ffffffe000204534:	fac42783          	lw	a5,-84(s0)
ffffffe000204538:	fff7879b          	addiw	a5,a5,-1
ffffffe00020453c:	faf42623          	sw	a5,-84(s0)
ffffffe000204540:	fac42783          	lw	a5,-84(s0)
ffffffe000204544:	0007879b          	sext.w	a5,a5
ffffffe000204548:	fc07d8e3          	bgez	a5,ffffffe000204518 <_edata+0x518>
ffffffe00020454c:	fb842783          	lw	a5,-72(s0)
ffffffe000204550:	fff7879b          	addiw	a5,a5,-1
ffffffe000204554:	0007879b          	sext.w	a5,a5
ffffffe000204558:	00078713          	mv	a4,a5
ffffffe00020455c:	fe043783          	ld	a5,-32(s0)
ffffffe000204560:	00e787b3          	add	a5,a5,a4
ffffffe000204564:	fef43023          	sd	a5,-32(s0)
ffffffe000204568:	fe042423          	sw	zero,-24(s0)
ffffffe00020456c:	fe042623          	sw	zero,-20(s0)
ffffffe000204570:	0e40006f          	j	ffffffe000204654 <_edata+0x654>
ffffffe000204574:	f1843783          	ld	a5,-232(s0)
ffffffe000204578:	00878713          	addi	a4,a5,8
ffffffe00020457c:	f0e43c23          	sd	a4,-232(s0)
ffffffe000204580:	0007b783          	ld	a5,0(a5)
ffffffe000204584:	faf43023          	sd	a5,-96(s0)
ffffffe000204588:	0300006f          	j	ffffffe0002045b8 <_edata+0x5b8>
ffffffe00020458c:	fa043783          	ld	a5,-96(s0)
ffffffe000204590:	0007c783          	lbu	a5,0(a5)
ffffffe000204594:	f2843703          	ld	a4,-216(s0)
ffffffe000204598:	00078513          	mv	a0,a5
ffffffe00020459c:	000700e7          	jalr	a4
ffffffe0002045a0:	fe043783          	ld	a5,-32(s0)
ffffffe0002045a4:	00178793          	addi	a5,a5,1
ffffffe0002045a8:	fef43023          	sd	a5,-32(s0)
ffffffe0002045ac:	fa043783          	ld	a5,-96(s0)
ffffffe0002045b0:	00178793          	addi	a5,a5,1
ffffffe0002045b4:	faf43023          	sd	a5,-96(s0)
ffffffe0002045b8:	fa043783          	ld	a5,-96(s0)
ffffffe0002045bc:	0007c783          	lbu	a5,0(a5)
ffffffe0002045c0:	fc0796e3          	bnez	a5,ffffffe00020458c <_edata+0x58c>
ffffffe0002045c4:	fe042423          	sw	zero,-24(s0)
ffffffe0002045c8:	fe042623          	sw	zero,-20(s0)
ffffffe0002045cc:	0880006f          	j	ffffffe000204654 <_edata+0x654>
ffffffe0002045d0:	f1843783          	ld	a5,-232(s0)
ffffffe0002045d4:	00878713          	addi	a4,a5,8
ffffffe0002045d8:	f0e43c23          	sd	a4,-232(s0)
ffffffe0002045dc:	0007a783          	lw	a5,0(a5)
ffffffe0002045e0:	f6f407a3          	sb	a5,-145(s0)
ffffffe0002045e4:	f6f44783          	lbu	a5,-145(s0)
ffffffe0002045e8:	f2843703          	ld	a4,-216(s0)
ffffffe0002045ec:	00078513          	mv	a0,a5
ffffffe0002045f0:	000700e7          	jalr	a4
ffffffe0002045f4:	fe043783          	ld	a5,-32(s0)
ffffffe0002045f8:	00178793          	addi	a5,a5,1
ffffffe0002045fc:	fef43023          	sd	a5,-32(s0)
ffffffe000204600:	fe042423          	sw	zero,-24(s0)
ffffffe000204604:	fe042623          	sw	zero,-20(s0)
ffffffe000204608:	04c0006f          	j	ffffffe000204654 <_edata+0x654>
ffffffe00020460c:	f2043783          	ld	a5,-224(s0)
ffffffe000204610:	0007c783          	lbu	a5,0(a5)
ffffffe000204614:	00078713          	mv	a4,a5
ffffffe000204618:	02500793          	li	a5,37
ffffffe00020461c:	00f71863          	bne	a4,a5,ffffffe00020462c <_edata+0x62c>
ffffffe000204620:	00100793          	li	a5,1
ffffffe000204624:	fef42623          	sw	a5,-20(s0)
ffffffe000204628:	02c0006f          	j	ffffffe000204654 <_edata+0x654>
ffffffe00020462c:	f2043783          	ld	a5,-224(s0)
ffffffe000204630:	0007c783          	lbu	a5,0(a5)
ffffffe000204634:	f2843703          	ld	a4,-216(s0)
ffffffe000204638:	00078513          	mv	a0,a5
ffffffe00020463c:	000700e7          	jalr	a4
ffffffe000204640:	fe043783          	ld	a5,-32(s0)
ffffffe000204644:	00178793          	addi	a5,a5,1
ffffffe000204648:	fef43023          	sd	a5,-32(s0)
ffffffe00020464c:	0080006f          	j	ffffffe000204654 <_edata+0x654>
ffffffe000204650:	00000013          	nop
ffffffe000204654:	f2043783          	ld	a5,-224(s0)
ffffffe000204658:	00178793          	addi	a5,a5,1
ffffffe00020465c:	f2f43023          	sd	a5,-224(s0)
ffffffe000204660:	f2043783          	ld	a5,-224(s0)
ffffffe000204664:	0007c783          	lbu	a5,0(a5)
ffffffe000204668:	b40790e3          	bnez	a5,ffffffe0002041a8 <_edata+0x1a8>
ffffffe00020466c:	00100793          	li	a5,1
ffffffe000204670:	f8f43c23          	sd	a5,-104(s0)
ffffffe000204674:	00000797          	auipc	a5,0x0
ffffffe000204678:	1a478793          	addi	a5,a5,420 # ffffffe000204818 <uapp_end>
ffffffe00020467c:	0007a783          	lw	a5,0(a5)
ffffffe000204680:	0017871b          	addiw	a4,a5,1
ffffffe000204684:	0007069b          	sext.w	a3,a4
ffffffe000204688:	00000717          	auipc	a4,0x0
ffffffe00020468c:	19070713          	addi	a4,a4,400 # ffffffe000204818 <uapp_end>
ffffffe000204690:	00d72023          	sw	a3,0(a4)
ffffffe000204694:	00000717          	auipc	a4,0x0
ffffffe000204698:	18c70713          	addi	a4,a4,396 # ffffffe000204820 <uapp_end+0x8>
ffffffe00020469c:	00f707b3          	add	a5,a4,a5
ffffffe0002046a0:	00078023          	sb	zero,0(a5)
ffffffe0002046a4:	00000797          	auipc	a5,0x0
ffffffe0002046a8:	17478793          	addi	a5,a5,372 # ffffffe000204818 <uapp_end>
ffffffe0002046ac:	0007a603          	lw	a2,0(a5)
ffffffe0002046b0:	f9843703          	ld	a4,-104(s0)
ffffffe0002046b4:	00000697          	auipc	a3,0x0
ffffffe0002046b8:	16c68693          	addi	a3,a3,364 # ffffffe000204820 <uapp_end+0x8>
ffffffe0002046bc:	f9043783          	ld	a5,-112(s0)
ffffffe0002046c0:	04000893          	li	a7,64
ffffffe0002046c4:	00070513          	mv	a0,a4
ffffffe0002046c8:	00068593          	mv	a1,a3
ffffffe0002046cc:	00060613          	mv	a2,a2
ffffffe0002046d0:	00000073          	ecall
ffffffe0002046d4:	00050793          	mv	a5,a0
ffffffe0002046d8:	f8f43823          	sd	a5,-112(s0)
ffffffe0002046dc:	f9043783          	ld	a5,-112(s0)
ffffffe0002046e0:	0007879b          	sext.w	a5,a5
ffffffe0002046e4:	00078513          	mv	a0,a5
ffffffe0002046e8:	0e813083          	ld	ra,232(sp)
ffffffe0002046ec:	0e013403          	ld	s0,224(sp)
ffffffe0002046f0:	0f010113          	addi	sp,sp,240
ffffffe0002046f4:	00008067          	ret
ffffffe0002046f8:	f9010113          	addi	sp,sp,-112
ffffffe0002046fc:	02113423          	sd	ra,40(sp)
ffffffe000204700:	02813023          	sd	s0,32(sp)
ffffffe000204704:	03010413          	addi	s0,sp,48
ffffffe000204708:	fca43c23          	sd	a0,-40(s0)
ffffffe00020470c:	00b43423          	sd	a1,8(s0)
ffffffe000204710:	00c43823          	sd	a2,16(s0)
ffffffe000204714:	00d43c23          	sd	a3,24(s0)
ffffffe000204718:	02e43023          	sd	a4,32(s0)
ffffffe00020471c:	02f43423          	sd	a5,40(s0)
ffffffe000204720:	03043823          	sd	a6,48(s0)
ffffffe000204724:	03143c23          	sd	a7,56(s0)
ffffffe000204728:	fe042623          	sw	zero,-20(s0)
ffffffe00020472c:	04040793          	addi	a5,s0,64
ffffffe000204730:	fcf43823          	sd	a5,-48(s0)
ffffffe000204734:	fd043783          	ld	a5,-48(s0)
ffffffe000204738:	fc878793          	addi	a5,a5,-56
ffffffe00020473c:	fef43023          	sd	a5,-32(s0)
ffffffe000204740:	00000797          	auipc	a5,0x0
ffffffe000204744:	0d878793          	addi	a5,a5,216 # ffffffe000204818 <uapp_end>
ffffffe000204748:	0007a023          	sw	zero,0(a5)
ffffffe00020474c:	fe043783          	ld	a5,-32(s0)
ffffffe000204750:	00078613          	mv	a2,a5
ffffffe000204754:	fd843583          	ld	a1,-40(s0)
ffffffe000204758:	00000517          	auipc	a0,0x0
ffffffe00020475c:	9cc50513          	addi	a0,a0,-1588 # ffffffe000204124 <_edata+0x124>
ffffffe000204760:	a1dff0ef          	jal	ra,ffffffe00020417c <_edata+0x17c>
ffffffe000204764:	00050793          	mv	a5,a0
ffffffe000204768:	fef42623          	sw	a5,-20(s0)
ffffffe00020476c:	fec42783          	lw	a5,-20(s0)
ffffffe000204770:	00078513          	mv	a0,a5
ffffffe000204774:	02813083          	ld	ra,40(sp)
ffffffe000204778:	02013403          	ld	s0,32(sp)
ffffffe00020477c:	07010113          	addi	sp,sp,112
ffffffe000204780:	00008067          	ret
ffffffe000204784:	0000                	unimp
ffffffe000204786:	0000                	unimp
ffffffe000204788:	4449505b          	0x4449505b
ffffffe00020478c:	3d20                	fld	fs0,120(a0)
ffffffe00020478e:	2520                	fld	fs0,72(a0)
ffffffe000204790:	5d64                	lw	s1,124(a0)
ffffffe000204792:	6620                	ld	s0,72(a2)
ffffffe000204794:	206b726f          	jal	tp,ffffffe0002bb99a <_ebss+0xb19fa>
ffffffe000204798:	4449505b          	0x4449505b
ffffffe00020479c:	3d20                	fld	fs0,120(a0)
ffffffe00020479e:	2520                	fld	fs0,72(a0)
ffffffe0002047a0:	5d64                	lw	s1,124(a0)
ffffffe0002047a2:	000a                	c.slli	zero,0x2
ffffffe0002047a4:	0000                	unimp
ffffffe0002047a6:	0000                	unimp
ffffffe0002047a8:	4449505b          	0x4449505b
ffffffe0002047ac:	3d20                	fld	fs0,120(a0)
ffffffe0002047ae:	2520                	fld	fs0,72(a0)
ffffffe0002047b0:	5d64                	lw	s1,124(a0)
ffffffe0002047b2:	6920                	ld	s0,80(a0)
ffffffe0002047b4:	75722073          	csrs	0x757,tp
ffffffe0002047b8:	6e6e                	ld	t3,216(sp)
ffffffe0002047ba:	6e69                	lui	t3,0x1a
ffffffe0002047bc:	000a2167          	0xa2167
ffffffe0002047c0:	fe10                	sd	a2,56(a2)
ffffffe0002047c2:	ffff                	0xffff
ffffffe0002047c4:	fb38                	sd	a4,112(a4)
ffffffe0002047c6:	ffff                	0xffff
ffffffe0002047c8:	fe90                	sd	a2,56(a3)
ffffffe0002047ca:	ffff                	0xffff
ffffffe0002047cc:	fe90                	sd	a2,56(a3)
ffffffe0002047ce:	ffff                	0xffff
ffffffe0002047d0:	fe90                	sd	a2,56(a3)
ffffffe0002047d2:	ffff                	0xffff
ffffffe0002047d4:	fe90                	sd	a2,56(a3)
ffffffe0002047d6:	ffff                	0xffff
ffffffe0002047d8:	fe90                	sd	a2,56(a3)
ffffffe0002047da:	ffff                	0xffff
ffffffe0002047dc:	fe90                	sd	a2,56(a3)
ffffffe0002047de:	ffff                	0xffff
ffffffe0002047e0:	fe90                	sd	a2,56(a3)
ffffffe0002047e2:	ffff                	0xffff
ffffffe0002047e4:	fa38                	sd	a4,112(a2)
ffffffe0002047e6:	ffff                	0xffff
ffffffe0002047e8:	fe90                	sd	a2,56(a3)
ffffffe0002047ea:	ffff                	0xffff
ffffffe0002047ec:	fe90                	sd	a2,56(a3)
ffffffe0002047ee:	ffff                	0xffff
ffffffe0002047f0:	fe90                	sd	a2,56(a3)
ffffffe0002047f2:	ffff                	0xffff
ffffffe0002047f4:	fe90                	sd	a2,56(a3)
ffffffe0002047f6:	ffff                	0xffff
ffffffe0002047f8:	fe90                	sd	a2,56(a3)
ffffffe0002047fa:	ffff                	0xffff
ffffffe0002047fc:	fe90                	sd	a2,56(a3)
ffffffe0002047fe:	ffff                	0xffff
ffffffe000204800:	fdb4                	sd	a3,120(a1)
ffffffe000204802:	ffff                	0xffff
ffffffe000204804:	fe90                	sd	a2,56(a3)
ffffffe000204806:	ffff                	0xffff
ffffffe000204808:	fc8c                	sd	a1,56(s1)
ffffffe00020480a:	ffff                	0xffff
ffffffe00020480c:	fe90                	sd	a2,56(a3)
ffffffe00020480e:	ffff                	0xffff
ffffffe000204810:	fe90                	sd	a2,56(a3)
ffffffe000204812:	ffff                	0xffff
ffffffe000204814:	fa44                	sd	s1,176(a2)
ffffffe000204816:	ffff                	0xffff

ffffffe000204818 <uapp_end>:
	...

Disassembly of section .bss:

ffffffe000205000 <_sbss>:
	...

ffffffe000206000 <kmem>:
	...

ffffffe000206008 <idle>:
	...

ffffffe000206010 <current>:
	...

ffffffe000206018 <tot_task>:
	...

ffffffe000206020 <first_page_fault>:
ffffffe000206020:	0000                	unimp
	...

ffffffe000206024 <initialize>:
ffffffe000206024:	0000                	unimp
	...

ffffffe000206028 <t>:
	...

ffffffe000206030 <task>:
	...

ffffffe000207000 <first_page_table>:
	...

ffffffe000208000 <second_page_table>:
	...

ffffffe000209000 <r>:
	...

Disassembly of section .debug_info:

0000000000000000 <.debug_info>:
       0:	00000123          	sb	zero,2(zero) # 2 <BASE_ADDR-0xffffffe0001ffffe>
       4:	0005                	c.nop	1
       6:	0801                	addi	a6,a6,0
       8:	0000                	unimp
       a:	0000                	unimp
       c:	2505                	addiw	a0,a0,1
       e:	0000                	unimp
      10:	1d00                	addi	s0,sp,688
      12:	0032                	c.slli	zero,0xc
      14:	0000                	unimp
      16:	0000                	unimp
      18:	0000                	unimp
      1a:	000c                	0xc
	...
      28:	0000                	unimp
      2a:	b906                	fsd	ft1,176(sp)
      2c:	0000                	unimp
      2e:	0300                	addi	s0,sp,384
      30:	1704                	addi	s1,sp,928
      32:	0000003b          	addw	zero,zero,zero
      36:	00002a07          	flw	fs4,0(zero) # 0 <BASE_ADDR-0xffffffe000200000>
      3a:	0300                	addi	s0,sp,384
      3c:	00000007          	0x7
      40:	0800                	addi	s0,sp,16
      42:	000000ef          	jal	ra,42 <BASE_ADDR-0xffffffe0001fffbe>
      46:	0210                	addi	a2,sp,256
      48:	0808                	addi	a0,sp,16
      4a:	0065                	c.nop	25
      4c:	0000                	unimp
      4e:	c004                	sw	s1,0(s0)
      50:	0000                	unimp
      52:	0900                	addi	s0,sp,144
      54:	0065                	c.nop	25
      56:	0000                	unimp
      58:	0400                	addi	s0,sp,512
      5a:	000000b3          	add	ra,zero,zero
      5e:	650a                	ld	a0,128(sp)
      60:	0000                	unimp
      62:	0800                	addi	s0,sp,16
      64:	0300                	addi	s0,sp,384
      66:	1205                	addi	tp,tp,-31
      68:	0000                	unimp
      6a:	0900                	addi	s0,sp,144
      6c:	0504                	addi	s1,sp,640
      6e:	6e69                	lui	t3,0x1a
      70:	0074                	addi	a3,sp,12
      72:	d00a                	sw	sp,32(sp)
      74:	0000                	unimp
      76:	0100                	addi	s0,sp,128
      78:	0e08                	addi	a0,sp,784
      7a:	0036                	c.slli	zero,0xd
      7c:	0000                	unimp
      7e:	0309                	addi	t1,t1,2
      80:	3000                	fld	fs0,32(s0)
      82:	0020                	addi	s0,sp,8
      84:	ffe0                	sd	s0,248(a5)
      86:	ffff                	0xffff
      88:	00001b0b          	0x1b0b
      8c:	0200                	addi	s0,sp,256
      8e:	0f0d                	addi	t5,t5,3
      90:	0041                	c.nop	16
      92:	0000                	unimp
      94:	00c1                	addi	ra,ra,16
      96:	0000                	unimp
      98:	6b01                	0x6b01
      9a:	0000                	unimp
      9c:	0100                	addi	s0,sp,128
      9e:	0000006b          	0x6b
      a2:	2a01                	sext.w	s4,s4
      a4:	0000                	unimp
      a6:	0100                	addi	s0,sp,128
      a8:	002a                	c.slli	zero,0xa
      aa:	0000                	unimp
      ac:	2a01                	sext.w	s4,s4
      ae:	0000                	unimp
      b0:	0100                	addi	s0,sp,128
      b2:	002a                	c.slli	zero,0xa
      b4:	0000                	unimp
      b6:	2a01                	sext.w	s4,s4
      b8:	0000                	unimp
      ba:	0100                	addi	s0,sp,128
      bc:	002a                	c.slli	zero,0xa
      be:	0000                	unimp
      c0:	0c00                	addi	s0,sp,528
      c2:	00da                	slli	ra,ra,0x16
      c4:	0000                	unimp
      c6:	1301                	addi	t1,t1,-32
      c8:	a806                	fsd	ft1,16(sp)
      ca:	e0002003          	lw	zero,-512(zero) # fffffffffffffe00 <_ebss+0x1fffdf5e60>
      ce:	ffff                	0xffff
      d0:	64ff                	0x64ff
      d2:	0000                	unimp
      d4:	0000                	unimp
      d6:	0000                	unimp
      d8:	0100                	addi	s0,sp,128
      da:	fa9c                	sd	a5,48(a3)
      dc:	0000                	unimp
      de:	0200                	addi	s0,sp,256
      e0:	6974                	ld	a3,208(a0)
      e2:	006d                	c.nop	27
      e4:	2a15                	addiw	s4,s4,5
      e6:	0000                	unimp
      e8:	0200                	addi	s0,sp,256
      ea:	6891                	lui	a7,0x4
      ec:	6e02                	ld	t3,0(sp)
      ee:	7478                	ld	a4,232(s0)
      f0:	1600                	addi	s0,sp,800
      f2:	002a                	c.slli	zero,0xa
      f4:	0000                	unimp
      f6:	9102                	jalr	sp
      f8:	0060                	addi	s0,sp,12
      fa:	c60d                	beqz	a2,124 <BASE_ADDR-0xffffffe0001ffedc>
      fc:	0000                	unimp
      fe:	0100                	addi	s0,sp,128
     100:	080a                	slli	a6,a6,0x2
     102:	002a                	c.slli	zero,0xa
     104:	0000                	unimp
     106:	0380                	addi	s0,sp,448
     108:	0020                	addi	s0,sp,8
     10a:	ffe0                	sd	s0,248(a5)
     10c:	ffff                	0xffff
     10e:	0028                	addi	a0,sp,8
     110:	0000                	unimp
     112:	0000                	unimp
     114:	0000                	unimp
     116:	9c01                	subw	s0,s0,s0
     118:	7202                	ld	tp,32(sp)
     11a:	7465                	lui	s0,0xffff9
     11c:	0b00                	addi	s0,sp,400
     11e:	002a                	c.slli	zero,0xa
     120:	0000                	unimp
     122:	9102                	jalr	sp
     124:	0068                	addi	a0,sp,12
     126:	2500                	fld	fs0,8(a0)
     128:	0000                	unimp
     12a:	0500                	addi	s0,sp,640
     12c:	0100                	addi	s0,sp,128
     12e:	db08                	sw	a0,48(a4)
     130:	0000                	unimp
     132:	0100                	addi	s0,sp,128
     134:	00b4                	addi	a3,sp,72
     136:	0000                	unimp
     138:	0094                	addi	a3,sp,64
     13a:	0020                	addi	s0,sp,8
     13c:	ffe0                	sd	s0,248(a5)
     13e:	ffff                	0xffff
     140:	05f0                	addi	a2,sp,716
     142:	00f6                	slli	ra,ra,0x1d
     144:	0000                	unimp
     146:	00fe                	slli	ra,ra,0x1f
     148:	0000                	unimp
     14a:	0130                	addi	a2,sp,136
     14c:	0000                	unimp
     14e:	8001                	c.srli64	s0
     150:	0025                	c.nop	9
     152:	0000                	unimp
     154:	0005                	c.nop	1
     156:	0801                	addi	a6,a6,0
     158:	000000ef          	jal	ra,158 <BASE_ADDR-0xffffffe0001ffea8>
     15c:	5401                	li	s0,-32
     15e:	0005                	c.nop	1
     160:	0000                	unimp
     162:	2000                	fld	fs0,0(s0)
     164:	e000                	sd	s0,0(s0)
     166:	ffff                	0xffff
     168:	a8ff                	0xa8ff
     16a:	3c01                	addiw	s8,s8,-32
     16c:	0001                	nop
     16e:	fe00                	sd	s0,56(a2)
     170:	0000                	unimp
     172:	3000                	fld	fs0,32(s0)
     174:	0001                	nop
     176:	0100                	addi	s0,sp,128
     178:	b880                	fsd	fs0,48(s1)
     17a:	0001                	nop
     17c:	0500                	addi	s0,sp,640
     17e:	0100                	addi	s0,sp,128
     180:	0308                	addi	a0,sp,384
     182:	0001                	nop
     184:	0900                	addi	s0,sp,144
     186:	0025                	c.nop	9
     188:	0000                	unimp
     18a:	b21d                	j	fffffffffffffab0 <_ebss+0x1fffdf5b10>
     18c:	0000                	unimp
     18e:	0000                	unimp
     190:	0000                	unimp
     192:	3b00                	fld	fs0,48(a4)
	...
     19c:	0000                	unimp
     19e:	4c00                	lw	s0,24(s0)
     1a0:	0006                	c.slli	zero,0x1
     1a2:	0a00                	addi	s0,sp,272
     1a4:	00b9                	addi	ra,ra,14
     1a6:	0000                	unimp
     1a8:	0405                	addi	s0,s0,1
     1aa:	00003617          	auipc	a2,0x3
     1ae:	0200                	addi	s0,sp,256
     1b0:	0708                	addi	a0,sp,896
     1b2:	0000                	unimp
     1b4:	0000                	unimp
     1b6:	6e75720b          	0x6e75720b
     1ba:	0800                	addi	s0,sp,16
     1bc:	0602                	c.slli64	a2
     1be:	5608                	lw	a0,40(a2)
     1c0:	0000                	unimp
     1c2:	0400                	addi	s0,sp,512
     1c4:	0318                	addi	a4,sp,384
     1c6:	0000                	unimp
     1c8:	0702                	c.slli64	a4
     1ca:	0056                	c.slli	zero,0x15
     1cc:	0000                	unimp
     1ce:	0300                	addi	s0,sp,384
     1d0:	003d                	c.nop	15
     1d2:	0000                	unimp
     1d4:	0802                	c.slli64	a6
     1d6:	1205                	addi	tp,tp,-31
     1d8:	0000                	unimp
     1da:	0c00                	addi	s0,sp,528
     1dc:	0504                	addi	s1,sp,640
     1de:	6e69                	lui	t3,0x1a
     1e0:	0074                	addi	a3,sp,12
     1e2:	740d                	lui	s0,0xfffe3
     1e4:	0000                	unimp
     1e6:	7400                	ld	s0,40(s0)
     1e8:	0000                	unimp
     1ea:	0e00                	addi	s0,sp,784
     1ec:	0200                	addi	s0,sp,256
     1ee:	0801                	addi	a6,a6,0
     1f0:	05e9                	addi	a1,a1,26
     1f2:	0000                	unimp
     1f4:	0000740f          	0x740f
     1f8:	1000                	addi	s0,sp,32
     1fa:	0000014f          	fnmadd.s	ft2,ft0,ft0,ft0,rne
     1fe:	0701                	addi	a4,a4,0
     200:	690d                	lui	s2,0x3
     202:	0000                	unimp
     204:	1100                	addi	s0,sp,160
     206:	0108                	addi	a0,sp,128
     208:	0109                	addi	sp,sp,2
     20a:	00a1                	addi	ra,ra,8
     20c:	0000                	unimp
     20e:	6804                	ld	s1,16(s0)
     210:	0001                	nop
     212:	0100                	addi	s0,sp,128
     214:	560a                	lw	a2,160(sp)
     216:	0000                	unimp
     218:	0000                	unimp
     21a:	4a12                	lw	s4,4(sp)
     21c:	0001                	nop
     21e:	0100                	addi	s0,sp,128
     220:	008c030b          	0x8c030b
     224:	0000                	unimp
     226:	0309                	addi	t1,t1,2
     228:	6000                	ld	s0,0(s0)
     22a:	0020                	addi	s0,sp,8
     22c:	ffe0                	sd	s0,248(a5)
     22e:	ffff                	0xffff
     230:	7f05                	lui	t5,0xfffe1
     232:	0001                	nop
     234:	0300                	addi	s0,sp,384
     236:	6205                	lui	tp,0x1
     238:	0000                	unimp
     23a:	cd00                	sw	s0,24(a0)
     23c:	0000                	unimp
     23e:	0100                	addi	s0,sp,128
     240:	00cd                	addi	ra,ra,19
     242:	0000                	unimp
     244:	7b030013          	addi	zero,t1,1968 # fffffffffffe97b0 <_ebss+0x1fffddf810>
     248:	0000                	unimp
     24a:	0500                	addi	s0,sp,640
     24c:	0186                	slli	gp,gp,0x1
     24e:	0000                	unimp
     250:	0704                	addi	s1,sp,896
     252:	00f1                	addi	ra,ra,28
     254:	0000                	unimp
     256:	00f1                	addi	ra,ra,28
     258:	0000                	unimp
     25a:	f101                	bnez	a0,15a <BASE_ADDR-0xffffffe0001ffea6>
     25c:	0000                	unimp
     25e:	0100                	addi	s0,sp,128
     260:	0074                	addi	a3,sp,12
     262:	0000                	unimp
     264:	2a01                	sext.w	s4,s4
     266:	0000                	unimp
     268:	0000                	unimp
     26a:	0814                	addi	a3,sp,16
     26c:	7715                	lui	a4,0xfffe5
     26e:	0001                	nop
     270:	0100                	addi	s0,sp,128
     272:	062d                	addi	a2,a2,11
     274:	0560                	addi	s0,sp,652
     276:	0020                	addi	s0,sp,8
     278:	ffe0                	sd	s0,248(a5)
     27a:	ffff                	0xffff
     27c:	0044                	addi	s1,sp,4
     27e:	0000                	unimp
     280:	0000                	unimp
     282:	0000                	unimp
     284:	9c01                	subw	s0,s0,s0
     286:	5d06                	lw	s10,96(sp)
     288:	0001                	nop
     28a:	2600                	fld	fs0,8(a2)
     28c:	04e0                	addi	s0,sp,588
     28e:	0020                	addi	s0,sp,8
     290:	ffe0                	sd	s0,248(a5)
     292:	ffff                	0xffff
     294:	0080                	addi	s0,sp,64
     296:	0000                	unimp
     298:	0000                	unimp
     29a:	0000                	unimp
     29c:	9c01                	subw	s0,s0,s0
     29e:	0156                	slli	sp,sp,0x15
     2a0:	0000                	unimp
     2a2:	00023207          	fld	ft4,0(tp) # 1000 <BASE_ADDR-0xffffffe0001ff000>
     2a6:	2600                	fld	fs0,8(a2)
     2a8:	00015617          	auipc	a2,0x15
     2ac:	0200                	addi	s0,sp,256
     2ae:	5891                	li	a7,-28
     2b0:	6516                	ld	a0,320(sp)
     2b2:	646e                	ld	s0,216(sp)
     2b4:	0100                	addi	s0,sp,128
     2b6:	2426                	fld	fs0,72(sp)
     2b8:	0156                	slli	sp,sp,0x15
     2ba:	0000                	unimp
     2bc:	9102                	jalr	sp
     2be:	1750                	addi	a2,sp,932
     2c0:	0158                	addi	a4,sp,132
     2c2:	0000                	unimp
     2c4:	2701                	sext.w	a4,a4
     2c6:	0001560b          	0x1560b
     2ca:	0200                	addi	s0,sp,256
     2cc:	6891                	lui	a7,0x4
     2ce:	0300                	addi	s0,sp,384
     2d0:	0074                	addi	a3,sp,12
     2d2:	0000                	unimp
     2d4:	7106                	ld	sp,96(sp)
     2d6:	0001                	nop
     2d8:	1700                	addi	s0,sp,928
     2da:	0468                	addi	a0,sp,524
     2dc:	0020                	addi	s0,sp,8
     2de:	ffe0                	sd	s0,248(a5)
     2e0:	ffff                	0xffff
     2e2:	0078                	addi	a4,sp,12
     2e4:	0000                	unimp
     2e6:	0000                	unimp
     2e8:	0000                	unimp
     2ea:	9c01                	subw	s0,s0,s0
     2ec:	0191                	addi	gp,gp,4
     2ee:	0000                	unimp
     2f0:	00015807          	0x15807
     2f4:	1700                	addi	s0,sp,928
     2f6:	00002a13          	slti	s4,zero,0
     2fa:	0200                	addi	s0,sp,256
     2fc:	5891                	li	a7,-28
     2fe:	7208                	ld	a0,32(a2)
     300:	1800                	addi	s0,sp,48
     302:	0056                	c.slli	zero,0x15
     304:	0000                	unimp
     306:	9102                	jalr	sp
     308:	0068                	addi	a0,sp,12
     30a:	4318                	lw	a4,0(a4)
     30c:	0001                	nop
     30e:	0100                	addi	s0,sp,128
     310:	080d                	addi	a6,a6,3
     312:	002a                	c.slli	zero,0xa
     314:	0000                	unimp
     316:	040c                	addi	a1,sp,512
     318:	0020                	addi	s0,sp,8
     31a:	ffe0                	sd	s0,248(a5)
     31c:	ffff                	0xffff
     31e:	005c                	addi	a5,sp,4
     320:	0000                	unimp
     322:	0000                	unimp
     324:	0000                	unimp
     326:	9c01                	subw	s0,s0,s0
     328:	7208                	ld	a0,32(a2)
     32a:	0e00                	addi	s0,sp,784
     32c:	0056                	c.slli	zero,0x15
     32e:	0000                	unimp
     330:	9102                	jalr	sp
     332:	0068                	addi	a0,sp,12
     334:	8d00                	0x8d00
     336:	0000                	unimp
     338:	0500                	addi	s0,sp,640
     33a:	0100                	addi	s0,sp,128
     33c:	7508                	ld	a0,40(a0)
     33e:	0002                	c.slli64	zero
     340:	0200                	addi	s0,sp,256
     342:	0025                	c.nop	9
     344:	0000                	unimp
     346:	ce1d                	beqz	a2,384 <BASE_ADDR-0xffffffe0001ffc7c>
     348:	0000                	unimp
     34a:	0000                	unimp
     34c:	0000                	unimp
     34e:	8c00                	0x8c00
	...
     358:	0000                	unimp
     35a:	e400                	sd	s0,8(s0)
     35c:	01000007          	0x1000007
     360:	0508                	addi	a0,sp,640
     362:	0012                	c.slli	zero,0x4
     364:	0000                	unimp
     366:	0801                	addi	a6,a6,0
     368:	00000007          	0x7
     36c:	0300                	addi	s0,sp,384
     36e:	0504                	addi	s1,sp,640
     370:	6e69                	lui	t3,0x1a
     372:	0074                	addi	a3,sp,12
     374:	7f04                	ld	s1,56(a4)
     376:	0001                	nop
     378:	0200                	addi	s0,sp,256
     37a:	0505                	addi	a0,a0,1
     37c:	0038                	addi	a4,sp,8
     37e:	0000                	unimp
     380:	0056                	c.slli	zero,0x15
     382:	0000                	unimp
     384:	5605                	li	a2,-31
     386:	0000                	unimp
     388:	0600                	addi	s0,sp,768
     38a:	0700                	addi	s0,sp,896
     38c:	6308                	ld	a0,0(a4)
     38e:	0000                	unimp
     390:	0100                	addi	s0,sp,128
     392:	0801                	addi	a6,a6,0
     394:	05e9                	addi	a1,a1,26
     396:	0000                	unimp
     398:	5c08                	lw	a0,56(s0)
     39a:	0000                	unimp
     39c:	0900                	addi	s0,sp,144
     39e:	018d                	addi	gp,gp,3
     3a0:	0000                	unimp
     3a2:	0401                	addi	s0,s0,0
     3a4:	a406                	fsd	ft1,8(sp)
     3a6:	2005                	0x2005
     3a8:	e000                	sd	s0,0(s0)
     3aa:	ffff                	0xffff
     3ac:	28ff                	0x28ff
     3ae:	0000                	unimp
     3b0:	0000                	unimp
     3b2:	0000                	unimp
     3b4:	0100                	addi	s0,sp,128
     3b6:	0a9c                	addi	a5,sp,336
     3b8:	04010073          	0x4010073
     3bc:	5618                	lw	a4,40(a2)
     3be:	0000                	unimp
     3c0:	0200                	addi	s0,sp,256
     3c2:	6891                	lui	a7,0x4
     3c4:	0000                	unimp
     3c6:	00000677          	0x677
     3ca:	0005                	c.nop	1
     3cc:	0801                	addi	a6,a6,0
     3ce:	02fc                	addi	a5,sp,332
     3d0:	0000                	unimp
     3d2:	2514                	fld	fa3,8(a0)
     3d4:	0000                	unimp
     3d6:	1d00                	addi	s0,sp,688
     3d8:	00d6                	slli	ra,ra,0x15
     3da:	0000                	unimp
     3dc:	0000                	unimp
     3de:	0000                	unimp
     3e0:	00aa                	slli	ra,ra,0xa
	...
     3ea:	0000                	unimp
     3ec:	0000084b          	fnmsub.s	fa6,ft0,ft0,ft0,rne
     3f0:	b915                	j	24 <BASE_ADDR-0xffffffe0001fffdc>
     3f2:	0000                	unimp
     3f4:	0900                	addi	s0,sp,144
     3f6:	1704                	addi	s1,sp,928
     3f8:	0036                	c.slli	zero,0xd
     3fa:	0000                	unimp
     3fc:	080e                	slli	a6,a6,0x3
     3fe:	00000007          	0x7
     402:	0700                	addi	s0,sp,896
     404:	0238                	addi	a4,sp,264
     406:	0000                	unimp
     408:	0230                	addi	a2,sp,264
     40a:	9806                	add	a6,a6,ra
     40c:	0000                	unimp
     40e:	0100                	addi	s0,sp,128
     410:	0364                	addi	s1,sp,396
     412:	0000                	unimp
     414:	0702                	c.slli64	a4
     416:	0000b217          	auipc	tp,0xb
     41a:	0000                	unimp
     41c:	2f01                	sext.w	t5,t5
     41e:	0002                	c.slli64	zero
     420:	0200                	addi	s0,sp,256
     422:	0c08                	addi	a0,sp,528
     424:	002a                	c.slli	zero,0xa
     426:	0000                	unimp
     428:	0108                	addi	a0,sp,128
     42a:	00000193          	li	gp,0
     42e:	0902                	c.slli64	s2
     430:	2a0c                	fld	fa1,16(a2)
     432:	0000                	unimp
     434:	1000                	addi	s0,sp,32
     436:	1501                	addi	a0,a0,-32
     438:	02000003          	lb	zero,32(zero) # 20 <BASE_ADDR-0xffffffe0001fffe0>
     43c:	00b71c0b          	0xb71c0b
     440:	0000                	unimp
     442:	0118                	addi	a4,sp,128
     444:	000002ef          	jal	t0,444 <BASE_ADDR-0xffffffe0001ffbbc>
     448:	0b02                	c.slli64	s6
     44a:	b726                	fsd	fs1,424(sp)
     44c:	0000                	unimp
     44e:	2000                	fld	fs0,0(s0)
     450:	ff01                	bnez	a4,368 <BASE_ADDR-0xffffffe0001ffc98>
     452:	02000003          	lb	zero,32(zero) # 20 <BASE_ADDR-0xffffffe0001fffe0>
     456:	0c0d                	addi	s8,s8,3
     458:	002a                	c.slli	zero,0xa
     45a:	0000                	unimp
     45c:	0028                	addi	a0,sp,8
     45e:	00022507          	flw	fa0,0(tp) # b416 <BASE_ADDR-0xffffffe0001f4bea>
     462:	0800                	addi	s0,sp,16
     464:	1002                	c.slli	zero,0x20
     466:	00b2                	slli	ra,ra,0xc
     468:	0000                	unimp
     46a:	2001                	0x2001
     46c:	0002                	c.slli64	zero
     46e:	0200                	addi	s0,sp,256
     470:	1c11                	addi	s8,s8,-28
     472:	000000b7          	lui	ra,0x0
     476:	0000                	unimp
     478:	9805                	andi	s0,s0,-31
     47a:	0000                	unimp
     47c:	0500                	addi	s0,sp,640
     47e:	003d                	c.nop	15
     480:	0000                	unimp
     482:	5b16                	lw	s6,100(sp)
     484:	0002                	c.slli64	zero
     486:	1800                	addi	s0,sp,48
     488:	0301                	addi	t1,t1,0
     48a:	0806                	slli	a6,a6,0x1
     48c:	00fa                	slli	ra,ra,0x1e
     48e:	0000                	unimp
     490:	7806                	ld	a6,96(sp)
     492:	0300                	addi	s0,sp,384
     494:	00fa0c07          	0xfa0c07
     498:	0000                	unimp
     49a:	0f00                	addi	s0,sp,912
     49c:	02a6                	slli	t0,t0,0x9
     49e:	0000                	unimp
     4a0:	2a08                	fld	fa0,16(a2)
     4a2:	0000                	unimp
     4a4:	0000                	unimp
     4a6:	0f01                	addi	t5,t5,0
     4a8:	0000035b          	0x35b
     4ac:	2a09                	addiw	s4,s4,2
     4ae:	0000                	unimp
     4b0:	0800                	addi	s0,sp,16
     4b2:	0f01                	addi	t5,t5,0
     4b4:	00000263          	beqz	zero,4b8 <BASE_ADDR-0xffffffe0001ffb48>
     4b8:	2a0a                	fld	fs4,128(sp)
     4ba:	0000                	unimp
     4bc:	1000                	addi	s0,sp,32
     4be:	0001                	nop
     4c0:	2a08                	fld	fa0,16(a2)
     4c2:	0000                	unimp
     4c4:	0a00                	addi	s0,sp,272
     4c6:	0001                	nop
     4c8:	1000                	addi	s0,sp,32
     4ca:	0036                	c.slli	zero,0xd
     4cc:	0000                	unimp
     4ce:	001f 9a07 0002      	0x29a07001f
     4d4:	0800                	addi	s0,sp,16
     4d6:	1204                	addi	s1,sp,288
     4d8:	0124                	addi	s1,sp,136
     4da:	0000                	unimp
     4dc:	8c01                	sub	s0,s0,s0
     4de:	0002                	c.slli64	zero
     4e0:	0400                	addi	s0,sp,512
     4e2:	0c14                	addi	a3,sp,528
     4e4:	002a                	c.slli	zero,0xa
     4e6:	0000                	unimp
     4e8:	0000                	unimp
     4ea:	0002e107          	0x2e107
     4ee:	8800                	0x8800
     4f0:	1704                	addi	s1,sp,928
     4f2:	0000017b          	0x17b
     4f6:	7206                	ld	tp,96(sp)
     4f8:	0061                	c.nop	24
     4fa:	1804                	addi	s1,sp,48
     4fc:	2a0c                	fld	fa1,16(a2)
     4fe:	0000                	unimp
     500:	0000                	unimp
     502:	7306                	ld	t1,96(sp)
     504:	0070                	addi	a2,sp,12
     506:	1904                	addi	s1,sp,176
     508:	2a0c                	fld	fa1,16(a2)
     50a:	0000                	unimp
     50c:	0800                	addi	s0,sp,16
     50e:	7306                	ld	t1,96(sp)
     510:	0400                	addi	s0,sp,512
     512:	0c1a                	slli	s8,s8,0x6
     514:	0000017b          	0x17b
     518:	0110                	addi	a2,sp,128
     51a:	02a6                	slli	t0,t0,0x9
     51c:	0000                	unimp
     51e:	1c04                	addi	s1,sp,560
     520:	2a0c                	fld	fa1,16(a2)
     522:	0000                	unimp
     524:	7000                	ld	s0,32(s0)
     526:	6901                	0x6901
     528:	0002                	c.slli64	zero
     52a:	0400                	addi	s0,sp,512
     52c:	121c                	addi	a5,sp,288
     52e:	002a                	c.slli	zero,0xa
     530:	0000                	unimp
     532:	0178                	addi	a4,sp,140
     534:	0000035b          	0x35b
     538:	1c04                	addi	s1,sp,560
     53a:	00002a1b          	0x2a1b
     53e:	8000                	0x8000
     540:	0800                	addi	s0,sp,16
     542:	002a                	c.slli	zero,0xa
     544:	0000                	unimp
     546:	0000018b          	0x18b
     54a:	3610                	fld	fa2,40(a2)
     54c:	0000                	unimp
     54e:	0b00                	addi	s0,sp,400
     550:	0700                	addi	s0,sp,896
     552:	000002ab          	0x2ab
     556:	04c8                	addi	a0,sp,580
     558:	0c20                	addi	s0,sp,536
     55a:	0002                	c.slli64	zero
     55c:	0100                	addi	s0,sp,128
     55e:	029a                	slli	t0,t0,0x6
     560:	0000                	unimp
     562:	2104                	fld	fs1,0(a0)
     564:	0c19                	addi	s8,s8,6
     566:	0002                	c.slli64	zero
     568:	0000                	unimp
     56a:	ae01                	j	87a <BASE_ADDR-0xffffffe0001ff786>
     56c:	0001                	nop
     56e:	0400                	addi	s0,sp,512
     570:	0c22                	slli	s8,s8,0x8
     572:	002a                	c.slli	zero,0xa
     574:	0000                	unimp
     576:	0108                	addi	a0,sp,128
     578:	0000024b          	fnmsub.s	ft4,ft0,ft0,ft0,rne
     57c:	2304                	fld	fs1,0(a4)
     57e:	2a0c                	fld	fa1,16(a2)
     580:	0000                	unimp
     582:	1000                	addi	s0,sp,32
     584:	dc01                	beqz	s0,49c <BASE_ADDR-0xffffffe0001ffb64>
     586:	0001                	nop
     588:	0400                	addi	s0,sp,512
     58a:	0c24                	addi	s1,sp,536
     58c:	002a                	c.slli	zero,0xa
     58e:	0000                	unimp
     590:	0618                	addi	a4,sp,768
     592:	6974                	ld	a3,208(a0)
     594:	0064                	addi	s1,sp,12
     596:	2504                	fld	fs1,8(a0)
     598:	2a0c                	fld	fa1,16(a2)
     59a:	0000                	unimp
     59c:	2000                	fld	fs0,0(s0)
     59e:	d301                	beqz	a4,49e <BASE_ADDR-0xffffffe0001ffb62>
     5a0:	0002                	c.slli64	zero
     5a2:	0400                	addi	s0,sp,512
     5a4:	01241a27          	0x1241a27
     5a8:	0000                	unimp
     5aa:	0128                	addi	a0,sp,136
     5ac:	030a                	slli	t1,t1,0x2
     5ae:	0000                	unimp
     5b0:	2b04                	fld	fs1,16(a4)
     5b2:	2a0c                	fld	fa1,16(a2)
     5b4:	0000                	unimp
     5b6:	b000                	fsd	fs0,32(s0)
     5b8:	6d06                	ld	s10,64(sp)
     5ba:	006d                	c.nop	27
     5bc:	2d04                	fld	fs1,24(a0)
     5be:	0000b217          	auipc	tp,0xb
     5c2:	b800                	fsd	fs0,48(s0)
     5c4:	e501                	bnez	a0,5cc <BASE_ADDR-0xffffffe0001ffa34>
     5c6:	0001                	nop
     5c8:	0400                	addi	s0,sp,512
     5ca:	0211152f          	0x211152f
     5ce:	0000                	unimp
     5d0:	00c0                	addi	s0,sp,68
     5d2:	0a05                	addi	s4,s4,1
     5d4:	0001                	nop
     5d6:	0500                	addi	s0,sp,640
     5d8:	00bc                	addi	a5,sp,72
     5da:	0000                	unimp
     5dc:	080e                	slli	a6,a6,0x3
     5de:	1205                	addi	tp,tp,-31
     5e0:	0000                	unimp
     5e2:	1700                	addi	s0,sp,928
     5e4:	0504                	addi	s1,sp,640
     5e6:	6e69                	lui	t3,0x1a
     5e8:	0074                	addi	a3,sp,12
     5ea:	f90a                	sd	sp,176(sp)
     5ec:	0001                	nop
     5ee:	0c00                	addi	s0,sp,528
     5f0:	3915                	addiw	s2,s2,-27
     5f2:	0002                	c.slli64	zero
     5f4:	0900                	addi	s0,sp,144
     5f6:	20600803          	lb	a6,518(zero) # 206 <BASE_ADDR-0xffffffe0001ffdfa>
     5fa:	e000                	sd	s0,0(s0)
     5fc:	ffff                	0xffff
     5fe:	05ff                	0x5ff
     600:	0000018b          	0x18b
     604:	530a                	lw	t1,160(sp)
     606:	0002                	c.slli64	zero
     608:	0d00                	addi	s0,sp,656
     60a:	3915                	addiw	s2,s2,-27
     60c:	0002                	c.slli64	zero
     60e:	0900                	addi	s0,sp,144
     610:	20601003          	lh	zero,518(zero) # 206 <BASE_ADDR-0xffffffe0001ffdfa>
     614:	e000                	sd	s0,0(s0)
     616:	ffff                	0xffff
     618:	08ff                	0x8ff
     61a:	0239                	addi	tp,tp,14
     61c:	0000                	unimp
     61e:	00000263          	beqz	zero,622 <BASE_ADDR-0xffffffe0001ff9de>
     622:	3610                	fld	fa2,40(a2)
     624:	0000                	unimp
     626:	0400                	addi	s0,sp,512
     628:	0a00                	addi	s0,sp,272
     62a:	0334                	addi	a3,sp,392
     62c:	0000                	unimp
     62e:	150e                	slli	a0,a0,0x23
     630:	00000253          	fadd.s	ft4,ft0,ft0,rne
     634:	0309                	addi	t1,t1,2
     636:	6030                	ld	a2,64(s0)
     638:	0020                	addi	s0,sp,8
     63a:	ffe0                	sd	s0,248(a5)
     63c:	ffff                	0xffff
     63e:	140a                	slli	s0,s0,0x22
     640:	0002                	c.slli64	zero
     642:	0f00                	addi	s0,sp,912
     644:	2a08                	fld	fa0,16(a2)
     646:	0000                	unimp
     648:	0900                	addi	s0,sp,144
     64a:	20601803          	lh	a6,518(zero) # 206 <BASE_ADDR-0xffffffe0001ffdfa>
     64e:	e000                	sd	s0,0(s0)
     650:	ffff                	0xffff
     652:	08ff                	0x8ff
     654:	0298                	addi	a4,sp,320
     656:	0000                	unimp
     658:	0298                	addi	a4,sp,320
     65a:	0000                	unimp
     65c:	0018                	0x18
     65e:	010e                	slli	sp,sp,0x3
     660:	e908                	sd	a0,16(a0)
     662:	0005                	c.nop	1
     664:	1900                	addi	s0,sp,176
     666:	0298                	addi	a4,sp,320
     668:	0000                	unimp
     66a:	f811                	bnez	s0,57e <BASE_ADDR-0xffffffe0001ffa82>
     66c:	0002                	c.slli64	zero
     66e:	1100                	addi	s0,sp,160
     670:	8d0d                	sub	a0,a0,a1
     672:	0002                	c.slli64	zero
     674:	1100                	addi	s0,sp,160
     676:	02ca                	slli	t0,t0,0x12
     678:	0000                	unimp
     67a:	1b11                	addi	s6,s6,-28
     67c:	028d                	addi	t0,t0,3
     67e:	0000                	unimp
     680:	2a08                	fld	fa0,16(a2)
     682:	0000                	unimp
     684:	cb00                	sw	s0,16(a4)
     686:	0002                	c.slli64	zero
     688:	1a00                	addi	s0,sp,304
     68a:	0036                	c.slli	zero,0xd
     68c:	0000                	unimp
     68e:	01ff                	0x1ff
     690:	1100                	addi	s0,sp,160
     692:	00000303          	lb	t1,0(zero) # 0 <BASE_ADDR-0xffffffe000200000>
     696:	0f12                	slli	t5,t5,0x4
     698:	02ba                	slli	t0,t0,0xe
     69a:	0000                	unimp
     69c:	00034f1b          	0x34f1b
     6a0:	0100                	addi	s0,sp,128
     6a2:	0d0a                	slli	s10,s10,0x2
     6a4:	02ed                	addi	t0,t0,27
     6a6:	0000                	unimp
     6a8:	3902                	fld	fs2,32(sp)
     6aa:	0002                	c.slli64	zero
     6ac:	0200                	addi	s0,sp,256
     6ae:	0239                	addi	tp,tp,14
     6b0:	0000                	unimp
     6b2:	0900                	addi	s0,sp,144
     6b4:	017f                	0x17f
     6b6:	0000                	unimp
     6b8:	0505                	addi	a0,a0,1
     6ba:	1d05                	addi	s10,s10,-31
     6bc:	0002                	c.slli64	zero
     6be:	0400                	addi	s0,sp,512
     6c0:	02000003          	lb	zero,32(zero) # 20 <BASE_ADDR-0xffffffe0001fffe0>
     6c4:	0304                	addi	s1,sp,384
     6c6:	0000                	unimp
     6c8:	0012                	c.slli	zero,0x4
     6ca:	9f05                	subw	a4,a4,s1
     6cc:	0002                	c.slli64	zero
     6ce:	0900                	addi	s0,sp,144
     6d0:	021d                	addi	tp,tp,7
     6d2:	0000                	unimp
     6d4:	2502                	fld	fa0,0(sp)
     6d6:	2a08                	fld	fa0,16(a2)
     6d8:	0000                	unimp
     6da:	2e00                	fld	fs0,24(a2)
     6dc:	02000003          	lb	zero,32(zero) # 20 <BASE_ADDR-0xffffffe0001fffe0>
     6e0:	00b2                	slli	ra,ra,0xc
     6e2:	0000                	unimp
     6e4:	2a02                	fld	fs4,0(sp)
     6e6:	0000                	unimp
     6e8:	0200                	addi	s0,sp,256
     6ea:	002a                	c.slli	zero,0xa
     6ec:	0000                	unimp
     6ee:	1d02                	slli	s10,s10,0x20
     6f0:	0002                	c.slli64	zero
     6f2:	0000                	unimp
     6f4:	9a09                	andi	a2,a2,-30
     6f6:	0001                	nop
     6f8:	0200                	addi	s0,sp,256
     6fa:	0829                	addi	a6,a6,10
     6fc:	002a                	c.slli	zero,0xa
     6fe:	0000                	unimp
     700:	0344                	addi	s1,sp,388
     702:	0000                	unimp
     704:	2a02                	fld	fs4,0(sp)
     706:	0000                	unimp
     708:	0000                	unimp
     70a:	cb1c                	sw	a5,16(a4)
     70c:	0001                	nop
     70e:	0100                	addi	s0,sp,128
     710:	0d09                	addi	s10,s10,2
     712:	0352                	slli	t1,t1,0x14
     714:	0000                	unimp
     716:	0012                	c.slli	zero,0x4
     718:	4409                	li	s0,2
     71a:	06000003          	lb	zero,96(zero) # 60 <BASE_ADDR-0xffffffe0001fffa0>
     71e:	0809                	addi	a6,a6,2
     720:	002a                	c.slli	zero,0xa
     722:	0000                	unimp
     724:	036d                	addi	t1,t1,27
     726:	0000                	unimp
     728:	2a02                	fld	fs4,0(sp)
     72a:	0000                	unimp
     72c:	0200                	addi	s0,sp,256
     72e:	002a                	c.slli	zero,0xa
     730:	0000                	unimp
     732:	0900                	addi	s0,sp,144
     734:	02da                	slli	t0,t0,0x16
     736:	0000                	unimp
     738:	8d070707          	0x8d070707
     73c:	8d000003          	lb	zero,-1840(zero) # fffffffffffff8d0 <_ebss+0x1fffdf5930>
     740:	02000003          	lb	zero,32(zero) # 20 <BASE_ADDR-0xffffffe0001fffe0>
     744:	038d                	addi	t2,t2,3
     746:	0000                	unimp
     748:	8f02                	jr	t5
     74a:	02000003          	lb	zero,32(zero) # 20 <BASE_ADDR-0xffffffe0001fffe0>
     74e:	002a                	c.slli	zero,0xa
     750:	0000                	unimp
     752:	1d00                	addi	s0,sp,688
     754:	0508                	addi	a0,sp,640
     756:	0394                	addi	a3,sp,448
     758:	0000                	unimp
     75a:	1f1e                	slli	t5,t5,0x27
     75c:	00000143          	fmadd.s	ft2,ft0,ft0,ft0,rne
     760:	0e08                	addi	a0,sp,784
     762:	2a08                	fld	fa0,16(a2)
     764:	0000                	unimp
     766:	a700                	fsd	fs0,8(a4)
     768:	12000003          	lb	zero,288(zero) # 120 <BASE_ADDR-0xffffffe0001ffee0>
     76c:	0b00                	addi	s0,sp,400
     76e:	0000020b          	0x20b
     772:	28ad                	addiw	a7,a7,11
     774:	200e                	fld	ft0,192(sp)
     776:	e000                	sd	s0,0(s0)
     778:	ffff                	0xffff
     77a:	4cff                	0x4cff
     77c:	0000                	unimp
     77e:	0000                	unimp
     780:	0000                	unimp
     782:	0100                	addi	s0,sp,128
     784:	d29c                	sw	a5,32(a3)
     786:	04000003          	lb	zero,64(zero) # 40 <BASE_ADDR-0xffffffe0001fffc0>
     78a:	0326                	slli	t1,t1,0x9
     78c:	0000                	unimp
     78e:	0cae                	slli	s9,s9,0xb
     790:	002a                	c.slli	zero,0xa
     792:	0000                	unimp
     794:	9102                	jalr	sp
     796:	0068                	addi	a0,sp,12
     798:	d30c                	sw	a1,32(a4)
     79a:	0001                	nop
     79c:	8f00                	0x8f00
     79e:	2a08                	fld	fa0,16(a2)
     7a0:	0000                	unimp
     7a2:	8800                	0x8800
     7a4:	200c                	fld	fa1,0(s0)
     7a6:	e000                	sd	s0,0(s0)
     7a8:	ffff                	0xffff
     7aa:	a0ff                	0xa0ff
     7ac:	0001                	nop
     7ae:	0000                	unimp
     7b0:	0000                	unimp
     7b2:	0100                	addi	s0,sp,128
     7b4:	4f9c                	lw	a5,24(a5)
     7b6:	0004                	0x4
     7b8:	0400                	addi	s0,sp,512
     7ba:	0281                	addi	t0,t0,0
     7bc:	0000                	unimp
     7be:	0c90                	addi	a2,sp,592
     7c0:	002a                	c.slli	zero,0xa
     7c2:	0000                	unimp
     7c4:	9102                	jalr	sp
     7c6:	0368                	addi	a0,sp,396
     7c8:	6469                	lui	s0,0x1a
     7ca:	9000                	0x9000
     7cc:	2a1c                	fld	fa5,16(a2)
     7ce:	0000                	unimp
     7d0:	0200                	addi	s0,sp,256
     7d2:	6091                	lui	ra,0x4
     7d4:	200ca013          	slti	zero,s9,512
     7d8:	e000                	sd	s0,0(s0)
     7da:	ffff                	0xffff
     7dc:	90ff                	0x90ff
     7de:	0000                	unimp
     7e0:	0000                	unimp
     7e2:	0000                	unimp
     7e4:	3000                	fld	fs0,32(s0)
     7e6:	0004                	0x4
     7e8:	0300                	addi	s0,sp,384
     7ea:	0069                	c.nop	26
     7ec:	0e91                	addi	t4,t4,4
     7ee:	021d                	addi	tp,tp,7
     7f0:	0000                	unimp
     7f2:	9102                	jalr	sp
     7f4:	005c                	addi	a5,sp,4
     7f6:	400d                	c.li	zero,3
     7f8:	200d                	0x200d
     7fa:	e000                	sd	s0,0(s0)
     7fc:	ffff                	0xffff
     7fe:	ccff                	0xccff
     800:	0000                	unimp
     802:	0000                	unimp
     804:	0000                	unimp
     806:	0300                	addi	s0,sp,384
     808:	0069                	c.nop	26
     80a:	0e9c                	addi	a5,sp,848
     80c:	021d                	addi	tp,tp,7
     80e:	0000                	unimp
     810:	9102                	jalr	sp
     812:	0058                	addi	a4,sp,4
     814:	0c00                	addi	s0,sp,528
     816:	01fe                	slli	gp,gp,0x1f
     818:	0000                	unimp
     81a:	087a                	slli	a6,a6,0x1e
     81c:	002a                	c.slli	zero,0xa
     81e:	0000                	unimp
     820:	0ac4                	addi	s1,sp,340
     822:	0020                	addi	s0,sp,8
     824:	ffe0                	sd	s0,248(a5)
     826:	ffff                	0xffff
     828:	01c4                	addi	s1,sp,196
     82a:	0000                	unimp
     82c:	0000                	unimp
     82e:	0000                	unimp
     830:	9c01                	subw	s0,s0,s0
     832:	04cc                	addi	a1,sp,580
     834:	0000                	unimp
     836:	a304                	fsd	fs1,0(a4)
     838:	0001                	nop
     83a:	7b00                	ld	s0,48(a4)
     83c:	2a0c                	fld	fa1,16(a2)
     83e:	0000                	unimp
     840:	0200                	addi	s0,sp,256
     842:	5891                	li	a7,-28
     844:	00646903          	lwu	s2,6(s0) # 1a006 <BASE_ADDR-0xffffffe0001e5ffa>
     848:	002a1c7b          	0x2a1c7b
     84c:	0000                	unimp
     84e:	9102                	jalr	sp
     850:	1350                	addi	a2,sp,420
     852:	0ae0                	addi	s0,sp,348
     854:	0020                	addi	s0,sp,8
     856:	ffe0                	sd	s0,248(a5)
     858:	ffff                	0xffff
     85a:	00b8                	addi	a4,sp,72
     85c:	0000                	unimp
     85e:	0000                	unimp
     860:	0000                	unimp
     862:	04ad                	addi	s1,s1,11
     864:	0000                	unimp
     866:	7c006903          	lwu	s2,1984(zero) # 7c0 <BASE_ADDR-0xffffffe0001ff840>
     86a:	1d0e                	slli	s10,s10,0x23
     86c:	0002                	c.slli64	zero
     86e:	0200                	addi	s0,sp,256
     870:	4c91                	li	s9,4
     872:	0d00                	addi	s0,sp,656
     874:	0ba8                	addi	a0,sp,472
     876:	0020                	addi	s0,sp,8
     878:	ffe0                	sd	s0,248(a5)
     87a:	ffff                	0xffff
     87c:	00c0                	addi	s0,sp,68
     87e:	0000                	unimp
     880:	0000                	unimp
     882:	0000                	unimp
     884:	88006903          	lwu	s2,-1920(zero) # fffffffffffff880 <_ebss+0x1fffdf58e0>
     888:	1d0e                	slli	s10,s10,0x23
     88a:	0002                	c.slli64	zero
     88c:	0200                	addi	s0,sp,256
     88e:	4891                	li	a7,4
     890:	0000                	unimp
     892:	1d20                	addi	s0,sp,696
     894:	01000003          	lb	zero,16(zero) # 10 <BASE_ADDR-0xffffffe0001ffff0>
     898:	0671                	addi	a2,a2,28
     89a:	0a60                	addi	s0,sp,284
     89c:	0020                	addi	s0,sp,8
     89e:	ffe0                	sd	s0,248(a5)
     8a0:	ffff                	0xffff
     8a2:	0064                	addi	s1,sp,12
     8a4:	0000                	unimp
     8a6:	0000                	unimp
     8a8:	0000                	unimp
     8aa:	9c01                	subw	s0,s0,s0
     8ac:	5121                	li	sp,-24
     8ae:	01000003          	lb	zero,16(zero) # 10 <BASE_ADDR-0xffffffe0001ffff0>
     8b2:	0668                	addi	a0,sp,780
     8b4:	09cc                	addi	a1,sp,212
     8b6:	0020                	addi	s0,sp,8
     8b8:	ffe0                	sd	s0,248(a5)
     8ba:	ffff                	0xffff
     8bc:	0094                	addi	a3,sp,64
     8be:	0000                	unimp
     8c0:	0000                	unimp
     8c2:	0000                	unimp
     8c4:	9c01                	subw	s0,s0,s0
     8c6:	0534                	addi	a3,sp,648
     8c8:	0000                	unimp
     8ca:	1822                	slli	a6,a6,0x28
     8cc:	01000003          	lb	zero,16(zero) # 10 <BASE_ADDR-0xffffffe0001ffff0>
     8d0:	2468                	fld	fa0,200(s0)
     8d2:	0239                	addi	tp,tp,14
     8d4:	0000                	unimp
     8d6:	9102                	jalr	sp
     8d8:	0d58                	addi	a4,sp,660
     8da:	09f4                	addi	a3,sp,220
     8dc:	0020                	addi	s0,sp,8
     8de:	ffe0                	sd	s0,248(a5)
     8e0:	ffff                	0xffff
     8e2:	0058                	addi	a4,sp,4
     8e4:	0000                	unimp
     8e6:	0000                	unimp
     8e8:	0000                	unimp
     8ea:	f204                	sd	s1,32(a2)
     8ec:	0002                	c.slli64	zero
     8ee:	6a00                	ld	s0,16(a2)
     8f0:	391d                	addiw	s2,s2,-25
     8f2:	0002                	c.slli64	zero
     8f4:	0200                	addi	s0,sp,256
     8f6:	6891                	lui	a7,0x4
     8f8:	0000                	unimp
     8fa:	0001cd0b          	0x1cd0b
     8fe:	5b00                	lw	s0,48(a4)
     900:	0930                	addi	a2,sp,152
     902:	0020                	addi	s0,sp,8
     904:	ffe0                	sd	s0,248(a5)
     906:	ffff                	0xffff
     908:	009c                	addi	a5,sp,64
     90a:	0000                	unimp
     90c:	0000                	unimp
     90e:	0000                	unimp
     910:	9c01                	subw	s0,s0,s0
     912:	0000057b          	0x57b
     916:	444f4d03          	lbu	s10,1092(t5) # fffffffffffe1444 <_ebss+0x1fffdd74a4>
     91a:	5c00                	lw	s0,56(s0)
     91c:	2a0c                	fld	fa1,16(a2)
     91e:	0000                	unimp
     920:	0200                	addi	s0,sp,256
     922:	5891                	li	a7,-28
     924:	7b04                	ld	s1,48(a4)
     926:	0002                	c.slli64	zero
     928:	5d00                	lw	s0,56(a0)
     92a:	2a0c                	fld	fa1,16(a2)
     92c:	0000                	unimp
     92e:	0200                	addi	s0,sp,256
     930:	6891                	lui	a7,0x4
     932:	4704                	lw	s1,8(a4)
     934:	0002                	c.slli64	zero
     936:	5e00                	lw	s0,56(a2)
     938:	2a0c                	fld	fa1,16(a2)
     93a:	0000                	unimp
     93c:	0200                	addi	s0,sp,256
     93e:	6091                	lui	ra,0x4
     940:	0b00                	addi	s0,sp,400
     942:	000001ef          	jal	gp,942 <BASE_ADDR-0xffffffe0001ff6be>
     946:	344a                	fld	fs0,176(sp)
     948:	2008                	fld	fa0,0(s0)
     94a:	e000                	sd	s0,0(s0)
     94c:	ffff                	0xffff
     94e:	fcff                	0xfcff
     950:	0000                	unimp
     952:	0000                	unimp
     954:	0000                	unimp
     956:	0100                	addi	s0,sp,128
     958:	b69c                	fsd	fa5,40(a3)
     95a:	0005                	c.nop	1
     95c:	0d00                	addi	s0,sp,656
     95e:	08cc                	addi	a1,sp,84
     960:	0020                	addi	s0,sp,8
     962:	ffe0                	sd	s0,248(a5)
     964:	ffff                	0xffff
     966:	0040                	addi	s0,sp,4
     968:	0000                	unimp
     96a:	0000                	unimp
     96c:	0000                	unimp
     96e:	52006903          	lwu	s2,1312(zero) # 520 <BASE_ADDR-0xffffffe0001ffae0>
     972:	1d0e                	slli	s10,s10,0x23
     974:	0002                	c.slli64	zero
     976:	0200                	addi	s0,sp,256
     978:	6c91                	lui	s9,0x4
     97a:	0000                	unimp
     97c:	0002b70b          	0x2b70b
     980:	3400                	fld	fs0,40(s0)
     982:	0710                	addi	a2,sp,896
     984:	0020                	addi	s0,sp,8
     986:	ffe0                	sd	s0,248(a5)
     988:	ffff                	0xffff
     98a:	0124                	addi	s1,sp,136
     98c:	0000                	unimp
     98e:	0000                	unimp
     990:	0000                	unimp
     992:	9c01                	subw	s0,s0,s0
     994:	0609                	addi	a2,a2,2
     996:	0000                	unimp
     998:	35007403          	0x35007403
     99c:	3919                	addiw	s2,s2,-26
     99e:	0002                	c.slli64	zero
     9a0:	0200                	addi	s0,sp,256
     9a2:	6891                	lui	a7,0x4
     9a4:	f704                	sd	s1,40(a4)
     9a6:	0002                	c.slli64	zero
     9a8:	4000                	lw	s0,0(s0)
     9aa:	2a0c                	fld	fa1,16(a2)
     9ac:	0000                	unimp
     9ae:	0200                	addi	s0,sp,256
     9b0:	6091                	lui	ra,0x4
     9b2:	c904                	sw	s1,16(a0)
     9b4:	0002                	c.slli64	zero
     9b6:	4100                	lw	s0,0(a0)
     9b8:	2a0c                	fld	fa1,16(a2)
     9ba:	0000                	unimp
     9bc:	0200                	addi	s0,sp,256
     9be:	5891                	li	a7,-28
     9c0:	7104                	ld	s1,32(a0)
     9c2:	0002                	c.slli64	zero
     9c4:	4200                	lw	s0,0(a2)
     9c6:	2a0c                	fld	fa1,16(a2)
     9c8:	0000                	unimp
     9ca:	0200                	addi	s0,sp,256
     9cc:	5091                	li	ra,-28
     9ce:	0c00                	addi	s0,sp,528
     9d0:	032d                	addi	t1,t1,11
     9d2:	0000                	unimp
     9d4:	1521                	addi	a0,a0,-24
     9d6:	0239                	addi	tp,tp,14
     9d8:	0000                	unimp
     9da:	0614                	addi	a3,sp,768
     9dc:	0020                	addi	s0,sp,8
     9de:	ffe0                	sd	s0,248(a5)
     9e0:	ffff                	0xffff
     9e2:	00fc                	addi	a5,sp,76
     9e4:	0000                	unimp
     9e6:	0000                	unimp
     9e8:	0000                	unimp
     9ea:	9c01                	subw	s0,s0,s0
     9ec:	0645                	addi	a2,a2,17
     9ee:	0000                	unimp
     9f0:	64697403          	0x64697403
     9f4:	2200                	fld	fs0,0(a2)
     9f6:	2a0c                	fld	fa1,16(a2)
     9f8:	0000                	unimp
     9fa:	0200                	addi	s0,sp,256
     9fc:	6891                	lui	a7,0x4
     9fe:	23007403          	0x23007403
     a02:	3919                	addiw	s2,s2,-26
     a04:	0002                	c.slli64	zero
     a06:	0200                	addi	s0,sp,256
     a08:	6091                	lui	ra,0x4
     a0a:	0c00                	addi	s0,sp,528
     a0c:	01b4                	addi	a3,sp,200
     a0e:	0000                	unimp
     a10:	0914                	addi	a3,sp,144
     a12:	0675                	addi	a2,a2,29
     a14:	0000                	unimp
     a16:	05cc                	addi	a1,sp,708
     a18:	0020                	addi	s0,sp,8
     a1a:	ffe0                	sd	s0,248(a5)
     a1c:	ffff                	0xffff
     a1e:	0048                	addi	a0,sp,4
     a20:	0000                	unimp
     a22:	0000                	unimp
     a24:	0000                	unimp
     a26:	9c01                	subw	s0,s0,s0
     a28:	0675                	addi	a2,a2,29
     a2a:	0000                	unimp
     a2c:	3904                	fld	fs1,48(a0)
     a2e:	15000003          	lb	zero,336(zero) # 150 <BASE_ADDR-0xffffffe0001ffeb0>
     a32:	750d                	lui	a0,0xfffe3
     a34:	0006                	c.slli	zero,0x1
     a36:	0200                	addi	s0,sp,256
     a38:	6891                	lui	a7,0x4
     a3a:	0500                	addi	s0,sp,640
     a3c:	002a                	c.slli	zero,0xa
     a3e:	0000                	unimp
     a40:	0f00                	addi	s0,sp,912
     a42:	0001                	nop
     a44:	0500                	addi	s0,sp,640
     a46:	0100                	addi	s0,sp,128
     a48:	0408                	addi	a0,sp,512
     a4a:	0005                	c.nop	1
     a4c:	0500                	addi	s0,sp,640
     a4e:	0025                	c.nop	9
     a50:	0000                	unimp
     a52:	f71d                	bnez	a4,980 <BASE_ADDR-0xffffffe0001ff680>
     a54:	0000                	unimp
     a56:	0000                	unimp
     a58:	0000                	unimp
     a5a:	6100                	ld	s0,0(a0)
     a5c:	0001                	nop
	...
     a66:	4e00                	lw	s0,24(a2)
     a68:	0600000f          	fence	or,unknown
     a6c:	00b9                	addi	ra,ra,14
     a6e:	0000                	unimp
     a70:	36170403          	lb	s0,865(a4) # fffffffffffe5361 <_ebss+0x1fffddb3c1>
     a74:	0000                	unimp
     a76:	0200                	addi	s0,sp,256
     a78:	00000007          	0x7
     a7c:	0700                	addi	s0,sp,896
     a7e:	000000ef          	jal	ra,a7e <BASE_ADDR-0xffffffe0001ff582>
     a82:	0210                	addi	a2,sp,256
     a84:	0808                	addi	a0,sp,16
     a86:	0060                	addi	s0,sp,12
     a88:	0000                	unimp
     a8a:	0000c003          	lbu	zero,0(ra) # 4000 <BASE_ADDR-0xffffffe0001fc000>
     a8e:	0900                	addi	s0,sp,144
     a90:	0060                	addi	s0,sp,12
     a92:	0000                	unimp
     a94:	0300                	addi	s0,sp,384
     a96:	000000b3          	add	ra,zero,zero
     a9a:	600a                	0x600a
     a9c:	0000                	unimp
     a9e:	0800                	addi	s0,sp,16
     aa0:	0200                	addi	s0,sp,256
     aa2:	1205                	addi	tp,tp,-31
     aa4:	0000                	unimp
     aa6:	0800                	addi	s0,sp,16
     aa8:	0000001b          	sext.w	zero,zero
     aac:	0501                	addi	a0,a0,0
     aae:	00003c0f          	0x3c0f
     ab2:	7400                	ld	s0,40(s0)
     ab4:	200e                	fld	ft0,192(sp)
     ab6:	e000                	sd	s0,0(s0)
     ab8:	ffff                	0xffff
     aba:	9cff                	0x9cff
     abc:	0000                	unimp
     abe:	0000                	unimp
     ac0:	0000                	unimp
     ac2:	0100                	addi	s0,sp,128
     ac4:	0b9c                	addi	a5,sp,464
     ac6:	0001                	nop
     ac8:	0400                	addi	s0,sp,512
     aca:	7865                	lui	a6,0xffff9
     acc:	0074                	addi	a3,sp,12
     ace:	0b1d                	addi	s6,s6,7
     ad0:	0001                	nop
     ad2:	0200                	addi	s0,sp,256
     ad4:	4c91                	li	s9,4
     ad6:	6604                	ld	s1,8(a2)
     ad8:	6469                	lui	s0,0x1a
     ada:	2600                	fld	fs0,8(a2)
     adc:	0000010b          	0x10b
     ae0:	9102                	jalr	sp
     ae2:	0148                	addi	a0,sp,132
     ae4:	0000036f          	jal	t1,ae4 <BASE_ADDR-0xffffffe0001ff51c>
     ae8:	3205                	addiw	tp,tp,-31
     aea:	002a                	c.slli	zero,0xa
     aec:	0000                	unimp
     aee:	9102                	jalr	sp
     af0:	0140                	addi	s0,sp,132
     af2:	036a                	slli	t1,t1,0x1a
     af4:	0000                	unimp
     af6:	1706                	slli	a4,a4,0x21
     af8:	002a                	c.slli	zero,0xa
     afa:	0000                	unimp
     afc:	7fb89103          	lh	sp,2043(a7) # 47fb <BASE_ADDR-0xffffffe0001fb805>
     b00:	7401                	lui	s0,0xfffe0
     b02:	06000003          	lb	zero,96(zero) # 60 <BASE_ADDR-0xffffffe0001fffa0>
     b06:	2a24                	fld	fs1,80(a2)
     b08:	0000                	unimp
     b0a:	0300                	addi	s0,sp,384
     b0c:	b091                	j	350 <BASE_ADDR-0xffffffe0001ffcb0>
     b0e:	017f                	0x17f
     b10:	0379                	addi	t1,t1,30
     b12:	0000                	unimp
     b14:	002a1707          	0x2a1707
     b18:	0000                	unimp
     b1a:	7fa89103          	lh	sp,2042(a7)
     b1e:	7e01                	lui	t3,0xfffe0
     b20:	07000003          	lb	zero,112(zero) # 70 <BASE_ADDR-0xffffffe0001fff90>
     b24:	2a24                	fld	fs1,80(a2)
     b26:	0000                	unimp
     b28:	0300                	addi	s0,sp,384
     b2a:	a091                	j	b6e <BASE_ADDR-0xffffffe0001ff492>
     b2c:	017f                	0x17f
     b2e:	00000383          	lb	t2,0(zero) # 0 <BASE_ADDR-0xffffffe000200000>
     b32:	1708                	addi	a0,sp,928
     b34:	002a                	c.slli	zero,0xa
     b36:	0000                	unimp
     b38:	7f989103          	lh	sp,2041(a7)
     b3c:	7209                	lui	tp,0xfffe2
     b3e:	7465                	lui	s0,0xffff9
     b40:	0100                	addi	s0,sp,128
     b42:	130a                	slli	t1,t1,0x22
     b44:	003c                	addi	a5,sp,8
     b46:	0000                	unimp
     b48:	9102                	jalr	sp
     b4a:	0050                	addi	a2,sp,4
     b4c:	040a                	slli	s0,s0,0x2
     b4e:	6905                	lui	s2,0x1
     b50:	746e                	ld	s0,248(sp)
     b52:	0000                	unimp
     b54:	048a                	slli	s1,s1,0x2
     b56:	0000                	unimp
     b58:	0005                	c.nop	1
     b5a:	0801                	addi	a6,a6,0
     b5c:	05b5                	addi	a1,a1,13
     b5e:	0000                	unimp
     b60:	00002513          	slti	a0,zero,0
     b64:	1d00                	addi	s0,sp,688
     b66:	00fd                	addi	ra,ra,31
     b68:	0000                	unimp
     b6a:	0000                	unimp
     b6c:	0000                	unimp
     b6e:	017f                	0x17f
	...
     b78:	0000                	unimp
     b7a:	0fc2                	slli	t6,t6,0x10
     b7c:	0000                	unimp
     b7e:	b914                	fsd	fa3,48(a0)
     b80:	0000                	unimp
     b82:	0800                	addi	s0,sp,16
     b84:	1704                	addi	s1,sp,928
     b86:	0036                	c.slli	zero,0xd
     b88:	0000                	unimp
     b8a:	0809                	addi	a6,a6,2
     b8c:	00000007          	0x7
     b90:	1500                	addi	s0,sp,672
     b92:	0000025b          	0x25b
     b96:	0118                	addi	a4,sp,128
     b98:	0602                	c.slli64	a2
     b9a:	7b08                	ld	a0,48(a4)
     b9c:	0000                	unimp
     b9e:	0400                	addi	s0,sp,512
     ba0:	0078                	addi	a4,sp,12
     ba2:	0702                	c.slli64	a4
     ba4:	7b0c                	ld	a1,48(a4)
     ba6:	0000                	unimp
     ba8:	0000                	unimp
     baa:	a60a                	fsd	ft2,264(sp)
     bac:	0002                	c.slli64	zero
     bae:	0800                	addi	s0,sp,16
     bb0:	002a                	c.slli	zero,0xa
     bb2:	0000                	unimp
     bb4:	0100                	addi	s0,sp,128
     bb6:	5b0a                	lw	s6,160(sp)
     bb8:	09000003          	lb	zero,144(zero) # 90 <BASE_ADDR-0xffffffe0001fff70>
     bbc:	002a                	c.slli	zero,0xa
     bbe:	0000                	unimp
     bc0:	0108                	addi	a0,sp,128
     bc2:	630a                	ld	t1,128(sp)
     bc4:	0002                	c.slli64	zero
     bc6:	0a00                	addi	s0,sp,272
     bc8:	002a                	c.slli	zero,0xa
     bca:	0000                	unimp
     bcc:	0110                	addi	a2,sp,128
     bce:	0d00                	addi	s0,sp,656
     bd0:	002a                	c.slli	zero,0xa
     bd2:	0000                	unimp
     bd4:	0000008b          	0x8b
     bd8:	360e                	fld	fa2,224(sp)
     bda:	0000                	unimp
     bdc:	1f00                	addi	s0,sp,944
     bde:	0600                	addi	s0,sp,768
     be0:	0238                	addi	a4,sp,264
     be2:	0000                	unimp
     be4:	0330                	addi	a2,sp,392
     be6:	e606                	sd	ra,264(sp)
     be8:	0000                	unimp
     bea:	0100                	addi	s0,sp,128
     bec:	0364                	addi	s1,sp,396
     bee:	0000                	unimp
     bf0:	00170703          	lb	a4,1(a4)
     bf4:	0001                	nop
     bf6:	0000                	unimp
     bf8:	2f01                	sext.w	t5,t5
     bfa:	0002                	c.slli64	zero
     bfc:	0300                	addi	s0,sp,384
     bfe:	0c08                	addi	a0,sp,528
     c00:	002a                	c.slli	zero,0xa
     c02:	0000                	unimp
     c04:	0108                	addi	a0,sp,128
     c06:	00000193          	li	gp,0
     c0a:	2a0c0903          	lb	s2,672(s8) # 92a0 <BASE_ADDR-0xffffffe0001f6d60>
     c0e:	0000                	unimp
     c10:	1000                	addi	s0,sp,32
     c12:	1501                	addi	a0,a0,-32
     c14:	03000003          	lb	zero,48(zero) # 30 <BASE_ADDR-0xffffffe0001fffd0>
     c18:	01051c0b          	0x1051c0b
     c1c:	0000                	unimp
     c1e:	0118                	addi	a4,sp,128
     c20:	000002ef          	jal	t0,c20 <BASE_ADDR-0xffffffe0001ff3e0>
     c24:	05260b03          	lb	s6,82(a2) # 152fa <BASE_ADDR-0xffffffe0001ead06>
     c28:	0001                	nop
     c2a:	2000                	fld	fs0,0(s0)
     c2c:	ff01                	bnez	a4,b44 <BASE_ADDR-0xffffffe0001ff4bc>
     c2e:	03000003          	lb	zero,48(zero) # 30 <BASE_ADDR-0xffffffe0001fffd0>
     c32:	0c0d                	addi	s8,s8,3
     c34:	002a                	c.slli	zero,0xa
     c36:	0000                	unimp
     c38:	0028                	addi	a0,sp,8
     c3a:	2506                	fld	fa0,64(sp)
     c3c:	0002                	c.slli64	zero
     c3e:	0800                	addi	s0,sp,16
     c40:	01001003          	lh	zero,16(zero) # 10 <BASE_ADDR-0xffffffe0001ffff0>
     c44:	0000                	unimp
     c46:	2001                	0x2001
     c48:	0002                	c.slli64	zero
     c4a:	0300                	addi	s0,sp,384
     c4c:	1c11                	addi	s8,s8,-28
     c4e:	0105                	addi	sp,sp,1
     c50:	0000                	unimp
     c52:	0000                	unimp
     c54:	e602                	sd	zero,264(sp)
     c56:	0000                	unimp
     c58:	0200                	addi	s0,sp,256
     c5a:	0000008b          	0x8b
     c5e:	9a06                	add	s4,s4,ra
     c60:	0002                	c.slli64	zero
     c62:	0800                	addi	s0,sp,16
     c64:	1204                	addi	s1,sp,288
     c66:	0124                	addi	s1,sp,136
     c68:	0000                	unimp
     c6a:	8c01                	sub	s0,s0,s0
     c6c:	0002                	c.slli64	zero
     c6e:	0400                	addi	s0,sp,512
     c70:	0c14                	addi	a3,sp,528
     c72:	002a                	c.slli	zero,0xa
     c74:	0000                	unimp
     c76:	0000                	unimp
     c78:	e106                	sd	ra,128(sp)
     c7a:	0002                	c.slli64	zero
     c7c:	8800                	0x8800
     c7e:	1704                	addi	s1,sp,928
     c80:	0000017b          	0x17b
     c84:	7204                	ld	s1,32(a2)
     c86:	0061                	c.nop	24
     c88:	1804                	addi	s1,sp,48
     c8a:	2a0c                	fld	fa1,16(a2)
     c8c:	0000                	unimp
     c8e:	0000                	unimp
     c90:	7304                	ld	s1,32(a4)
     c92:	0070                	addi	a2,sp,12
     c94:	1904                	addi	s1,sp,176
     c96:	2a0c                	fld	fa1,16(a2)
     c98:	0000                	unimp
     c9a:	0800                	addi	s0,sp,16
     c9c:	7304                	ld	s1,32(a4)
     c9e:	0400                	addi	s0,sp,512
     ca0:	0c1a                	slli	s8,s8,0x6
     ca2:	0000017b          	0x17b
     ca6:	0110                	addi	a2,sp,128
     ca8:	02a6                	slli	t0,t0,0x9
     caa:	0000                	unimp
     cac:	1c04                	addi	s1,sp,560
     cae:	2a0c                	fld	fa1,16(a2)
     cb0:	0000                	unimp
     cb2:	7000                	ld	s0,32(s0)
     cb4:	6901                	0x6901
     cb6:	0002                	c.slli64	zero
     cb8:	0400                	addi	s0,sp,512
     cba:	121c                	addi	a5,sp,288
     cbc:	002a                	c.slli	zero,0xa
     cbe:	0000                	unimp
     cc0:	0178                	addi	a4,sp,140
     cc2:	0000035b          	0x35b
     cc6:	1c04                	addi	s1,sp,560
     cc8:	00002a1b          	0x2a1b
     ccc:	8000                	0x8000
     cce:	0d00                	addi	s0,sp,656
     cd0:	002a                	c.slli	zero,0xa
     cd2:	0000                	unimp
     cd4:	0000018b          	0x18b
     cd8:	360e                	fld	fa2,224(sp)
     cda:	0000                	unimp
     cdc:	0b00                	addi	s0,sp,400
     cde:	0600                	addi	s0,sp,768
     ce0:	000002ab          	0x2ab
     ce4:	04c8                	addi	a0,sp,580
     ce6:	0c20                	addi	s0,sp,536
     ce8:	0002                	c.slli64	zero
     cea:	0100                	addi	s0,sp,128
     cec:	029a                	slli	t0,t0,0x6
     cee:	0000                	unimp
     cf0:	2104                	fld	fs1,0(a0)
     cf2:	0c19                	addi	s8,s8,6
     cf4:	0002                	c.slli64	zero
     cf6:	0000                	unimp
     cf8:	ae01                	j	1008 <BASE_ADDR-0xffffffe0001feff8>
     cfa:	0001                	nop
     cfc:	0400                	addi	s0,sp,512
     cfe:	0c22                	slli	s8,s8,0x8
     d00:	002a                	c.slli	zero,0xa
     d02:	0000                	unimp
     d04:	0108                	addi	a0,sp,128
     d06:	0000024b          	fnmsub.s	ft4,ft0,ft0,ft0,rne
     d0a:	2304                	fld	fs1,0(a4)
     d0c:	2a0c                	fld	fa1,16(a2)
     d0e:	0000                	unimp
     d10:	1000                	addi	s0,sp,32
     d12:	dc01                	beqz	s0,c2a <BASE_ADDR-0xffffffe0001ff3d6>
     d14:	0001                	nop
     d16:	0400                	addi	s0,sp,512
     d18:	0c24                	addi	s1,sp,536
     d1a:	002a                	c.slli	zero,0xa
     d1c:	0000                	unimp
     d1e:	0418                	addi	a4,sp,512
     d20:	6974                	ld	a3,208(a0)
     d22:	0064                	addi	s1,sp,12
     d24:	2504                	fld	fs1,8(a0)
     d26:	2a0c                	fld	fa1,16(a2)
     d28:	0000                	unimp
     d2a:	2000                	fld	fs0,0(s0)
     d2c:	d301                	beqz	a4,c2c <BASE_ADDR-0xffffffe0001ff3d4>
     d2e:	0002                	c.slli64	zero
     d30:	0400                	addi	s0,sp,512
     d32:	01241a27          	0x1241a27
     d36:	0000                	unimp
     d38:	0128                	addi	a0,sp,136
     d3a:	030a                	slli	t1,t1,0x2
     d3c:	0000                	unimp
     d3e:	2b04                	fld	fs1,16(a4)
     d40:	2a0c                	fld	fa1,16(a2)
     d42:	0000                	unimp
     d44:	b000                	fsd	fs0,32(s0)
     d46:	6d04                	ld	s1,24(a0)
     d48:	006d                	c.nop	27
     d4a:	2d04                	fld	fs1,24(a0)
     d4c:	00010017          	auipc	zero,0x10
     d50:	b800                	fsd	fs0,48(s0)
     d52:	e501                	bnez	a0,d5a <BASE_ADDR-0xffffffe0001ff2a6>
     d54:	0001                	nop
     d56:	0400                	addi	s0,sp,512
     d58:	0211152f          	0x211152f
     d5c:	0000                	unimp
     d5e:	00c0                	addi	s0,sp,68
     d60:	0a02                	c.slli64	s4
     d62:	0001                	nop
     d64:	0200                	addi	s0,sp,256
     d66:	003d                	c.nop	15
     d68:	0000                	unimp
     d6a:	0809                	addi	a6,a6,2
     d6c:	1205                	addi	tp,tp,-31
     d6e:	0000                	unimp
     d70:	1600                	addi	s0,sp,800
     d72:	0504                	addi	s1,sp,640
     d74:	6e69                	lui	t3,0x1a
     d76:	0074                	addi	a3,sp,12
     d78:	00025317          	auipc	t1,0x25
     d7c:	0100                	addi	s0,sp,128
     d7e:	1c08                	addi	a0,sp,560
     d80:	0230                	addi	a2,sp,264
     d82:	0000                	unimp
     d84:	8b02                	jr	s6
     d86:	0001                	nop
     d88:	0b00                	addi	s0,sp,400
     d8a:	01b4                	addi	a3,sp,200
     d8c:	0000                	unimp
     d8e:	3204                	fld	fs1,32(a2)
     d90:	4709                	li	a4,2
     d92:	0002                	c.slli64	zero
     d94:	4700                	lw	s0,8(a4)
     d96:	0002                	c.slli64	zero
     d98:	0c00                	addi	s0,sp,528
     d9a:	0200                	addi	s0,sp,256
     d9c:	002a                	c.slli	zero,0xa
     d9e:	0000                	unimp
     da0:	00019a0f          	0x19a0f
     da4:	0300                	addi	s0,sp,384
     da6:	0829                	addi	a6,a6,10
     da8:	002a                	c.slli	zero,0xa
     daa:	0000                	unimp
     dac:	0262                	slli	tp,tp,0x18
     dae:	0000                	unimp
     db0:	2a05                	addiw	s4,s4,1
     db2:	0000                	unimp
     db4:	0000                	unimp
     db6:	0002da0f          	0x2da0f
     dba:	0500                	addi	s0,sp,640
     dbc:	02820707          	0x2820707
     dc0:	0000                	unimp
     dc2:	0282                	c.slli64	t0
     dc4:	0000                	unimp
     dc6:	8205                	srli	a2,a2,0x1
     dc8:	0002                	c.slli64	zero
     dca:	0500                	addi	s0,sp,640
     dcc:	0284                	addi	s1,sp,320
     dce:	0000                	unimp
     dd0:	2a05                	addiw	s4,s4,1
     dd2:	0000                	unimp
     dd4:	0000                	unimp
     dd6:	0818                	addi	a4,sp,16
     dd8:	8902                	jr	s2
     dda:	0002                	c.slli64	zero
     ddc:	1900                	addi	s0,sp,176
     dde:	0001430b          	0x1430b
     de2:	0600                	addi	s0,sp,768
     de4:	080e                	slli	a6,a6,0x3
     de6:	002a                	c.slli	zero,0xa
     de8:	0000                	unimp
     dea:	029c                	addi	a5,sp,320
     dec:	0000                	unimp
     dee:	000c                	0xc
     df0:	00032d0b          	0x32d0b
     df4:	0400                	addi	s0,sp,512
     df6:	1534                	addi	a3,sp,680
     df8:	0230                	addi	a2,sp,264
     dfa:	0000                	unimp
     dfc:	02ae                	slli	t0,t0,0xb
     dfe:	0000                	unimp
     e00:	000c                	0xc
     e02:	9f10                	0x9f10
     e04:	01000003          	lb	zero,16(zero) # 10 <BASE_ADDR-0xffffffe0001ffff0>
     e08:	0d0a                	slli	s10,s10,0x2
     e0a:	02c0                	addi	s0,sp,324
     e0c:	0000                	unimp
     e0e:	1105                	addi	sp,sp,-31
     e10:	0002                	c.slli64	zero
     e12:	0000                	unimp
     e14:	9010                	0x9010
     e16:	07000003          	lb	zero,112(zero) # 70 <BASE_ADDR-0xffffffe0001fff90>
     e1a:	0606                	slli	a2,a2,0x1
     e1c:	02d2                	slli	t0,t0,0x14
     e1e:	0000                	unimp
     e20:	d205                	beqz	a2,d40 <BASE_ADDR-0xffffffe0001ff2c0>
     e22:	0002                	c.slli64	zero
     e24:	0000                	unimp
     e26:	0109                	addi	sp,sp,2
     e28:	e908                	sd	a0,16(a0)
     e2a:	0005                	c.nop	1
     e2c:	1a00                	addi	s0,sp,304
     e2e:	02d2                	slli	t0,t0,0x14
     e30:	0000                	unimp
     e32:	d211                	beqz	a2,d36 <BASE_ADDR-0xffffffe0001ff2ca>
     e34:	2b000003          	lb	zero,688(zero) # 2b0 <BASE_ADDR-0xffffffe0001ffd50>
     e38:	10a0                	addi	s0,sp,104
     e3a:	0020                	addi	s0,sp,8
     e3c:	ffe0                	sd	s0,248(a5)
     e3e:	ffff                	0xffff
     e40:	0264                	addi	s1,sp,268
     e42:	0000                	unimp
     e44:	0000                	unimp
     e46:	0000                	unimp
     e48:	9c01                	subw	s0,s0,s0
     e4a:	0395                	addi	t2,t2,5
     e4c:	0000                	unimp
     e4e:	00025e07          	0x25e07
     e52:	2b00                	fld	fs0,16(a4)
     e54:	1120                	addi	s0,sp,168
     e56:	0002                	c.slli64	zero
     e58:	0300                	addi	s0,sp,384
     e5a:	a891                	j	eae <BASE_ADDR-0xffffffe0001ff152>
     e5c:	127f                	0x127f
     e5e:	03b5                	addi	t2,t2,13
     e60:	0000                	unimp
     e62:	192c                	addi	a1,sp,184
     e64:	0230                	addi	a2,sp,264
     e66:	0000                	unimp
     e68:	9102                	jalr	sp
     e6a:	1b48                	addi	a0,sp,436
     e6c:	10c0                	addi	s0,sp,100
     e6e:	0020                	addi	s0,sp,8
     e70:	ffe0                	sd	s0,248(a5)
     e72:	ffff                	0xffff
     e74:	0040                	addi	s0,sp,4
     e76:	0000                	unimp
     e78:	0000                	unimp
     e7a:	0000                	unimp
     e7c:	0339                	addi	t1,t1,14
     e7e:	0000                	unimp
     e80:	30007003          	0x30007003
     e84:	0003950f          	0x3950f
     e88:	0200                	addi	s0,sp,256
     e8a:	4091                	li	ra,4
     e8c:	0800                	addi	s0,sp,16
     e8e:	1158                	addi	a4,sp,164
     e90:	0020                	addi	s0,sp,8
     e92:	ffe0                	sd	s0,248(a5)
     e94:	ffff                	0xffff
     e96:	013c                	addi	a5,sp,136
     e98:	0000                	unimp
     e9a:	0000                	unimp
     e9c:	0000                	unimp
     e9e:	41007003          	0x41007003
     ea2:	0520                	addi	s0,sp,648
     ea4:	0001                	nop
     ea6:	0200                	addi	s0,sp,256
     ea8:	5891                	li	a7,-28
     eaa:	8808                	0x8808
     eac:	2011                	0x2011
     eae:	e000                	sd	s0,0(s0)
     eb0:	ffff                	0xffff
     eb2:	0cff                	0xcff
     eb4:	0001                	nop
     eb6:	0000                	unimp
     eb8:	0000                	unimp
     eba:	0300                	addi	s0,sp,384
     ebc:	0071                	c.nop	28
     ebe:	01052443          	fmadd.s	fs0,fa0,fa6,ft0,rdn
     ec2:	0000                	unimp
     ec4:	9102                	jalr	sp
     ec6:	0850                	addi	a2,sp,20
     ec8:	120c                	addi	a1,sp,288
     eca:	0020                	addi	s0,sp,8
     ecc:	ffe0                	sd	s0,248(a5)
     ece:	ffff                	0xffff
     ed0:	0074                	addi	a3,sp,12
     ed2:	0000                	unimp
     ed4:	0000                	unimp
     ed6:	0000                	unimp
     ed8:	4b007203          	0x4b007203
     edc:	0528                	addi	a0,sp,648
     ede:	0001                	nop
     ee0:	0300                	addi	s0,sp,384
     ee2:	b891                	j	736 <BASE_ADDR-0xffffffe0001ff8ca>
     ee4:	007f                	0x7f
     ee6:	0000                	unimp
     ee8:	0200                	addi	s0,sp,256
     eea:	02d2                	slli	t0,t0,0x14
     eec:	0000                	unimp
     eee:	a01c                	fsd	fa5,0(s0)
     ef0:	01000003          	lb	zero,16(zero) # 10 <BASE_ADDR-0xffffffe0001ffff0>
     ef4:	10640627          	0x10640627
     ef8:	0020                	addi	s0,sp,8
     efa:	ffe0                	sd	s0,248(a5)
     efc:	ffff                	0xffff
     efe:	003c                	addi	a5,sp,8
     f00:	0000                	unimp
     f02:	0000                	unimp
     f04:	0000                	unimp
     f06:	9c01                	subw	s0,s0,s0
     f08:	9511                	srai	a0,a0,0x24
     f0a:	1f000003          	lb	zero,496(zero) # 1f0 <BASE_ADDR-0xffffffe0001ffe10>
     f0e:	0fd4                	addi	a3,sp,980
     f10:	0020                	addi	s0,sp,8
     f12:	ffe0                	sd	s0,248(a5)
     f14:	ffff                	0xffff
     f16:	0090                	addi	a2,sp,64
     f18:	0000                	unimp
     f1a:	0000                	unimp
     f1c:	0000                	unimp
     f1e:	9c01                	subw	s0,s0,s0
     f20:	0424                	addi	s1,sp,520
     f22:	0000                	unimp
     f24:	00025e07          	0x25e07
     f28:	1f00                	addi	s0,sp,944
     f2a:	1120                	addi	s0,sp,168
     f2c:	0002                	c.slli64	zero
     f2e:	0200                	addi	s0,sp,256
     f30:	4891                	li	a7,4
     f32:	00646603          	lwu	a2,6(s0) # ffffffffffff9006 <_ebss+0x1fffdef066>
     f36:	0c20                	addi	s0,sp,536
     f38:	002a                	c.slli	zero,0xa
     f3a:	0000                	unimp
     f3c:	9102                	jalr	sp
     f3e:	0358                	addi	a4,sp,388
     f40:	11210063          	beq	sp,s2,1040 <BASE_ADDR-0xffffffe0001fefc0>
     f44:	0424                	addi	s1,sp,520
     f46:	0000                	unimp
     f48:	9102                	jalr	sp
     f4a:	0368                	addi	a0,sp,396
     f4c:	00746e63          	bltu	s0,t2,f68 <BASE_ADDR-0xffffffe0001ff098>
     f50:	0c22                	slli	s8,s8,0x8
     f52:	002a                	c.slli	zero,0xa
     f54:	0000                	unimp
     f56:	9102                	jalr	sp
     f58:	0850                	addi	a2,sp,20
     f5a:	100c                	addi	a1,sp,32
     f5c:	0020                	addi	s0,sp,8
     f5e:	ffe0                	sd	s0,248(a5)
     f60:	ffff                	0xffff
     f62:	0038                	addi	a4,sp,8
     f64:	0000                	unimp
     f66:	0000                	unimp
     f68:	0000                	unimp
     f6a:	23006903          	lwu	s2,560(zero) # 230 <BASE_ADDR-0xffffffe0001ffdd0>
     f6e:	2a11                	addiw	s4,s4,4
     f70:	0000                	unimp
     f72:	0200                	addi	s0,sp,256
     f74:	6091                	lui	ra,0x4
     f76:	0000                	unimp
     f78:	d902                	sw	zero,176(sp)
     f7a:	0002                	c.slli64	zero
     f7c:	1d00                	addi	s0,sp,688
     f7e:	000003c7          	fmsub.s	ft7,ft0,ft0,ft0,rne
     f82:	1b01                	addi	s6,s6,-32
     f84:	9c06                	add	s8,s8,ra
     f86:	e000200f          	0xe000200f
     f8a:	ffff                	0xffff
     f8c:	38ff                	0x38ff
     f8e:	0000                	unimp
     f90:	0000                	unimp
     f92:	0000                	unimp
     f94:	0100                	addi	s0,sp,128
     f96:	569c                	lw	a5,40(a3)
     f98:	0004                	0x4
     f9a:	0700                	addi	s0,sp,896
     f9c:	025e                	slli	tp,tp,0x17
     f9e:	0000                	unimp
     fa0:	0211211b          	0x211211b
     fa4:	0000                	unimp
     fa6:	9102                	jalr	sp
     fa8:	0068                	addi	a0,sp,12
     faa:	881e                	mv	a6,t2
     fac:	01000003          	lb	zero,16(zero) # 10 <BASE_ADDR-0xffffffe0001ffff0>
     fb0:	060c                	addi	a1,sp,768
     fb2:	0f10                	addi	a2,sp,912
     fb4:	0020                	addi	s0,sp,8
     fb6:	ffe0                	sd	s0,248(a5)
     fb8:	ffff                	0xffff
     fba:	008c                	addi	a1,sp,64
     fbc:	0000                	unimp
     fbe:	0000                	unimp
     fc0:	0000                	unimp
     fc2:	9c01                	subw	s0,s0,s0
     fc4:	00025e07          	0x25e07
     fc8:	0c00                	addi	s0,sp,528
     fca:	111e                	slli	sp,sp,0x27
     fcc:	0002                	c.slli64	zero
     fce:	0200                	addi	s0,sp,256
     fd0:	5891                	li	a7,-28
     fd2:	bb12                	fsd	ft4,432(sp)
     fd4:	0d000003          	lb	zero,208(zero) # d0 <BASE_ADDR-0xffffffe0001fff30>
     fd8:	2a0c                	fld	fa1,16(a2)
     fda:	0000                	unimp
     fdc:	0200                	addi	s0,sp,256
     fde:	6891                	lui	a7,0x4
     fe0:	0000                	unimp
     fe2:	0495                	addi	s1,s1,5
     fe4:	0000                	unimp
     fe6:	0005                	c.nop	1
     fe8:	0801                	addi	a6,a6,0
     fea:	00000787          	0x787
     fee:	2514                	fld	fa3,8(a0)
     ff0:	0000                	unimp
     ff2:	1d00                	addi	s0,sp,688
     ff4:	0112                	slli	sp,sp,0x4
     ff6:	0000                	unimp
     ff8:	0000                	unimp
     ffa:	0000                	unimp
     ffc:	01e1                	addi	gp,gp,24
	...
    1006:	0000                	unimp
    1008:	13df 0000 080a      	0x80a000013df
    100e:	1205                	addi	tp,tp,-31
    1010:	0000                	unimp
    1012:	0a00                	addi	s0,sp,272
    1014:	0708                	addi	a0,sp,896
    1016:	0000                	unimp
    1018:	0000                	unimp
    101a:	0415                	addi	s0,s0,5
    101c:	6905                	lui	s2,0x1
    101e:	746e                	ld	s0,248(sp)
    1020:	1600                	addi	s0,sp,800
    1022:	00b9                	addi	ra,ra,14
    1024:	0000                	unimp
    1026:	040a                	slli	s0,s0,0x2
    1028:	00003117          	auipc	sp,0x3
    102c:	0500                	addi	s0,sp,640
    102e:	0238                	addi	a4,sp,264
    1030:	0000                	unimp
    1032:	0230                	addi	a2,sp,264
    1034:	a606                	fsd	ft1,264(sp)
    1036:	0000                	unimp
    1038:	0100                	addi	s0,sp,128
    103a:	0364                	addi	s1,sp,396
    103c:	0000                	unimp
    103e:	0702                	c.slli64	a4
    1040:	0000c017          	auipc	zero,0xc
    1044:	0000                	unimp
    1046:	2f01                	sext.w	t5,t5
    1048:	0002                	c.slli64	zero
    104a:	0200                	addi	s0,sp,256
    104c:	0c08                	addi	a0,sp,528
    104e:	0000003f 01930108 	0x19301080000003f
    1056:	0000                	unimp
    1058:	0902                	c.slli64	s2
    105a:	3f0c                	fld	fa1,56(a4)
    105c:	0000                	unimp
    105e:	1000                	addi	s0,sp,32
    1060:	1501                	addi	a0,a0,-32
    1062:	02000003          	lb	zero,32(zero) # 20 <BASE_ADDR-0xffffffe0001fffe0>
    1066:	00c51c0b          	0xc51c0b
    106a:	0000                	unimp
    106c:	0118                	addi	a4,sp,128
    106e:	000002ef          	jal	t0,106e <BASE_ADDR-0xffffffe0001fef92>
    1072:	0b02                	c.slli64	s6
    1074:	c526                	sw	s1,136(sp)
    1076:	0000                	unimp
    1078:	2000                	fld	fs0,0(s0)
    107a:	ff01                	bnez	a4,f92 <BASE_ADDR-0xffffffe0001ff06e>
    107c:	02000003          	lb	zero,32(zero) # 20 <BASE_ADDR-0xffffffe0001fffe0>
    1080:	0c0d                	addi	s8,s8,3
    1082:	0000003f 25050028 	0x250500280000003f
    108a:	0002                	c.slli64	zero
    108c:	0800                	addi	s0,sp,16
    108e:	1002                	c.slli	zero,0x20
    1090:	00c0                	addi	s0,sp,68
    1092:	0000                	unimp
    1094:	2001                	0x2001
    1096:	0002                	c.slli64	zero
    1098:	0200                	addi	s0,sp,256
    109a:	1c11                	addi	s8,s8,-28
    109c:	00c5                	addi	ra,ra,17
    109e:	0000                	unimp
    10a0:	0000                	unimp
    10a2:	0000a603          	lw	a2,0(ra) # 4000 <BASE_ADDR-0xffffffe0001fc000>
    10a6:	0300                	addi	s0,sp,384
    10a8:	0000004b          	fnmsub.s	ft0,ft0,ft0,ft0,rne
    10ac:	00025b17          	auipc	s6,0x25
    10b0:	1800                	addi	s0,sp,48
    10b2:	0301                	addi	t1,t1,0
    10b4:	0806                	slli	a6,a6,0x1
    10b6:	0108                	addi	a0,sp,128
    10b8:	0000                	unimp
    10ba:	7804                	ld	s1,48(s0)
    10bc:	0300                	addi	s0,sp,384
    10be:	01080c07          	0x1080c07
    10c2:	0000                	unimp
    10c4:	0b00                	addi	s0,sp,400
    10c6:	02a6                	slli	t0,t0,0x9
    10c8:	0000                	unimp
    10ca:	3f08                	fld	fa0,56(a4)
    10cc:	0000                	unimp
    10ce:	0000                	unimp
    10d0:	0b01                	addi	s6,s6,0
    10d2:	0000035b          	0x35b
    10d6:	3f09                	addiw	t5,t5,-30
    10d8:	0000                	unimp
    10da:	0800                	addi	s0,sp,16
    10dc:	0b01                	addi	s6,s6,0
    10de:	00000263          	beqz	zero,10e2 <BASE_ADDR-0xffffffe0001fef1e>
    10e2:	3f0a                	fld	ft10,160(sp)
    10e4:	0000                	unimp
    10e6:	1000                	addi	s0,sp,32
    10e8:	0001                	nop
    10ea:	3f0c                	fld	fa1,56(a4)
    10ec:	0000                	unimp
    10ee:	1800                	addi	s0,sp,48
    10f0:	0001                	nop
    10f2:	1100                	addi	s0,sp,160
    10f4:	0031                	c.nop	12
    10f6:	0000                	unimp
    10f8:	001f 9a05 0002      	0x29a05001f
    10fe:	0800                	addi	s0,sp,16
    1100:	1204                	addi	s1,sp,288
    1102:	0132                	slli	sp,sp,0xc
    1104:	0000                	unimp
    1106:	8c01                	sub	s0,s0,s0
    1108:	0002                	c.slli64	zero
    110a:	0400                	addi	s0,sp,512
    110c:	0c14                	addi	a3,sp,528
    110e:	0000003f e1050000 	0xe10500000000003f
    1116:	0002                	c.slli64	zero
    1118:	8800                	0x8800
    111a:	1704                	addi	s1,sp,928
    111c:	0189                	addi	gp,gp,2
    111e:	0000                	unimp
    1120:	7204                	ld	s1,32(a2)
    1122:	0061                	c.nop	24
    1124:	1804                	addi	s1,sp,48
    1126:	3f0c                	fld	fa1,56(a4)
    1128:	0000                	unimp
    112a:	0000                	unimp
    112c:	7304                	ld	s1,32(a4)
    112e:	0070                	addi	a2,sp,12
    1130:	1904                	addi	s1,sp,176
    1132:	3f0c                	fld	fa1,56(a4)
    1134:	0000                	unimp
    1136:	0800                	addi	s0,sp,16
    1138:	7304                	ld	s1,32(a4)
    113a:	0400                	addi	s0,sp,512
    113c:	0c1a                	slli	s8,s8,0x6
    113e:	0189                	addi	gp,gp,2
    1140:	0000                	unimp
    1142:	0110                	addi	a2,sp,128
    1144:	02a6                	slli	t0,t0,0x9
    1146:	0000                	unimp
    1148:	1c04                	addi	s1,sp,560
    114a:	3f0c                	fld	fa1,56(a4)
    114c:	0000                	unimp
    114e:	7000                	ld	s0,32(s0)
    1150:	6901                	0x6901
    1152:	0002                	c.slli64	zero
    1154:	0400                	addi	s0,sp,512
    1156:	121c                	addi	a5,sp,288
    1158:	0000003f 035b0178 	0x35b01780000003f
    1160:	0000                	unimp
    1162:	1c04                	addi	s1,sp,560
    1164:	00003f1b          	0x3f1b
    1168:	8000                	0x8000
    116a:	0c00                	addi	s0,sp,528
    116c:	0000003f 00000199 	0x1990000003f
    1174:	3111                	addiw	sp,sp,-28
    1176:	0000                	unimp
    1178:	0b00                	addi	s0,sp,400
    117a:	0500                	addi	s0,sp,640
    117c:	000002ab          	0x2ab
    1180:	04c8                	addi	a0,sp,580
    1182:	1a20                	addi	s0,sp,312
    1184:	0002                	c.slli64	zero
    1186:	0100                	addi	s0,sp,128
    1188:	029a                	slli	t0,t0,0x6
    118a:	0000                	unimp
    118c:	2104                	fld	fs1,0(a0)
    118e:	1a19                	addi	s4,s4,-26
    1190:	0002                	c.slli64	zero
    1192:	0000                	unimp
    1194:	ae01                	j	14a4 <BASE_ADDR-0xffffffe0001feb5c>
    1196:	0001                	nop
    1198:	0400                	addi	s0,sp,512
    119a:	0c22                	slli	s8,s8,0x8
    119c:	0000003f 024b0108 	0x24b01080000003f
    11a4:	0000                	unimp
    11a6:	2304                	fld	fs1,0(a4)
    11a8:	3f0c                	fld	fa1,56(a4)
    11aa:	0000                	unimp
    11ac:	1000                	addi	s0,sp,32
    11ae:	dc01                	beqz	s0,10c6 <BASE_ADDR-0xffffffe0001fef3a>
    11b0:	0001                	nop
    11b2:	0400                	addi	s0,sp,512
    11b4:	0c24                	addi	s1,sp,536
    11b6:	0000003f 69740418 	0x697404180000003f
    11be:	0064                	addi	s1,sp,12
    11c0:	2504                	fld	fs1,8(a0)
    11c2:	3f0c                	fld	fa1,56(a4)
    11c4:	0000                	unimp
    11c6:	2000                	fld	fs0,0(s0)
    11c8:	d301                	beqz	a4,10c8 <BASE_ADDR-0xffffffe0001fef38>
    11ca:	0002                	c.slli64	zero
    11cc:	0400                	addi	s0,sp,512
    11ce:	01321a27          	0x1321a27
    11d2:	0000                	unimp
    11d4:	0128                	addi	a0,sp,136
    11d6:	030a                	slli	t1,t1,0x2
    11d8:	0000                	unimp
    11da:	2b04                	fld	fs1,16(a4)
    11dc:	3f0c                	fld	fa1,56(a4)
    11de:	0000                	unimp
    11e0:	b000                	fsd	fs0,32(s0)
    11e2:	6d04                	ld	s1,24(a0)
    11e4:	006d                	c.nop	27
    11e6:	2d04                	fld	fs1,24(a0)
    11e8:	0000c017          	auipc	zero,0xc
    11ec:	b800                	fsd	fs0,48(s0)
    11ee:	e501                	bnez	a0,11f6 <BASE_ADDR-0xffffffe0001fee0a>
    11f0:	0001                	nop
    11f2:	0400                	addi	s0,sp,512
    11f4:	021f152f          	0x21f152f
    11f8:	0000                	unimp
    11fa:	00c0                	addi	s0,sp,68
    11fc:	00011803          	lh	a6,0(sp) # 4028 <BASE_ADDR-0xffffffe0001fbfd8>
    1200:	0300                	addi	s0,sp,384
    1202:	00ca                	slli	ra,ra,0x12
    1204:	0000                	unimp
    1206:	530d                	li	t1,-29
    1208:	0002                	c.slli64	zero
    120a:	1500                	addi	s0,sp,672
    120c:	2f1c                	fld	fa5,24(a4)
    120e:	0002                	c.slli64	zero
    1210:	0300                	addi	s0,sp,384
    1212:	0199                	addi	gp,gp,6
    1214:	0000                	unimp
    1216:	3f0c                	fld	fa1,56(a4)
    1218:	0002                	c.slli64	zero
    121a:	3f00                	fld	fs0,56(a4)
    121c:	0002                	c.slli64	zero
    121e:	1800                	addi	s0,sp,48
    1220:	0a00                	addi	s0,sp,272
    1222:	0801                	addi	a6,a6,0
    1224:	05e9                	addi	a1,a1,26
    1226:	0000                	unimp
    1228:	3f19                	addiw	t5,t5,-26
    122a:	0002                	c.slli64	zero
    122c:	0d00                	addi	s0,sp,656
    122e:	02f8                	addi	a4,sp,332
    1230:	0000                	unimp
    1232:	0d16                	slli	s10,s10,0x5
    1234:	0234                	addi	a3,sp,264
    1236:	0000                	unimp
    1238:	ca0d                	beqz	a2,126a <BASE_ADDR-0xffffffe0001fed96>
    123a:	0002                	c.slli64	zero
    123c:	1600                	addi	s0,sp,800
    123e:	0002341b          	0x2341b
    1242:	0600                	addi	s0,sp,768
    1244:	03dc                	addi	a5,sp,452
    1246:	0000                	unimp
    1248:	3818                	fld	fa4,48(s0)
    124a:	0000                	unimp
    124c:	0900                	addi	s0,sp,144
    124e:	20602003          	lw	zero,518(zero) # 206 <BASE_ADDR-0xffffffe0001ffdfa>
    1252:	e000                	sd	s0,0(s0)
    1254:	ffff                	0xffff
    1256:	0eff                	0xeff
    1258:	0388                	addi	a0,sp,448
    125a:	0000                	unimp
    125c:	0b06                	slli	s6,s6,0x1
    125e:	0286                	slli	t0,t0,0x1
    1260:	0000                	unimp
    1262:	1f02                	slli	t5,t5,0x20
    1264:	0002                	c.slli64	zero
    1266:	0000                	unimp
    1268:	1d12                	slli	s10,s10,0x24
    126a:	04000003          	lb	zero,64(zero) # 40 <BASE_ADDR-0xffffffe0001fffc0>
    126e:	9338                	0x9338
    1270:	0002                	c.slli64	zero
    1272:	0900                	addi	s0,sp,144
    1274:	1200                	addi	s0,sp,288
    1276:	00da                	slli	ra,ra,0x16
    1278:	0000                	unimp
    127a:	0805                	addi	a6,a6,1
    127c:	02a0                	addi	s0,sp,328
    127e:	0000                	unimp
    1280:	0009                	c.nop	2
    1282:	00017f07          	0x17f07
    1286:	0700                	addi	s0,sp,896
    1288:	0505                	addi	a0,a0,1
    128a:	0038                	addi	a4,sp,8
    128c:	0000                	unimp
    128e:	000002b7          	lui	t0,0x0
    1292:	b702                	fsd	ft0,424(sp)
    1294:	0002                	c.slli64	zero
    1296:	0900                	addi	s0,sp,144
    1298:	0300                	addi	s0,sp,384
    129a:	0246                	slli	tp,tp,0x11
    129c:	0000                	unimp
    129e:	670e                	ld	a4,192(sp)
    12a0:	0005                	c.nop	1
    12a2:	0200                	addi	s0,sp,256
    12a4:	e12d                	bnez	a0,1306 <BASE_ADDR-0xffffffe0001fecfa>
    12a6:	0002                	c.slli64	zero
    12a8:	0200                	addi	s0,sp,256
    12aa:	02e1                	addi	t0,t0,24
    12ac:	0000                	unimp
    12ae:	3f02                	fld	ft10,32(sp)
    12b0:	0000                	unimp
    12b2:	0200                	addi	s0,sp,256
    12b4:	0000003f 00003f02 	0x3f020000003f
    12bc:	0200                	addi	s0,sp,256
    12be:	0000003f 003f0300 	0x3f03000000003f
    12c6:	0000                	unimp
    12c8:	00043407          	fld	fs0,0(s0)
    12cc:	0200                	addi	s0,sp,256
    12ce:	003f082b          	0x3f082b
    12d2:	0000                	unimp
    12d4:	02fc                	addi	a5,sp,332
    12d6:	0000                	unimp
    12d8:	3f02                	fld	ft10,32(sp)
    12da:	0000                	unimp
    12dc:	0000                	unimp
    12de:	00041c07          	0x41c07
    12e2:	0200                	addi	s0,sp,256
    12e4:	082a                	slli	a6,a6,0xa
    12e6:	0000003f 00000312 	0x3120000003f
    12ee:	3f02                	fld	ft10,32(sp)
    12f0:	0000                	unimp
    12f2:	0000                	unimp
    12f4:	431a                	lw	t1,132(sp)
    12f6:	0001                	nop
    12f8:	0800                	addi	s0,sp,16
    12fa:	080e                	slli	a6,a6,0x3
    12fc:	0000003f 00000324 	0x3240000003f
    1304:	0009                	c.nop	2
    1306:	00019a07          	0x19a07
    130a:	0200                	addi	s0,sp,256
    130c:	0829                	addi	a6,a6,10
    130e:	0000003f 0000033a 	0x33a0000003f
    1316:	3f02                	fld	ft10,32(sp)
    1318:	0000                	unimp
    131a:	0000                	unimp
    131c:	8d0e                	mv	s10,gp
    131e:	0001                	nop
    1320:	0900                	addi	s0,sp,144
    1322:	4b04                	lw	s1,16(a4)
    1324:	02000003          	lb	zero,32(zero) # 20 <BASE_ADDR-0xffffffe0001fffe0>
    1328:	000002b7          	lui	t0,0x0
    132c:	0700                	addi	s0,sp,896
    132e:	0469                	addi	s0,s0,26
    1330:	0000                	unimp
    1332:	1b02                	slli	s6,s6,0x20
    1334:	c518                	sw	a4,8(a0)
    1336:	0000                	unimp
    1338:	6600                	ld	s0,8(a2)
    133a:	02000003          	lb	zero,32(zero) # 20 <BASE_ADDR-0xffffffe0001fffe0>
    133e:	00c0                	addi	s0,sp,68
    1340:	0000                	unimp
    1342:	3f02                	fld	ft10,32(sp)
    1344:	0000                	unimp
    1346:	0000                	unimp
    1348:	00044a0f          	0x44a0f
    134c:	4600                	lw	s0,8(a2)
    134e:	15dc                	addi	a5,sp,740
    1350:	0020                	addi	s0,sp,8
    1352:	ffe0                	sd	s0,248(a5)
    1354:	ffff                	0xffff
    1356:	013c                	addi	a5,sp,136
    1358:	0000                	unimp
    135a:	0000                	unimp
    135c:	0000                	unimp
    135e:	9c01                	subw	s0,s0,s0
    1360:	03b9                	addi	t2,t2,14
    1362:	0000                	unimp
    1364:	0808                	addi	a0,sp,16
    1366:	0004                	0x4
    1368:	4600                	lw	s0,8(a2)
    136a:	3f1a                	fld	ft10,416(sp)
    136c:	0000                	unimp
    136e:	0200                	addi	s0,sp,256
    1370:	5891                	li	a7,-28
    1372:	5e08                	lw	a0,56(a2)
    1374:	0002                	c.slli64	zero
    1376:	4600                	lw	s0,8(a2)
    1378:	1f32                	slli	t5,t5,0x2c
    137a:	0002                	c.slli64	zero
    137c:	0200                	addi	s0,sp,256
    137e:	5091                	li	ra,-28
    1380:	0f06                	slli	t5,t5,0x1
    1382:	0004                	0x4
    1384:	4700                	lw	s0,8(a4)
    1386:	0000003f 06689102 	0x66891020000003f
    138e:	0425                	addi	s0,s0,9
    1390:	0000                	unimp
    1392:	3f48                	fld	fa0,184(a4)
    1394:	0000                	unimp
    1396:	0200                	addi	s0,sp,256
    1398:	6091                	lui	ra,0x4
    139a:	0f00                	addi	s0,sp,912
    139c:	0472                	slli	s0,s0,0x1c
    139e:	0000                	unimp
    13a0:	f43c                	sd	a5,104(s0)
    13a2:	2014                	fld	fa3,0(s0)
    13a4:	e000                	sd	s0,0(s0)
    13a6:	ffff                	0xffff
    13a8:	e8ff                	0xe8ff
    13aa:	0000                	unimp
    13ac:	0000                	unimp
    13ae:	0000                	unimp
    13b0:	0100                	addi	s0,sp,128
    13b2:	fc9c                	sd	a5,56(s1)
    13b4:	13000003          	lb	zero,304(zero) # 130 <BASE_ADDR-0xffffffe0001ffed0>
    13b8:	7369                	lui	t1,0xffffa
    13ba:	0069                	c.nop	26
    13bc:	3f18                	fld	fa4,56(a4)
    13be:	0000                	unimp
    13c0:	0200                	addi	s0,sp,256
    13c2:	5891                	li	a7,-28
    13c4:	63786513          	ori	a0,a6,1591
    13c8:	2400                	fld	fs0,8(s0)
    13ca:	0000003f 10509102 	0x105091020000003f
    13d2:	113d0073          	0x113d0073
    13d6:	000002b7          	lui	t0,0x0
    13da:	9102                	jalr	sp
    13dc:	0068                	addi	a0,sp,12
    13de:	0004570f          	0x4570f
    13e2:	2700                	fld	fs0,8(a4)
    13e4:	1374                	addi	a3,sp,428
    13e6:	0020                	addi	s0,sp,8
    13e8:	ffe0                	sd	s0,248(a5)
    13ea:	ffff                	0xffff
    13ec:	0180                	addi	s0,sp,192
    13ee:	0000                	unimp
    13f0:	0000                	unimp
    13f2:	0000                	unimp
    13f4:	9c01                	subw	s0,s0,s0
    13f6:	0000046b          	0x46b
    13fa:	2508                	fld	fa0,8(a0)
    13fc:	0004                	0x4
    13fe:	2700                	fld	fs0,8(a4)
    1400:	3f1f 0000 0300      	0x30000003f1f
    1406:	a891                	j	145a <BASE_ADDR-0xffffffe0001feba6>
    1408:	087f                	0x87f
    140a:	025e                	slli	tp,tp,0x17
    140c:	0000                	unimp
    140e:	021f3f27          	fsd	ft1,62(t5)
    1412:	0000                	unimp
    1414:	7fa09103          	lh	sp,2042(ra) # 47fa <BASE_ADDR-0xffffffe0001fb806>
    1418:	5806                	lw	a6,96(sp)
    141a:	0001                	nop
    141c:	2800                	fld	fs0,16(s0)
    141e:	0000003f 10409102 	0x104091020000003f
    1426:	0070                	addi	a2,sp,12
    1428:	1c29                	addi	s8,s8,-22
    142a:	00c5                	addi	ra,ra,17
    142c:	0000                	unimp
    142e:	7fb89103          	lh	sp,2043(a7) # 47fb <BASE_ADDR-0xffffffe0001fb805>
    1432:	6310                	ld	a2,0(a4)
    1434:	2d00                	fld	fs0,24(a0)
    1436:	3f0c                	fld	fa1,56(a4)
    1438:	0000                	unimp
    143a:	0300                	addi	s0,sp,384
    143c:	b091                	j	c80 <BASE_ADDR-0xffffffe0001ff380>
    143e:	067f                	0x67f
    1440:	04c1                	addi	s1,s1,16
    1442:	0000                	unimp
    1444:	3f32                	fld	ft10,296(sp)
    1446:	0000                	unimp
    1448:	0200                	addi	s0,sp,256
    144a:	4891                	li	a7,4
    144c:	1b00                	addi	s0,sp,432
    144e:	03ed                	addi	t2,t2,27
    1450:	0000                	unimp
    1452:	1a01                	addi	s4,s4,-32
    1454:	3f08                	fld	fa0,56(a4)
    1456:	0000                	unimp
    1458:	0400                	addi	s0,sp,512
    145a:	e0002013          	slti	zero,zero,-512
    145e:	ffff                	0xffff
    1460:	70ff                	0x70ff
    1462:	0000                	unimp
    1464:	0000                	unimp
    1466:	0000                	unimp
    1468:	0100                	addi	s0,sp,128
    146a:	089c                	addi	a5,sp,80
    146c:	0425                	addi	s0,s0,9
    146e:	0000                	unimp
    1470:	2a1a                	fld	fs4,384(sp)
    1472:	0000003f 00689102 	0x6891020000003f
    147a:	2c00                	fld	fs0,24(s0)
    147c:	05000007          	0x5000007
    1480:	0100                	addi	s0,sp,128
    1482:	3808                	fld	fa0,48(s0)
    1484:	0009                	c.nop	2
    1486:	1600                	addi	s0,sp,800
    1488:	0025                	c.nop	9
    148a:	0000                	unimp
    148c:	331d                	addiw	t1,t1,-25
    148e:	0001                	nop
    1490:	0000                	unimp
    1492:	0000                	unimp
    1494:	3200                	fld	fs0,32(a2)
    1496:	0002                	c.slli64	zero
	...
    14a0:	4100                	lw	s0,0(a0)
    14a2:	17000017          	auipc	zero,0x17000
    14a6:	00b9                	addi	ra,ra,14
    14a8:	0000                	unimp
    14aa:	0405                	addi	s0,s0,1
    14ac:	00003617          	auipc	a2,0x3
    14b0:	0a00                	addi	s0,sp,272
    14b2:	0708                	addi	a0,sp,896
    14b4:	0000                	unimp
    14b6:	0000                	unimp
    14b8:	080a                	slli	a6,a6,0x2
    14ba:	1205                	addi	tp,tp,-31
    14bc:	0000                	unimp
    14be:	1800                	addi	s0,sp,48
    14c0:	0504                	addi	s1,sp,640
    14c2:	6e69                	lui	t3,0x1a
    14c4:	0074                	addi	a3,sp,12
    14c6:	380d                	addiw	a6,a6,-29
    14c8:	0002                	c.slli64	zero
    14ca:	3000                	fld	fs0,32(s0)
    14cc:	9f06                	add	t5,t5,ra
    14ce:	0000                	unimp
    14d0:	0400                	addi	s0,sp,512
    14d2:	0364                	addi	s1,sp,396
    14d4:	0000                	unimp
    14d6:	00b71707          	0xb71707
    14da:	0000                	unimp
    14dc:	0400                	addi	s0,sp,512
    14de:	0000022f          	0x22f
    14e2:	0c08                	addi	a0,sp,528
    14e4:	002a                	c.slli	zero,0xa
    14e6:	0000                	unimp
    14e8:	0408                	addi	a0,sp,512
    14ea:	00000193          	li	gp,0
    14ee:	0c09                	addi	s8,s8,2
    14f0:	002a                	c.slli	zero,0xa
    14f2:	0000                	unimp
    14f4:	0410                	addi	a2,sp,512
    14f6:	0315                	addi	t1,t1,5
    14f8:	0000                	unimp
    14fa:	00bc1c0b          	0xbc1c0b
    14fe:	0000                	unimp
    1500:	0418                	addi	a4,sp,512
    1502:	000002ef          	jal	t0,1502 <BASE_ADDR-0xffffffe0001feafe>
    1506:	00bc260b          	0xbc260b
    150a:	0000                	unimp
    150c:	0420                	addi	s0,sp,520
    150e:	03ff                	0x3ff
    1510:	0000                	unimp
    1512:	0c0d                	addi	s8,s8,3
    1514:	002a                	c.slli	zero,0xa
    1516:	0000                	unimp
    1518:	0028                	addi	a0,sp,8
    151a:	250d                	addiw	a0,a0,3
    151c:	0002                	c.slli64	zero
    151e:	0800                	addi	s0,sp,16
    1520:	b710                	fsd	fa2,40(a4)
    1522:	0000                	unimp
    1524:	0400                	addi	s0,sp,512
    1526:	0220                	addi	s0,sp,264
    1528:	0000                	unimp
    152a:	1c11                	addi	s8,s8,-28
    152c:	00bc                	addi	a5,sp,72
    152e:	0000                	unimp
    1530:	0000                	unimp
    1532:	9f05                	subw	a4,a4,s1
    1534:	0000                	unimp
    1536:	0500                	addi	s0,sp,640
    1538:	0000004b          	fnmsub.s	ft0,ft0,ft0,ft0,rne
    153c:	0000cc0b          	0xcc0b
    1540:	cc00                	sw	s0,24(s0)
    1542:	0000                	unimp
    1544:	1900                	addi	s0,sp,176
    1546:	0a00                	addi	s0,sp,272
    1548:	0801                	addi	a6,a6,0
    154a:	05e9                	addi	a1,a1,26
    154c:	0000                	unimp
    154e:	cc1a                	sw	t1,24(sp)
    1550:	0000                	unimp
    1552:	0600                	addi	s0,sp,768
    1554:	048e                	slli	s1,s1,0x3
    1556:	0000                	unimp
    1558:	0d3a                	slli	s10,s10,0xe
    155a:	00c1                	addi	ra,ra,16
    155c:	0000                	unimp
    155e:	2406                	fld	fs0,64(sp)
    1560:	0005                	c.nop	1
    1562:	3a00                	fld	fs0,48(a2)
    1564:	0000c117          	auipc	sp,0xc
    1568:	0600                	addi	s0,sp,768
    156a:	0514                	addi	a3,sp,640
    156c:	0000                	unimp
    156e:	00c10d3b          	addw	s10,sp,a2
    1572:	0000                	unimp
    1574:	e506                	sd	ra,136(sp)
    1576:	0004                	0x4
    1578:	3b00                	fld	fs0,48(a4)
    157a:	c119                	beqz	a0,1580 <BASE_ADDR-0xffffffe0001fea80>
    157c:	0000                	unimp
    157e:	0600                	addi	s0,sp,768
    1580:	047d                	addi	s0,s0,31
    1582:	0000                	unimp
    1584:	0d3c                	addi	a5,sp,664
    1586:	00c1                	addi	ra,ra,16
    1588:	0000                	unimp
    158a:	00002a0b          	0x2a0b
    158e:	2000                	fld	fs0,0(s0)
    1590:	0001                	nop
    1592:	1b00                	addi	s0,sp,432
    1594:	0036                	c.slli	zero,0xd
    1596:	0000                	unimp
    1598:	01ff                	0x1ff
    159a:	0e00                	addi	s0,sp,784
    159c:	0000052b          	0x52b
    15a0:	00010f3f 00030900 	0x3090000010f3f
    15a8:	2070                	fld	fa2,192(s0)
    15aa:	e000                	sd	s0,0(s0)
    15ac:	ffff                	0xffff
    15ae:	0eff                	0xeff
    15b0:	00000303          	lb	t1,0(zero) # 0 <BASE_ADDR-0xffffffe000200000>
    15b4:	0f40                	addi	s0,sp,916
    15b6:	0001                	nop
    15b8:	0900                	addi	s0,sp,144
    15ba:	20800003          	lb	zero,520(zero) # 208 <BASE_ADDR-0xffffffe0001ffdf8>
    15be:	e000                	sd	s0,0(s0)
    15c0:	ffff                	0xffff
    15c2:	0fff                	0xfff
    15c4:	0186                	slli	gp,gp,0x1
    15c6:	0000                	unimp
    15c8:	01670703          	lb	a4,22(a4)
    15cc:	0000                	unimp
    15ce:	00000167          	jalr	sp,zero # 0 <BASE_ADDR-0xffffffe000200000>
    15d2:	6708                	ld	a0,8(a4)
    15d4:	0001                	nop
    15d6:	0800                	addi	s0,sp,16
    15d8:	00cc                	addi	a1,sp,68
    15da:	0000                	unimp
    15dc:	2a08                	fld	fa0,16(a2)
    15de:	0000                	unimp
    15e0:	0000                	unimp
    15e2:	081c                	addi	a5,sp,16
    15e4:	431d                	li	t1,7
    15e6:	0001                	nop
    15e8:	0600                	addi	s0,sp,768
    15ea:	080e                	slli	a6,a6,0x3
    15ec:	002a                	c.slli	zero,0xa
    15ee:	0000                	unimp
    15f0:	0000017b          	0x17b
    15f4:	0010                	0x10
    15f6:	00017f0f          	0x17f0f
    15fa:	0400                	addi	s0,sp,512
    15fc:	4405                	li	s0,1
    15fe:	0000                	unimp
    1600:	9100                	0x9100
    1602:	0001                	nop
    1604:	0800                	addi	s0,sp,16
    1606:	0191                	addi	gp,gp,4
    1608:	0000                	unimp
    160a:	0010                	0x10
    160c:	d305                	beqz	a4,152c <BASE_ADDR-0xffffffe0001fead4>
    160e:	0000                	unimp
    1610:	1100                	addi	s0,sp,160
    1612:	0546                	slli	a0,a0,0x11
    1614:	0000                	unimp
    1616:	a09a                	fsd	ft6,64(sp)
    1618:	201e                	fld	ft0,448(sp)
    161a:	e000                	sd	s0,0(s0)
    161c:	ffff                	0xffff
    161e:	18ff                	0x18ff
    1620:	0001                	nop
    1622:	0000                	unimp
    1624:	0000                	unimp
    1626:	0100                	addi	s0,sp,128
    1628:	c19c                	sw	a5,0(a1)
    162a:	0001                	nop
    162c:	0700                	addi	s0,sp,896
    162e:	000004b3          	add	s1,zero,zero
    1632:	0ca1                	addi	s9,s9,8
    1634:	002a                	c.slli	zero,0xa
    1636:	0000                	unimp
    1638:	9102                	jalr	sp
    163a:	0068                	addi	a0,sp,12
    163c:	6012                	0x6012
    163e:	0005                	c.nop	1
    1640:	9200                	0x9200
    1642:	1e38                	addi	a4,sp,824
    1644:	0020                	addi	s0,sp,8
    1646:	ffe0                	sd	s0,248(a5)
    1648:	ffff                	0xffff
    164a:	0068                	addi	a0,sp,12
    164c:	0000                	unimp
    164e:	0000                	unimp
    1650:	0000                	unimp
    1652:	9c01                	subw	s0,s0,s0
    1654:	0251                	addi	tp,tp,20
    1656:	0000                	unimp
    1658:	3901                	addiw	s2,s2,-32
    165a:	92000003          	lb	zero,-1760(zero) # fffffffffffff920 <_ebss+0x1fffdf5980>
    165e:	5126                	lw	sp,104(sp)
    1660:	0002                	c.slli64	zero
    1662:	0200                	addi	s0,sp,256
    1664:	4891                	li	a7,4
    1666:	ab01                	j	1b76 <BASE_ADDR-0xffffffe0001fe48a>
    1668:	0004                	0x4
    166a:	9200                	0x9200
    166c:	5638                	lw	a4,104(a2)
    166e:	0002                	c.slli64	zero
    1670:	0200                	addi	s0,sp,256
    1672:	4091                	li	ra,4
    1674:	7101                	addi	sp,sp,-512
    1676:	0005                	c.nop	1
    1678:	9200                	0x9200
    167a:	00025647          	fmsub.s	fa2,ft4,ft0,ft0,unknown
    167e:	0300                	addi	s0,sp,384
    1680:	b891                	j	ed4 <BASE_ADDR-0xffffffe0001ff12c>
    1682:	017f                	0x17f
    1684:	04c0                	addi	s0,sp,580
    1686:	0000                	unimp
    1688:	5492                	lw	s1,36(sp)
    168a:	0256                	slli	tp,tp,0x15
    168c:	0000                	unimp
    168e:	7fb09103          	lh	sp,2043(ra)
    1692:	4401                	li	s0,0
    1694:	0004                	0x4
    1696:	9200                	0x9200
    1698:	2a64                	fld	fs1,208(a2)
    169a:	0000                	unimp
    169c:	0300                	addi	s0,sp,384
    169e:	a891                	j	16f2 <BASE_ADDR-0xffffffe0001fe90e>
    16a0:	077f                	0x77f
    16a2:	04ac                	addi	a1,sp,584
    16a4:	0000                	unimp
    16a6:	002a0993          	addi	s3,s4,2
    16aa:	0000                	unimp
    16ac:	9102                	jalr	sp
    16ae:	0768                	addi	a0,sp,908
    16b0:	0572                	slli	a0,a0,0x1c
    16b2:	0000                	unimp
    16b4:	0994                	addi	a3,sp,208
    16b6:	002a                	c.slli	zero,0xa
    16b8:	0000                	unimp
    16ba:	9102                	jalr	sp
    16bc:	0760                	addi	s0,sp,908
    16be:	04c1                	addi	s1,s1,16
    16c0:	0000                	unimp
    16c2:	0995                	addi	s3,s3,5
    16c4:	002a                	c.slli	zero,0xa
    16c6:	0000                	unimp
    16c8:	9102                	jalr	sp
    16ca:	0058                	addi	a4,sp,4
    16cc:	2a05                	addiw	s4,s4,1
    16ce:	0000                	unimp
    16d0:	0500                	addi	s0,sp,640
    16d2:	00cc                	addi	a1,sp,68
    16d4:	0000                	unimp
    16d6:	671e                	ld	a4,448(sp)
    16d8:	0005                	c.nop	1
    16da:	0100                	addi	s0,sp,128
    16dc:	067f                	0x67f
    16de:	1ce0                	addi	s0,sp,636
    16e0:	0020                	addi	s0,sp,8
    16e2:	ffe0                	sd	s0,248(a5)
    16e4:	ffff                	0xffff
    16e6:	0158                	addi	a4,sp,132
    16e8:	0000                	unimp
    16ea:	0000                	unimp
    16ec:	0000                	unimp
    16ee:	9c01                	subw	s0,s0,s0
    16f0:	0362                	slli	t1,t1,0x18
    16f2:	0000                	unimp
    16f4:	3901                	addiw	s2,s2,-32
    16f6:	7f000003          	lb	zero,2032(zero) # 7f0 <BASE_ADDR-0xffffffe0001ff810>
    16fa:	5118                	lw	a4,32(a0)
    16fc:	0002                	c.slli64	zero
    16fe:	0300                	addi	s0,sp,384
    1700:	9891                	andi	s1,s1,-28
    1702:	017f                	0x17f
    1704:	04ac                	addi	a1,sp,584
    1706:	0000                	unimp
    1708:	2b7f                	0x2b7f
    170a:	002a                	c.slli	zero,0xa
    170c:	0000                	unimp
    170e:	7f909103          	lh	sp,2041(ra)
    1712:	7201                	lui	tp,0xfffe0
    1714:	0005                	c.nop	1
    1716:	7f00                	ld	s0,56(a4)
    1718:	2a3a                	fld	fs4,392(sp)
    171a:	0000                	unimp
    171c:	0300                	addi	s0,sp,384
    171e:	8891                	andi	s1,s1,4
    1720:	017f                	0x17f
    1722:	04c1                	addi	s1,s1,16
    1724:	0000                	unimp
    1726:	477f                	0x477f
    1728:	002a                	c.slli	zero,0xa
    172a:	0000                	unimp
    172c:	7f809103          	lh	sp,2040(ra)
    1730:	4401                	li	s0,0
    1732:	0004                	0x4
    1734:	7f00                	ld	s0,56(a4)
    1736:	2a56                	fld	fs4,336(sp)
    1738:	0000                	unimp
    173a:	0300                	addi	s0,sp,384
    173c:	f891                	bnez	s1,1650 <BASE_ADDR-0xffffffe0001fe9b0>
    173e:	0c7e                	slli	s8,s8,0x1f
    1740:	1d0c                	addi	a1,sp,688
    1742:	0020                	addi	s0,sp,8
    1744:	ffe0                	sd	s0,248(a5)
    1746:	ffff                	0xffff
    1748:	00e4                	addi	s1,sp,76
    174a:	0000                	unimp
    174c:	0000                	unimp
    174e:	0000                	unimp
    1750:	7602                	ld	a2,32(sp)
    1752:	6e70                	ld	a2,216(a2)
    1754:	8200                	0x8200
    1756:	620a                	ld	tp,128(sp)
    1758:	03000003          	lb	zero,48(zero) # 30 <BASE_ADDR-0xffffffe0001fffd0>
    175c:	a891                	j	17b0 <BASE_ADDR-0xffffffe0001fe850>
    175e:	027f                	0x27f
    1760:	6d74                	ld	a3,216(a0)
    1762:	0070                	addi	a2,sp,12
    1764:	1282                	slli	t0,t0,0x20
    1766:	002a                	c.slli	zero,0xa
    1768:	0000                	unimp
    176a:	9102                	jalr	sp
    176c:	0758                	addi	a4,sp,900
    176e:	0000030f          	0x30f
    1772:	02510b83          	lb	s7,37(sp) # d589 <BASE_ADDR-0xffffffe0001f2a77>
    1776:	0000                	unimp
    1778:	9102                	jalr	sp
    177a:	1f50                	addi	a2,sp,948
    177c:	1d20                	addi	s0,sp,696
    177e:	0020                	addi	s0,sp,8
    1780:	ffe0                	sd	s0,248(a5)
    1782:	ffff                	0xffff
    1784:	004c                	addi	a1,sp,4
    1786:	0000                	unimp
    1788:	0000                	unimp
    178a:	0000                	unimp
    178c:	0322                	slli	t1,t1,0x8
    178e:	0000                	unimp
    1790:	6a02                	ld	s4,0(sp)
    1792:	8400                	0x8400
    1794:	440c                	lw	a1,8(s0)
    1796:	0000                	unimp
    1798:	0200                	addi	s0,sp,256
    179a:	4c91                	li	s9,4
    179c:	0c00                	addi	s0,sp,528
    179e:	1d6c                	addi	a1,sp,700
    17a0:	0020                	addi	s0,sp,8
    17a2:	ffe0                	sd	s0,248(a5)
    17a4:	ffff                	0xffff
    17a6:	0058                	addi	a4,sp,4
    17a8:	0000                	unimp
    17aa:	0000                	unimp
    17ac:	0000                	unimp
    17ae:	6a02                	ld	s4,0(sp)
    17b0:	8500                	0x8500
    17b2:	440c                	lw	a1,8(s0)
    17b4:	0000                	unimp
    17b6:	0200                	addi	s0,sp,256
    17b8:	4891                	li	a7,4
    17ba:	780c                	ld	a1,48(s0)
    17bc:	201d                	0x201d
    17be:	e000                	sd	s0,0(s0)
    17c0:	ffff                	0xffff
    17c2:	34ff                	0x34ff
    17c4:	0000                	unimp
    17c6:	0000                	unimp
    17c8:	0000                	unimp
    17ca:	0200                	addi	s0,sp,256
    17cc:	7470                	ld	a2,232(s0)
    17ce:	0065                	c.nop	25
    17d0:	0b86                	slli	s7,s7,0x1
    17d2:	002a                	c.slli	zero,0xa
    17d4:	0000                	unimp
    17d6:	9102                	jalr	sp
    17d8:	0040                	addi	s0,sp,4
    17da:	0000                	unimp
    17dc:	0b00                	addi	s0,sp,400
    17de:	002a                	c.slli	zero,0xa
    17e0:	0000                	unimp
    17e2:	0372                	slli	t1,t1,0x1c
    17e4:	0000                	unimp
    17e6:	3620                	fld	fs0,104(a2)
    17e8:	0000                	unimp
    17ea:	0200                	addi	s0,sp,256
    17ec:	1300                	addi	s0,sp,416
    17ee:	04c8                	addi	a0,sp,580
    17f0:	0000                	unimp
    17f2:	00002a6b          	0x2a6b
    17f6:	4000                	lw	s0,0(s0)
    17f8:	201c                	fld	fa5,0(s0)
    17fa:	e000                	sd	s0,0(s0)
    17fc:	ffff                	0xffff
    17fe:	a0ff                	0xa0ff
    1800:	0000                	unimp
    1802:	0000                	unimp
    1804:	0000                	unimp
    1806:	0100                	addi	s0,sp,128
    1808:	d79c                	sw	a5,40(a5)
    180a:	01000003          	lb	zero,16(zero) # 10 <BASE_ADDR-0xffffffe0001ffff0>
    180e:	0000030f          	0x30f
    1812:	0251346b          	0x251346b
    1816:	0000                	unimp
    1818:	9102                	jalr	sp
    181a:	0348                	addi	a0,sp,388
    181c:	6469                	lui	s0,0x1a
    181e:	0078                	addi	a4,sp,12
    1820:	002a426b          	0x2a426b
    1824:	0000                	unimp
    1826:	9102                	jalr	sp
    1828:	0240                	addi	s0,sp,260
    182a:	6176                	ld	sp,344(sp)
    182c:	6f00                	ld	s0,24(a4)
    182e:	2a09                	addiw	s4,s4,2
    1830:	0000                	unimp
    1832:	0200                	addi	s0,sp,256
    1834:	6891                	lui	a7,0x4
    1836:	7002                	0x7002
    1838:	0061                	c.nop	24
    183a:	002a186f          	jal	a6,a283c <BASE_ADDR-0xffffffe00015d7c4>
    183e:	0000                	unimp
    1840:	9102                	jalr	sp
    1842:	0260                	addi	s0,sp,268
    1844:	7470                	ld	a2,232(s0)
    1846:	0065                	c.nop	25
    1848:	0970                	addi	a2,sp,156
    184a:	002a                	c.slli	zero,0xa
    184c:	0000                	unimp
    184e:	9102                	jalr	sp
    1850:	0058                	addi	a4,sp,4
    1852:	ee11                	bnez	a2,186e <BASE_ADDR-0xffffffe0001fe792>
    1854:	0004                	0x4
    1856:	6400                	ld	s0,8(s0)
    1858:	1be0                	addi	s0,sp,508
    185a:	0020                	addi	s0,sp,8
    185c:	ffe0                	sd	s0,248(a5)
    185e:	ffff                	0xffff
    1860:	0060                	addi	s0,sp,12
    1862:	0000                	unimp
    1864:	0000                	unimp
    1866:	0000                	unimp
    1868:	9c01                	subw	s0,s0,s0
    186a:	0000040f          	0x40f
    186e:	7002                	0x7002
    1870:	0061                	c.nop	24
    1872:	0966                	slli	s2,s2,0x19
    1874:	002a                	c.slli	zero,0xa
    1876:	0000                	unimp
    1878:	9102                	jalr	sp
    187a:	0268                	addi	a0,sp,268
    187c:	6176                	ld	sp,344(sp)
    187e:	0032                	c.slli	zero,0xc
    1880:	002a0967          	jalr	s2,2(s4)
    1884:	0000                	unimp
    1886:	9102                	jalr	sp
    1888:	0060                	addi	s0,sp,12
    188a:	a112                	fsd	ft4,128(sp)
    188c:	0004                	0x4
    188e:	5f00                	lw	s0,56(a4)
    1890:	1b74                	addi	a3,sp,444
    1892:	0020                	addi	s0,sp,8
    1894:	ffe0                	sd	s0,248(a5)
    1896:	ffff                	0xffff
    1898:	006c                	addi	a1,sp,12
    189a:	0000                	unimp
    189c:	0000                	unimp
    189e:	0000                	unimp
    18a0:	9c01                	subw	s0,s0,s0
    18a2:	0462                	slli	s0,s0,0x18
    18a4:	0000                	unimp
    18a6:	00617603          	0x617603
    18aa:	1e5f 002a 0000      	0x2a1e5f
    18b0:	9102                	jalr	sp
    18b2:	0358                	addi	a4,sp,388
    18b4:	6170                	ld	a2,192(a0)
    18b6:	5f00                	lw	s0,56(a4)
    18b8:	2a29                	addiw	s4,s4,10
    18ba:	0000                	unimp
    18bc:	0200                	addi	s0,sp,256
    18be:	5091                	li	ra,-28
    18c0:	4401                	li	s0,0
    18c2:	0004                	0x4
    18c4:	5f00                	lw	s0,56(a4)
    18c6:	2a34                	fld	fa3,80(a2)
    18c8:	0000                	unimp
    18ca:	0200                	addi	s0,sp,256
    18cc:	4891                	li	a7,4
    18ce:	7002                	0x7002
    18d0:	6574                	ld	a3,200(a0)
    18d2:	6000                	ld	s0,0(s0)
    18d4:	2a0c                	fld	fa1,16(a2)
    18d6:	0000                	unimp
    18d8:	0200                	addi	s0,sp,256
    18da:	6891                	lui	a7,0x4
    18dc:	1400                	addi	s0,sp,544
    18de:	0495                	addi	s1,s1,5
    18e0:	0000                	unimp
    18e2:	2a5a                	fld	fs4,400(sp)
    18e4:	0000                	unimp
    18e6:	2800                	fld	fs0,16(s0)
    18e8:	e000201b          	0xe000201b
    18ec:	ffff                	0xffff
    18ee:	4cff                	0x4cff
    18f0:	0000                	unimp
    18f2:	0000                	unimp
    18f4:	0000                	unimp
    18f6:	0100                	addi	s0,sp,128
    18f8:	ac9c                	fsd	fa5,24(s1)
    18fa:	0004                	0x4
    18fc:	0300                	addi	s0,sp,384
    18fe:	6170                	ld	a2,192(a0)
    1900:	5a00                	lw	s0,48(a2)
    1902:	2a22                	fld	fs4,8(sp)
    1904:	0000                	unimp
    1906:	0200                	addi	s0,sp,256
    1908:	5891                	li	a7,-28
    190a:	4401                	li	s0,0
    190c:	0004                	0x4
    190e:	5a00                	lw	s0,48(a2)
    1910:	2a2d                	addiw	s4,s4,11
    1912:	0000                	unimp
    1914:	0200                	addi	s0,sp,256
    1916:	5091                	li	ra,-28
    1918:	7002                	0x7002
    191a:	6e70                	ld	a2,216(a2)
    191c:	5b00                	lw	s0,48(a4)
    191e:	2a09                	addiw	s4,s4,2
    1920:	0000                	unimp
    1922:	0200                	addi	s0,sp,256
    1924:	6891                	lui	a7,0x4
    1926:	1300                	addi	s0,sp,416
    1928:	0484                	addi	s1,sp,576
    192a:	0000                	unimp
    192c:	2a56                	fld	fs4,336(sp)
    192e:	0000                	unimp
    1930:	e800                	sd	s0,16(s0)
    1932:	201a                	fld	ft0,384(sp)
    1934:	e000                	sd	s0,0(s0)
    1936:	ffff                	0xffff
    1938:	40ff                	0x40ff
    193a:	0000                	unimp
    193c:	0000                	unimp
    193e:	0000                	unimp
    1940:	0100                	addi	s0,sp,128
    1942:	db9c                	sw	a5,48(a5)
    1944:	0004                	0x4
    1946:	0300                	addi	s0,sp,384
    1948:	7470                	ld	a2,232(s0)
    194a:	0065                	c.nop	25
    194c:	2056                	fld	ft0,336(sp)
    194e:	002a                	c.slli	zero,0xa
    1950:	0000                	unimp
    1952:	9102                	jalr	sp
    1954:	0068                	addi	a0,sp,12
    1956:	5614                	lw	a3,40(a2)
    1958:	0005                	c.nop	1
    195a:	5200                	lw	s0,32(a2)
    195c:	002a                	c.slli	zero,0xa
    195e:	0000                	unimp
    1960:	1ab0                	addi	a2,sp,376
    1962:	0020                	addi	s0,sp,8
    1964:	ffe0                	sd	s0,248(a5)
    1966:	ffff                	0xffff
    1968:	0038                	addi	a4,sp,8
    196a:	0000                	unimp
    196c:	0000                	unimp
    196e:	0000                	unimp
    1970:	9c01                	subw	s0,s0,s0
    1972:	050a                	slli	a0,a0,0x2
    1974:	0000                	unimp
    1976:	65747003          	0x65747003
    197a:	5200                	lw	s0,32(a2)
    197c:	2a20                	fld	fs0,80(a2)
    197e:	0000                	unimp
    1980:	0200                	addi	s0,sp,256
    1982:	6891                	lui	a7,0x4
    1984:	0900                	addi	s0,sp,144
    1986:	0434                	addi	a3,sp,520
    1988:	0000                	unimp
    198a:	084a                	slli	a6,a6,0x12
    198c:	002a                	c.slli	zero,0xa
    198e:	0000                	unimp
    1990:	1a40                	addi	s0,sp,308
    1992:	0020                	addi	s0,sp,8
    1994:	ffe0                	sd	s0,248(a5)
    1996:	ffff                	0xffff
    1998:	0070                	addi	a2,sp,12
    199a:	0000                	unimp
    199c:	0000                	unimp
    199e:	0000                	unimp
    19a0:	9c01                	subw	s0,s0,s0
    19a2:	0548                	addi	a0,sp,644
    19a4:	0000                	unimp
    19a6:	ff01                	bnez	a4,18be <BASE_ADDR-0xffffffe0001fe742>
    19a8:	4a000003          	lb	zero,1184(zero) # 4a0 <BASE_ADDR-0xffffffe0001ffb60>
    19ac:	2a25                	addiw	s4,s4,9
    19ae:	0000                	unimp
    19b0:	0200                	addi	s0,sp,256
    19b2:	5891                	li	a7,-28
    19b4:	7202                	ld	tp,32(sp)
    19b6:	7465                	lui	s0,0xffff9
    19b8:	4b00                	lw	s0,16(a4)
    19ba:	2a0c                	fld	fa1,16(a2)
    19bc:	0000                	unimp
    19be:	0200                	addi	s0,sp,256
    19c0:	6891                	lui	a7,0x4
    19c2:	0900                	addi	s0,sp,144
    19c4:	041c                	addi	a5,sp,512
    19c6:	0000                	unimp
    19c8:	0846                	slli	a6,a6,0x11
    19ca:	002a                	c.slli	zero,0xa
    19cc:	0000                	unimp
    19ce:	1a10                	addi	a2,sp,304
    19d0:	0020                	addi	s0,sp,8
    19d2:	ffe0                	sd	s0,248(a5)
    19d4:	ffff                	0xffff
    19d6:	0030                	addi	a2,sp,8
    19d8:	0000                	unimp
    19da:	0000                	unimp
    19dc:	0000                	unimp
    19de:	9c01                	subw	s0,s0,s0
    19e0:	00000577          	0x577
    19e4:	00617003          	0x617003
    19e8:	1846                	slli	a6,a6,0x31
    19ea:	002a                	c.slli	zero,0xa
    19ec:	0000                	unimp
    19ee:	9102                	jalr	sp
    19f0:	0068                	addi	a0,sp,12
    19f2:	9a09                	andi	a2,a2,-30
    19f4:	0001                	nop
    19f6:	4200                	lw	s0,0(a2)
    19f8:	2a08                	fld	fa0,16(a2)
    19fa:	0000                	unimp
    19fc:	e000                	sd	s0,0(s0)
    19fe:	2019                	0x2019
    1a00:	e000                	sd	s0,0(s0)
    1a02:	ffff                	0xffff
    1a04:	30ff                	0x30ff
    1a06:	0000                	unimp
    1a08:	0000                	unimp
    1a0a:	0000                	unimp
    1a0c:	0100                	addi	s0,sp,128
    1a0e:	a69c                	fsd	fa5,8(a3)
    1a10:	0005                	c.nop	1
    1a12:	0300                	addi	s0,sp,384
    1a14:	6176                	ld	sp,344(sp)
    1a16:	4200                	lw	s0,0(a2)
    1a18:	2a18                	fld	fa4,16(a2)
    1a1a:	0000                	unimp
    1a1c:	0200                	addi	s0,sp,256
    1a1e:	6891                	lui	a7,0x4
    1a20:	1500                	addi	s0,sp,672
    1a22:	0502                	c.slli64	a0
    1a24:	0000                	unimp
    1a26:	2a34                	fld	fa3,80(a2)
    1a28:	0000                	unimp
    1a2a:	7400                	ld	s0,40(s0)
    1a2c:	2019                	0x2019
    1a2e:	e000                	sd	s0,0(s0)
    1a30:	ffff                	0xffff
    1a32:	6cff                	0x6cff
    1a34:	0000                	unimp
    1a36:	0000                	unimp
    1a38:	0000                	unimp
    1a3a:	0100                	addi	s0,sp,128
    1a3c:	ee9c                	sd	a5,24(a3)
    1a3e:	0005                	c.nop	1
    1a40:	0300                	addi	s0,sp,384
    1a42:	6d6d                	lui	s10,0x1b
    1a44:	3400                	fld	fs0,40(s0)
    1a46:	b72c                	fsd	fa1,104(a4)
    1a48:	0000                	unimp
    1a4a:	0200                	addi	s0,sp,256
    1a4c:	5891                	li	a7,-28
    1a4e:	7701                	lui	a4,0xfffe0
    1a50:	0005                	c.nop	1
    1a52:	3400                	fld	fs0,40(s0)
    1a54:	00002a37          	lui	s4,0x2
    1a58:	0200                	addi	s0,sp,256
    1a5a:	5091                	li	ra,-28
    1a5c:	6902                	ld	s2,0(sp)
    1a5e:	3500                	fld	fs0,40(a0)
    1a60:	2a0c                	fld	fa1,16(a2)
    1a62:	0000                	unimp
    1a64:	0200                	addi	s0,sp,256
    1a66:	6891                	lui	a7,0x4
    1a68:	1500                	addi	s0,sp,672
    1a6a:	021d                	addi	tp,tp,7
    1a6c:	0000                	unimp
    1a6e:	2a29                	addiw	s4,s4,10
    1a70:	0000                	unimp
    1a72:	a000                	fsd	fs0,0(s0)
    1a74:	2018                	fld	fa4,0(s0)
    1a76:	e000                	sd	s0,0(s0)
    1a78:	ffff                	0xffff
    1a7a:	d4ff                	0xd4ff
    1a7c:	0000                	unimp
    1a7e:	0000                	unimp
    1a80:	0000                	unimp
    1a82:	0100                	addi	s0,sp,128
    1a84:	529c                	lw	a5,32(a3)
    1a86:	0006                	c.slli	zero,0x1
    1a88:	0300                	addi	s0,sp,384
    1a8a:	6d6d                	lui	s10,0x1b
    1a8c:	2900                	fld	fs0,16(a0)
    1a8e:	b722                	fsd	fs0,424(sp)
    1a90:	0000                	unimp
    1a92:	0200                	addi	s0,sp,256
    1a94:	5891                	li	a7,-28
    1a96:	5801                	li	a6,-32
    1a98:	0001                	nop
    1a9a:	2900                	fld	fs0,16(a0)
    1a9c:	2a2d                	addiw	s4,s4,11
    1a9e:	0000                	unimp
    1aa0:	0200                	addi	s0,sp,256
    1aa2:	5091                	li	ra,-28
    1aa4:	7701                	lui	a4,0xfffe0
    1aa6:	0005                	c.nop	1
    1aa8:	2900                	fld	fs0,16(a0)
    1aaa:	2a3a                	fld	fs4,392(sp)
    1aac:	0000                	unimp
    1aae:	0200                	addi	s0,sp,256
    1ab0:	4891                	li	a7,4
    1ab2:	fd01                	bnez	a0,19ca <BASE_ADDR-0xffffffe0001fe636>
    1ab4:	0004                	0x4
    1ab6:	2900                	fld	fs0,16(a0)
    1ab8:	4446                	lw	s0,80(sp)
    1aba:	0000                	unimp
    1abc:	0200                	addi	s0,sp,256
    1abe:	4491                	li	s1,4
    1ac0:	7002                	0x7002
    1ac2:	2c00                	fld	fs0,24(s0)
    1ac4:	bc1c                	fsd	fa5,56(s0)
    1ac6:	0000                	unimp
    1ac8:	0200                	addi	s0,sp,256
    1aca:	6891                	lui	a7,0x4
    1acc:	2100                	fld	fs0,0(a0)
    1ace:	051d                	addi	a0,a0,7
    1ad0:	0000                	unimp
    1ad2:	1c01                	addi	s8,s8,-32
    1ad4:	0406                	slli	s0,s0,0x1
    1ad6:	2018                	fld	fa4,0(s0)
    1ad8:	e000                	sd	s0,0(s0)
    1ada:	ffff                	0xffff
    1adc:	9cff                	0x9cff
    1ade:	0000                	unimp
    1ae0:	0000                	unimp
    1ae2:	0000                	unimp
    1ae4:	0100                	addi	s0,sp,128
    1ae6:	969c                	0x969c
    1ae8:	0006                	c.slli	zero,0x1
    1aea:	0300                	addi	s0,sp,384
    1aec:	6d6d                	lui	s10,0x1b
    1aee:	1c00                	addi	s0,sp,560
    1af0:	b71f 0000 0200      	0x2000000b71f
    1af6:	5891                	li	a7,-28
    1af8:	1c007003          	0x1c007003
    1afc:	bc3a                	fsd	fa4,56(sp)
    1afe:	0000                	unimp
    1b00:	0200                	addi	s0,sp,256
    1b02:	5091                	li	ra,-28
    1b04:	7802                	ld	a6,32(sp)
    1b06:	2200                	fld	fs0,0(a2)
    1b08:	bc1c                	fsd	fa5,56(s0)
    1b0a:	0000                	unimp
    1b0c:	0200                	addi	s0,sp,256
    1b0e:	6891                	lui	a7,0x4
    1b10:	0900                	addi	s0,sp,144
    1b12:	053c                	addi	a5,sp,648
    1b14:	0000                	unimp
    1b16:	0514                	addi	a3,sp,640
    1b18:	0044                	addi	s1,sp,4
    1b1a:	0000                	unimp
    1b1c:	178c                	addi	a1,sp,992
    1b1e:	0020                	addi	s0,sp,8
    1b20:	ffe0                	sd	s0,248(a5)
    1b22:	ffff                	0xffff
    1b24:	0078                	addi	a4,sp,12
    1b26:	0000                	unimp
    1b28:	0000                	unimp
    1b2a:	0000                	unimp
    1b2c:	9c01                	subw	s0,s0,s0
    1b2e:	06e9                	addi	a3,a3,26
    1b30:	0000                	unimp
    1b32:	006d6d03          	lwu	s10,6(s10) # 1b006 <BASE_ADDR-0xffffffe0001e4ffa>
    1b36:	2114                	fld	fa3,0(a0)
    1b38:	000000b7          	lui	ra,0x0
    1b3c:	9102                	jalr	sp
    1b3e:	0358                	addi	a4,sp,388
    1b40:	006c                	addi	a1,sp,12
    1b42:	2c14                	fld	fa3,24(s0)
    1b44:	002a                	c.slli	zero,0xa
    1b46:	0000                	unimp
    1b48:	9102                	jalr	sp
    1b4a:	0350                	addi	a2,sp,388
    1b4c:	0072                	c.slli	zero,0x1c
    1b4e:	3614                	fld	fa3,40(a2)
    1b50:	002a                	c.slli	zero,0xa
    1b52:	0000                	unimp
    1b54:	9102                	jalr	sp
    1b56:	0248                	addi	a0,sp,260
    1b58:	0070                	addi	a2,sp,12
    1b5a:	1c15                	addi	s8,s8,-27
    1b5c:	00bc                	addi	a5,sp,72
    1b5e:	0000                	unimp
    1b60:	9102                	jalr	sp
    1b62:	0068                	addi	a0,sp,12
    1b64:	6922                	ld	s2,8(sp)
    1b66:	0004                	0x4
    1b68:	0100                	addi	s0,sp,128
    1b6a:	00bc180b          	0xbc180b
    1b6e:	0000                	unimp
    1b70:	1718                	addi	a4,sp,928
    1b72:	0020                	addi	s0,sp,8
    1b74:	ffe0                	sd	s0,248(a5)
    1b76:	ffff                	0xffff
    1b78:	0074                	addi	a3,sp,12
    1b7a:	0000                	unimp
    1b7c:	0000                	unimp
    1b7e:	0000                	unimp
    1b80:	9c01                	subw	s0,s0,s0
    1b82:	006d6d03          	lwu	s10,6(s10)
    1b86:	00b7330b          	0xb7330b
    1b8a:	0000                	unimp
    1b8c:	9102                	jalr	sp
    1b8e:	0158                	addi	a4,sp,132
    1b90:	0158                	addi	a4,sp,132
    1b92:	0000                	unimp
    1b94:	002a3e0b          	0x2a3e0b
    1b98:	0000                	unimp
    1b9a:	9102                	jalr	sp
    1b9c:	0250                	addi	a2,sp,260
    1b9e:	0070                	addi	a2,sp,12
    1ba0:	1c0c                	addi	a1,sp,560
    1ba2:	00bc                	addi	a5,sp,72
    1ba4:	0000                	unimp
    1ba6:	9102                	jalr	sp
    1ba8:	0068                	addi	a0,sp,12
    1baa:	9f00                	0x9f00
    1bac:	0000                	unimp
    1bae:	0500                	addi	s0,sp,640
    1bb0:	0100                	addi	s0,sp,128
    1bb2:	8f08                	0x8f08
    1bb4:	0400000b          	0x400000b
    1bb8:	0025                	c.nop	9
    1bba:	0000                	unimp
    1bbc:	5d1d                	li	s10,-25
    1bbe:	0001                	nop
    1bc0:	3800                	fld	fs0,48(s0)
    1bc2:	0001                	nop
    1bc4:	6000                	ld	s0,0(s0)
    1bc6:	00000003          	lb	zero,0(zero) # 0 <BASE_ADDR-0xffffffe000200000>
    1bca:	0000                	unimp
    1bcc:	0000                	unimp
    1bce:	0000                	unimp
    1bd0:	ea00                	sd	s0,16(a2)
    1bd2:	001d                	c.nop	7
    1bd4:	0100                	addi	s0,sp,128
    1bd6:	0508                	addi	a0,sp,640
    1bd8:	0012                	c.slli	zero,0x4
    1bda:	0000                	unimp
    1bdc:	0801                	addi	a6,a6,0
    1bde:	00000007          	0x7
    1be2:	0500                	addi	s0,sp,640
    1be4:	0504                	addi	s1,sp,640
    1be6:	6e69                	lui	t3,0x1a
    1be8:	0074                	addi	a3,sp,12
    1bea:	00058b03          	lb	s6,0(a1)
    1bee:	0100                	addi	s0,sp,128
    1bf0:	0d05                	addi	s10,s10,1
    1bf2:	004d                	c.nop	19
    1bf4:	0000                	unimp
    1bf6:	0002                	c.slli64	zero
    1bf8:	00020b03          	lb	s6,0(tp) # fffffffffffe0000 <_ebss+0x1fffdd6060>
    1bfc:	0200                	addi	s0,sp,256
    1bfe:	063a                	slli	a2,a2,0xe
    1c00:	0000005b          	0x5b
    1c04:	0002                	c.slli64	zero
    1c06:	7f06                	ld	t5,96(sp)
    1c08:	0001                	nop
    1c0a:	0300                	addi	s0,sp,384
    1c0c:	0505                	addi	a0,a0,1
    1c0e:	0038                	addi	a4,sp,8
    1c10:	0000                	unimp
    1c12:	0072                	c.slli	zero,0x1c
    1c14:	0000                	unimp
    1c16:	00007207          	0x7207
    1c1a:	0200                	addi	s0,sp,256
    1c1c:	0800                	addi	s0,sp,16
    1c1e:	7f08                	ld	a0,56(a4)
    1c20:	0000                	unimp
    1c22:	0100                	addi	s0,sp,128
    1c24:	0801                	addi	a6,a6,0
    1c26:	05e9                	addi	a1,a1,26
    1c28:	0000                	unimp
    1c2a:	7809                	lui	a6,0xfffe2
    1c2c:	0000                	unimp
    1c2e:	0a00                	addi	s0,sp,272
    1c30:	057e                	slli	a0,a0,0x1f
    1c32:	0000                	unimp
    1c34:	0701                	addi	a4,a4,0
    1c36:	3805                	addiw	a6,a6,-31
    1c38:	0000                	unimp
    1c3a:	b800                	fsd	fs0,48(s0)
    1c3c:	201f e000 ffff      	0xffffe000201f
    1c42:	4cff                	0x4cff
    1c44:	0000                	unimp
    1c46:	0000                	unimp
    1c48:	0000                	unimp
    1c4a:	0100                	addi	s0,sp,128
    1c4c:	009c                	addi	a5,sp,64
    1c4e:	0095                	addi	ra,ra,5
    1c50:	0000                	unimp
    1c52:	0005                	c.nop	1
    1c54:	0801                	addi	a6,a6,0
    1c56:	0c18                	addi	a4,sp,528
    1c58:	0000                	unimp
    1c5a:	2504                	fld	fs1,8(a0)
    1c5c:	0000                	unimp
    1c5e:	1d00                	addi	s0,sp,688
    1c60:	0164                	addi	s1,sp,140
    1c62:	0000                	unimp
    1c64:	0138                	addi	a4,sp,136
    1c66:	0000                	unimp
    1c68:	037e                	slli	t1,t1,0x1f
	...
    1c72:	0000                	unimp
    1c74:	1e70                	addi	a2,sp,828
    1c76:	0000                	unimp
    1c78:	00120503          	lb	a0,1(tp) # 1 <BASE_ADDR-0xffffffe0001fffff>
    1c7c:	0000                	unimp
    1c7e:	00000703          	lb	a4,0(zero) # 0 <BASE_ADDR-0xffffffe000200000>
    1c82:	0000                	unimp
    1c84:	0405                	addi	s0,s0,1
    1c86:	6905                	lui	s2,0x1
    1c88:	746e                	ld	s0,248(sp)
    1c8a:	0600                	addi	s0,sp,768
    1c8c:	0000058b          	0x58b
    1c90:	0701                	addi	a4,a4,0
    1c92:	3605                	addiw	a2,a2,-31
    1c94:	0000                	unimp
    1c96:	0400                	addi	s0,sp,512
    1c98:	2020                	fld	fs0,64(s0)
    1c9a:	e000                	sd	s0,0(s0)
    1c9c:	ffff                	0xffff
    1c9e:	10ff                	0x10ff
    1ca0:	0000                	unimp
    1ca2:	0000                	unimp
    1ca4:	0000                	unimp
    1ca6:	0100                	addi	s0,sp,128
    1ca8:	019c                	addi	a5,sp,192
    1caa:	0078                	addi	a4,sp,12
    1cac:	090a                	slli	s2,s2,0x2
    1cae:	0036                	c.slli	zero,0xd
    1cb0:	0000                	unimp
    1cb2:	5401                	li	s0,-32
    1cb4:	0b00                	addi	s0,sp,400
    1cb6:	3609                	addiw	a2,a2,-30
    1cb8:	0000                	unimp
    1cba:	0200                	addi	s0,sp,256
    1cbc:	6901                	0x6901
    1cbe:	0c00                	addi	s0,sp,528
    1cc0:	360e                	fld	fa2,224(sp)
    1cc2:	0000                	unimp
    1cc4:	0200                	addi	s0,sp,256
    1cc6:	6a01                	0x6a01
    1cc8:	0d00                	addi	s0,sp,656
    1cca:	3612                	fld	fa2,288(sp)
    1ccc:	0000                	unimp
    1cce:	0200                	addi	s0,sp,256
    1cd0:	7901                	lui	s2,0xfffe0
    1cd2:	0e00                	addi	s0,sp,784
    1cd4:	3611                	addiw	a2,a2,-28
    1cd6:	0000                	unimp
    1cd8:	0100                	addi	s0,sp,128
    1cda:	007a                	c.slli	zero,0x1e
    1cdc:	0036110f          	0x36110f
    1ce0:	0000                	unimp
    1ce2:	0000                	unimp
    1ce4:	0000                	unimp
    1ce6:	b700                	fsd	fs0,40(a4)
    1ce8:	05000003          	lb	zero,80(zero) # 50 <BASE_ADDR-0xffffffe0001fffb0>
    1cec:	0100                	addi	s0,sp,128
    1cee:	7108                	ld	a0,32(a0)
    1cf0:	000c                	0xc
    1cf2:	0b00                	addi	s0,sp,400
    1cf4:	0025                	c.nop	9
    1cf6:	0000                	unimp
    1cf8:	8f1d                	sub	a4,a4,a5
    1cfa:	0001                	nop
    1cfc:	6b00                	ld	s0,16(a4)
    1cfe:	0001                	nop
    1d00:	9c00                	0x9c00
    1d02:	00000003          	lb	zero,0(zero) # 0 <BASE_ADDR-0xffffffe000200000>
    1d06:	0000                	unimp
    1d08:	0000                	unimp
    1d0a:	0000                	unimp
    1d0c:	c600                	sw	s0,8(a2)
    1d0e:	001e                	c.slli	zero,0x7
    1d10:	0700                	addi	s0,sp,896
    1d12:	0508                	addi	a0,sp,640
    1d14:	0012                	c.slli	zero,0x4
    1d16:	0000                	unimp
    1d18:	9a08                	0x9a08
    1d1a:	0005                	c.nop	1
    1d1c:	0200                	addi	s0,sp,256
    1d1e:	1704                	addi	s1,sp,928
    1d20:	003d                	c.nop	15
    1d22:	0000                	unimp
    1d24:	00070807          	0x70807
    1d28:	0000                	unimp
    1d2a:	0c00                	addi	s0,sp,528
    1d2c:	0504                	addi	s1,sp,640
    1d2e:	6e69                	lui	t3,0x1a
    1d30:	0074                	addi	a3,sp,12
    1d32:	b108                	fsd	fa0,32(a0)
    1d34:	0005                	c.nop	1
    1d36:	0200                	addi	s0,sp,256
    1d38:	1b0a                	slli	s6,s6,0x22
    1d3a:	00000057          	0x57
    1d3e:	080d                	addi	a6,a6,3
    1d40:	000005a7          	0x5a7
    1d44:	b908                	fsd	fa0,48(a0)
    1d46:	0000                	unimp
    1d48:	0300                	addi	s0,sp,384
    1d4a:	1704                	addi	s1,sp,928
    1d4c:	003d                	c.nop	15
    1d4e:	0000                	unimp
    1d50:	ef0e                	sd	gp,408(sp)
    1d52:	0000                	unimp
    1d54:	1000                	addi	s0,sp,32
    1d56:	0804                	addi	s1,sp,16
    1d58:	8d08                	0x8d08
    1d5a:	0000                	unimp
    1d5c:	0900                	addi	s0,sp,144
    1d5e:	00c0                	addi	s0,sp,68
    1d60:	0000                	unimp
    1d62:	2a09                	addiw	s4,s4,2
    1d64:	0000                	unimp
    1d66:	0000                	unimp
    1d68:	b309                	j	1a6a <BASE_ADDR-0xffffffe0001fe596>
    1d6a:	0000                	unimp
    1d6c:	0a00                	addi	s0,sp,272
    1d6e:	002a                	c.slli	zero,0xa
    1d70:	0000                	unimp
    1d72:	0008                	0x8
    1d74:	00001b0f          	0x1b0f
    1d78:	0400                	addi	s0,sp,512
    1d7a:	0f0d                	addi	t5,t5,3
    1d7c:	0069                	c.nop	26
    1d7e:	0000                	unimp
    1d80:	00c6                	slli	ra,ra,0x11
    1d82:	0000                	unimp
    1d84:	4402                	lw	s0,0(sp)
    1d86:	0000                	unimp
    1d88:	0200                	addi	s0,sp,256
    1d8a:	0044                	addi	s1,sp,4
    1d8c:	0000                	unimp
    1d8e:	5d02                	lw	s10,32(sp)
    1d90:	0000                	unimp
    1d92:	0200                	addi	s0,sp,256
    1d94:	005d                	c.nop	23
    1d96:	0000                	unimp
    1d98:	5d02                	lw	s10,32(sp)
    1d9a:	0000                	unimp
    1d9c:	0200                	addi	s0,sp,256
    1d9e:	005d                	c.nop	23
    1da0:	0000                	unimp
    1da2:	5d02                	lw	s10,32(sp)
    1da4:	0000                	unimp
    1da6:	0200                	addi	s0,sp,256
    1da8:	005d                	c.nop	23
    1daa:	0000                	unimp
    1dac:	1000                	addi	s0,sp,32
    1dae:	017f                	0x17f
    1db0:	0000                	unimp
    1db2:	6a01                	0x6a01
    1db4:	4405                	li	s0,1
    1db6:	0000                	unimp
    1db8:	4000                	lw	s0,0(s0)
    1dba:	2025                	0x2025
    1dbc:	e000                	sd	s0,0(s0)
    1dbe:	ffff                	0xffff
    1dc0:	80ff                	0x80ff
    1dc2:	0000                	unimp
    1dc4:	0000                	unimp
    1dc6:	0000                	unimp
    1dc8:	0100                	addi	s0,sp,128
    1dca:	149c                	addi	a5,sp,608
    1dcc:	0001                	nop
    1dce:	0600                	addi	s0,sp,768
    1dd0:	186a0073          	0x186a0073
    1dd4:	0114                	addi	a3,sp,128
    1dd6:	0000                	unimp
    1dd8:	7f989103          	lh	sp,2041(a7) # 47f9 <BASE_ADDR-0xffffffe0001fb807>
    1ddc:	0111                	addi	sp,sp,4
    1dde:	6572                	ld	a0,280(sp)
    1de0:	096b0073          	0x96b0073
    1de4:	0044                	addi	s1,sp,4
    1de6:	0000                	unimp
    1de8:	7fac9103          	lh	sp,2042(s9) # 47fa <BASE_ADDR-0xffffffe0001fb806>
    1dec:	7601                	lui	a2,0xfffe0
    1dee:	006c                	addi	a1,sp,12
    1df0:	0d6c                	addi	a1,sp,668
    1df2:	0000004b          	fnmsub.s	ft0,ft0,ft0,ft0,rne
    1df6:	7fa09103          	lh	sp,2042(ra) # 7fa <BASE_ADDR-0xffffffe0001ff806>
    1dfa:	0a00                	addi	s0,sp,272
    1dfc:	0120                	addi	s0,sp,136
    1dfe:	0000                	unimp
    1e00:	e9080107          	0xe9080107
    1e04:	0005                	c.nop	1
    1e06:	1200                	addi	s0,sp,288
    1e08:	0119                	addi	sp,sp,6
    1e0a:	0000                	unimp
    1e0c:	0005b913          	sltiu	s2,a1,0
    1e10:	0100                	addi	s0,sp,128
    1e12:	0c08                	addi	a0,sp,528
    1e14:	0044                	addi	s1,sp,4
    1e16:	0000                	unimp
    1e18:	2064                	fld	fs1,192(s0)
    1e1a:	0020                	addi	s0,sp,8
    1e1c:	ffe0                	sd	s0,248(a5)
    1e1e:	ffff                	0xffff
    1e20:	04dc                	addi	a5,sp,580
    1e22:	0000                	unimp
    1e24:	0000                	unimp
    1e26:	0000                	unimp
    1e28:	9c01                	subw	s0,s0,s0
    1e2a:	00000373          	0x373
    1e2e:	a114                	fsd	fa3,0(a0)
    1e30:	0005                	c.nop	1
    1e32:	0100                	addi	s0,sp,128
    1e34:	1c08                	addi	a0,sp,560
    1e36:	037e                	slli	t1,t1,0x1f
    1e38:	0000                	unimp
    1e3a:	7eb89103          	lh	sp,2027(a7)
    1e3e:	6606                	ld	a2,64(sp)
    1e40:	746d                	lui	s0,0xffffb
    1e42:	0800                	addi	s0,sp,16
    1e44:	1436                	slli	s0,s0,0x2d
    1e46:	0001                	nop
    1e48:	0300                	addi	s0,sp,384
    1e4a:	b091                	j	168e <BASE_ADDR-0xffffffe0001fe972>
    1e4c:	067e                	slli	a2,a2,0x1f
    1e4e:	6c76                	ld	s8,344(sp)
    1e50:	0800                	addi	s0,sp,16
    1e52:	00004b43          	fmadd.s	fs6,ft0,ft0,ft0,rmm
    1e56:	0300                	addi	s0,sp,384
    1e58:	a891                	j	1eac <BASE_ADDR-0xffffffe0001fe154>
    1e5a:	037e                	slli	t1,t1,0x1f
    1e5c:	05cc                	addi	a1,sp,708
    1e5e:	0000                	unimp
    1e60:	0909                	addi	s2,s2,2
    1e62:	0044                	addi	s1,sp,4
    1e64:	0000                	unimp
    1e66:	9102                	jalr	sp
    1e68:	036c                	addi	a1,sp,396
    1e6a:	05de                	slli	a1,a1,0x17
    1e6c:	0000                	unimp
    1e6e:	1809                	addi	a6,a6,-30
    1e70:	0044                	addi	s1,sp,4
    1e72:	0000                	unimp
    1e74:	9102                	jalr	sp
    1e76:	0168                	addi	a0,sp,140
    1e78:	6f70                	ld	a2,216(a4)
    1e7a:	0c0a0073          	0xc0a0073
    1e7e:	0031                	c.nop	12
    1e80:	0000                	unimp
    1e82:	9102                	jalr	sp
    1e84:	0460                	addi	s0,sp,524
    1e86:	20f4                	fld	fa3,192(s1)
    1e88:	0020                	addi	s0,sp,8
    1e8a:	ffe0                	sd	s0,248(a5)
    1e8c:	ffff                	0xffff
    1e8e:	00f4                	addi	a3,sp,76
    1e90:	0000                	unimp
    1e92:	0000                	unimp
    1e94:	0000                	unimp
    1e96:	0222                	slli	tp,tp,0x8
    1e98:	0000                	unimp
    1e9a:	6e01                	0x6e01
    1e9c:	6d75                	lui	s10,0x1d
    1e9e:	1400                	addi	s0,sp,544
    1ea0:	2a1a                	fld	fs4,384(sp)
    1ea2:	0000                	unimp
    1ea4:	0300                	addi	s0,sp,384
    1ea6:	9891                	andi	s1,s1,-28
    1ea8:	037f                	0x37f
    1eaa:	0590                	addi	a2,sp,704
    1eac:	0000                	unimp
    1eae:	1916                	slli	s2,s2,0x25
    1eb0:	0044                	addi	s1,sp,4
    1eb2:	0000                	unimp
    1eb4:	7f949103          	lh	sp,2041(s1)
    1eb8:	4405                	li	s0,1
    1eba:	2021                	0x2021
    1ebc:	e000                	sd	s0,0(s0)
    1ebe:	ffff                	0xffff
    1ec0:	98ff                	0x98ff
    1ec2:	0000                	unimp
    1ec4:	0000                	unimp
    1ec6:	0000                	unimp
    1ec8:	0300                	addi	s0,sp,384
    1eca:	000005c3          	fmadd.s	fa1,ft0,ft0,ft0,rne
    1ece:	00441d17          	auipc	s10,0x441
    1ed2:	0000                	unimp
    1ed4:	9102                	jalr	sp
    1ed6:	055c                	addi	a5,sp,644
    1ed8:	2150                	fld	fa2,128(a0)
    1eda:	0020                	addi	s0,sp,8
    1edc:	ffe0                	sd	s0,248(a5)
    1ede:	ffff                	0xffff
    1ee0:	0074                	addi	a3,sp,12
    1ee2:	0000                	unimp
    1ee4:	0000                	unimp
    1ee6:	0000                	unimp
    1ee8:	6801                	0x6801
    1eea:	7865                	lui	a6,0xffff9
    1eec:	1800                	addi	s0,sp,48
    1eee:	441d                	li	s0,7
    1ef0:	0000                	unimp
    1ef2:	0300                	addi	s0,sp,384
    1ef4:	9091                	srli	s1,s1,0x24
    1ef6:	037f                	0x37f
    1ef8:	05d6                	slli	a1,a1,0x15
    1efa:	0000                	unimp
    1efc:	1e19                	addi	t3,t3,-26
    1efe:	0119                	addi	sp,sp,6
    1f00:	0000                	unimp
    1f02:	7f8f9103          	lh	sp,2040(t6)
    1f06:	0000                	unimp
    1f08:	0400                	addi	s0,sp,512
    1f0a:	21e8                	fld	fa0,192(a1)
    1f0c:	0020                	addi	s0,sp,8
    1f0e:	ffe0                	sd	s0,248(a5)
    1f10:	ffff                	0xffff
    1f12:	0138                	addi	a4,sp,136
    1f14:	0000                	unimp
    1f16:	0000                	unimp
    1f18:	0000                	unimp
    1f1a:	02a6                	slli	t0,t0,0x9
    1f1c:	0000                	unimp
    1f1e:	6e01                	0x6e01
    1f20:	6d75                	lui	s10,0x1d
    1f22:	2200                	fld	fs0,0(a2)
    1f24:	2a1a                	fld	fs4,384(sp)
    1f26:	0000                	unimp
    1f28:	0200                	addi	s0,sp,256
    1f2a:	5091                	li	ra,-28
    1f2c:	0005ee03          	lwu	t3,0(a1)
    1f30:	2700                	fld	fs0,8(a4)
    1f32:	4419                	li	s0,6
    1f34:	0000                	unimp
    1f36:	0200                	addi	s0,sp,256
    1f38:	4c91                	li	s9,4
    1f3a:	0005e603          	lwu	a2,0(a1)
    1f3e:	2800                	fld	fs0,16(s0)
    1f40:	831a                	mv	t1,t1
    1f42:	03000003          	lb	zero,48(zero) # 30 <BASE_ADDR-0xffffffe0001fffd0>
    1f46:	e091                	bnez	s1,1f4a <BASE_ADDR-0xffffffe0001fe0b6>
    1f48:	047e                	slli	s0,s0,0x1f
    1f4a:	2260                	fld	fs0,192(a2)
    1f4c:	0020                	addi	s0,sp,8
    1f4e:	ffe0                	sd	s0,248(a5)
    1f50:	ffff                	0xffff
    1f52:	0058                	addi	a4,sp,4
    1f54:	0000                	unimp
    1f56:	0000                	unimp
    1f58:	0000                	unimp
    1f5a:	0286                	slli	t0,t0,0x1
    1f5c:	0000                	unimp
    1f5e:	7401                	lui	s0,0xfffe0
    1f60:	706d                	c.lui	zero,0xffffb
    1f62:	2900                	fld	fs0,16(a0)
    1f64:	2a1f 0000 0200      	0x20000002a1f
    1f6a:	4091                	li	ra,4
    1f6c:	0500                	addi	s0,sp,640
    1f6e:	22b8                	fld	fa4,64(a3)
    1f70:	0020                	addi	s0,sp,8
    1f72:	ffe0                	sd	s0,248(a5)
    1f74:	ffff                	0xffff
    1f76:	0040                	addi	s0,sp,4
    1f78:	0000                	unimp
    1f7a:	0000                	unimp
    1f7c:	0000                	unimp
    1f7e:	6901                	0x6901
    1f80:	2e00                	fld	fs0,24(a2)
    1f82:	441e                	lw	s0,196(sp)
    1f84:	0000                	unimp
    1f86:	0300                	addi	s0,sp,384
    1f88:	bc91                	j	19dc <BASE_ADDR-0xffffffe0001fe624>
    1f8a:	007f                	0x7f
    1f8c:	0400                	addi	s0,sp,512
    1f8e:	2320                	fld	fs0,64(a4)
    1f90:	0020                	addi	s0,sp,8
    1f92:	ffe0                	sd	s0,248(a5)
    1f94:	ffff                	0xffff
    1f96:	010c                	addi	a1,sp,128
    1f98:	0000                	unimp
    1f9a:	0000                	unimp
    1f9c:	0000                	unimp
    1f9e:	032d                	addi	t1,t1,11
    1fa0:	0000                	unimp
    1fa2:	6e01                	0x6e01
    1fa4:	6d75                	lui	s10,0x1d
    1fa6:	3700                	fld	fs0,40(a4)
    1fa8:	00003d23          	sd	zero,26(zero) # 1a <BASE_ADDR-0xffffffe0001fffe6>
    1fac:	0300                	addi	s0,sp,384
    1fae:	8091                	srli	s1,s1,0x4
    1fb0:	037f                	0x37f
    1fb2:	05ee                	slli	a1,a1,0x1b
    1fb4:	0000                	unimp
    1fb6:	1938                	addi	a4,sp,184
    1fb8:	0044                	addi	s1,sp,4
    1fba:	0000                	unimp
    1fbc:	7fb89103          	lh	sp,2043(a7)
    1fc0:	0005e603          	lwu	a2,0(a1)
    1fc4:	3900                	fld	fs0,48(a0)
    1fc6:	831a                	mv	t1,t1
    1fc8:	03000003          	lb	zero,48(zero) # 30 <BASE_ADDR-0xffffffe0001fffd0>
    1fcc:	c091                	beqz	s1,1fd0 <BASE_ADDR-0xffffffe0001fe030>
    1fce:	047e                	slli	s0,s0,0x1f
    1fd0:	236c                	fld	fa1,192(a4)
    1fd2:	0020                	addi	s0,sp,8
    1fd4:	ffe0                	sd	s0,248(a5)
    1fd6:	ffff                	0xffff
    1fd8:	0058                	addi	a4,sp,4
    1fda:	0000                	unimp
    1fdc:	0000                	unimp
    1fde:	0000                	unimp
    1fe0:	030d                	addi	t1,t1,3
    1fe2:	0000                	unimp
    1fe4:	7401                	lui	s0,0xfffe0
    1fe6:	706d                	c.lui	zero,0xffffb
    1fe8:	3a00                	fld	fs0,48(a2)
    1fea:	2a1f 0000 0300      	0x30000002a1f
    1ff0:	b091                	j	1834 <BASE_ADDR-0xffffffe0001fe7cc>
    1ff2:	007f                	0x7f
    1ff4:	c405                	beqz	s0,201c <BASE_ADDR-0xffffffe0001fdfe4>
    1ff6:	e0002023          	sw	zero,-512(zero) # fffffffffffffe00 <_ebss+0x1fffdf5e60>
    1ffa:	ffff                	0xffff
    1ffc:	40ff                	0x40ff
    1ffe:	0000                	unimp
    2000:	0000                	unimp
    2002:	0000                	unimp
    2004:	0100                	addi	s0,sp,128
    2006:	0069                	c.nop	26
    2008:	00441e3f 91030000 	0x9103000000441e3f
    2010:	7fac                	ld	a1,120(a5)
    2012:	0000                	unimp
    2014:	2c04                	fld	fs1,24(s0)
    2016:	2024                	fld	fs1,64(s0)
    2018:	e000                	sd	s0,0(s0)
    201a:	ffff                	0xffff
    201c:	5cff                	0x5cff
    201e:	0000                	unimp
    2020:	0000                	unimp
    2022:	0000                	unimp
    2024:	5200                	lw	s0,32(a2)
    2026:	01000003          	lb	zero,16(zero) # 10 <BASE_ADDR-0xffffffe0001ffff0>
    202a:	00727473          	csrrci	s0,0x7,4
    202e:	2148                	fld	fa0,128(a0)
    2030:	0114                	addi	a3,sp,128
    2032:	0000                	unimp
    2034:	7fa09103          	lh	sp,2042(ra)
    2038:	0500                	addi	s0,sp,640
    203a:	2488                	fld	fa0,8(s1)
    203c:	0020                	addi	s0,sp,8
    203e:	ffe0                	sd	s0,248(a5)
    2040:	ffff                	0xffff
    2042:	003c                	addi	a5,sp,8
    2044:	0000                	unimp
    2046:	0000                	unimp
    2048:	0000                	unimp
    204a:	6301                	0x6301
    204c:	0068                	addi	a0,sp,12
    204e:	01191a53          	fadd.s	fs4,fs2,fa7,rtz
    2052:	0000                	unimp
    2054:	7eff9103          	lh	sp,2031(t6)
    2058:	0000                	unimp
    205a:	7e15                	lui	t3,0xfffe5
    205c:	02000003          	lb	zero,32(zero) # 20 <BASE_ADDR-0xffffffe0001fffe0>
    2060:	0119                	addi	sp,sp,6
    2062:	0000                	unimp
    2064:	0a00                	addi	s0,sp,272
    2066:	00000373          	0x373
    206a:	1916                	slli	s2,s2,0x25
    206c:	0001                	nop
    206e:	9300                	0x9300
    2070:	17000003          	lb	zero,368(zero) # 170 <BASE_ADDR-0xffffffe0001ffe90>
    2074:	003d                	c.nop	15
    2076:	0000                	unimp
    2078:	0018                	0x18
    207a:	9018                	0x9018
    207c:	01000003          	lb	zero,16(zero) # 10 <BASE_ADDR-0xffffffe0001ffff0>
    2080:	0604                	addi	s1,sp,768
    2082:	2014                	fld	fa3,0(s0)
    2084:	0020                	addi	s0,sp,8
    2086:	ffe0                	sd	s0,248(a5)
    2088:	ffff                	0xffff
    208a:	0050                	addi	a2,sp,4
    208c:	0000                	unimp
    208e:	0000                	unimp
    2090:	0000                	unimp
    2092:	9c01                	subw	s0,s0,s0
    2094:	6306                	ld	t1,64(sp)
    2096:	0400                	addi	s0,sp,512
    2098:	1910                	addi	a2,sp,176
    209a:	0001                	nop
    209c:	0200                	addi	s0,sp,256
    209e:	6f91                	lui	t6,0x4
    20a0:	0000                	unimp
    20a2:	00fe                	slli	ra,ra,0x1f
    20a4:	0000                	unimp
    20a6:	0005                	c.nop	1
    20a8:	0801                	addi	a6,a6,0
    20aa:	0dd2                	slli	s11,s11,0x14
    20ac:	0000                	unimp
    20ae:	2504                	fld	fs1,8(a0)
    20b0:	0000                	unimp
    20b2:	1d00                	addi	s0,sp,688
    20b4:	01a1                	addi	gp,gp,8
    20b6:	0000                	unimp
    20b8:	0000016b          	0x16b
    20bc:	03dc                	addi	a5,sp,452
	...
    20c6:	0000                	unimp
    20c8:	23a8                	fld	fa0,64(a5)
    20ca:	0000                	unimp
    20cc:	b905                	j	1cfc <BASE_ADDR-0xffffffe0001fe304>
    20ce:	0000                	unimp
    20d0:	0200                	addi	s0,sp,256
    20d2:	1704                	addi	s1,sp,928
    20d4:	0036                	c.slli	zero,0xd
    20d6:	0000                	unimp
    20d8:	0806                	slli	a6,a6,0x1
    20da:	00000007          	0x7
    20de:	0700                	addi	s0,sp,896
    20e0:	05f8                	addi	a4,sp,716
    20e2:	0000                	unimp
    20e4:	0301                	addi	t1,t1,0
    20e6:	5305                	li	t1,-31
    20e8:	0000                	unimp
    20ea:	0900                	addi	s0,sp,144
    20ec:	20602403          	lw	s0,518(zero) # 206 <BASE_ADDR-0xffffffe0001ffdfa>
    20f0:	e000                	sd	s0,0(s0)
    20f2:	ffff                	0xffff
    20f4:	08ff                	0x8ff
    20f6:	0504                	addi	s1,sp,640
    20f8:	6e69                	lui	t3,0x1a
    20fa:	0074                	addi	a3,sp,12
    20fc:	5309                	li	t1,-30
    20fe:	0000                	unimp
    2100:	6b00                	ld	s0,16(a4)
    2102:	0000                	unimp
    2104:	0a00                	addi	s0,sp,272
    2106:	0036                	c.slli	zero,0xd
    2108:	0000                	unimp
    210a:	010003e7          	jalr	t2,16(zero) # 0 <BASE_ADDR-0xffffffe000200000>
    210e:	0072                	c.slli	zero,0x1c
    2110:	5a04                	lw	s1,48(a2)
    2112:	0000                	unimp
    2114:	0900                	addi	s0,sp,144
    2116:	20900003          	lb	zero,521(zero) # 209 <BASE_ADDR-0xffffffe0001ffdf7>
    211a:	e000                	sd	s0,0(s0)
    211c:	ffff                	0xffff
    211e:	01ff                	0x1ff
    2120:	0074                	addi	a3,sp,12
    2122:	5305                	li	t1,-31
    2124:	0000                	unimp
    2126:	0900                	addi	s0,sp,144
    2128:	20602803          	lw	a6,518(zero) # 206 <BASE_ADDR-0xffffffe0001ffdfa>
    212c:	e000                	sd	s0,0(s0)
    212e:	ffff                	0xffff
    2130:	0bff                	0xbff
    2132:	0344                	addi	s1,sp,388
    2134:	0000                	unimp
    2136:	2501                	sext.w	a0,a0
    2138:	2a08                	fld	fa0,16(a2)
    213a:	0000                	unimp
    213c:	c000                	sw	s0,0(s0)
    213e:	2028                	fld	fa0,64(s0)
    2140:	e000                	sd	s0,0(s0)
    2142:	ffff                	0xffff
    2144:	58ff                	0x58ff
    2146:	0000                	unimp
    2148:	0000                	unimp
    214a:	0000                	unimp
    214c:	0100                	addi	s0,sp,128
    214e:	d69c                	sw	a5,40(a3)
    2150:	0000                	unimp
    2152:	0200                	addi	s0,sp,256
    2154:	006c                	addi	a1,sp,12
    2156:	2a1a                	fld	fs4,384(sp)
    2158:	0000                	unimp
    215a:	0200                	addi	s0,sp,256
    215c:	5891                	li	a7,-28
    215e:	7202                	ld	tp,32(sp)
    2160:	2400                	fld	fs0,8(s0)
    2162:	002a                	c.slli	zero,0xa
    2164:	0000                	unimp
    2166:	9102                	jalr	sp
    2168:	0350                	addi	a2,sp,388
    216a:	656c                	ld	a1,200(a0)
    216c:	006e                	c.slli	zero,0x1b
    216e:	0c26                	slli	s8,s8,0x9
    2170:	002a                	c.slli	zero,0xa
    2172:	0000                	unimp
    2174:	9102                	jalr	sp
    2176:	0068                	addi	a0,sp,12
    2178:	f30c                	sd	a1,32(a4)
    217a:	0005                	c.nop	1
    217c:	0100                	addi	s0,sp,128
    217e:	002a0807          	0x2a0807
    2182:	0000                	unimp
    2184:	25c0                	fld	fs0,136(a1)
    2186:	0020                	addi	s0,sp,8
    2188:	ffe0                	sd	s0,248(a5)
    218a:	ffff                	0xffff
    218c:	0300                	addi	s0,sp,384
    218e:	0000                	unimp
    2190:	0000                	unimp
    2192:	0000                	unimp
    2194:	9c01                	subw	s0,s0,s0
    2196:	08006903          	lwu	s2,128(zero) # 80 <BASE_ADDR-0xffffffe0001fff80>
    219a:	5309                	li	t1,-30
    219c:	0000                	unimp
    219e:	0200                	addi	s0,sp,256
    21a0:	6c91                	lui	s9,0x4
    21a2:	0000                	unimp
    21a4:	0131                	addi	sp,sp,12
    21a6:	0000                	unimp
    21a8:	0005                	c.nop	1
    21aa:	0801                	addi	a6,a6,0
    21ac:	0ea0                	addi	s0,sp,856
    21ae:	0000                	unimp
    21b0:	2505                	addiw	a0,a0,1
    21b2:	0000                	unimp
    21b4:	1d00                	addi	s0,sp,688
    21b6:	01a8                	addi	a0,sp,200
    21b8:	0000                	unimp
    21ba:	0000016b          	0x16b
    21be:	0000040b          	0x40b
	...
    21ca:	25e9                	addiw	a1,a1,26
    21cc:	0000                	unimp
    21ce:	b906                	fsd	ft1,176(sp)
    21d0:	0000                	unimp
    21d2:	0200                	addi	s0,sp,256
    21d4:	1704                	addi	s1,sp,928
    21d6:	0036                	c.slli	zero,0xd
    21d8:	0000                	unimp
    21da:	0804                	addi	s1,sp,16
    21dc:	00000007          	0x7
    21e0:	0700                	addi	s0,sp,896
    21e2:	02da                	slli	t0,t0,0x16
    21e4:	0000                	unimp
    21e6:	0c01                	addi	s8,s8,0
    21e8:	0000a407          	flw	fs0,0(ra)
    21ec:	8400                	0x8400
    21ee:	2029                	0x2029
    21f0:	e000                	sd	s0,0(s0)
    21f2:	ffff                	0xffff
    21f4:	78ff                	0x78ff
    21f6:	0000                	unimp
    21f8:	0000                	unimp
    21fa:	0000                	unimp
    21fc:	0100                	addi	s0,sp,128
    21fe:	a49c                	fsd	fa5,8(s1)
    2200:	0000                	unimp
    2202:	0100                	addi	s0,sp,128
    2204:	7364                	ld	s1,224(a4)
    2206:	0074                	addi	a3,sp,12
    2208:	140c                	addi	a1,sp,544
    220a:	00a4                	addi	s1,sp,72
    220c:	0000                	unimp
    220e:	9102                	jalr	sp
    2210:	0158                	addi	a4,sp,132
    2212:	00637273          	csrrci	tp,0x6,6
    2216:	250c                	fld	fa1,8(a0)
    2218:	00a6                	slli	ra,ra,0x9
    221a:	0000                	unimp
    221c:	9102                	jalr	sp
    221e:	0150                	addi	a2,sp,132
    2220:	006e                	c.slli	zero,0x1b
    2222:	310c                	fld	fa1,32(a0)
    2224:	002a                	c.slli	zero,0xa
    2226:	0000                	unimp
    2228:	9102                	jalr	sp
    222a:	0248                	addi	a0,sp,260
    222c:	0608                	addi	a0,sp,768
    222e:	0000                	unimp
    2230:	0b0d                	addi	s6,s6,3
    2232:	00ac                	addi	a1,sp,72
    2234:	0000                	unimp
    2236:	9102                	jalr	sp
    2238:	0268                	addi	a0,sp,268
    223a:	00000603          	lb	a2,0(zero) # 0 <BASE_ADDR-0xffffffe000200000>
    223e:	110e                	slli	sp,sp,0x23
    2240:	00bd                	addi	ra,ra,15
    2242:	0000                	unimp
    2244:	9102                	jalr	sp
    2246:	0060                	addi	s0,sp,12
    2248:	0808                	addi	a0,sp,16
    224a:	0000ab03          	lw	s6,0(ra)
    224e:	0900                	addi	s0,sp,144
    2250:	0000b103          	ld	sp,0(ra)
    2254:	0400                	addi	s0,sp,512
    2256:	0801                	addi	a6,a6,0
    2258:	05e9                	addi	a1,a1,26
    225a:	0000                	unimp
    225c:	b10a                	fsd	ft2,160(sp)
    225e:	0000                	unimp
    2260:	0300                	addi	s0,sp,384
    2262:	00b8                	addi	a4,sp,72
    2264:	0000                	unimp
    2266:	0001860b          	0x1860b
    226a:	0100                	addi	s0,sp,128
    226c:	0704                	addi	s1,sp,896
    226e:	00a4                	addi	s1,sp,72
    2270:	0000                	unimp
    2272:	2918                	fld	fa4,16(a0)
    2274:	0020                	addi	s0,sp,8
    2276:	ffe0                	sd	s0,248(a5)
    2278:	ffff                	0xffff
    227a:	006c                	addi	a1,sp,12
    227c:	0000                	unimp
    227e:	0000                	unimp
    2280:	0000                	unimp
    2282:	9c01                	subw	s0,s0,s0
    2284:	6401                	0x6401
    2286:	04007473          	csrrci	s0,uscratch,0
    228a:	a414                	fsd	fa3,8(s0)
    228c:	0000                	unimp
    228e:	0200                	addi	s0,sp,256
    2290:	5891                	li	a7,-28
    2292:	6301                	0x6301
    2294:	0400                	addi	s0,sp,512
    2296:	b11e                	fsd	ft7,160(sp)
    2298:	0000                	unimp
    229a:	0200                	addi	s0,sp,256
    229c:	5791                	li	a5,-28
    229e:	6e01                	0x6e01
    22a0:	0400                	addi	s0,sp,512
    22a2:	2a28                	fld	fa0,80(a2)
    22a4:	0000                	unimp
    22a6:	0200                	addi	s0,sp,256
    22a8:	4891                	li	a7,4
    22aa:	0802                	c.slli64	a6
    22ac:	0006                	c.slli	zero,0x1
    22ae:	0500                	addi	s0,sp,640
    22b0:	0000ac0b          	0xac0b
    22b4:	0200                	addi	s0,sp,256
    22b6:	6091                	lui	ra,0x4
    22b8:	3c0c                	fld	fa1,56(s0)
    22ba:	2029                	0x2029
    22bc:	e000                	sd	s0,0(s0)
    22be:	ffff                	0xffff
    22c0:	34ff                	0x34ff
    22c2:	0000                	unimp
    22c4:	0000                	unimp
    22c6:	0000                	unimp
    22c8:	0d00                	addi	s0,sp,656
    22ca:	0069                	c.nop	26
    22cc:	0601                	addi	a2,a2,0
    22ce:	2a11                	addiw	s4,s4,4
    22d0:	0000                	unimp
    22d2:	0200                	addi	s0,sp,256
    22d4:	6891                	lui	a7,0x4
    22d6:	0000                	unimp
	...

Disassembly of section .debug_abbrev:

0000000000000000 <.debug_abbrev>:
   0:	0501                	addi	a0,a0,0
   2:	4900                	lw	s0,16(a0)
   4:	02000013          	li	zero,32
   8:	0034                	addi	a3,sp,8
   a:	213a0803          	lb	a6,531(s4) # 2213 <BASE_ADDR-0xffffffe0001fdded>
   e:	3b01                	addiw	s6,s6,-32
  10:	0c21390b          	0xc21390b
  14:	1349                	addi	t1,t1,-14
  16:	1802                	slli	a6,a6,0x20
  18:	0000                	unimp
  1a:	0b002403          	lw	s0,176(zero) # b0 <BASE_ADDR-0xffffffe0001fff50>
  1e:	0821                	addi	a6,a6,8
  20:	0b3e                	slli	s6,s6,0xf
  22:	00000e03          	lb	t3,0(zero) # 0 <BASE_ADDR-0xffffffe000200000>
  26:	0d04                	addi	s1,sp,656
  28:	0300                	addi	s0,sp,384
  2a:	3a0e                	fld	fs4,224(sp)
  2c:	0221                	addi	tp,tp,8
  2e:	21390b3b          	0x21390b3b
  32:	38134907          	flq	fs2,897(t1) # ffffffffffffa381 <_ebss+0x1fffdf03e1>
  36:	0500000b          	0x500000b
  3a:	0111                	addi	sp,sp,4
  3c:	0e25                	addi	t3,t3,9
  3e:	1f030b13          	addi	s6,t1,496
  42:	17551f1b          	0x17551f1b
  46:	0111                	addi	sp,sp,4
  48:	1710                	addi	a2,sp,928
  4a:	0000                	unimp
  4c:	1606                	slli	a2,a2,0x21
  4e:	0300                	addi	s0,sp,384
  50:	3a0e                	fld	fs4,224(sp)
  52:	390b3b0b          	0x390b3b0b
  56:	0013490b          	0x13490b
  5a:	0700                	addi	s0,sp,896
  5c:	0026                	c.slli	zero,0x9
  5e:	1349                	addi	t1,t1,-14
  60:	0000                	unimp
  62:	1308                	addi	a0,sp,416
  64:	0301                	addi	t1,t1,0
  66:	0b0e                	slli	s6,s6,0x3
  68:	3b0b3a0b          	0x3b0b3a0b
  6c:	010b390b          	0x10b390b
  70:	09000013          	li	zero,144
  74:	0024                	addi	s1,sp,8
  76:	0b3e0b0b          	0xb3e0b0b
  7a:	00000803          	lb	a6,0(zero) # 0 <BASE_ADDR-0xffffffe000200000>
  7e:	340a                	fld	fs0,160(sp)
  80:	0300                	addi	s0,sp,384
  82:	3a0e                	fld	fs4,224(sp)
  84:	390b3b0b          	0x390b3b0b
  88:	3f13490b          	0x3f13490b
  8c:	0219                	addi	tp,tp,6
  8e:	0018                	0x18
  90:	0b00                	addi	s0,sp,400
  92:	012e                	slli	sp,sp,0xb
  94:	0e03193f 0b3b0b3a 	0xb3b0b3a0e03193f
  9c:	0b39                	addi	s6,s6,14
  9e:	13491927          	0x13491927
  a2:	193c                	addi	a5,sp,184
  a4:	1301                	addi	t1,t1,-32
  a6:	0000                	unimp
  a8:	2e0c                	fld	fa1,24(a2)
  aa:	3f01                	addiw	t5,t5,-32
  ac:	0319                	addi	t1,t1,6
  ae:	3a0e                	fld	fs4,224(sp)
  b0:	390b3b0b          	0x390b3b0b
  b4:	1201110b          	0x1201110b
  b8:	7c184007          	flq	ft0,1985(a6) # ffffffffffff97c1 <_ebss+0x1fffdef821>
  bc:	0119                	addi	sp,sp,6
  be:	0d000013          	li	zero,208
  c2:	012e                	slli	sp,sp,0xb
  c4:	0e03193f 0b3b0b3a 	0xb3b0b3a0e03193f
  cc:	0b39                	addi	s6,s6,14
  ce:	1349                	addi	t1,t1,-14
  d0:	0111                	addi	sp,sp,4
  d2:	0712                	slli	a4,a4,0x4
  d4:	1840                	addi	s0,sp,52
  d6:	197a                	slli	s2,s2,0x3e
  d8:	0000                	unimp
  da:	0100                	addi	s0,sp,128
  dc:	0011                	c.nop	4
  de:	1710                	addi	a2,sp,928
  e0:	0111                	addi	sp,sp,4
  e2:	0f12                	slli	t5,t5,0x4
  e4:	0e1b0e03          	lb	t3,225(s6) # 2618d <BASE_ADDR-0xffffffe0001d9e73>
  e8:	0e25                	addi	t3,t3,9
  ea:	00000513          	li	a0,0
  ee:	0100                	addi	s0,sp,128
  f0:	0011                	c.nop	4
  f2:	1710                	addi	a2,sp,928
  f4:	0111                	addi	sp,sp,4
  f6:	0f12                	slli	t5,t5,0x4
  f8:	0e1b0e03          	lb	t3,225(s6)
  fc:	0e25                	addi	t3,t3,9
  fe:	00000513          	li	a0,0
 102:	0100                	addi	s0,sp,128
 104:	0005                	c.nop	1
 106:	1349                	addi	t1,t1,-14
 108:	0000                	unimp
 10a:	2402                	fld	fs0,0(sp)
 10c:	0b00                	addi	s0,sp,400
 10e:	030b3e0b          	0x30b3e0b
 112:	000e                	c.slli	zero,0x3
 114:	0300                	addi	s0,sp,384
 116:	210b000f          	0x210b000f
 11a:	4908                	lw	a0,16(a0)
 11c:	04000013          	li	zero,64
 120:	000d                	c.nop	3
 122:	0b3a0e03          	lb	t3,179(s4)
 126:	21390b3b          	0x21390b3b
 12a:	4911                	li	s2,4
 12c:	00213813          	sltiu	a6,sp,2
 130:	0000                	unimp
 132:	2e05                	addiw	t3,t3,1
 134:	3f01                	addiw	t5,t5,-32
 136:	0319                	addi	t1,t1,6
 138:	3a0e                	fld	fs4,224(sp)
 13a:	05213b0b          	0x5213b0b
 13e:	0b39                	addi	s6,s6,14
 140:	13491927          	0x13491927
 144:	193c                	addi	a5,sp,184
 146:	1301                	addi	t1,t1,-32
 148:	0000                	unimp
 14a:	2e06                	fld	ft8,64(sp)
 14c:	3f01                	addiw	t5,t5,-32
 14e:	0319                	addi	t1,t1,6
 150:	3a0e                	fld	fs4,224(sp)
 152:	0121                	addi	sp,sp,8
 154:	21390b3b          	0x21390b3b
 158:	2706                	fld	fa4,64(sp)
 15a:	1119                	addi	sp,sp,-26
 15c:	1201                	addi	tp,tp,-32
 15e:	7c184007          	flq	ft0,1985(a6)
 162:	0119                	addi	sp,sp,6
 164:	07000013          	li	zero,112
 168:	0005                	c.nop	1
 16a:	213a0e03          	lb	t3,531(s4)
 16e:	3b01                	addiw	s6,s6,-32
 170:	490b390b          	0x490b390b
 174:	00180213          	addi	tp,a6,1
 178:	0800                	addi	s0,sp,16
 17a:	0034                	addi	a3,sp,8
 17c:	213a0803          	lb	a6,531(s4)
 180:	3b01                	addiw	s6,s6,-32
 182:	1121390b          	0x1121390b
 186:	1349                	addi	t1,t1,-14
 188:	1802                	slli	a6,a6,0x20
 18a:	0000                	unimp
 18c:	1109                	addi	sp,sp,-30
 18e:	2501                	sext.w	a0,a0
 190:	130e                	slli	t1,t1,0x23
 192:	1b1f030b          	0x1b1f030b
 196:	551f 1117 1001      	0x10011117551f
 19c:	0a000017          	auipc	zero,0xa000
 1a0:	0016                	c.slli	zero,0x5
 1a2:	0b3a0e03          	lb	t3,179(s4)
 1a6:	0b390b3b          	0xb390b3b
 1aa:	1349                	addi	t1,t1,-14
 1ac:	0000                	unimp
 1ae:	0301130b          	0x301130b
 1b2:	0b08                	addi	a0,sp,400
 1b4:	3b0b3a0b          	0x3b0b3a0b
 1b8:	010b390b          	0x10b390b
 1bc:	0c000013          	li	zero,192
 1c0:	0024                	addi	s1,sp,8
 1c2:	0b3e0b0b          	0xb3e0b0b
 1c6:	00000803          	lb	a6,0(zero) # 0 <BASE_ADDR-0xffffffe000200000>
 1ca:	010d                	addi	sp,sp,3
 1cc:	4901                	li	s2,0
 1ce:	00130113          	addi	sp,t1,1
 1d2:	0e00                	addi	s0,sp,784
 1d4:	0021                	c.nop	8
 1d6:	0000                	unimp
 1d8:	4900260f          	0x4900260f
 1dc:	10000013          	li	zero,256
 1e0:	0034                	addi	a3,sp,8
 1e2:	0b3a0e03          	lb	t3,179(s4)
 1e6:	0b390b3b          	0xb390b3b
 1ea:	1349                	addi	t1,t1,-14
 1ec:	193c193f 13110000 	0x13110000193c193f
 1f4:	0b01                	addi	s6,s6,0
 1f6:	3b0b3a0b          	0x3b0b3a0b
 1fa:	010b390b          	0x10b390b
 1fe:	12000013          	li	zero,288
 202:	0034                	addi	a3,sp,8
 204:	0b3a0e03          	lb	t3,179(s4)
 208:	0b390b3b          	0xb390b3b
 20c:	1349                	addi	t1,t1,-14
 20e:	1802193f 18130000 	0x181300001802193f
 216:	0000                	unimp
 218:	1400                	addi	s0,sp,544
 21a:	0b0b000f          	0xb0b000f
 21e:	0000                	unimp
 220:	2e15                	addiw	t3,t3,5
 222:	3f00                	fld	fs0,56(a4)
 224:	0319                	addi	t1,t1,6
 226:	3a0e                	fld	fs4,224(sp)
 228:	390b3b0b          	0x390b3b0b
 22c:	1119270b          	0x1119270b
 230:	1201                	addi	tp,tp,-32
 232:	7c184007          	flq	ft0,1985(a6)
 236:	0019                	c.nop	6
 238:	1600                	addi	s0,sp,800
 23a:	0005                	c.nop	1
 23c:	0b3a0803          	lb	a6,179(s4)
 240:	0b390b3b          	0xb390b3b
 244:	1349                	addi	t1,t1,-14
 246:	1802                	slli	a6,a6,0x20
 248:	0000                	unimp
 24a:	03003417          	auipc	s0,0x3003
 24e:	3a0e                	fld	fs4,224(sp)
 250:	390b3b0b          	0x390b3b0b
 254:	0213490b          	0x213490b
 258:	0018                	0x18
 25a:	1800                	addi	s0,sp,48
 25c:	012e                	slli	sp,sp,0xb
 25e:	0e03193f 0b3b0b3a 	0xb3b0b3a0e03193f
 266:	0b39                	addi	s6,s6,14
 268:	1349                	addi	t1,t1,-14
 26a:	0111                	addi	sp,sp,4
 26c:	0712                	slli	a4,a4,0x4
 26e:	1840                	addi	s0,sp,52
 270:	197c                	addi	a5,sp,188
 272:	0000                	unimp
 274:	0100                	addi	s0,sp,128
 276:	0024                	addi	s1,sp,8
 278:	0b3e0b0b          	0xb3e0b0b
 27c:	00000e03          	lb	t3,0(zero) # 0 <BASE_ADDR-0xffffffe000200000>
 280:	1102                	slli	sp,sp,0x20
 282:	2501                	sext.w	a0,a0
 284:	130e                	slli	t1,t1,0x23
 286:	1b1f030b          	0x1b1f030b
 28a:	551f 1117 1001      	0x10011117551f
 290:	03000017          	auipc	zero,0x3000
 294:	0024                	addi	s1,sp,8
 296:	0b3e0b0b          	0xb3e0b0b
 29a:	00000803          	lb	a6,0(zero) # 0 <BASE_ADDR-0xffffffe000200000>
 29e:	2e04                	fld	fs1,24(a2)
 2a0:	3f01                	addiw	t5,t5,-32
 2a2:	0319                	addi	t1,t1,6
 2a4:	3a0e                	fld	fs4,224(sp)
 2a6:	390b3b0b          	0x390b3b0b
 2aa:	4919270b          	0x4919270b
 2ae:	01193c13          	sltiu	s8,s2,17
 2b2:	05000013          	li	zero,80
 2b6:	0005                	c.nop	1
 2b8:	1349                	addi	t1,t1,-14
 2ba:	0000                	unimp
 2bc:	1806                	slli	a6,a6,0x21
 2be:	0000                	unimp
 2c0:	0700                	addi	s0,sp,896
 2c2:	0b0b000f          	0xb0b000f
 2c6:	1349                	addi	t1,t1,-14
 2c8:	0000                	unimp
 2ca:	2608                	fld	fa0,8(a2)
 2cc:	4900                	lw	s0,16(a0)
 2ce:	09000013          	li	zero,144
 2d2:	012e                	slli	sp,sp,0xb
 2d4:	0e03193f 0b3b0b3a 	0xb3b0b3a0e03193f
 2dc:	0b39                	addi	s6,s6,14
 2de:	01111927          	0x1111927
 2e2:	0712                	slli	a4,a4,0x4
 2e4:	1840                	addi	s0,sp,52
 2e6:	197c                	addi	a5,sp,188
 2e8:	0000                	unimp
 2ea:	050a                	slli	a0,a0,0x2
 2ec:	0300                	addi	s0,sp,384
 2ee:	3a08                	fld	fa0,48(a2)
 2f0:	390b3b0b          	0x390b3b0b
 2f4:	0213490b          	0x213490b
 2f8:	0018                	0x18
 2fa:	0000                	unimp
 2fc:	0d01                	addi	s10,s10,0
 2fe:	0300                	addi	s0,sp,384
 300:	3a0e                	fld	fs4,224(sp)
 302:	390b3b0b          	0x390b3b0b
 306:	3813490b          	0x3813490b
 30a:	0200000b          	0x200000b
 30e:	0005                	c.nop	1
 310:	1349                	addi	t1,t1,-14
 312:	0000                	unimp
 314:	03003403          	ld	s0,48(zero) # 30 <BASE_ADDR-0xffffffe0001fffd0>
 318:	3a08                	fld	fa0,48(a2)
 31a:	0121                	addi	sp,sp,8
 31c:	0b390b3b          	0xb390b3b
 320:	1349                	addi	t1,t1,-14
 322:	1802                	slli	a6,a6,0x20
 324:	0000                	unimp
 326:	3404                	fld	fs1,40(s0)
 328:	0300                	addi	s0,sp,384
 32a:	3a0e                	fld	fs4,224(sp)
 32c:	0121                	addi	sp,sp,8
 32e:	0b390b3b          	0xb390b3b
 332:	1349                	addi	t1,t1,-14
 334:	1802                	slli	a6,a6,0x20
 336:	0000                	unimp
 338:	0f05                	addi	t5,t5,1
 33a:	0b00                	addi	s0,sp,400
 33c:	0821                	addi	a6,a6,8
 33e:	1349                	addi	t1,t1,-14
 340:	0000                	unimp
 342:	0d06                	slli	s10,s10,0x1
 344:	0300                	addi	s0,sp,384
 346:	3a08                	fld	fa0,48(a2)
 348:	390b3b0b          	0x390b3b0b
 34c:	3813490b          	0x3813490b
 350:	0700000b          	0x700000b
 354:	0e030113          	addi	sp,t1,224
 358:	0b3a0b0b          	0xb3a0b0b
 35c:	21390b3b          	0x21390b3b
 360:	0108                	addi	a0,sp,128
 362:	08000013          	li	zero,128
 366:	0101                	addi	sp,sp,0
 368:	1349                	addi	t1,t1,-14
 36a:	1301                	addi	t1,t1,-32
 36c:	0000                	unimp
 36e:	2e09                	addiw	t3,t3,2
 370:	3f01                	addiw	t5,t5,-32
 372:	0319                	addi	t1,t1,6
 374:	3a0e                	fld	fs4,224(sp)
 376:	390b3b0b          	0x390b3b0b
 37a:	4919270b          	0x4919270b
 37e:	01193c13          	sltiu	s8,s2,17
 382:	0a000013          	li	zero,160
 386:	0034                	addi	a3,sp,8
 388:	213a0e03          	lb	t3,531(s4)
 38c:	3b01                	addiw	s6,s6,-32
 38e:	490b390b          	0x490b390b
 392:	02193f13          	sltiu	t5,s2,33
 396:	0018                	0x18
 398:	0b00                	addi	s0,sp,400
 39a:	012e                	slli	sp,sp,0xb
 39c:	0e03193f 3b01213a 	0x3b01213a0e03193f
 3a4:	0621390b          	0x621390b
 3a8:	0111                	addi	sp,sp,4
 3aa:	0712                	slli	a4,a4,0x4
 3ac:	1840                	addi	s0,sp,52
 3ae:	197c                	addi	a5,sp,188
 3b0:	1301                	addi	t1,t1,-32
 3b2:	0000                	unimp
 3b4:	2e0c                	fld	fa1,24(a2)
 3b6:	3f01                	addiw	t5,t5,-32
 3b8:	0319                	addi	t1,t1,6
 3ba:	3a0e                	fld	fs4,224(sp)
 3bc:	0121                	addi	sp,sp,8
 3be:	0b390b3b          	0xb390b3b
 3c2:	1349                	addi	t1,t1,-14
 3c4:	0111                	addi	sp,sp,4
 3c6:	0712                	slli	a4,a4,0x4
 3c8:	1840                	addi	s0,sp,52
 3ca:	197c                	addi	a5,sp,188
 3cc:	1301                	addi	t1,t1,-32
 3ce:	0000                	unimp
 3d0:	0b0d                	addi	s6,s6,3
 3d2:	1101                	addi	sp,sp,-32
 3d4:	1201                	addi	tp,tp,-32
 3d6:	0e000007          	0xe000007
 3da:	0024                	addi	s1,sp,8
 3dc:	0b3e0b0b          	0xb3e0b0b
 3e0:	00000e03          	lb	t3,0(zero) # 0 <BASE_ADDR-0xffffffe000200000>
 3e4:	03000d0f          	0x3000d0f
 3e8:	3a0e                	fld	fs4,224(sp)
 3ea:	0321                	addi	t1,t1,8
 3ec:	21390b3b          	0x21390b3b
 3f0:	490c                	lw	a1,16(a0)
 3f2:	00053813          	sltiu	a6,a0,0
 3f6:	1000                	addi	s0,sp,32
 3f8:	0021                	c.nop	8
 3fa:	1349                	addi	t1,t1,-14
 3fc:	00000b2f          	0xb2f
 400:	3411                	addiw	s0,s0,-28
 402:	0300                	addi	s0,sp,384
 404:	3a0e                	fld	fs4,224(sp)
 406:	0121                	addi	sp,sp,8
 408:	0b390b3b          	0xb390b3b
 40c:	1349                	addi	t1,t1,-14
 40e:	193c193f 18120000 	0x18120000193c193f
 416:	0000                	unimp
 418:	1300                	addi	s0,sp,416
 41a:	0111010b          	0x111010b
 41e:	0712                	slli	a4,a4,0x4
 420:	1301                	addi	t1,t1,-32
 422:	0000                	unimp
 424:	1114                	addi	a3,sp,160
 426:	2501                	sext.w	a0,a0
 428:	130e                	slli	t1,t1,0x23
 42a:	1b1f030b          	0x1b1f030b
 42e:	551f 1117 1001      	0x10011117551f
 434:	15000017          	auipc	zero,0x15000
 438:	0016                	c.slli	zero,0x5
 43a:	0b3a0e03          	lb	t3,179(s4)
 43e:	0b390b3b          	0xb390b3b
 442:	1349                	addi	t1,t1,-14
 444:	0000                	unimp
 446:	1316                	slli	t1,t1,0x25
 448:	0301                	addi	t1,t1,0
 44a:	0b0e                	slli	s6,s6,0x3
 44c:	3a05                	addiw	s4,s4,-31
 44e:	390b3b0b          	0x390b3b0b
 452:	0013010b          	0x13010b
 456:	1700                	addi	s0,sp,928
 458:	0024                	addi	s1,sp,8
 45a:	0b3e0b0b          	0xb3e0b0b
 45e:	00000803          	lb	a6,0(zero) # 0 <BASE_ADDR-0xffffffe000200000>
 462:	2118                	fld	fa4,0(a0)
 464:	0000                	unimp
 466:	1900                	addi	s0,sp,176
 468:	0026                	c.slli	zero,0x9
 46a:	1349                	addi	t1,t1,-14
 46c:	0000                	unimp
 46e:	211a                	fld	ft2,384(sp)
 470:	4900                	lw	s0,16(a0)
 472:	00052f13          	slti	t5,a0,0
 476:	1b00                	addi	s0,sp,432
 478:	012e                	slli	sp,sp,0xb
 47a:	0e03193f 0b3b0b3a 	0xb3b0b3a0e03193f
 482:	0b39                	addi	s6,s6,14
 484:	193c1927          	0x193c1927
 488:	1301                	addi	t1,t1,-32
 48a:	0000                	unimp
 48c:	2e1c                	fld	fa5,24(a2)
 48e:	3f01                	addiw	t5,t5,-32
 490:	0319                	addi	t1,t1,6
 492:	3a0e                	fld	fs4,224(sp)
 494:	390b3b0b          	0x390b3b0b
 498:	01193c0b          	0x1193c0b
 49c:	1d000013          	li	zero,464
 4a0:	0b0b000f          	0xb0b000f
 4a4:	0000                	unimp
 4a6:	261e                	fld	fa2,448(sp)
 4a8:	0000                	unimp
 4aa:	1f00                	addi	s0,sp,944
 4ac:	012e                	slli	sp,sp,0xb
 4ae:	0e03193f 0b3b0b3a 	0xb3b0b3a0e03193f
 4b6:	0b39                	addi	s6,s6,14
 4b8:	1349                	addi	t1,t1,-14
 4ba:	193c                	addi	a5,sp,184
 4bc:	1301                	addi	t1,t1,-32
 4be:	0000                	unimp
 4c0:	2e20                	fld	fs0,88(a2)
 4c2:	3f00                	fld	fs0,56(a4)
 4c4:	0319                	addi	t1,t1,6
 4c6:	3a0e                	fld	fs4,224(sp)
 4c8:	390b3b0b          	0x390b3b0b
 4cc:	1201110b          	0x1201110b
 4d0:	7c184007          	flq	ft0,1985(a6)
 4d4:	0019                	c.nop	6
 4d6:	2100                	fld	fs0,0(a0)
 4d8:	012e                	slli	sp,sp,0xb
 4da:	0e03193f 0b3b0b3a 	0xb3b0b3a0e03193f
 4e2:	0b39                	addi	s6,s6,14
 4e4:	01111927          	0x1111927
 4e8:	0712                	slli	a4,a4,0x4
 4ea:	1840                	addi	s0,sp,52
 4ec:	197c                	addi	a5,sp,188
 4ee:	1301                	addi	t1,t1,-32
 4f0:	0000                	unimp
 4f2:	0522                	slli	a0,a0,0x8
 4f4:	0300                	addi	s0,sp,384
 4f6:	3a0e                	fld	fs4,224(sp)
 4f8:	390b3b0b          	0x390b3b0b
 4fc:	0213490b          	0x213490b
 500:	0018                	0x18
 502:	0000                	unimp
 504:	0501                	addi	a0,a0,0
 506:	0300                	addi	s0,sp,384
 508:	3a0e                	fld	fs4,224(sp)
 50a:	0121                	addi	sp,sp,8
 50c:	0b390b3b          	0xb390b3b
 510:	1349                	addi	t1,t1,-14
 512:	1802                	slli	a6,a6,0x20
 514:	0000                	unimp
 516:	2402                	fld	fs0,0(sp)
 518:	0b00                	addi	s0,sp,400
 51a:	0821                	addi	a6,a6,8
 51c:	0b3e                	slli	s6,s6,0xf
 51e:	00000e03          	lb	t3,0(zero) # 0 <BASE_ADDR-0xffffffe000200000>
 522:	03000d03          	lb	s10,48(zero) # 30 <BASE_ADDR-0xffffffe0001fffd0>
 526:	3a0e                	fld	fs4,224(sp)
 528:	0221                	addi	tp,tp,8
 52a:	21390b3b          	0x21390b3b
 52e:	38134907          	flq	fs2,897(t1)
 532:	0400000b          	0x400000b
 536:	0005                	c.nop	1
 538:	213a0803          	lb	a6,531(s4)
 53c:	3b01                	addiw	s6,s6,-32
 53e:	0521                	addi	a0,a0,8
 540:	0b39                	addi	s6,s6,14
 542:	1349                	addi	t1,t1,-14
 544:	1802                	slli	a6,a6,0x20
 546:	0000                	unimp
 548:	1105                	addi	sp,sp,-31
 54a:	2501                	sext.w	a0,a0
 54c:	130e                	slli	t1,t1,0x23
 54e:	1b1f030b          	0x1b1f030b
 552:	551f 1117 1001      	0x10011117551f
 558:	06000017          	auipc	zero,0x6000
 55c:	0016                	c.slli	zero,0x5
 55e:	0b3a0e03          	lb	t3,179(s4)
 562:	0b390b3b          	0xb390b3b
 566:	1349                	addi	t1,t1,-14
 568:	0000                	unimp
 56a:	03011307          	0x3011307
 56e:	0b0e                	slli	s6,s6,0x3
 570:	3b0b3a0b          	0x3b0b3a0b
 574:	010b390b          	0x10b390b
 578:	08000013          	li	zero,128
 57c:	012e                	slli	sp,sp,0xb
 57e:	0e03193f 0b3b0b3a 	0xb3b0b3a0e03193f
 586:	0b39                	addi	s6,s6,14
 588:	13491927          	0x13491927
 58c:	0111                	addi	sp,sp,4
 58e:	0712                	slli	a4,a4,0x4
 590:	1840                	addi	s0,sp,52
 592:	197a                	slli	s2,s2,0x3e
 594:	1301                	addi	t1,t1,-32
 596:	0000                	unimp
 598:	3409                	addiw	s0,s0,-30
 59a:	0300                	addi	s0,sp,384
 59c:	3a08                	fld	fa0,48(a2)
 59e:	390b3b0b          	0x390b3b0b
 5a2:	0213490b          	0x213490b
 5a6:	0018                	0x18
 5a8:	0a00                	addi	s0,sp,272
 5aa:	0024                	addi	s1,sp,8
 5ac:	0b3e0b0b          	0xb3e0b0b
 5b0:	00000803          	lb	a6,0(zero) # 0 <BASE_ADDR-0xffffffe000200000>
 5b4:	0100                	addi	s0,sp,128
 5b6:	000d                	c.nop	3
 5b8:	0b3a0e03          	lb	t3,179(s4)
 5bc:	0b390b3b          	0xb390b3b
 5c0:	1349                	addi	t1,t1,-14
 5c2:	0b38                	addi	a4,sp,408
 5c4:	0000                	unimp
 5c6:	0f02                	c.slli64	t5
 5c8:	0b00                	addi	s0,sp,400
 5ca:	0821                	addi	a6,a6,8
 5cc:	1349                	addi	t1,t1,-14
 5ce:	0000                	unimp
 5d0:	03003403          	ld	s0,48(zero) # 30 <BASE_ADDR-0xffffffe0001fffd0>
 5d4:	3a08                	fld	fa0,48(a2)
 5d6:	0121                	addi	sp,sp,8
 5d8:	0b390b3b          	0xb390b3b
 5dc:	1349                	addi	t1,t1,-14
 5de:	1802                	slli	a6,a6,0x20
 5e0:	0000                	unimp
 5e2:	0d04                	addi	s1,sp,656
 5e4:	0300                	addi	s0,sp,384
 5e6:	3a08                	fld	fa0,48(a2)
 5e8:	390b3b0b          	0x390b3b0b
 5ec:	3813490b          	0x3813490b
 5f0:	0500000b          	0x500000b
 5f4:	0005                	c.nop	1
 5f6:	1349                	addi	t1,t1,-14
 5f8:	0000                	unimp
 5fa:	1306                	slli	t1,t1,0x21
 5fc:	0301                	addi	t1,t1,0
 5fe:	0b0e                	slli	s6,s6,0x3
 600:	3b0b3a0b          	0x3b0b3a0b
 604:	0821390b          	0x821390b
 608:	1301                	addi	t1,t1,-32
 60a:	0000                	unimp
 60c:	03000507          	0x3000507
 610:	3a0e                	fld	fs4,224(sp)
 612:	0121                	addi	sp,sp,8
 614:	0b390b3b          	0xb390b3b
 618:	1349                	addi	t1,t1,-14
 61a:	1802                	slli	a6,a6,0x20
 61c:	0000                	unimp
 61e:	0b08                	addi	a0,sp,400
 620:	1101                	addi	sp,sp,-32
 622:	1201                	addi	tp,tp,-32
 624:	09000007          	0x9000007
 628:	0024                	addi	s1,sp,8
 62a:	0b3e0b0b          	0xb3e0b0b
 62e:	00000e03          	lb	t3,0(zero) # 0 <BASE_ADDR-0xffffffe000200000>
 632:	0d0a                	slli	s10,s10,0x2
 634:	0300                	addi	s0,sp,384
 636:	3a0e                	fld	fs4,224(sp)
 638:	0221                	addi	tp,tp,8
 63a:	21390b3b          	0x21390b3b
 63e:	490c                	lw	a1,16(a0)
 640:	00053813          	sltiu	a6,a0,0
 644:	0b00                	addi	s0,sp,400
 646:	012e                	slli	sp,sp,0xb
 648:	0e03193f 0b3b0b3a 	0xb3b0b3a0e03193f
 650:	0b39                	addi	s6,s6,14
 652:	1349                	addi	t1,t1,-14
 654:	193c                	addi	a5,sp,184
 656:	1301                	addi	t1,t1,-32
 658:	0000                	unimp
 65a:	180c                	addi	a1,sp,48
 65c:	0000                	unimp
 65e:	0d00                	addi	s0,sp,656
 660:	0101                	addi	sp,sp,0
 662:	1349                	addi	t1,t1,-14
 664:	1301                	addi	t1,t1,-32
 666:	0000                	unimp
 668:	210e                	fld	ft2,192(sp)
 66a:	4900                	lw	s0,16(a0)
 66c:	000b2f13          	slti	t5,s6,0
 670:	0f00                	addi	s0,sp,912
 672:	012e                	slli	sp,sp,0xb
 674:	0e03193f 0b3b0b3a 	0xb3b0b3a0e03193f
 67c:	0b39                	addi	s6,s6,14
 67e:	13491927          	0x13491927
 682:	193c                	addi	a5,sp,184
 684:	1301                	addi	t1,t1,-32
 686:	0000                	unimp
 688:	2e10                	fld	fa2,24(a2)
 68a:	3f01                	addiw	t5,t5,-32
 68c:	0319                	addi	t1,t1,6
 68e:	3a0e                	fld	fs4,224(sp)
 690:	390b3b0b          	0x390b3b0b
 694:	3c19270b          	0x3c19270b
 698:	0119                	addi	sp,sp,6
 69a:	11000013          	li	zero,272
 69e:	012e                	slli	sp,sp,0xb
 6a0:	0e03193f 3b01213a 	0x3b01213a0e03193f
 6a8:	0621390b          	0x621390b
 6ac:	01111927          	0x1111927
 6b0:	0712                	slli	a4,a4,0x4
 6b2:	1840                	addi	s0,sp,52
 6b4:	197c                	addi	a5,sp,188
 6b6:	1301                	addi	t1,t1,-32
 6b8:	0000                	unimp
 6ba:	3412                	fld	fs0,288(sp)
 6bc:	0300                	addi	s0,sp,384
 6be:	3a0e                	fld	fs4,224(sp)
 6c0:	0121                	addi	sp,sp,8
 6c2:	0b390b3b          	0xb390b3b
 6c6:	1349                	addi	t1,t1,-14
 6c8:	1802                	slli	a6,a6,0x20
 6ca:	0000                	unimp
 6cc:	25011113          	0x25011113
 6d0:	130e                	slli	t1,t1,0x23
 6d2:	1b1f030b          	0x1b1f030b
 6d6:	551f 1117 1001      	0x10011117551f
 6dc:	14000017          	auipc	zero,0x14000
 6e0:	0016                	c.slli	zero,0x5
 6e2:	0b3a0e03          	lb	t3,179(s4)
 6e6:	0b390b3b          	0xb390b3b
 6ea:	1349                	addi	t1,t1,-14
 6ec:	0000                	unimp
 6ee:	1315                	addi	t1,t1,-27
 6f0:	0301                	addi	t1,t1,0
 6f2:	0b0e                	slli	s6,s6,0x3
 6f4:	3a05                	addiw	s4,s4,-31
 6f6:	390b3b0b          	0x390b3b0b
 6fa:	0013010b          	0x13010b
 6fe:	1600                	addi	s0,sp,800
 700:	0024                	addi	s1,sp,8
 702:	0b3e0b0b          	0xb3e0b0b
 706:	00000803          	lb	a6,0(zero) # 0 <BASE_ADDR-0xffffffe000200000>
 70a:	03003417          	auipc	s0,0x3003
 70e:	3a0e                	fld	fs4,224(sp)
 710:	390b3b0b          	0x390b3b0b
 714:	3f13490b          	0x3f13490b
 718:	3c19                	addiw	s8,s8,-26
 71a:	0019                	c.nop	6
 71c:	1800                	addi	s0,sp,48
 71e:	0b0b000f          	0xb0b000f
 722:	0000                	unimp
 724:	2619                	addiw	a2,a2,6
 726:	0000                	unimp
 728:	1a00                	addi	s0,sp,304
 72a:	0026                	c.slli	zero,0x9
 72c:	1349                	addi	t1,t1,-14
 72e:	0000                	unimp
 730:	11010b1b          	addiw	s6,sp,272
 734:	1201                	addi	tp,tp,-32
 736:	00130107          	0x130107
 73a:	1c00                	addi	s0,sp,560
 73c:	002e                	c.slli	zero,0xb
 73e:	0e03193f 0b3b0b3a 	0xb3b0b3a0e03193f
 746:	0b39                	addi	s6,s6,14
 748:	0111                	addi	sp,sp,4
 74a:	0712                	slli	a4,a4,0x4
 74c:	1840                	addi	s0,sp,52
 74e:	197c                	addi	a5,sp,188
 750:	0000                	unimp
 752:	2e1d                	addiw	t3,t3,7
 754:	3f01                	addiw	t5,t5,-32
 756:	0319                	addi	t1,t1,6
 758:	3a0e                	fld	fs4,224(sp)
 75a:	390b3b0b          	0x390b3b0b
 75e:	1119270b          	0x1119270b
 762:	1201                	addi	tp,tp,-32
 764:	7a184007          	flq	ft0,1953(a6)
 768:	0119                	addi	sp,sp,6
 76a:	1e000013          	li	zero,480
 76e:	012e                	slli	sp,sp,0xb
 770:	0e03193f 0b3b0b3a 	0xb3b0b3a0e03193f
 778:	0b39                	addi	s6,s6,14
 77a:	01111927          	0x1111927
 77e:	0712                	slli	a4,a4,0x4
 780:	1840                	addi	s0,sp,52
 782:	197c                	addi	a5,sp,188
 784:	0000                	unimp
 786:	0100                	addi	s0,sp,128
 788:	000d                	c.nop	3
 78a:	0b3a0e03          	lb	t3,179(s4)
 78e:	0b390b3b          	0xb390b3b
 792:	1349                	addi	t1,t1,-14
 794:	0b38                	addi	a4,sp,408
 796:	0000                	unimp
 798:	0502                	c.slli64	a0
 79a:	4900                	lw	s0,16(a0)
 79c:	03000013          	li	zero,48
 7a0:	210b000f          	0x210b000f
 7a4:	4908                	lw	a0,16(a0)
 7a6:	04000013          	li	zero,64
 7aa:	000d                	c.nop	3
 7ac:	0b3a0803          	lb	a6,179(s4)
 7b0:	0b390b3b          	0xb390b3b
 7b4:	1349                	addi	t1,t1,-14
 7b6:	0b38                	addi	a4,sp,408
 7b8:	0000                	unimp
 7ba:	1305                	addi	t1,t1,-31
 7bc:	0301                	addi	t1,t1,0
 7be:	0b0e                	slli	s6,s6,0x3
 7c0:	3b0b3a0b          	0x3b0b3a0b
 7c4:	0821390b          	0x821390b
 7c8:	1301                	addi	t1,t1,-32
 7ca:	0000                	unimp
 7cc:	3406                	fld	fs0,96(sp)
 7ce:	0300                	addi	s0,sp,384
 7d0:	3a0e                	fld	fs4,224(sp)
 7d2:	0121                	addi	sp,sp,8
 7d4:	21390b3b          	0x21390b3b
 7d8:	490c                	lw	a1,16(a0)
 7da:	00180213          	addi	tp,a6,1
 7de:	0700                	addi	s0,sp,896
 7e0:	012e                	slli	sp,sp,0xb
 7e2:	0e03193f 0b3b0b3a 	0xb3b0b3a0e03193f
 7ea:	0b39                	addi	s6,s6,14
 7ec:	13491927          	0x13491927
 7f0:	193c                	addi	a5,sp,184
 7f2:	1301                	addi	t1,t1,-32
 7f4:	0000                	unimp
 7f6:	0508                	addi	a0,sp,640
 7f8:	0300                	addi	s0,sp,384
 7fa:	3a0e                	fld	fs4,224(sp)
 7fc:	0121                	addi	sp,sp,8
 7fe:	0b390b3b          	0xb390b3b
 802:	1349                	addi	t1,t1,-14
 804:	1802                	slli	a6,a6,0x20
 806:	0000                	unimp
 808:	1809                	addi	a6,a6,-30
 80a:	0000                	unimp
 80c:	0a00                	addi	s0,sp,272
 80e:	0024                	addi	s1,sp,8
 810:	0b3e0b0b          	0xb3e0b0b
 814:	00000e03          	lb	t3,0(zero) # 0 <BASE_ADDR-0xffffffe000200000>
 818:	03000d0b          	0x3000d0b
 81c:	3a0e                	fld	fs4,224(sp)
 81e:	0321                	addi	t1,t1,8
 820:	21390b3b          	0x21390b3b
 824:	490c                	lw	a1,16(a0)
 826:	00053813          	sltiu	a6,a0,0
 82a:	0c00                	addi	s0,sp,528
 82c:	0101                	addi	sp,sp,0
 82e:	1349                	addi	t1,t1,-14
 830:	1301                	addi	t1,t1,-32
 832:	0000                	unimp
 834:	340d                	addiw	s0,s0,-29
 836:	0300                	addi	s0,sp,384
 838:	3a0e                	fld	fs4,224(sp)
 83a:	0121                	addi	sp,sp,8
 83c:	0b390b3b          	0xb390b3b
 840:	1349                	addi	t1,t1,-14
 842:	193c193f 2e0e0000 	0x2e0e0000193c193f
 84a:	3f01                	addiw	t5,t5,-32
 84c:	0319                	addi	t1,t1,6
 84e:	3a0e                	fld	fs4,224(sp)
 850:	390b3b0b          	0x390b3b0b
 854:	0621                	addi	a2,a2,8
 856:	193c1927          	0x193c1927
 85a:	1301                	addi	t1,t1,-32
 85c:	0000                	unimp
 85e:	3f012e0f          	0x3f012e0f
 862:	0319                	addi	t1,t1,6
 864:	3a0e                	fld	fs4,224(sp)
 866:	0121                	addi	sp,sp,8
 868:	21390b3b          	0x21390b3b
 86c:	2706                	fld	fa4,64(sp)
 86e:	1119                	addi	sp,sp,-26
 870:	1201                	addi	tp,tp,-32
 872:	7c184007          	flq	ft0,1985(a6)
 876:	0119                	addi	sp,sp,6
 878:	10000013          	li	zero,256
 87c:	0034                	addi	a3,sp,8
 87e:	213a0803          	lb	a6,531(s4)
 882:	3b01                	addiw	s6,s6,-32
 884:	490b390b          	0x490b390b
 888:	00180213          	addi	tp,a6,1
 88c:	1100                	addi	s0,sp,160
 88e:	0021                	c.nop	8
 890:	1349                	addi	t1,t1,-14
 892:	00000b2f          	0xb2f
 896:	2e12                	fld	ft8,256(sp)
 898:	3f01                	addiw	t5,t5,-32
 89a:	0319                	addi	t1,t1,6
 89c:	3a0e                	fld	fs4,224(sp)
 89e:	390b3b0b          	0x390b3b0b
 8a2:	0621                	addi	a2,a2,8
 8a4:	193c                	addi	a5,sp,184
 8a6:	1301                	addi	t1,t1,-32
 8a8:	0000                	unimp
 8aa:	03000513          	li	a0,48
 8ae:	3a08                	fld	fa0,48(a2)
 8b0:	0121                	addi	sp,sp,8
 8b2:	393c213b          	0x393c213b
 8b6:	0213490b          	0x213490b
 8ba:	0018                	0x18
 8bc:	1400                	addi	s0,sp,544
 8be:	0111                	addi	sp,sp,4
 8c0:	0e25                	addi	t3,t3,9
 8c2:	1f030b13          	addi	s6,t1,496
 8c6:	17551f1b          	0x17551f1b
 8ca:	0111                	addi	sp,sp,4
 8cc:	1710                	addi	a2,sp,928
 8ce:	0000                	unimp
 8d0:	2415                	addiw	s0,s0,5
 8d2:	0b00                	addi	s0,sp,400
 8d4:	030b3e0b          	0x30b3e0b
 8d8:	0008                	0x8
 8da:	1600                	addi	s0,sp,800
 8dc:	0016                	c.slli	zero,0x5
 8de:	0b3a0e03          	lb	t3,179(s4)
 8e2:	0b390b3b          	0xb390b3b
 8e6:	1349                	addi	t1,t1,-14
 8e8:	0000                	unimp
 8ea:	03011317          	auipc	t1,0x3011
 8ee:	0b0e                	slli	s6,s6,0x3
 8f0:	3a05                	addiw	s4,s4,-31
 8f2:	390b3b0b          	0x390b3b0b
 8f6:	0013010b          	0x13010b
 8fa:	1800                	addi	s0,sp,48
 8fc:	0021                	c.nop	8
 8fe:	0000                	unimp
 900:	2619                	addiw	a2,a2,6
 902:	4900                	lw	s0,16(a0)
 904:	1a000013          	li	zero,416
 908:	012e                	slli	sp,sp,0xb
 90a:	0e03193f 0b3b0b3a 	0xb3b0b3a0e03193f
 912:	0b39                	addi	s6,s6,14
 914:	1349                	addi	t1,t1,-14
 916:	193c                	addi	a5,sp,184
 918:	1301                	addi	t1,t1,-32
 91a:	0000                	unimp
 91c:	3f012e1b          	0x3f012e1b
 920:	0319                	addi	t1,t1,6
 922:	3a0e                	fld	fs4,224(sp)
 924:	390b3b0b          	0x390b3b0b
 928:	4919270b          	0x4919270b
 92c:	12011113          	0x12011113
 930:	7a184007          	flq	ft0,1953(a6)
 934:	0019                	c.nop	6
 936:	0000                	unimp
 938:	0501                	addi	a0,a0,0
 93a:	0300                	addi	s0,sp,384
 93c:	3a0e                	fld	fs4,224(sp)
 93e:	0121                	addi	sp,sp,8
 940:	0b390b3b          	0xb390b3b
 944:	1349                	addi	t1,t1,-14
 946:	1802                	slli	a6,a6,0x20
 948:	0000                	unimp
 94a:	3402                	fld	fs0,32(sp)
 94c:	0300                	addi	s0,sp,384
 94e:	3a08                	fld	fa0,48(a2)
 950:	0121                	addi	sp,sp,8
 952:	0b390b3b          	0xb390b3b
 956:	1349                	addi	t1,t1,-14
 958:	1802                	slli	a6,a6,0x20
 95a:	0000                	unimp
 95c:	03000503          	lb	a0,48(zero) # 30 <BASE_ADDR-0xffffffe0001fffd0>
 960:	3a08                	fld	fa0,48(a2)
 962:	0121                	addi	sp,sp,8
 964:	0b390b3b          	0xb390b3b
 968:	1349                	addi	t1,t1,-14
 96a:	1802                	slli	a6,a6,0x20
 96c:	0000                	unimp
 96e:	0d04                	addi	s1,sp,656
 970:	0300                	addi	s0,sp,384
 972:	3a0e                	fld	fs4,224(sp)
 974:	0221                	addi	tp,tp,8
 976:	0b390b3b          	0xb390b3b
 97a:	1349                	addi	t1,t1,-14
 97c:	0b38                	addi	a4,sp,408
 97e:	0000                	unimp
 980:	0f05                	addi	t5,t5,1
 982:	0b00                	addi	s0,sp,400
 984:	0821                	addi	a6,a6,8
 986:	1349                	addi	t1,t1,-14
 988:	0000                	unimp
 98a:	3406                	fld	fs0,96(sp)
 98c:	0300                	addi	s0,sp,384
 98e:	3a0e                	fld	fs4,224(sp)
 990:	0121                	addi	sp,sp,8
 992:	0b390b3b          	0xb390b3b
 996:	1349                	addi	t1,t1,-14
 998:	193c193f 34070000 	0x34070000193c193f
 9a0:	0300                	addi	s0,sp,384
 9a2:	3a0e                	fld	fs4,224(sp)
 9a4:	0121                	addi	sp,sp,8
 9a6:	0b390b3b          	0xb390b3b
 9aa:	1349                	addi	t1,t1,-14
 9ac:	1802                	slli	a6,a6,0x20
 9ae:	0000                	unimp
 9b0:	0508                	addi	a0,sp,640
 9b2:	4900                	lw	s0,16(a0)
 9b4:	09000013          	li	zero,144
 9b8:	012e                	slli	sp,sp,0xb
 9ba:	0e03193f 3b01213a 	0x3b01213a0e03193f
 9c2:	270b390b          	0x270b390b
 9c6:	4919                	li	s2,6
 9c8:	12011113          	0x12011113
 9cc:	7a184007          	flq	ft0,1953(a6)
 9d0:	0119                	addi	sp,sp,6
 9d2:	0a000013          	li	zero,160
 9d6:	0024                	addi	s1,sp,8
 9d8:	0b3e0b0b          	0xb3e0b0b
 9dc:	00000e03          	lb	t3,0(zero) # 0 <BASE_ADDR-0xffffffe000200000>
 9e0:	4901010b          	0x4901010b
 9e4:	00130113          	addi	sp,t1,1 # 30118eb <BASE_ADDR-0xffffffdffd1ee715>
 9e8:	0c00                	addi	s0,sp,528
 9ea:	0111010b          	0x111010b
 9ee:	0712                	slli	a4,a4,0x4
 9f0:	0000                	unimp
 9f2:	130d                	addi	t1,t1,-29
 9f4:	0301                	addi	t1,t1,0
 9f6:	0b0e                	slli	s6,s6,0x3
 9f8:	02213a0b          	0x2213a0b
 9fc:	21390b3b          	0x21390b3b
 a00:	0108                	addi	a0,sp,128
 a02:	0e000013          	li	zero,224
 a06:	0034                	addi	a3,sp,8
 a08:	213a0e03          	lb	t3,531(s4)
 a0c:	3b01                	addiw	s6,s6,-32
 a0e:	0821390b          	0x821390b
 a12:	1349                	addi	t1,t1,-14
 a14:	0188193f 02208021 	0x22080210188193f
 a1c:	0018                	0x18
 a1e:	0f00                	addi	s0,sp,912
 a20:	012e                	slli	sp,sp,0xb
 a22:	0e03193f 213b0b3a 	0x213b0b3a0e03193f
 a2a:	3905                	addiw	s2,s2,-31
 a2c:	4919270b          	0x4919270b
 a30:	01193c13          	sltiu	s8,s2,17
 a34:	10000013          	li	zero,256
 a38:	0018                	0x18
 a3a:	0000                	unimp
 a3c:	2e11                	addiw	t3,t3,4
 a3e:	3f01                	addiw	t5,t5,-32
 a40:	0319                	addi	t1,t1,6
 a42:	3a0e                	fld	fs4,224(sp)
 a44:	0121                	addi	sp,sp,8
 a46:	21390b3b          	0x21390b3b
 a4a:	1106                	slli	sp,sp,0x21
 a4c:	1201                	addi	tp,tp,-32
 a4e:	7c184007          	flq	ft0,1985(a6)
 a52:	0119                	addi	sp,sp,6
 a54:	12000013          	li	zero,288
 a58:	012e                	slli	sp,sp,0xb
 a5a:	213a0e03          	lb	t3,531(s4)
 a5e:	3b01                	addiw	s6,s6,-32
 a60:	0d21390b          	0xd21390b
 a64:	01111927          	0x1111927
 a68:	0712                	slli	a4,a4,0x4
 a6a:	1840                	addi	s0,sp,52
 a6c:	197c                	addi	a5,sp,188
 a6e:	1301                	addi	t1,t1,-32
 a70:	0000                	unimp
 a72:	03012e13          	slti	t3,sp,48
 a76:	3a0e                	fld	fs4,224(sp)
 a78:	0121                	addi	sp,sp,8
 a7a:	21390b3b          	0x21390b3b
 a7e:	4919270f          	0x4919270f
 a82:	12011113          	0x12011113
 a86:	7c184007          	flq	ft0,1985(a6)
 a8a:	0119                	addi	sp,sp,6
 a8c:	14000013          	li	zero,320
 a90:	012e                	slli	sp,sp,0xb
 a92:	213a0e03          	lb	t3,531(s4)
 a96:	3b01                	addiw	s6,s6,-32
 a98:	0f21390b          	0xf21390b
 a9c:	13491927          	0x13491927
 aa0:	0111                	addi	sp,sp,4
 aa2:	0712                	slli	a4,a4,0x4
 aa4:	1840                	addi	s0,sp,52
 aa6:	197a                	slli	s2,s2,0x3e
 aa8:	1301                	addi	t1,t1,-32
 aaa:	0000                	unimp
 aac:	2e15                	addiw	t3,t3,5
 aae:	3f01                	addiw	t5,t5,-32
 ab0:	0319                	addi	t1,t1,6
 ab2:	3a0e                	fld	fs4,224(sp)
 ab4:	0121                	addi	sp,sp,8
 ab6:	21390b3b          	0x21390b3b
 aba:	2708                	fld	fa0,8(a4)
 abc:	4919                	li	s2,6
 abe:	12011113          	0x12011113
 ac2:	7c184007          	flq	ft0,1985(a6)
 ac6:	0119                	addi	sp,sp,6
 ac8:	16000013          	li	zero,352
 acc:	0111                	addi	sp,sp,4
 ace:	0e25                	addi	t3,t3,9
 ad0:	1f030b13          	addi	s6,t1,496
 ad4:	17551f1b          	0x17551f1b
 ad8:	0111                	addi	sp,sp,4
 ada:	1710                	addi	a2,sp,928
 adc:	0000                	unimp
 ade:	03001617          	auipc	a2,0x3001
 ae2:	3a0e                	fld	fs4,224(sp)
 ae4:	390b3b0b          	0x390b3b0b
 ae8:	0013490b          	0x13490b
 aec:	1800                	addi	s0,sp,48
 aee:	0024                	addi	s1,sp,8
 af0:	0b3e0b0b          	0xb3e0b0b
 af4:	00000803          	lb	a6,0(zero) # 0 <BASE_ADDR-0xffffffe000200000>
 af8:	2119                	addiw	sp,sp,6
 afa:	0000                	unimp
 afc:	1a00                	addi	s0,sp,304
 afe:	0026                	c.slli	zero,0x9
 b00:	1349                	addi	t1,t1,-14
 b02:	0000                	unimp
 b04:	4900211b          	0x4900211b
 b08:	00052f13          	slti	t5,a0,0
 b0c:	1c00                	addi	s0,sp,560
 b0e:	0b0b000f          	0xb0b000f
 b12:	0000                	unimp
 b14:	2e1d                	addiw	t3,t3,7
 b16:	3f01                	addiw	t5,t5,-32
 b18:	0319                	addi	t1,t1,6
 b1a:	3a0e                	fld	fs4,224(sp)
 b1c:	390b3b0b          	0x390b3b0b
 b20:	3c13490b          	0x3c13490b
 b24:	0119                	addi	sp,sp,6
 b26:	1e000013          	li	zero,480
 b2a:	012e                	slli	sp,sp,0xb
 b2c:	0e03193f 0b3b0b3a 	0xb3b0b3a0e03193f
 b34:	0b39                	addi	s6,s6,14
 b36:	01111927          	0x1111927
 b3a:	0712                	slli	a4,a4,0x4
 b3c:	1840                	addi	s0,sp,52
 b3e:	197c                	addi	a5,sp,188
 b40:	1301                	addi	t1,t1,-32
 b42:	0000                	unimp
 b44:	0b1f 1101 1201      	0x120111010b1f
 b4a:	00130107          	0x130107
 b4e:	2000                	fld	fs0,0(s0)
 b50:	0021                	c.nop	8
 b52:	1349                	addi	t1,t1,-14
 b54:	00000b2f          	0xb2f
 b58:	2e21                	addiw	t3,t3,8
 b5a:	3f01                	addiw	t5,t5,-32
 b5c:	0319                	addi	t1,t1,6
 b5e:	3a0e                	fld	fs4,224(sp)
 b60:	390b3b0b          	0x390b3b0b
 b64:	1119270b          	0x1119270b
 b68:	1201                	addi	tp,tp,-32
 b6a:	7a184007          	flq	ft0,1953(a6)
 b6e:	0119                	addi	sp,sp,6
 b70:	22000013          	li	zero,544
 b74:	012e                	slli	sp,sp,0xb
 b76:	0e03193f 0b3b0b3a 	0xb3b0b3a0e03193f
 b7e:	0b39                	addi	s6,s6,14
 b80:	13491927          	0x13491927
 b84:	0111                	addi	sp,sp,4
 b86:	0712                	slli	a4,a4,0x4
 b88:	1840                	addi	s0,sp,52
 b8a:	197a                	slli	s2,s2,0x3e
 b8c:	0000                	unimp
 b8e:	0100                	addi	s0,sp,128
 b90:	0024                	addi	s1,sp,8
 b92:	0b3e0b0b          	0xb3e0b0b
 b96:	00000e03          	lb	t3,0(zero) # 0 <BASE_ADDR-0xffffffe000200000>
 b9a:	1802                	slli	a6,a6,0x20
 b9c:	0000                	unimp
 b9e:	0300                	addi	s0,sp,384
 ba0:	012e                	slli	sp,sp,0xb
 ba2:	0e03193f 0b3b0b3a 	0xb3b0b3a0e03193f
 baa:	0b39                	addi	s6,s6,14
 bac:	193c                	addi	a5,sp,184
 bae:	1301                	addi	t1,t1,-32
 bb0:	0000                	unimp
 bb2:	1104                	addi	s1,sp,160
 bb4:	2501                	sext.w	a0,a0
 bb6:	130e                	slli	t1,t1,0x23
 bb8:	1b1f030b          	0x1b1f030b
 bbc:	551f 1117 1001      	0x10011117551f
 bc2:	05000017          	auipc	zero,0x5000
 bc6:	0024                	addi	s1,sp,8
 bc8:	0b3e0b0b          	0xb3e0b0b
 bcc:	00000803          	lb	a6,0(zero) # 0 <BASE_ADDR-0xffffffe000200000>
 bd0:	2e06                	fld	ft8,64(sp)
 bd2:	3f01                	addiw	t5,t5,-32
 bd4:	0319                	addi	t1,t1,6
 bd6:	3a0e                	fld	fs4,224(sp)
 bd8:	390b3b0b          	0x390b3b0b
 bdc:	4919270b          	0x4919270b
 be0:	01193c13          	sltiu	s8,s2,17
 be4:	07000013          	li	zero,112
 be8:	0005                	c.nop	1
 bea:	1349                	addi	t1,t1,-14
 bec:	0000                	unimp
 bee:	0f08                	addi	a0,sp,912
 bf0:	0b00                	addi	s0,sp,400
 bf2:	0013490b          	0x13490b
 bf6:	0900                	addi	s0,sp,144
 bf8:	0026                	c.slli	zero,0x9
 bfa:	1349                	addi	t1,t1,-14
 bfc:	0000                	unimp
 bfe:	2e0a                	fld	ft8,128(sp)
 c00:	3f00                	fld	fs0,56(a4)
 c02:	0319                	addi	t1,t1,6
 c04:	3a0e                	fld	fs4,224(sp)
 c06:	390b3b0b          	0x390b3b0b
 c0a:	1113490b          	0x1113490b
 c0e:	1201                	addi	tp,tp,-32
 c10:	7c184007          	flq	ft0,1985(a6)
 c14:	0019                	c.nop	6
 c16:	0000                	unimp
 c18:	3401                	addiw	s0,s0,-32
 c1a:	0300                	addi	s0,sp,384
 c1c:	3a08                	fld	fa0,48(a2)
 c1e:	0121                	addi	sp,sp,8
 c20:	0b390b3b          	0xb390b3b
 c24:	1349                	addi	t1,t1,-14
 c26:	0000                	unimp
 c28:	0b02                	c.slli64	s6
 c2a:	0001                	nop
 c2c:	0300                	addi	s0,sp,384
 c2e:	0024                	addi	s1,sp,8
 c30:	3e08210b          	0x3e08210b
 c34:	000e030b          	0xe030b
 c38:	0400                	addi	s0,sp,512
 c3a:	0111                	addi	sp,sp,4
 c3c:	0e25                	addi	t3,t3,9
 c3e:	1f030b13          	addi	s6,t1,496
 c42:	17551f1b          	0x17551f1b
 c46:	0111                	addi	sp,sp,4
 c48:	1710                	addi	a2,sp,928
 c4a:	0000                	unimp
 c4c:	2405                	addiw	s0,s0,1
 c4e:	0b00                	addi	s0,sp,400
 c50:	030b3e0b          	0x30b3e0b
 c54:	0008                	0x8
 c56:	0600                	addi	s0,sp,768
 c58:	012e                	slli	sp,sp,0xb
 c5a:	0e03193f 0b3b0b3a 	0xb3b0b3a0e03193f
 c62:	0b39                	addi	s6,s6,14
 c64:	1349                	addi	t1,t1,-14
 c66:	0111                	addi	sp,sp,4
 c68:	0712                	slli	a4,a4,0x4
 c6a:	1840                	addi	s0,sp,52
 c6c:	197a                	slli	s2,s2,0x3e
 c6e:	0000                	unimp
 c70:	0100                	addi	s0,sp,128
 c72:	0034                	addi	a3,sp,8
 c74:	213a0803          	lb	a6,531(s4)
 c78:	3b01                	addiw	s6,s6,-32
 c7a:	490b390b          	0x490b390b
 c7e:	00180213          	addi	tp,a6,1
 c82:	0200                	addi	s0,sp,256
 c84:	0005                	c.nop	1
 c86:	1349                	addi	t1,t1,-14
 c88:	0000                	unimp
 c8a:	03003403          	ld	s0,48(zero) # 30 <BASE_ADDR-0xffffffe0001fffd0>
 c8e:	3a0e                	fld	fs4,224(sp)
 c90:	0121                	addi	sp,sp,8
 c92:	0b390b3b          	0xb390b3b
 c96:	1349                	addi	t1,t1,-14
 c98:	1802                	slli	a6,a6,0x20
 c9a:	0000                	unimp
 c9c:	0b04                	addi	s1,sp,400
 c9e:	1101                	addi	sp,sp,-32
 ca0:	1201                	addi	tp,tp,-32
 ca2:	00130107          	0x130107
 ca6:	0500                	addi	s0,sp,640
 ca8:	0111010b          	0x111010b
 cac:	0712                	slli	a4,a4,0x4
 cae:	0000                	unimp
 cb0:	0506                	slli	a0,a0,0x1
 cb2:	0300                	addi	s0,sp,384
 cb4:	3a08                	fld	fa0,48(a2)
 cb6:	0121                	addi	sp,sp,8
 cb8:	0b390b3b          	0xb390b3b
 cbc:	1349                	addi	t1,t1,-14
 cbe:	1802                	slli	a6,a6,0x20
 cc0:	0000                	unimp
 cc2:	0b002407          	flw	fs0,176(zero) # b0 <BASE_ADDR-0xffffffe0001fff50>
 cc6:	030b3e0b          	0x30b3e0b
 cca:	000e                	c.slli	zero,0x3
 ccc:	0800                	addi	s0,sp,16
 cce:	0016                	c.slli	zero,0x5
 cd0:	0b3a0e03          	lb	t3,179(s4)
 cd4:	0b390b3b          	0xb390b3b
 cd8:	1349                	addi	t1,t1,-14
 cda:	0000                	unimp
 cdc:	0d09                	addi	s10,s10,2
 cde:	0300                	addi	s0,sp,384
 ce0:	3a0e                	fld	fs4,224(sp)
 ce2:	0421                	addi	s0,s0,8
 ce4:	21390b3b          	0x21390b3b
 ce8:	38134907          	flq	fs2,897(t1)
 cec:	0a00000b          	0xa00000b
 cf0:	210b000f          	0x210b000f
 cf4:	4908                	lw	a0,16(a0)
 cf6:	0b000013          	li	zero,176
 cfa:	0111                	addi	sp,sp,4
 cfc:	0e25                	addi	t3,t3,9
 cfe:	1f030b13          	addi	s6,t1,496
 d02:	17551f1b          	0x17551f1b
 d06:	0111                	addi	sp,sp,4
 d08:	1710                	addi	a2,sp,928
 d0a:	0000                	unimp
 d0c:	240c                	fld	fa1,8(s0)
 d0e:	0b00                	addi	s0,sp,400
 d10:	030b3e0b          	0x30b3e0b
 d14:	0008                	0x8
 d16:	0d00                	addi	s0,sp,656
 d18:	0b0b000f          	0xb0b000f
 d1c:	00000e03          	lb	t3,0(zero) # 0 <BASE_ADDR-0xffffffe000200000>
 d20:	130e                	slli	t1,t1,0x23
 d22:	0301                	addi	t1,t1,0
 d24:	0b0e                	slli	s6,s6,0x3
 d26:	3b0b3a0b          	0x3b0b3a0b
 d2a:	010b390b          	0x10b390b
 d2e:	0f000013          	li	zero,240
 d32:	012e                	slli	sp,sp,0xb
 d34:	0e03193f 0b3b0b3a 	0xb3b0b3a0e03193f
 d3c:	0b39                	addi	s6,s6,14
 d3e:	13491927          	0x13491927
 d42:	193c                	addi	a5,sp,184
 d44:	1301                	addi	t1,t1,-32
 d46:	0000                	unimp
 d48:	2e10                	fld	fa2,24(a2)
 d4a:	3f01                	addiw	t5,t5,-32
 d4c:	0319                	addi	t1,t1,6
 d4e:	3a0e                	fld	fs4,224(sp)
 d50:	390b3b0b          	0x390b3b0b
 d54:	4919270b          	0x4919270b
 d58:	12011113          	0x12011113
 d5c:	7c184007          	flq	ft0,1985(a6)
 d60:	0119                	addi	sp,sp,6
 d62:	11000013          	li	zero,272
 d66:	0018                	0x18
 d68:	0000                	unimp
 d6a:	2612                	fld	fa2,256(sp)
 d6c:	4900                	lw	s0,16(a0)
 d6e:	13000013          	li	zero,304
 d72:	012e                	slli	sp,sp,0xb
 d74:	0b3a0e03          	lb	t3,179(s4)
 d78:	0b390b3b          	0xb390b3b
 d7c:	13491927          	0x13491927
 d80:	0111                	addi	sp,sp,4
 d82:	0712                	slli	a4,a4,0x4
 d84:	1840                	addi	s0,sp,52
 d86:	197c                	addi	a5,sp,188
 d88:	1301                	addi	t1,t1,-32
 d8a:	0000                	unimp
 d8c:	0514                	addi	a3,sp,640
 d8e:	0300                	addi	s0,sp,384
 d90:	3a0e                	fld	fs4,224(sp)
 d92:	390b3b0b          	0x390b3b0b
 d96:	0213490b          	0x213490b
 d9a:	0018                	0x18
 d9c:	1500                	addi	s0,sp,672
 d9e:	0115                	addi	sp,sp,5
 da0:	13011927          	0x13011927
 da4:	0000                	unimp
 da6:	0116                	slli	sp,sp,0x5
 da8:	4901                	li	s2,0
 daa:	00130113          	addi	sp,t1,1
 dae:	1700                	addi	s0,sp,928
 db0:	0021                	c.nop	8
 db2:	1349                	addi	t1,t1,-14
 db4:	00000b2f          	0xb2f
 db8:	2e18                	fld	fa4,24(a2)
 dba:	3f01                	addiw	t5,t5,-32
 dbc:	0319                	addi	t1,t1,6
 dbe:	3a0e                	fld	fs4,224(sp)
 dc0:	390b3b0b          	0x390b3b0b
 dc4:	1119270b          	0x1119270b
 dc8:	1201                	addi	tp,tp,-32
 dca:	7c184007          	flq	ft0,1985(a6)
 dce:	0019                	c.nop	6
 dd0:	0000                	unimp
 dd2:	3401                	addiw	s0,s0,-32
 dd4:	0300                	addi	s0,sp,384
 dd6:	3a08                	fld	fa0,48(a2)
 dd8:	0121                	addi	sp,sp,8
 dda:	21390b3b          	0x21390b3b
 dde:	4905                	li	s2,1
 de0:	02193f13          	sltiu	t5,s2,33
 de4:	0018                	0x18
 de6:	0200                	addi	s0,sp,256
 de8:	0005                	c.nop	1
 dea:	213a0803          	lb	a6,531(s4)
 dee:	3b01                	addiw	s6,s6,-32
 df0:	2521                	addiw	a0,a0,8
 df2:	0b39                	addi	s6,s6,14
 df4:	1349                	addi	t1,t1,-14
 df6:	1802                	slli	a6,a6,0x20
 df8:	0000                	unimp
 dfa:	03003403          	ld	s0,48(zero) # 30 <BASE_ADDR-0xffffffe0001fffd0>
 dfe:	3a08                	fld	fa0,48(a2)
 e00:	0121                	addi	sp,sp,8
 e02:	0b390b3b          	0xb390b3b
 e06:	1349                	addi	t1,t1,-14
 e08:	1802                	slli	a6,a6,0x20
 e0a:	0000                	unimp
 e0c:	1104                	addi	s1,sp,160
 e0e:	2501                	sext.w	a0,a0
 e10:	130e                	slli	t1,t1,0x23
 e12:	1b1f030b          	0x1b1f030b
 e16:	551f 1117 1001      	0x10011117551f
 e1c:	05000017          	auipc	zero,0x5000
 e20:	0016                	c.slli	zero,0x5
 e22:	0b3a0e03          	lb	t3,179(s4)
 e26:	0b390b3b          	0xb390b3b
 e2a:	1349                	addi	t1,t1,-14
 e2c:	0000                	unimp
 e2e:	2406                	fld	fs0,64(sp)
 e30:	0b00                	addi	s0,sp,400
 e32:	030b3e0b          	0x30b3e0b
 e36:	000e                	c.slli	zero,0x3
 e38:	0700                	addi	s0,sp,896
 e3a:	0034                	addi	a3,sp,8
 e3c:	0b3a0e03          	lb	t3,179(s4)
 e40:	0b390b3b          	0xb390b3b
 e44:	1349                	addi	t1,t1,-14
 e46:	1802193f 24080000 	0x240800001802193f
 e4e:	0b00                	addi	s0,sp,400
 e50:	030b3e0b          	0x30b3e0b
 e54:	0008                	0x8
 e56:	0900                	addi	s0,sp,144
 e58:	0101                	addi	sp,sp,0
 e5a:	1349                	addi	t1,t1,-14
 e5c:	1301                	addi	t1,t1,-32
 e5e:	0000                	unimp
 e60:	210a                	fld	ft2,128(sp)
 e62:	4900                	lw	s0,16(a0)
 e64:	00052f13          	slti	t5,a0,0
 e68:	0b00                	addi	s0,sp,400
 e6a:	012e                	slli	sp,sp,0xb
 e6c:	0e03193f 0b3b0b3a 	0xb3b0b3a0e03193f
 e74:	0b39                	addi	s6,s6,14
 e76:	13491927          	0x13491927
 e7a:	0111                	addi	sp,sp,4
 e7c:	0712                	slli	a4,a4,0x4
 e7e:	1840                	addi	s0,sp,52
 e80:	197c                	addi	a5,sp,188
 e82:	1301                	addi	t1,t1,-32
 e84:	0000                	unimp
 e86:	2e0c                	fld	fa1,24(a2)
 e88:	3f01                	addiw	t5,t5,-32
 e8a:	0319                	addi	t1,t1,6
 e8c:	3a0e                	fld	fs4,224(sp)
 e8e:	390b3b0b          	0x390b3b0b
 e92:	1113490b          	0x1113490b
 e96:	1201                	addi	tp,tp,-32
 e98:	7a184007          	flq	ft0,1953(a6)
 e9c:	0019                	c.nop	6
 e9e:	0000                	unimp
 ea0:	0501                	addi	a0,a0,0
 ea2:	0300                	addi	s0,sp,384
 ea4:	3a08                	fld	fa0,48(a2)
 ea6:	0121                	addi	sp,sp,8
 ea8:	0b390b3b          	0xb390b3b
 eac:	1349                	addi	t1,t1,-14
 eae:	1802                	slli	a6,a6,0x20
 eb0:	0000                	unimp
 eb2:	3402                	fld	fs0,32(sp)
 eb4:	0300                	addi	s0,sp,384
 eb6:	3a0e                	fld	fs4,224(sp)
 eb8:	0121                	addi	sp,sp,8
 eba:	0b390b3b          	0xb390b3b
 ebe:	1349                	addi	t1,t1,-14
 ec0:	1802                	slli	a6,a6,0x20
 ec2:	0000                	unimp
 ec4:	0b000f03          	lb	t5,176(zero) # b0 <BASE_ADDR-0xffffffe0001fff50>
 ec8:	0821                	addi	a6,a6,8
 eca:	1349                	addi	t1,t1,-14
 ecc:	0000                	unimp
 ece:	2404                	fld	fs1,8(s0)
 ed0:	0b00                	addi	s0,sp,400
 ed2:	030b3e0b          	0x30b3e0b
 ed6:	000e                	c.slli	zero,0x3
 ed8:	0500                	addi	s0,sp,640
 eda:	0111                	addi	sp,sp,4
 edc:	0e25                	addi	t3,t3,9
 ede:	1f030b13          	addi	s6,t1,496
 ee2:	17551f1b          	0x17551f1b
 ee6:	0111                	addi	sp,sp,4
 ee8:	1710                	addi	a2,sp,928
 eea:	0000                	unimp
 eec:	1606                	slli	a2,a2,0x21
 eee:	0300                	addi	s0,sp,384
 ef0:	3a0e                	fld	fs4,224(sp)
 ef2:	390b3b0b          	0x390b3b0b
 ef6:	0013490b          	0x13490b
 efa:	0700                	addi	s0,sp,896
 efc:	012e                	slli	sp,sp,0xb
 efe:	0e03193f 0b3b0b3a 	0xb3b0b3a0e03193f
 f06:	0b39                	addi	s6,s6,14
 f08:	13491927          	0x13491927
 f0c:	0111                	addi	sp,sp,4
 f0e:	0712                	slli	a4,a4,0x4
 f10:	1840                	addi	s0,sp,52
 f12:	197a                	slli	s2,s2,0x3e
 f14:	1301                	addi	t1,t1,-32
 f16:	0000                	unimp
 f18:	0f08                	addi	a0,sp,912
 f1a:	0b00                	addi	s0,sp,400
 f1c:	0900000b          	0x900000b
 f20:	0026                	c.slli	zero,0x9
 f22:	0000                	unimp
 f24:	260a                	fld	fa2,128(sp)
 f26:	4900                	lw	s0,16(a0)
 f28:	0b000013          	li	zero,176
 f2c:	012e                	slli	sp,sp,0xb
 f2e:	0e03193f 0b3b0b3a 	0xb3b0b3a0e03193f
 f36:	0b39                	addi	s6,s6,14
 f38:	13491927          	0x13491927
 f3c:	0111                	addi	sp,sp,4
 f3e:	0712                	slli	a4,a4,0x4
 f40:	1840                	addi	s0,sp,52
 f42:	197a                	slli	s2,s2,0x3e
 f44:	0000                	unimp
 f46:	0b0c                	addi	a1,sp,400
 f48:	1101                	addi	sp,sp,-32
 f4a:	1201                	addi	tp,tp,-32
 f4c:	0d000007          	0xd000007
 f50:	0034                	addi	a3,sp,8
 f52:	0b3a0803          	lb	a6,179(s4)
 f56:	0b390b3b          	0xb390b3b
 f5a:	1349                	addi	t1,t1,-14
 f5c:	1802                	slli	a6,a6,0x20
 f5e:	0000                	unimp
	...

Disassembly of section .debug_aranges:

0000000000000000 <.debug_aranges>:
   0:	003c                	addi	a5,sp,8
   2:	0000                	unimp
   4:	0002                	c.slli64	zero
   6:	0000                	unimp
   8:	0000                	unimp
   a:	0008                	0x8
   c:	0000                	unimp
   e:	0000                	unimp
  10:	0380                	addi	s0,sp,448
  12:	0020                	addi	s0,sp,8
  14:	ffe0                	sd	s0,248(a5)
  16:	ffff                	0xffff
  18:	0028                	addi	a0,sp,8
  1a:	0000                	unimp
  1c:	0000                	unimp
  1e:	0000                	unimp
  20:	03a8                	addi	a0,sp,456
  22:	0020                	addi	s0,sp,8
  24:	ffe0                	sd	s0,248(a5)
  26:	ffff                	0xffff
  28:	0064                	addi	s1,sp,12
	...
  3e:	0000                	unimp
  40:	002c                	addi	a1,sp,8
  42:	0000                	unimp
  44:	0002                	c.slli64	zero
  46:	00000127          	0x127
  4a:	0008                	0x8
  4c:	0000                	unimp
  4e:	0000                	unimp
  50:	0094                	addi	a3,sp,64
  52:	0020                	addi	s0,sp,8
  54:	ffe0                	sd	s0,248(a5)
  56:	ffff                	0xffff
  58:	02ec                	addi	a1,sp,332
	...
  6e:	0000                	unimp
  70:	002c                	addi	a1,sp,8
  72:	0000                	unimp
  74:	0002                	c.slli64	zero
  76:	0150                	addi	a2,sp,132
  78:	0000                	unimp
  7a:	0008                	0x8
  7c:	0000                	unimp
  7e:	0000                	unimp
  80:	0000                	unimp
  82:	0020                	addi	s0,sp,8
  84:	ffe0                	sd	s0,248(a5)
  86:	ffff                	0xffff
  88:	0094                	addi	a3,sp,64
	...
  9e:	0000                	unimp
  a0:	005c                	addi	a5,sp,4
  a2:	0000                	unimp
  a4:	0002                	c.slli64	zero
  a6:	0179                	addi	sp,sp,30
  a8:	0000                	unimp
  aa:	0008                	0x8
  ac:	0000                	unimp
  ae:	0000                	unimp
  b0:	040c                	addi	a1,sp,512
  b2:	0020                	addi	s0,sp,8
  b4:	ffe0                	sd	s0,248(a5)
  b6:	ffff                	0xffff
  b8:	005c                	addi	a5,sp,4
  ba:	0000                	unimp
  bc:	0000                	unimp
  be:	0000                	unimp
  c0:	0468                	addi	a0,sp,524
  c2:	0020                	addi	s0,sp,8
  c4:	ffe0                	sd	s0,248(a5)
  c6:	ffff                	0xffff
  c8:	0078                	addi	a4,sp,12
  ca:	0000                	unimp
  cc:	0000                	unimp
  ce:	0000                	unimp
  d0:	04e0                	addi	s0,sp,588
  d2:	0020                	addi	s0,sp,8
  d4:	ffe0                	sd	s0,248(a5)
  d6:	ffff                	0xffff
  d8:	0080                	addi	s0,sp,64
  da:	0000                	unimp
  dc:	0000                	unimp
  de:	0000                	unimp
  e0:	0560                	addi	s0,sp,652
  e2:	0020                	addi	s0,sp,8
  e4:	ffe0                	sd	s0,248(a5)
  e6:	ffff                	0xffff
  e8:	0044                	addi	s1,sp,4
	...
  fe:	0000                	unimp
 100:	002c                	addi	a1,sp,8
 102:	0000                	unimp
 104:	0002                	c.slli64	zero
 106:	0335                	addi	t1,t1,13
 108:	0000                	unimp
 10a:	0008                	0x8
 10c:	0000                	unimp
 10e:	0000                	unimp
 110:	05a4                	addi	s1,sp,712
 112:	0020                	addi	s0,sp,8
 114:	ffe0                	sd	s0,248(a5)
 116:	ffff                	0xffff
 118:	0028                	addi	a0,sp,8
	...
 12e:	0000                	unimp
 130:	00bc                	addi	a5,sp,72
 132:	0000                	unimp
 134:	0002                	c.slli64	zero
 136:	03c6                	slli	t2,t2,0x11
 138:	0000                	unimp
 13a:	0008                	0x8
 13c:	0000                	unimp
 13e:	0000                	unimp
 140:	05cc                	addi	a1,sp,708
 142:	0020                	addi	s0,sp,8
 144:	ffe0                	sd	s0,248(a5)
 146:	ffff                	0xffff
 148:	0048                	addi	a0,sp,4
 14a:	0000                	unimp
 14c:	0000                	unimp
 14e:	0000                	unimp
 150:	0614                	addi	a3,sp,768
 152:	0020                	addi	s0,sp,8
 154:	ffe0                	sd	s0,248(a5)
 156:	ffff                	0xffff
 158:	00fc                	addi	a5,sp,76
 15a:	0000                	unimp
 15c:	0000                	unimp
 15e:	0000                	unimp
 160:	0710                	addi	a2,sp,896
 162:	0020                	addi	s0,sp,8
 164:	ffe0                	sd	s0,248(a5)
 166:	ffff                	0xffff
 168:	0124                	addi	s1,sp,136
 16a:	0000                	unimp
 16c:	0000                	unimp
 16e:	0000                	unimp
 170:	0834                	addi	a3,sp,24
 172:	0020                	addi	s0,sp,8
 174:	ffe0                	sd	s0,248(a5)
 176:	ffff                	0xffff
 178:	00fc                	addi	a5,sp,76
 17a:	0000                	unimp
 17c:	0000                	unimp
 17e:	0000                	unimp
 180:	0930                	addi	a2,sp,152
 182:	0020                	addi	s0,sp,8
 184:	ffe0                	sd	s0,248(a5)
 186:	ffff                	0xffff
 188:	009c                	addi	a5,sp,64
 18a:	0000                	unimp
 18c:	0000                	unimp
 18e:	0000                	unimp
 190:	09cc                	addi	a1,sp,212
 192:	0020                	addi	s0,sp,8
 194:	ffe0                	sd	s0,248(a5)
 196:	ffff                	0xffff
 198:	0094                	addi	a3,sp,64
 19a:	0000                	unimp
 19c:	0000                	unimp
 19e:	0000                	unimp
 1a0:	0a60                	addi	s0,sp,284
 1a2:	0020                	addi	s0,sp,8
 1a4:	ffe0                	sd	s0,248(a5)
 1a6:	ffff                	0xffff
 1a8:	0064                	addi	s1,sp,12
 1aa:	0000                	unimp
 1ac:	0000                	unimp
 1ae:	0000                	unimp
 1b0:	0ac4                	addi	s1,sp,340
 1b2:	0020                	addi	s0,sp,8
 1b4:	ffe0                	sd	s0,248(a5)
 1b6:	ffff                	0xffff
 1b8:	01c4                	addi	s1,sp,196
 1ba:	0000                	unimp
 1bc:	0000                	unimp
 1be:	0000                	unimp
 1c0:	0c88                	addi	a0,sp,592
 1c2:	0020                	addi	s0,sp,8
 1c4:	ffe0                	sd	s0,248(a5)
 1c6:	ffff                	0xffff
 1c8:	01a0                	addi	s0,sp,200
 1ca:	0000                	unimp
 1cc:	0000                	unimp
 1ce:	0000                	unimp
 1d0:	0e28                	addi	a0,sp,792
 1d2:	0020                	addi	s0,sp,8
 1d4:	ffe0                	sd	s0,248(a5)
 1d6:	ffff                	0xffff
 1d8:	004c                	addi	a1,sp,4
	...
 1ee:	0000                	unimp
 1f0:	002c                	addi	a1,sp,8
 1f2:	0000                	unimp
 1f4:	0002                	c.slli64	zero
 1f6:	0a41                	addi	s4,s4,16
 1f8:	0000                	unimp
 1fa:	0008                	0x8
 1fc:	0000                	unimp
 1fe:	0000                	unimp
 200:	0e74                	addi	a3,sp,796
 202:	0020                	addi	s0,sp,8
 204:	ffe0                	sd	s0,248(a5)
 206:	ffff                	0xffff
 208:	009c                	addi	a5,sp,64
	...
 21e:	0000                	unimp
 220:	006c                	addi	a1,sp,12
 222:	0000                	unimp
 224:	0002                	c.slli64	zero
 226:	0b54                	addi	a3,sp,404
 228:	0000                	unimp
 22a:	0008                	0x8
 22c:	0000                	unimp
 22e:	0000                	unimp
 230:	0f10                	addi	a2,sp,912
 232:	0020                	addi	s0,sp,8
 234:	ffe0                	sd	s0,248(a5)
 236:	ffff                	0xffff
 238:	008c                	addi	a1,sp,64
 23a:	0000                	unimp
 23c:	0000                	unimp
 23e:	0000                	unimp
 240:	0f9c                	addi	a5,sp,976
 242:	0020                	addi	s0,sp,8
 244:	ffe0                	sd	s0,248(a5)
 246:	ffff                	0xffff
 248:	0038                	addi	a4,sp,8
 24a:	0000                	unimp
 24c:	0000                	unimp
 24e:	0000                	unimp
 250:	0fd4                	addi	a3,sp,980
 252:	0020                	addi	s0,sp,8
 254:	ffe0                	sd	s0,248(a5)
 256:	ffff                	0xffff
 258:	0090                	addi	a2,sp,64
 25a:	0000                	unimp
 25c:	0000                	unimp
 25e:	0000                	unimp
 260:	1064                	addi	s1,sp,44
 262:	0020                	addi	s0,sp,8
 264:	ffe0                	sd	s0,248(a5)
 266:	ffff                	0xffff
 268:	003c                	addi	a5,sp,8
 26a:	0000                	unimp
 26c:	0000                	unimp
 26e:	0000                	unimp
 270:	10a0                	addi	s0,sp,104
 272:	0020                	addi	s0,sp,8
 274:	ffe0                	sd	s0,248(a5)
 276:	ffff                	0xffff
 278:	0264                	addi	s1,sp,268
	...
 28e:	0000                	unimp
 290:	005c                	addi	a5,sp,4
 292:	0000                	unimp
 294:	0002                	c.slli64	zero
 296:	0fe2                	slli	t6,t6,0x18
 298:	0000                	unimp
 29a:	0008                	0x8
 29c:	0000                	unimp
 29e:	0000                	unimp
 2a0:	1304                	addi	s1,sp,416
 2a2:	0020                	addi	s0,sp,8
 2a4:	ffe0                	sd	s0,248(a5)
 2a6:	ffff                	0xffff
 2a8:	0070                	addi	a2,sp,12
 2aa:	0000                	unimp
 2ac:	0000                	unimp
 2ae:	0000                	unimp
 2b0:	1374                	addi	a3,sp,428
 2b2:	0020                	addi	s0,sp,8
 2b4:	ffe0                	sd	s0,248(a5)
 2b6:	ffff                	0xffff
 2b8:	0180                	addi	s0,sp,192
 2ba:	0000                	unimp
 2bc:	0000                	unimp
 2be:	0000                	unimp
 2c0:	14f4                	addi	a3,sp,620
 2c2:	0020                	addi	s0,sp,8
 2c4:	ffe0                	sd	s0,248(a5)
 2c6:	ffff                	0xffff
 2c8:	00e8                	addi	a0,sp,76
 2ca:	0000                	unimp
 2cc:	0000                	unimp
 2ce:	0000                	unimp
 2d0:	15dc                	addi	a5,sp,740
 2d2:	0020                	addi	s0,sp,8
 2d4:	ffe0                	sd	s0,248(a5)
 2d6:	ffff                	0xffff
 2d8:	013c                	addi	a5,sp,136
	...
 2ee:	0000                	unimp
 2f0:	012c                	addi	a1,sp,136
 2f2:	0000                	unimp
 2f4:	0002                	c.slli64	zero
 2f6:	0000147b          	0x147b
 2fa:	0008                	0x8
 2fc:	0000                	unimp
 2fe:	0000                	unimp
 300:	1718                	addi	a4,sp,928
 302:	0020                	addi	s0,sp,8
 304:	ffe0                	sd	s0,248(a5)
 306:	ffff                	0xffff
 308:	0074                	addi	a3,sp,12
 30a:	0000                	unimp
 30c:	0000                	unimp
 30e:	0000                	unimp
 310:	178c                	addi	a1,sp,992
 312:	0020                	addi	s0,sp,8
 314:	ffe0                	sd	s0,248(a5)
 316:	ffff                	0xffff
 318:	0078                	addi	a4,sp,12
 31a:	0000                	unimp
 31c:	0000                	unimp
 31e:	0000                	unimp
 320:	1804                	addi	s1,sp,48
 322:	0020                	addi	s0,sp,8
 324:	ffe0                	sd	s0,248(a5)
 326:	ffff                	0xffff
 328:	009c                	addi	a5,sp,64
 32a:	0000                	unimp
 32c:	0000                	unimp
 32e:	0000                	unimp
 330:	18a0                	addi	s0,sp,120
 332:	0020                	addi	s0,sp,8
 334:	ffe0                	sd	s0,248(a5)
 336:	ffff                	0xffff
 338:	00d4                	addi	a3,sp,68
 33a:	0000                	unimp
 33c:	0000                	unimp
 33e:	0000                	unimp
 340:	1974                	addi	a3,sp,188
 342:	0020                	addi	s0,sp,8
 344:	ffe0                	sd	s0,248(a5)
 346:	ffff                	0xffff
 348:	006c                	addi	a1,sp,12
 34a:	0000                	unimp
 34c:	0000                	unimp
 34e:	0000                	unimp
 350:	19e0                	addi	s0,sp,252
 352:	0020                	addi	s0,sp,8
 354:	ffe0                	sd	s0,248(a5)
 356:	ffff                	0xffff
 358:	0030                	addi	a2,sp,8
 35a:	0000                	unimp
 35c:	0000                	unimp
 35e:	0000                	unimp
 360:	1a10                	addi	a2,sp,304
 362:	0020                	addi	s0,sp,8
 364:	ffe0                	sd	s0,248(a5)
 366:	ffff                	0xffff
 368:	0030                	addi	a2,sp,8
 36a:	0000                	unimp
 36c:	0000                	unimp
 36e:	0000                	unimp
 370:	1a40                	addi	s0,sp,308
 372:	0020                	addi	s0,sp,8
 374:	ffe0                	sd	s0,248(a5)
 376:	ffff                	0xffff
 378:	0070                	addi	a2,sp,12
 37a:	0000                	unimp
 37c:	0000                	unimp
 37e:	0000                	unimp
 380:	1ab0                	addi	a2,sp,376
 382:	0020                	addi	s0,sp,8
 384:	ffe0                	sd	s0,248(a5)
 386:	ffff                	0xffff
 388:	0038                	addi	a4,sp,8
 38a:	0000                	unimp
 38c:	0000                	unimp
 38e:	0000                	unimp
 390:	1ae8                	addi	a0,sp,380
 392:	0020                	addi	s0,sp,8
 394:	ffe0                	sd	s0,248(a5)
 396:	ffff                	0xffff
 398:	0040                	addi	s0,sp,4
 39a:	0000                	unimp
 39c:	0000                	unimp
 39e:	0000                	unimp
 3a0:	1b28                	addi	a0,sp,440
 3a2:	0020                	addi	s0,sp,8
 3a4:	ffe0                	sd	s0,248(a5)
 3a6:	ffff                	0xffff
 3a8:	004c                	addi	a1,sp,4
 3aa:	0000                	unimp
 3ac:	0000                	unimp
 3ae:	0000                	unimp
 3b0:	1b74                	addi	a3,sp,444
 3b2:	0020                	addi	s0,sp,8
 3b4:	ffe0                	sd	s0,248(a5)
 3b6:	ffff                	0xffff
 3b8:	006c                	addi	a1,sp,12
 3ba:	0000                	unimp
 3bc:	0000                	unimp
 3be:	0000                	unimp
 3c0:	1be0                	addi	s0,sp,508
 3c2:	0020                	addi	s0,sp,8
 3c4:	ffe0                	sd	s0,248(a5)
 3c6:	ffff                	0xffff
 3c8:	0060                	addi	s0,sp,12
 3ca:	0000                	unimp
 3cc:	0000                	unimp
 3ce:	0000                	unimp
 3d0:	1c40                	addi	s0,sp,564
 3d2:	0020                	addi	s0,sp,8
 3d4:	ffe0                	sd	s0,248(a5)
 3d6:	ffff                	0xffff
 3d8:	00a0                	addi	s0,sp,72
 3da:	0000                	unimp
 3dc:	0000                	unimp
 3de:	0000                	unimp
 3e0:	1ce0                	addi	s0,sp,636
 3e2:	0020                	addi	s0,sp,8
 3e4:	ffe0                	sd	s0,248(a5)
 3e6:	ffff                	0xffff
 3e8:	0158                	addi	a4,sp,132
 3ea:	0000                	unimp
 3ec:	0000                	unimp
 3ee:	0000                	unimp
 3f0:	1e38                	addi	a4,sp,824
 3f2:	0020                	addi	s0,sp,8
 3f4:	ffe0                	sd	s0,248(a5)
 3f6:	ffff                	0xffff
 3f8:	0068                	addi	a0,sp,12
 3fa:	0000                	unimp
 3fc:	0000                	unimp
 3fe:	0000                	unimp
 400:	1ea0                	addi	s0,sp,888
 402:	0020                	addi	s0,sp,8
 404:	ffe0                	sd	s0,248(a5)
 406:	ffff                	0xffff
 408:	0118                	addi	a4,sp,128
	...
 41e:	0000                	unimp
 420:	002c                	addi	a1,sp,8
 422:	0000                	unimp
 424:	0002                	c.slli64	zero
 426:	00001bab          	0x1bab
 42a:	0008                	0x8
 42c:	0000                	unimp
 42e:	0000                	unimp
 430:	1fb8                	addi	a4,sp,1016
 432:	0020                	addi	s0,sp,8
 434:	ffe0                	sd	s0,248(a5)
 436:	ffff                	0xffff
 438:	004c                	addi	a1,sp,4
	...
 44e:	0000                	unimp
 450:	002c                	addi	a1,sp,8
 452:	0000                	unimp
 454:	0002                	c.slli64	zero
 456:	1c4e                	slli	s8,s8,0x33
 458:	0000                	unimp
 45a:	0008                	0x8
 45c:	0000                	unimp
 45e:	0000                	unimp
 460:	2004                	fld	fs1,0(s0)
 462:	0020                	addi	s0,sp,8
 464:	ffe0                	sd	s0,248(a5)
 466:	ffff                	0xffff
 468:	0010                	0x10
	...
 47e:	0000                	unimp
 480:	004c                	addi	a1,sp,4
 482:	0000                	unimp
 484:	0002                	c.slli64	zero
 486:	00001ce7          	0x1ce7
 48a:	0008                	0x8
 48c:	0000                	unimp
 48e:	0000                	unimp
 490:	2014                	fld	fa3,0(s0)
 492:	0020                	addi	s0,sp,8
 494:	ffe0                	sd	s0,248(a5)
 496:	ffff                	0xffff
 498:	0050                	addi	a2,sp,4
 49a:	0000                	unimp
 49c:	0000                	unimp
 49e:	0000                	unimp
 4a0:	2064                	fld	fs1,192(s0)
 4a2:	0020                	addi	s0,sp,8
 4a4:	ffe0                	sd	s0,248(a5)
 4a6:	ffff                	0xffff
 4a8:	04dc                	addi	a5,sp,580
 4aa:	0000                	unimp
 4ac:	0000                	unimp
 4ae:	0000                	unimp
 4b0:	2540                	fld	fs0,136(a0)
 4b2:	0020                	addi	s0,sp,8
 4b4:	ffe0                	sd	s0,248(a5)
 4b6:	ffff                	0xffff
 4b8:	0080                	addi	s0,sp,64
	...
 4ce:	0000                	unimp
 4d0:	003c                	addi	a5,sp,8
 4d2:	0000                	unimp
 4d4:	0002                	c.slli64	zero
 4d6:	20a2                	fld	ft1,8(sp)
 4d8:	0000                	unimp
 4da:	0008                	0x8
 4dc:	0000                	unimp
 4de:	0000                	unimp
 4e0:	25c0                	fld	fs0,136(a1)
 4e2:	0020                	addi	s0,sp,8
 4e4:	ffe0                	sd	s0,248(a5)
 4e6:	ffff                	0xffff
 4e8:	0300                	addi	s0,sp,384
 4ea:	0000                	unimp
 4ec:	0000                	unimp
 4ee:	0000                	unimp
 4f0:	28c0                	fld	fs0,144(s1)
 4f2:	0020                	addi	s0,sp,8
 4f4:	ffe0                	sd	s0,248(a5)
 4f6:	ffff                	0xffff
 4f8:	0058                	addi	a4,sp,4
	...
 50e:	0000                	unimp
 510:	003c                	addi	a5,sp,8
 512:	0000                	unimp
 514:	0002                	c.slli64	zero
 516:	21a4                	fld	fs1,64(a1)
 518:	0000                	unimp
 51a:	0008                	0x8
 51c:	0000                	unimp
 51e:	0000                	unimp
 520:	2918                	fld	fa4,16(a0)
 522:	0020                	addi	s0,sp,8
 524:	ffe0                	sd	s0,248(a5)
 526:	ffff                	0xffff
 528:	006c                	addi	a1,sp,12
 52a:	0000                	unimp
 52c:	0000                	unimp
 52e:	0000                	unimp
 530:	2984                	fld	fs1,16(a1)
 532:	0020                	addi	s0,sp,8
 534:	ffe0                	sd	s0,248(a5)
 536:	ffff                	0xffff
 538:	0078                	addi	a4,sp,12
	...

Disassembly of section .debug_rnglists:

0000000000000000 <.debug_rnglists>:
   0:	0000002b          	0x2b
   4:	0005                	c.nop	1
   6:	0008                	0x8
   8:	0000                	unimp
   a:	0000                	unimp
   c:	8006                	c.mv	zero,ra
   e:	e0002003          	lw	zero,-512(zero) # fffffffffffffe00 <_ebss+0x1fffdf5e60>
  12:	ffff                	0xffff
  14:	a8ff                	0xa8ff
  16:	e0002003          	lw	zero,-512(zero) # fffffffffffffe00 <_ebss+0x1fffdf5e60>
  1a:	ffff                	0xffff
  1c:	06ff                	0x6ff
  1e:	03a8                	addi	a0,sp,456
  20:	0020                	addi	s0,sp,8
  22:	ffe0                	sd	s0,248(a5)
  24:	ffff                	0xffff
  26:	040c                	addi	a1,sp,512
  28:	0020                	addi	s0,sp,8
  2a:	ffe0                	sd	s0,248(a5)
  2c:	ffff                	0xffff
  2e:	4d00                	lw	s0,24(a0)
  30:	0000                	unimp
  32:	0500                	addi	s0,sp,640
  34:	0800                	addi	s0,sp,16
  36:	0000                	unimp
  38:	0000                	unimp
  3a:	0600                	addi	s0,sp,768
  3c:	040c                	addi	a1,sp,512
  3e:	0020                	addi	s0,sp,8
  40:	ffe0                	sd	s0,248(a5)
  42:	ffff                	0xffff
  44:	0468                	addi	a0,sp,524
  46:	0020                	addi	s0,sp,8
  48:	ffe0                	sd	s0,248(a5)
  4a:	ffff                	0xffff
  4c:	6806                	ld	a6,64(sp)
  4e:	2004                	fld	fs1,0(s0)
  50:	e000                	sd	s0,0(s0)
  52:	ffff                	0xffff
  54:	e0ff                	0xe0ff
  56:	2004                	fld	fs1,0(s0)
  58:	e000                	sd	s0,0(s0)
  5a:	ffff                	0xffff
  5c:	06ff                	0x6ff
  5e:	04e0                	addi	s0,sp,588
  60:	0020                	addi	s0,sp,8
  62:	ffe0                	sd	s0,248(a5)
  64:	ffff                	0xffff
  66:	0560                	addi	s0,sp,652
  68:	0020                	addi	s0,sp,8
  6a:	ffe0                	sd	s0,248(a5)
  6c:	ffff                	0xffff
  6e:	6006                	0x6006
  70:	2005                	0x2005
  72:	e000                	sd	s0,0(s0)
  74:	ffff                	0xffff
  76:	a4ff                	0xa4ff
  78:	2005                	0x2005
  7a:	e000                	sd	s0,0(s0)
  7c:	ffff                	0xffff
  7e:	00ff                	0xff
  80:	001a                	c.slli	zero,0x6
  82:	0000                	unimp
  84:	0005                	c.nop	1
  86:	0008                	0x8
  88:	0000                	unimp
  8a:	0000                	unimp
  8c:	a406                	fsd	ft1,8(sp)
  8e:	2005                	0x2005
  90:	e000                	sd	s0,0(s0)
  92:	ffff                	0xffff
  94:	ccff                	0xccff
  96:	2005                	0x2005
  98:	e000                	sd	s0,0(s0)
  9a:	ffff                	0xffff
  9c:	00ff                	0xff
  9e:	000000b3          	add	ra,zero,zero
  a2:	0005                	c.nop	1
  a4:	0008                	0x8
  a6:	0000                	unimp
  a8:	0000                	unimp
  aa:	cc06                	sw	ra,24(sp)
  ac:	2005                	0x2005
  ae:	e000                	sd	s0,0(s0)
  b0:	ffff                	0xffff
  b2:	14ff                	0x14ff
  b4:	2006                	fld	ft0,64(sp)
  b6:	e000                	sd	s0,0(s0)
  b8:	ffff                	0xffff
  ba:	06ff                	0x6ff
  bc:	0614                	addi	a3,sp,768
  be:	0020                	addi	s0,sp,8
  c0:	ffe0                	sd	s0,248(a5)
  c2:	ffff                	0xffff
  c4:	0710                	addi	a2,sp,896
  c6:	0020                	addi	s0,sp,8
  c8:	ffe0                	sd	s0,248(a5)
  ca:	ffff                	0xffff
  cc:	1006                	c.slli	zero,0x21
  ce:	e0002007          	flw	ft0,-512(zero) # fffffffffffffe00 <_ebss+0x1fffdf5e60>
  d2:	ffff                	0xffff
  d4:	34ff                	0x34ff
  d6:	2008                	fld	fa0,0(s0)
  d8:	e000                	sd	s0,0(s0)
  da:	ffff                	0xffff
  dc:	06ff                	0x6ff
  de:	0834                	addi	a3,sp,24
  e0:	0020                	addi	s0,sp,8
  e2:	ffe0                	sd	s0,248(a5)
  e4:	ffff                	0xffff
  e6:	0930                	addi	a2,sp,152
  e8:	0020                	addi	s0,sp,8
  ea:	ffe0                	sd	s0,248(a5)
  ec:	ffff                	0xffff
  ee:	3006                	fld	ft0,96(sp)
  f0:	2009                	0x2009
  f2:	e000                	sd	s0,0(s0)
  f4:	ffff                	0xffff
  f6:	ccff                	0xccff
  f8:	2009                	0x2009
  fa:	e000                	sd	s0,0(s0)
  fc:	ffff                	0xffff
  fe:	06ff                	0x6ff
 100:	09cc                	addi	a1,sp,212
 102:	0020                	addi	s0,sp,8
 104:	ffe0                	sd	s0,248(a5)
 106:	ffff                	0xffff
 108:	0a60                	addi	s0,sp,284
 10a:	0020                	addi	s0,sp,8
 10c:	ffe0                	sd	s0,248(a5)
 10e:	ffff                	0xffff
 110:	6006                	0x6006
 112:	200a                	fld	ft0,128(sp)
 114:	e000                	sd	s0,0(s0)
 116:	ffff                	0xffff
 118:	c4ff                	0xc4ff
 11a:	200a                	fld	ft0,128(sp)
 11c:	e000                	sd	s0,0(s0)
 11e:	ffff                	0xffff
 120:	06ff                	0x6ff
 122:	0ac4                	addi	s1,sp,340
 124:	0020                	addi	s0,sp,8
 126:	ffe0                	sd	s0,248(a5)
 128:	ffff                	0xffff
 12a:	0c88                	addi	a0,sp,592
 12c:	0020                	addi	s0,sp,8
 12e:	ffe0                	sd	s0,248(a5)
 130:	ffff                	0xffff
 132:	8806                	mv	a6,ra
 134:	200c                	fld	fa1,0(s0)
 136:	e000                	sd	s0,0(s0)
 138:	ffff                	0xffff
 13a:	28ff                	0x28ff
 13c:	200e                	fld	ft0,192(sp)
 13e:	e000                	sd	s0,0(s0)
 140:	ffff                	0xffff
 142:	06ff                	0x6ff
 144:	0e28                	addi	a0,sp,792
 146:	0020                	addi	s0,sp,8
 148:	ffe0                	sd	s0,248(a5)
 14a:	ffff                	0xffff
 14c:	0e74                	addi	a3,sp,796
 14e:	0020                	addi	s0,sp,8
 150:	ffe0                	sd	s0,248(a5)
 152:	ffff                	0xffff
 154:	1a00                	addi	s0,sp,304
 156:	0000                	unimp
 158:	0500                	addi	s0,sp,640
 15a:	0800                	addi	s0,sp,16
 15c:	0000                	unimp
 15e:	0000                	unimp
 160:	0600                	addi	s0,sp,768
 162:	0e74                	addi	a3,sp,796
 164:	0020                	addi	s0,sp,8
 166:	ffe0                	sd	s0,248(a5)
 168:	ffff                	0xffff
 16a:	0f10                	addi	a2,sp,912
 16c:	0020                	addi	s0,sp,8
 16e:	ffe0                	sd	s0,248(a5)
 170:	ffff                	0xffff
 172:	5e00                	lw	s0,56(a2)
 174:	0000                	unimp
 176:	0500                	addi	s0,sp,640
 178:	0800                	addi	s0,sp,16
 17a:	0000                	unimp
 17c:	0000                	unimp
 17e:	0600                	addi	s0,sp,768
 180:	0f10                	addi	a2,sp,912
 182:	0020                	addi	s0,sp,8
 184:	ffe0                	sd	s0,248(a5)
 186:	ffff                	0xffff
 188:	0f9c                	addi	a5,sp,976
 18a:	0020                	addi	s0,sp,8
 18c:	ffe0                	sd	s0,248(a5)
 18e:	ffff                	0xffff
 190:	9c06                	add	s8,s8,ra
 192:	e000200f          	0xe000200f
 196:	ffff                	0xffff
 198:	d4ff                	0xd4ff
 19a:	e000200f          	0xe000200f
 19e:	ffff                	0xffff
 1a0:	06ff                	0x6ff
 1a2:	0fd4                	addi	a3,sp,980
 1a4:	0020                	addi	s0,sp,8
 1a6:	ffe0                	sd	s0,248(a5)
 1a8:	ffff                	0xffff
 1aa:	1064                	addi	s1,sp,44
 1ac:	0020                	addi	s0,sp,8
 1ae:	ffe0                	sd	s0,248(a5)
 1b0:	ffff                	0xffff
 1b2:	6406                	ld	s0,64(sp)
 1b4:	2010                	fld	fa2,0(s0)
 1b6:	e000                	sd	s0,0(s0)
 1b8:	ffff                	0xffff
 1ba:	a0ff                	0xa0ff
 1bc:	2010                	fld	fa2,0(s0)
 1be:	e000                	sd	s0,0(s0)
 1c0:	ffff                	0xffff
 1c2:	06ff                	0x6ff
 1c4:	10a0                	addi	s0,sp,104
 1c6:	0020                	addi	s0,sp,8
 1c8:	ffe0                	sd	s0,248(a5)
 1ca:	ffff                	0xffff
 1cc:	1304                	addi	s1,sp,416
 1ce:	0020                	addi	s0,sp,8
 1d0:	ffe0                	sd	s0,248(a5)
 1d2:	ffff                	0xffff
 1d4:	4d00                	lw	s0,24(a0)
 1d6:	0000                	unimp
 1d8:	0500                	addi	s0,sp,640
 1da:	0800                	addi	s0,sp,16
 1dc:	0000                	unimp
 1de:	0000                	unimp
 1e0:	0600                	addi	s0,sp,768
 1e2:	1304                	addi	s1,sp,416
 1e4:	0020                	addi	s0,sp,8
 1e6:	ffe0                	sd	s0,248(a5)
 1e8:	ffff                	0xffff
 1ea:	1374                	addi	a3,sp,428
 1ec:	0020                	addi	s0,sp,8
 1ee:	ffe0                	sd	s0,248(a5)
 1f0:	ffff                	0xffff
 1f2:	7406                	ld	s0,96(sp)
 1f4:	e0002013          	slti	zero,zero,-512
 1f8:	ffff                	0xffff
 1fa:	f4ff                	0xf4ff
 1fc:	2014                	fld	fa3,0(s0)
 1fe:	e000                	sd	s0,0(s0)
 200:	ffff                	0xffff
 202:	06ff                	0x6ff
 204:	14f4                	addi	a3,sp,620
 206:	0020                	addi	s0,sp,8
 208:	ffe0                	sd	s0,248(a5)
 20a:	ffff                	0xffff
 20c:	15dc                	addi	a5,sp,740
 20e:	0020                	addi	s0,sp,8
 210:	ffe0                	sd	s0,248(a5)
 212:	ffff                	0xffff
 214:	dc06                	sw	ra,56(sp)
 216:	2015                	0x2015
 218:	e000                	sd	s0,0(s0)
 21a:	ffff                	0xffff
 21c:	18ff                	0x18ff
 21e:	e0002017          	auipc	zero,0xe0002
 222:	ffff                	0xffff
 224:	00ff                	0xff
 226:	012a                	slli	sp,sp,0xa
 228:	0000                	unimp
 22a:	0005                	c.nop	1
 22c:	0008                	0x8
 22e:	0000                	unimp
 230:	0000                	unimp
 232:	1806                	slli	a6,a6,0x21
 234:	e0002017          	auipc	zero,0xe0002
 238:	ffff                	0xffff
 23a:	8cff                	0x8cff
 23c:	e0002017          	auipc	zero,0xe0002
 240:	ffff                	0xffff
 242:	06ff                	0x6ff
 244:	178c                	addi	a1,sp,992
 246:	0020                	addi	s0,sp,8
 248:	ffe0                	sd	s0,248(a5)
 24a:	ffff                	0xffff
 24c:	1804                	addi	s1,sp,48
 24e:	0020                	addi	s0,sp,8
 250:	ffe0                	sd	s0,248(a5)
 252:	ffff                	0xffff
 254:	0406                	slli	s0,s0,0x1
 256:	2018                	fld	fa4,0(s0)
 258:	e000                	sd	s0,0(s0)
 25a:	ffff                	0xffff
 25c:	a0ff                	0xa0ff
 25e:	2018                	fld	fa4,0(s0)
 260:	e000                	sd	s0,0(s0)
 262:	ffff                	0xffff
 264:	06ff                	0x6ff
 266:	18a0                	addi	s0,sp,120
 268:	0020                	addi	s0,sp,8
 26a:	ffe0                	sd	s0,248(a5)
 26c:	ffff                	0xffff
 26e:	1974                	addi	a3,sp,188
 270:	0020                	addi	s0,sp,8
 272:	ffe0                	sd	s0,248(a5)
 274:	ffff                	0xffff
 276:	7406                	ld	s0,96(sp)
 278:	2019                	0x2019
 27a:	e000                	sd	s0,0(s0)
 27c:	ffff                	0xffff
 27e:	e0ff                	0xe0ff
 280:	2019                	0x2019
 282:	e000                	sd	s0,0(s0)
 284:	ffff                	0xffff
 286:	06ff                	0x6ff
 288:	19e0                	addi	s0,sp,252
 28a:	0020                	addi	s0,sp,8
 28c:	ffe0                	sd	s0,248(a5)
 28e:	ffff                	0xffff
 290:	1a10                	addi	a2,sp,304
 292:	0020                	addi	s0,sp,8
 294:	ffe0                	sd	s0,248(a5)
 296:	ffff                	0xffff
 298:	1006                	c.slli	zero,0x21
 29a:	201a                	fld	ft0,384(sp)
 29c:	e000                	sd	s0,0(s0)
 29e:	ffff                	0xffff
 2a0:	40ff                	0x40ff
 2a2:	201a                	fld	ft0,384(sp)
 2a4:	e000                	sd	s0,0(s0)
 2a6:	ffff                	0xffff
 2a8:	06ff                	0x6ff
 2aa:	1a40                	addi	s0,sp,308
 2ac:	0020                	addi	s0,sp,8
 2ae:	ffe0                	sd	s0,248(a5)
 2b0:	ffff                	0xffff
 2b2:	1ab0                	addi	a2,sp,376
 2b4:	0020                	addi	s0,sp,8
 2b6:	ffe0                	sd	s0,248(a5)
 2b8:	ffff                	0xffff
 2ba:	b006                	fsd	ft1,32(sp)
 2bc:	201a                	fld	ft0,384(sp)
 2be:	e000                	sd	s0,0(s0)
 2c0:	ffff                	0xffff
 2c2:	e8ff                	0xe8ff
 2c4:	201a                	fld	ft0,384(sp)
 2c6:	e000                	sd	s0,0(s0)
 2c8:	ffff                	0xffff
 2ca:	06ff                	0x6ff
 2cc:	1ae8                	addi	a0,sp,380
 2ce:	0020                	addi	s0,sp,8
 2d0:	ffe0                	sd	s0,248(a5)
 2d2:	ffff                	0xffff
 2d4:	1b28                	addi	a0,sp,440
 2d6:	0020                	addi	s0,sp,8
 2d8:	ffe0                	sd	s0,248(a5)
 2da:	ffff                	0xffff
 2dc:	2806                	fld	fa6,64(sp)
 2de:	e000201b          	0xe000201b
 2e2:	ffff                	0xffff
 2e4:	74ff                	0x74ff
 2e6:	e000201b          	0xe000201b
 2ea:	ffff                	0xffff
 2ec:	06ff                	0x6ff
 2ee:	1b74                	addi	a3,sp,444
 2f0:	0020                	addi	s0,sp,8
 2f2:	ffe0                	sd	s0,248(a5)
 2f4:	ffff                	0xffff
 2f6:	1be0                	addi	s0,sp,508
 2f8:	0020                	addi	s0,sp,8
 2fa:	ffe0                	sd	s0,248(a5)
 2fc:	ffff                	0xffff
 2fe:	e006                	sd	ra,0(sp)
 300:	e000201b          	0xe000201b
 304:	ffff                	0xffff
 306:	40ff                	0x40ff
 308:	201c                	fld	fa5,0(s0)
 30a:	e000                	sd	s0,0(s0)
 30c:	ffff                	0xffff
 30e:	06ff                	0x6ff
 310:	1c40                	addi	s0,sp,564
 312:	0020                	addi	s0,sp,8
 314:	ffe0                	sd	s0,248(a5)
 316:	ffff                	0xffff
 318:	1ce0                	addi	s0,sp,636
 31a:	0020                	addi	s0,sp,8
 31c:	ffe0                	sd	s0,248(a5)
 31e:	ffff                	0xffff
 320:	e006                	sd	ra,0(sp)
 322:	201c                	fld	fa5,0(s0)
 324:	e000                	sd	s0,0(s0)
 326:	ffff                	0xffff
 328:	38ff                	0x38ff
 32a:	201e                	fld	ft0,448(sp)
 32c:	e000                	sd	s0,0(s0)
 32e:	ffff                	0xffff
 330:	06ff                	0x6ff
 332:	1e38                	addi	a4,sp,824
 334:	0020                	addi	s0,sp,8
 336:	ffe0                	sd	s0,248(a5)
 338:	ffff                	0xffff
 33a:	1ea0                	addi	s0,sp,888
 33c:	0020                	addi	s0,sp,8
 33e:	ffe0                	sd	s0,248(a5)
 340:	ffff                	0xffff
 342:	a006                	fsd	ft1,0(sp)
 344:	201e                	fld	ft0,448(sp)
 346:	e000                	sd	s0,0(s0)
 348:	ffff                	0xffff
 34a:	b8ff                	0xb8ff
 34c:	201f e000 ffff      	0xffffe000201f
 352:	00ff                	0xff
 354:	001a                	c.slli	zero,0x6
 356:	0000                	unimp
 358:	0005                	c.nop	1
 35a:	0008                	0x8
 35c:	0000                	unimp
 35e:	0000                	unimp
 360:	b806                	fsd	ft1,48(sp)
 362:	201f e000 ffff      	0xffffe000201f
 368:	04ff                	0x4ff
 36a:	2020                	fld	fs0,64(s0)
 36c:	e000                	sd	s0,0(s0)
 36e:	ffff                	0xffff
 370:	00ff                	0xff
 372:	001a                	c.slli	zero,0x6
 374:	0000                	unimp
 376:	0005                	c.nop	1
 378:	0008                	0x8
 37a:	0000                	unimp
 37c:	0000                	unimp
 37e:	0406                	slli	s0,s0,0x1
 380:	2020                	fld	fs0,64(s0)
 382:	e000                	sd	s0,0(s0)
 384:	ffff                	0xffff
 386:	14ff                	0x14ff
 388:	2020                	fld	fs0,64(s0)
 38a:	e000                	sd	s0,0(s0)
 38c:	ffff                	0xffff
 38e:	00ff                	0xff
 390:	003c                	addi	a5,sp,8
 392:	0000                	unimp
 394:	0005                	c.nop	1
 396:	0008                	0x8
 398:	0000                	unimp
 39a:	0000                	unimp
 39c:	1406                	slli	s0,s0,0x21
 39e:	2020                	fld	fs0,64(s0)
 3a0:	e000                	sd	s0,0(s0)
 3a2:	ffff                	0xffff
 3a4:	64ff                	0x64ff
 3a6:	2020                	fld	fs0,64(s0)
 3a8:	e000                	sd	s0,0(s0)
 3aa:	ffff                	0xffff
 3ac:	06ff                	0x6ff
 3ae:	2064                	fld	fs1,192(s0)
 3b0:	0020                	addi	s0,sp,8
 3b2:	ffe0                	sd	s0,248(a5)
 3b4:	ffff                	0xffff
 3b6:	2540                	fld	fs0,136(a0)
 3b8:	0020                	addi	s0,sp,8
 3ba:	ffe0                	sd	s0,248(a5)
 3bc:	ffff                	0xffff
 3be:	4006                	0x4006
 3c0:	2025                	0x2025
 3c2:	e000                	sd	s0,0(s0)
 3c4:	ffff                	0xffff
 3c6:	c0ff                	0xc0ff
 3c8:	2025                	0x2025
 3ca:	e000                	sd	s0,0(s0)
 3cc:	ffff                	0xffff
 3ce:	00ff                	0xff
 3d0:	0000002b          	0x2b
 3d4:	0005                	c.nop	1
 3d6:	0008                	0x8
 3d8:	0000                	unimp
 3da:	0000                	unimp
 3dc:	c006                	sw	ra,0(sp)
 3de:	2025                	0x2025
 3e0:	e000                	sd	s0,0(s0)
 3e2:	ffff                	0xffff
 3e4:	c0ff                	0xc0ff
 3e6:	2028                	fld	fa0,64(s0)
 3e8:	e000                	sd	s0,0(s0)
 3ea:	ffff                	0xffff
 3ec:	06ff                	0x6ff
 3ee:	28c0                	fld	fs0,144(s1)
 3f0:	0020                	addi	s0,sp,8
 3f2:	ffe0                	sd	s0,248(a5)
 3f4:	ffff                	0xffff
 3f6:	2918                	fld	fa4,16(a0)
 3f8:	0020                	addi	s0,sp,8
 3fa:	ffe0                	sd	s0,248(a5)
 3fc:	ffff                	0xffff
 3fe:	2b00                	fld	fs0,16(a4)
 400:	0000                	unimp
 402:	0500                	addi	s0,sp,640
 404:	0800                	addi	s0,sp,16
 406:	0000                	unimp
 408:	0000                	unimp
 40a:	0600                	addi	s0,sp,768
 40c:	2918                	fld	fa4,16(a0)
 40e:	0020                	addi	s0,sp,8
 410:	ffe0                	sd	s0,248(a5)
 412:	ffff                	0xffff
 414:	2984                	fld	fs1,16(a1)
 416:	0020                	addi	s0,sp,8
 418:	ffe0                	sd	s0,248(a5)
 41a:	ffff                	0xffff
 41c:	8406                	mv	s0,ra
 41e:	2029                	0x2029
 420:	e000                	sd	s0,0(s0)
 422:	ffff                	0xffff
 424:	fcff                	0xfcff
 426:	2029                	0x2029
 428:	e000                	sd	s0,0(s0)
 42a:	ffff                	0xffff
 42c:	00ff                	0xff

Disassembly of section .debug_line:

0000000000000000 <.debug_line>:
       0:	00b0                	addi	a2,sp,72
       2:	0000                	unimp
       4:	0005                	c.nop	1
       6:	0008                	0x8
       8:	003c                	addi	a5,sp,8
       a:	0000                	unimp
       c:	0101                	addi	sp,sp,0
       e:	fb01                	bnez	a4,ffffffffffffff1e <_ebss+0x1fffdf5f7e>
      10:	0d0e                	slli	s10,s10,0x3
      12:	0100                	addi	s0,sp,128
      14:	0101                	addi	sp,sp,0
      16:	0001                	nop
      18:	0000                	unimp
      1a:	0001                	nop
      1c:	0100                	addi	s0,sp,128
      1e:	0101                	addi	sp,sp,0
      20:	031f 0000 0000      	0x31f
      26:	003a                	c.slli	zero,0xe
      28:	0000                	unimp
      2a:	006d                	c.nop	27
      2c:	0000                	unimp
      2e:	0102                	c.slli64	sp
      30:	021f 040f 0032      	0x32040f021f
      36:	0000                	unimp
      38:	3200                	fld	fs0,32(a2)
      3a:	0000                	unimp
      3c:	0000                	unimp
      3e:	0095                	addi	ra,ra,5
      40:	0000                	unimp
      42:	9b01                	andi	a4,a4,-32
      44:	0000                	unimp
      46:	0200                	addi	s0,sp,256
      48:	1405                	addi	s0,s0,-31
      4a:	0900                	addi	s0,sp,144
      4c:	8002                	0x8002
      4e:	e0002003          	lw	zero,-512(zero) # fffffffffffffe00 <_ebss+0x1fffdf5e60>
      52:	ffff                	0xffff
      54:	03ff                	0x3ff
      56:	0109                	addi	sp,sp,2
      58:	0505                	addi	a0,a0,1
      5a:	0c090203          	lb	tp,192(s2) # fffffffffffe00c0 <_ebss+0x1fffdd6120>
      5e:	0100                	addi	s0,sp,128
      60:	0c05                	addi	s8,s8,1
      62:	08090403          	lb	s0,128(s2)
      66:	0100                	addi	s0,sp,128
      68:	0105                	addi	sp,sp,1
      6a:	04090103          	lb	sp,64(s2)
      6e:	0100                	addi	s0,sp,128
      70:	1009                	c.nop	-30
      72:	0000                	unimp
      74:	0101                	addi	sp,sp,0
      76:	1d05                	addi	s10,s10,-31
      78:	0900                	addi	s0,sp,144
      7a:	a802                	fsd	ft0,16(sp)
      7c:	e0002003          	lw	zero,-512(zero) # fffffffffffffe00 <_ebss+0x1fffdf5e60>
      80:	ffff                	0xffff
      82:	03ff                	0x3ff
      84:	0112                	slli	sp,sp,0x4
      86:	1205                	addi	tp,tp,-31
      88:	10090203          	lb	tp,256(s2)
      8c:	0100                	addi	s0,sp,128
      8e:	1605                	addi	a2,a2,-31
      90:	08090103          	lb	sp,128(s2)
      94:	0100                	addi	s0,sp,128
      96:	0c05                	addi	s8,s8,1
      98:	08090003          	lb	zero,128(s2)
      9c:	0100                	addi	s0,sp,128
      9e:	0505                	addi	a0,a0,1
      a0:	0c090303          	lb	t1,192(s2)
      a4:	0100                	addi	s0,sp,128
      a6:	0105                	addi	sp,sp,1
      a8:	24090103          	lb	sp,576(s2)
      ac:	0100                	addi	s0,sp,128
      ae:	1409                	addi	s0,s0,-30
      b0:	0000                	unimp
      b2:	0101                	addi	sp,sp,0
      b4:	049c                	addi	a5,sp,576
      b6:	0000                	unimp
      b8:	0005                	c.nop	1
      ba:	0008                	0x8
      bc:	002a                	c.slli	zero,0xa
      be:	0000                	unimp
      c0:	0101                	addi	sp,sp,0
      c2:	fb01                	bnez	a4,ffffffffffffffd2 <_ebss+0x1fffdf6032>
      c4:	0d0e                	slli	s10,s10,0x3
      c6:	0100                	addi	s0,sp,128
      c8:	0101                	addi	sp,sp,0
      ca:	0001                	nop
      cc:	0000                	unimp
      ce:	0001                	nop
      d0:	0100                	addi	s0,sp,128
      d2:	0101                	addi	sp,sp,0
      d4:	011f 0000 0000      	0x11f
      da:	0102                	c.slli64	sp
      dc:	021f 020f 00a3      	0xa3020f021f
      e2:	0000                	unimp
      e4:	a300                	fsd	fs0,0(a4)
      e6:	0000                	unimp
      e8:	0000                	unimp
      ea:	0900                	addi	s0,sp,144
      ec:	9402                	jalr	s0
      ee:	2000                	fld	fs0,0(s0)
      f0:	e000                	sd	s0,0(s0)
      f2:	ffff                	0xffff
      f4:	03ff                	0x3ff
      f6:	0103010b          	0x103010b
      fa:	0409                	addi	s0,s0,2
      fc:	0100                	addi	s0,sp,128
      fe:	04090203          	lb	tp,64(s2)
     102:	0100                	addi	s0,sp,128
     104:	04090303          	lb	t1,64(s2)
     108:	0100                	addi	s0,sp,128
     10a:	04090403          	lb	s0,64(s2)
     10e:	0100                	addi	s0,sp,128
     110:	04090103          	lb	sp,64(s2)
     114:	0100                	addi	s0,sp,128
     116:	04090503          	lb	a0,64(s2)
     11a:	0100                	addi	s0,sp,128
     11c:	04090303          	lb	t1,64(s2)
     120:	0100                	addi	s0,sp,128
     122:	04090103          	lb	sp,64(s2)
     126:	0100                	addi	s0,sp,128
     128:	04090103          	lb	sp,64(s2)
     12c:	0100                	addi	s0,sp,128
     12e:	04090103          	lb	sp,64(s2)
     132:	0100                	addi	s0,sp,128
     134:	04090103          	lb	sp,64(s2)
     138:	0100                	addi	s0,sp,128
     13a:	04090103          	lb	sp,64(s2)
     13e:	0100                	addi	s0,sp,128
     140:	04090103          	lb	sp,64(s2)
     144:	0100                	addi	s0,sp,128
     146:	04090103          	lb	sp,64(s2)
     14a:	0100                	addi	s0,sp,128
     14c:	04090103          	lb	sp,64(s2)
     150:	0100                	addi	s0,sp,128
     152:	04090103          	lb	sp,64(s2)
     156:	0100                	addi	s0,sp,128
     158:	04090103          	lb	sp,64(s2)
     15c:	0100                	addi	s0,sp,128
     15e:	04090103          	lb	sp,64(s2)
     162:	0100                	addi	s0,sp,128
     164:	04090103          	lb	sp,64(s2)
     168:	0100                	addi	s0,sp,128
     16a:	04090103          	lb	sp,64(s2)
     16e:	0100                	addi	s0,sp,128
     170:	04090103          	lb	sp,64(s2)
     174:	0100                	addi	s0,sp,128
     176:	04090103          	lb	sp,64(s2)
     17a:	0100                	addi	s0,sp,128
     17c:	04090103          	lb	sp,64(s2)
     180:	0100                	addi	s0,sp,128
     182:	04090103          	lb	sp,64(s2)
     186:	0100                	addi	s0,sp,128
     188:	04090103          	lb	sp,64(s2)
     18c:	0100                	addi	s0,sp,128
     18e:	04090103          	lb	sp,64(s2)
     192:	0100                	addi	s0,sp,128
     194:	04090103          	lb	sp,64(s2)
     198:	0100                	addi	s0,sp,128
     19a:	04090103          	lb	sp,64(s2)
     19e:	0100                	addi	s0,sp,128
     1a0:	04090103          	lb	sp,64(s2)
     1a4:	0100                	addi	s0,sp,128
     1a6:	04090103          	lb	sp,64(s2)
     1aa:	0100                	addi	s0,sp,128
     1ac:	04090103          	lb	sp,64(s2)
     1b0:	0100                	addi	s0,sp,128
     1b2:	04090103          	lb	sp,64(s2)
     1b6:	0100                	addi	s0,sp,128
     1b8:	04090103          	lb	sp,64(s2)
     1bc:	0100                	addi	s0,sp,128
     1be:	04090103          	lb	sp,64(s2)
     1c2:	0100                	addi	s0,sp,128
     1c4:	04090103          	lb	sp,64(s2)
     1c8:	0100                	addi	s0,sp,128
     1ca:	04090103          	lb	sp,64(s2)
     1ce:	0100                	addi	s0,sp,128
     1d0:	04090103          	lb	sp,64(s2)
     1d4:	0100                	addi	s0,sp,128
     1d6:	04090103          	lb	sp,64(s2)
     1da:	0100                	addi	s0,sp,128
     1dc:	04090703          	lb	a4,64(s2)
     1e0:	0100                	addi	s0,sp,128
     1e2:	04090103          	lb	sp,64(s2)
     1e6:	0100                	addi	s0,sp,128
     1e8:	04090303          	lb	t1,64(s2)
     1ec:	0100                	addi	s0,sp,128
     1ee:	04090103          	lb	sp,64(s2)
     1f2:	0100                	addi	s0,sp,128
     1f4:	04090203          	lb	tp,64(s2)
     1f8:	0100                	addi	s0,sp,128
     1fa:	04090103          	lb	sp,64(s2)
     1fe:	0100                	addi	s0,sp,128
     200:	04090403          	lb	s0,64(s2)
     204:	0100                	addi	s0,sp,128
     206:	04090103          	lb	sp,64(s2)
     20a:	0100                	addi	s0,sp,128
     20c:	04090203          	lb	tp,64(s2)
     210:	0100                	addi	s0,sp,128
     212:	04090603          	lb	a2,64(s2)
     216:	0100                	addi	s0,sp,128
     218:	04090103          	lb	sp,64(s2)
     21c:	0100                	addi	s0,sp,128
     21e:	04090303          	lb	t1,64(s2)
     222:	0100                	addi	s0,sp,128
     224:	04090103          	lb	sp,64(s2)
     228:	0100                	addi	s0,sp,128
     22a:	04090303          	lb	t1,64(s2)
     22e:	0100                	addi	s0,sp,128
     230:	04090103          	lb	sp,64(s2)
     234:	0100                	addi	s0,sp,128
     236:	04090303          	lb	t1,64(s2)
     23a:	0100                	addi	s0,sp,128
     23c:	04090103          	lb	sp,64(s2)
     240:	0100                	addi	s0,sp,128
     242:	04090103          	lb	sp,64(s2)
     246:	0100                	addi	s0,sp,128
     248:	04090103          	lb	sp,64(s2)
     24c:	0100                	addi	s0,sp,128
     24e:	04090103          	lb	sp,64(s2)
     252:	0100                	addi	s0,sp,128
     254:	04090103          	lb	sp,64(s2)
     258:	0100                	addi	s0,sp,128
     25a:	04090103          	lb	sp,64(s2)
     25e:	0100                	addi	s0,sp,128
     260:	04090103          	lb	sp,64(s2)
     264:	0100                	addi	s0,sp,128
     266:	04090103          	lb	sp,64(s2)
     26a:	0100                	addi	s0,sp,128
     26c:	04090103          	lb	sp,64(s2)
     270:	0100                	addi	s0,sp,128
     272:	04090103          	lb	sp,64(s2)
     276:	0100                	addi	s0,sp,128
     278:	04090103          	lb	sp,64(s2)
     27c:	0100                	addi	s0,sp,128
     27e:	04090103          	lb	sp,64(s2)
     282:	0100                	addi	s0,sp,128
     284:	04090103          	lb	sp,64(s2)
     288:	0100                	addi	s0,sp,128
     28a:	04090103          	lb	sp,64(s2)
     28e:	0100                	addi	s0,sp,128
     290:	04090103          	lb	sp,64(s2)
     294:	0100                	addi	s0,sp,128
     296:	04090103          	lb	sp,64(s2)
     29a:	0100                	addi	s0,sp,128
     29c:	04090103          	lb	sp,64(s2)
     2a0:	0100                	addi	s0,sp,128
     2a2:	04090103          	lb	sp,64(s2)
     2a6:	0100                	addi	s0,sp,128
     2a8:	04090103          	lb	sp,64(s2)
     2ac:	0100                	addi	s0,sp,128
     2ae:	04090103          	lb	sp,64(s2)
     2b2:	0100                	addi	s0,sp,128
     2b4:	04090103          	lb	sp,64(s2)
     2b8:	0100                	addi	s0,sp,128
     2ba:	04090103          	lb	sp,64(s2)
     2be:	0100                	addi	s0,sp,128
     2c0:	04090103          	lb	sp,64(s2)
     2c4:	0100                	addi	s0,sp,128
     2c6:	04090103          	lb	sp,64(s2)
     2ca:	0100                	addi	s0,sp,128
     2cc:	04090103          	lb	sp,64(s2)
     2d0:	0100                	addi	s0,sp,128
     2d2:	04090103          	lb	sp,64(s2)
     2d6:	0100                	addi	s0,sp,128
     2d8:	04090103          	lb	sp,64(s2)
     2dc:	0100                	addi	s0,sp,128
     2de:	04090103          	lb	sp,64(s2)
     2e2:	0100                	addi	s0,sp,128
     2e4:	04090103          	lb	sp,64(s2)
     2e8:	0100                	addi	s0,sp,128
     2ea:	04090103          	lb	sp,64(s2)
     2ee:	0100                	addi	s0,sp,128
     2f0:	04090103          	lb	sp,64(s2)
     2f4:	0100                	addi	s0,sp,128
     2f6:	04090403          	lb	s0,64(s2)
     2fa:	0100                	addi	s0,sp,128
     2fc:	04090203          	lb	tp,64(s2)
     300:	0100                	addi	s0,sp,128
     302:	04090103          	lb	sp,64(s2)
     306:	0100                	addi	s0,sp,128
     308:	04090203          	lb	tp,64(s2)
     30c:	0100                	addi	s0,sp,128
     30e:	04090203          	lb	tp,64(s2)
     312:	0100                	addi	s0,sp,128
     314:	04090403          	lb	s0,64(s2)
     318:	0100                	addi	s0,sp,128
     31a:	04090103          	lb	sp,64(s2)
     31e:	0100                	addi	s0,sp,128
     320:	04090403          	lb	s0,64(s2)
     324:	0100                	addi	s0,sp,128
     326:	04090703          	lb	a4,64(s2)
     32a:	0100                	addi	s0,sp,128
     32c:	04090603          	lb	a2,64(s2)
     330:	0100                	addi	s0,sp,128
     332:	04090203          	lb	tp,64(s2)
     336:	0100                	addi	s0,sp,128
     338:	04090403          	lb	s0,64(s2)
     33c:	0100                	addi	s0,sp,128
     33e:	04090103          	lb	sp,64(s2)
     342:	0100                	addi	s0,sp,128
     344:	04090103          	lb	sp,64(s2)
     348:	0100                	addi	s0,sp,128
     34a:	04090103          	lb	sp,64(s2)
     34e:	0100                	addi	s0,sp,128
     350:	04090103          	lb	sp,64(s2)
     354:	0100                	addi	s0,sp,128
     356:	04090103          	lb	sp,64(s2)
     35a:	0100                	addi	s0,sp,128
     35c:	04090103          	lb	sp,64(s2)
     360:	0100                	addi	s0,sp,128
     362:	04090103          	lb	sp,64(s2)
     366:	0100                	addi	s0,sp,128
     368:	04090103          	lb	sp,64(s2)
     36c:	0100                	addi	s0,sp,128
     36e:	04090103          	lb	sp,64(s2)
     372:	0100                	addi	s0,sp,128
     374:	04090103          	lb	sp,64(s2)
     378:	0100                	addi	s0,sp,128
     37a:	04090103          	lb	sp,64(s2)
     37e:	0100                	addi	s0,sp,128
     380:	04090103          	lb	sp,64(s2)
     384:	0100                	addi	s0,sp,128
     386:	04090103          	lb	sp,64(s2)
     38a:	0100                	addi	s0,sp,128
     38c:	04090103          	lb	sp,64(s2)
     390:	0100                	addi	s0,sp,128
     392:	04090203          	lb	tp,64(s2)
     396:	0100                	addi	s0,sp,128
     398:	04090103          	lb	sp,64(s2)
     39c:	0100                	addi	s0,sp,128
     39e:	04090103          	lb	sp,64(s2)
     3a2:	0100                	addi	s0,sp,128
     3a4:	04090103          	lb	sp,64(s2)
     3a8:	0100                	addi	s0,sp,128
     3aa:	04090103          	lb	sp,64(s2)
     3ae:	0100                	addi	s0,sp,128
     3b0:	04090103          	lb	sp,64(s2)
     3b4:	0100                	addi	s0,sp,128
     3b6:	04090203          	lb	tp,64(s2)
     3ba:	0100                	addi	s0,sp,128
     3bc:	04090103          	lb	sp,64(s2)
     3c0:	0100                	addi	s0,sp,128
     3c2:	04090103          	lb	sp,64(s2)
     3c6:	0100                	addi	s0,sp,128
     3c8:	04090103          	lb	sp,64(s2)
     3cc:	0100                	addi	s0,sp,128
     3ce:	04090103          	lb	sp,64(s2)
     3d2:	0100                	addi	s0,sp,128
     3d4:	04090103          	lb	sp,64(s2)
     3d8:	0100                	addi	s0,sp,128
     3da:	04090103          	lb	sp,64(s2)
     3de:	0100                	addi	s0,sp,128
     3e0:	04090103          	lb	sp,64(s2)
     3e4:	0100                	addi	s0,sp,128
     3e6:	04090103          	lb	sp,64(s2)
     3ea:	0100                	addi	s0,sp,128
     3ec:	04090103          	lb	sp,64(s2)
     3f0:	0100                	addi	s0,sp,128
     3f2:	04090103          	lb	sp,64(s2)
     3f6:	0100                	addi	s0,sp,128
     3f8:	04090103          	lb	sp,64(s2)
     3fc:	0100                	addi	s0,sp,128
     3fe:	04090103          	lb	sp,64(s2)
     402:	0100                	addi	s0,sp,128
     404:	04090103          	lb	sp,64(s2)
     408:	0100                	addi	s0,sp,128
     40a:	04090103          	lb	sp,64(s2)
     40e:	0100                	addi	s0,sp,128
     410:	04090203          	lb	tp,64(s2)
     414:	0100                	addi	s0,sp,128
     416:	04090103          	lb	sp,64(s2)
     41a:	0100                	addi	s0,sp,128
     41c:	04090103          	lb	sp,64(s2)
     420:	0100                	addi	s0,sp,128
     422:	04090103          	lb	sp,64(s2)
     426:	0100                	addi	s0,sp,128
     428:	04090103          	lb	sp,64(s2)
     42c:	0100                	addi	s0,sp,128
     42e:	04090103          	lb	sp,64(s2)
     432:	0100                	addi	s0,sp,128
     434:	04090303          	lb	t1,64(s2)
     438:	0100                	addi	s0,sp,128
     43a:	04090103          	lb	sp,64(s2)
     43e:	0100                	addi	s0,sp,128
     440:	04090103          	lb	sp,64(s2)
     444:	0100                	addi	s0,sp,128
     446:	04090103          	lb	sp,64(s2)
     44a:	0100                	addi	s0,sp,128
     44c:	08090103          	lb	sp,128(s2)
     450:	0100                	addi	s0,sp,128
     452:	04090103          	lb	sp,64(s2)
     456:	0100                	addi	s0,sp,128
     458:	04090103          	lb	sp,64(s2)
     45c:	0100                	addi	s0,sp,128
     45e:	04090203          	lb	tp,64(s2)
     462:	0100                	addi	s0,sp,128
     464:	04090603          	lb	a2,64(s2)
     468:	0100                	addi	s0,sp,128
     46a:	04090103          	lb	sp,64(s2)
     46e:	0100                	addi	s0,sp,128
     470:	04090303          	lb	t1,64(s2)
     474:	0100                	addi	s0,sp,128
     476:	04090103          	lb	sp,64(s2)
     47a:	0100                	addi	s0,sp,128
     47c:	04090303          	lb	t1,64(s2)
     480:	0100                	addi	s0,sp,128
     482:	04090103          	lb	sp,64(s2)
     486:	0100                	addi	s0,sp,128
     488:	04090203          	lb	tp,64(s2)
     48c:	0100                	addi	s0,sp,128
     48e:	04090103          	lb	sp,64(s2)
     492:	0100                	addi	s0,sp,128
     494:	04090203          	lb	tp,64(s2)
     498:	0100                	addi	s0,sp,128
     49a:	04090103          	lb	sp,64(s2)
     49e:	0100                	addi	s0,sp,128
     4a0:	04090103          	lb	sp,64(s2)
     4a4:	0100                	addi	s0,sp,128
     4a6:	04090103          	lb	sp,64(s2)
     4aa:	0100                	addi	s0,sp,128
     4ac:	04090103          	lb	sp,64(s2)
     4b0:	0100                	addi	s0,sp,128
     4b2:	04090103          	lb	sp,64(s2)
     4b6:	0100                	addi	s0,sp,128
     4b8:	04090103          	lb	sp,64(s2)
     4bc:	0100                	addi	s0,sp,128
     4be:	04090203          	lb	tp,64(s2)
     4c2:	0100                	addi	s0,sp,128
     4c4:	04090103          	lb	sp,64(s2)
     4c8:	0100                	addi	s0,sp,128
     4ca:	04090103          	lb	sp,64(s2)
     4ce:	0100                	addi	s0,sp,128
     4d0:	04090103          	lb	sp,64(s2)
     4d4:	0100                	addi	s0,sp,128
     4d6:	04090103          	lb	sp,64(s2)
     4da:	0100                	addi	s0,sp,128
     4dc:	04090103          	lb	sp,64(s2)
     4e0:	0100                	addi	s0,sp,128
     4e2:	04090103          	lb	sp,64(s2)
     4e6:	0100                	addi	s0,sp,128
     4e8:	04090103          	lb	sp,64(s2)
     4ec:	0100                	addi	s0,sp,128
     4ee:	04090103          	lb	sp,64(s2)
     4f2:	0100                	addi	s0,sp,128
     4f4:	04090103          	lb	sp,64(s2)
     4f8:	0100                	addi	s0,sp,128
     4fa:	04090103          	lb	sp,64(s2)
     4fe:	0100                	addi	s0,sp,128
     500:	04090103          	lb	sp,64(s2)
     504:	0100                	addi	s0,sp,128
     506:	04090103          	lb	sp,64(s2)
     50a:	0100                	addi	s0,sp,128
     50c:	04090103          	lb	sp,64(s2)
     510:	0100                	addi	s0,sp,128
     512:	04090103          	lb	sp,64(s2)
     516:	0100                	addi	s0,sp,128
     518:	04090103          	lb	sp,64(s2)
     51c:	0100                	addi	s0,sp,128
     51e:	04090103          	lb	sp,64(s2)
     522:	0100                	addi	s0,sp,128
     524:	04090103          	lb	sp,64(s2)
     528:	0100                	addi	s0,sp,128
     52a:	04090103          	lb	sp,64(s2)
     52e:	0100                	addi	s0,sp,128
     530:	04090103          	lb	sp,64(s2)
     534:	0100                	addi	s0,sp,128
     536:	04090103          	lb	sp,64(s2)
     53a:	0100                	addi	s0,sp,128
     53c:	04090203          	lb	tp,64(s2)
     540:	0100                	addi	s0,sp,128
     542:	04090203          	lb	tp,64(s2)
     546:	0100                	addi	s0,sp,128
     548:	04090203          	lb	tp,64(s2)
     54c:	0100                	addi	s0,sp,128
     54e:	0409                	addi	s0,s0,2
     550:	0000                	unimp
     552:	0101                	addi	sp,sp,0
     554:	00f4                	addi	a3,sp,76
     556:	0000                	unimp
     558:	0005                	c.nop	1
     55a:	0008                	0x8
     55c:	002a                	c.slli	zero,0xa
     55e:	0000                	unimp
     560:	0101                	addi	sp,sp,0
     562:	fb01                	bnez	a4,472 <BASE_ADDR-0xffffffe0001ffb8e>
     564:	0d0e                	slli	s10,s10,0x3
     566:	0100                	addi	s0,sp,128
     568:	0101                	addi	sp,sp,0
     56a:	0001                	nop
     56c:	0000                	unimp
     56e:	0001                	nop
     570:	0100                	addi	s0,sp,128
     572:	0101                	addi	sp,sp,0
     574:	011f 0000 0000      	0x11f
     57a:	0102                	c.slli64	sp
     57c:	021f 020f 00ab      	0xab020f021f
     582:	0000                	unimp
     584:	ab00                	fsd	fs0,16(a4)
     586:	0000                	unimp
     588:	0000                	unimp
     58a:	0900                	addi	s0,sp,144
     58c:	0002                	c.slli64	zero
     58e:	2000                	fld	fs0,0(s0)
     590:	e000                	sd	s0,0(s0)
     592:	ffff                	0xffff
     594:	03ff                	0x3ff
     596:	010d                	addi	sp,sp,3
     598:	08090203          	lb	tp,128(s2)
     59c:	0100                	addi	s0,sp,128
     59e:	08090103          	lb	sp,128(s2)
     5a2:	0100                	addi	s0,sp,128
     5a4:	08090103          	lb	sp,128(s2)
     5a8:	0100                	addi	s0,sp,128
     5aa:	04090103          	lb	sp,64(s2)
     5ae:	0100                	addi	s0,sp,128
     5b0:	04090303          	lb	t1,64(s2)
     5b4:	0100                	addi	s0,sp,128
     5b6:	04090103          	lb	sp,64(s2)
     5ba:	0100                	addi	s0,sp,128
     5bc:	04090203          	lb	tp,64(s2)
     5c0:	0100                	addi	s0,sp,128
     5c2:	04090103          	lb	sp,64(s2)
     5c6:	0100                	addi	s0,sp,128
     5c8:	04090203          	lb	tp,64(s2)
     5cc:	0100                	addi	s0,sp,128
     5ce:	04090203          	lb	tp,64(s2)
     5d2:	0100                	addi	s0,sp,128
     5d4:	04090203          	lb	tp,64(s2)
     5d8:	0100                	addi	s0,sp,128
     5da:	04090403          	lb	s0,64(s2)
     5de:	0100                	addi	s0,sp,128
     5e0:	04090703          	lb	a4,64(s2)
     5e4:	0100                	addi	s0,sp,128
     5e6:	04090103          	lb	sp,64(s2)
     5ea:	0100                	addi	s0,sp,128
     5ec:	04090103          	lb	sp,64(s2)
     5f0:	0100                	addi	s0,sp,128
     5f2:	08090103          	lb	sp,128(s2)
     5f6:	0100                	addi	s0,sp,128
     5f8:	04090203          	lb	tp,64(s2)
     5fc:	0100                	addi	s0,sp,128
     5fe:	04090103          	lb	sp,64(s2)
     602:	0100                	addi	s0,sp,128
     604:	04090203          	lb	tp,64(s2)
     608:	0100                	addi	s0,sp,128
     60a:	04090503          	lb	a0,64(s2)
     60e:	0100                	addi	s0,sp,128
     610:	08090103          	lb	sp,128(s2)
     614:	0100                	addi	s0,sp,128
     616:	04090103          	lb	sp,64(s2)
     61a:	0100                	addi	s0,sp,128
     61c:	04090403          	lb	s0,64(s2)
     620:	0100                	addi	s0,sp,128
     622:	08090103          	lb	sp,128(s2)
     626:	0100                	addi	s0,sp,128
     628:	04090103          	lb	sp,64(s2)
     62c:	0100                	addi	s0,sp,128
     62e:	08090103          	lb	sp,128(s2)
     632:	0100                	addi	s0,sp,128
     634:	04090103          	lb	sp,64(s2)
     638:	0100                	addi	s0,sp,128
     63a:	04090403          	lb	s0,64(s2)
     63e:	0100                	addi	s0,sp,128
     640:	04090103          	lb	sp,64(s2)
     644:	0100                	addi	s0,sp,128
     646:	0409                	addi	s0,s0,2
     648:	0000                	unimp
     64a:	0101                	addi	sp,sp,0
     64c:	0194                	addi	a3,sp,192
     64e:	0000                	unimp
     650:	0005                	c.nop	1
     652:	0008                	0x8
     654:	0046                	c.slli	zero,0x11
     656:	0000                	unimp
     658:	0101                	addi	sp,sp,0
     65a:	fb01                	bnez	a4,56a <BASE_ADDR-0xffffffe0001ffa96>
     65c:	0d0e                	slli	s10,s10,0x3
     65e:	0100                	addi	s0,sp,128
     660:	0101                	addi	sp,sp,0
     662:	0001                	nop
     664:	0000                	unimp
     666:	0001                	nop
     668:	0100                	addi	s0,sp,128
     66a:	0101                	addi	sp,sp,0
     66c:	031f 0000 0000      	0x31f
     672:	003a                	c.slli	zero,0xe
     674:	0000                	unimp
     676:	006d                	c.nop	27
     678:	0000                	unimp
     67a:	0102                	c.slli64	sp
     67c:	021f 060f 00b2      	0xb2060f021f
     682:	0000                	unimp
     684:	b200                	fsd	fs0,32(a2)
     686:	0000                	unimp
     688:	0000                	unimp
     68a:	000000b7          	lui	ra,0x0
     68e:	bc01                	j	9e <BASE_ADDR-0xffffffe0001fff62>
     690:	0000                	unimp
     692:	0200                	addi	s0,sp,256
     694:	00c5                	addi	ra,ra,17
     696:	0000                	unimp
     698:	9b02                	jalr	s6
     69a:	0000                	unimp
     69c:	0200                	addi	s0,sp,256
     69e:	1105                	addi	sp,sp,-31
     6a0:	0900                	addi	s0,sp,144
     6a2:	0c02                	c.slli64	s8
     6a4:	2004                	fld	fs1,0(s0)
     6a6:	e000                	sd	s0,0(s0)
     6a8:	ffff                	0xffff
     6aa:	03ff                	0x3ff
     6ac:	010c                	addi	a1,sp,128
     6ae:	0705                	addi	a4,a4,1
     6b0:	10090303          	lb	t1,256(s2)
     6b4:	0100                	addi	s0,sp,128
     6b6:	1605                	addi	a2,a2,-31
     6b8:	10090103          	lb	sp,256(s2)
     6bc:	0100                	addi	s0,sp,128
     6be:	1305                	addi	t1,t1,-31
     6c0:	08090003          	lb	zero,128(s2)
     6c4:	0100                	addi	s0,sp,128
     6c6:	0505                	addi	a0,a0,1
     6c8:	0c090203          	lb	tp,192(s2)
     6cc:	0100                	addi	s0,sp,128
     6ce:	0c05                	addi	s8,s8,1
     6d0:	10090103          	lb	sp,256(s2)
     6d4:	0100                	addi	s0,sp,128
     6d6:	0105                	addi	sp,sp,1
     6d8:	04090103          	lb	sp,64(s2)
     6dc:	0100                	addi	s0,sp,128
     6de:	1409                	addi	s0,s0,-30
     6e0:	0000                	unimp
     6e2:	0101                	addi	sp,sp,0
     6e4:	1905                	addi	s2,s2,-31
     6e6:	0900                	addi	s0,sp,144
     6e8:	6802                	ld	a6,0(sp)
     6ea:	2004                	fld	fs1,0(s0)
     6ec:	e000                	sd	s0,0(s0)
     6ee:	ffff                	0xffff
     6f0:	03ff                	0x3ff
     6f2:	0116                	slli	sp,sp,0x5
     6f4:	0a05                	addi	s4,s4,1
     6f6:	14090403          	lb	s0,320(s2)
     6fa:	0100                	addi	s0,sp,128
     6fc:	0505                	addi	a0,a0,1
     6fe:	10090203          	lb	tp,256(s2)
     702:	0100                	addi	s0,sp,128
     704:	0705                	addi	a4,a4,1
     706:	14090203          	lb	tp,320(s2)
     70a:	0100                	addi	s0,sp,128
     70c:	1305                	addi	t1,t1,-31
     70e:	08090103          	lb	sp,128(s2)
     712:	0100                	addi	s0,sp,128
     714:	0d05                	addi	s10,s10,1
     716:	0c090003          	lb	zero,192(s2)
     71a:	0100                	addi	s0,sp,128
     71c:	1305                	addi	t1,t1,-31
     71e:	08090103          	lb	sp,128(s2)
     722:	0100                	addi	s0,sp,128
     724:	0505                	addi	a0,a0,1
     726:	10090203          	lb	tp,256(s2)
     72a:	0100                	addi	s0,sp,128
     72c:	0105                	addi	sp,sp,1
     72e:	04090103          	lb	sp,64(s2)
     732:	0100                	addi	s0,sp,128
     734:	1009                	c.nop	-30
     736:	0000                	unimp
     738:	0101                	addi	sp,sp,0
     73a:	2905                	addiw	s2,s2,1
     73c:	0900                	addi	s0,sp,144
     73e:	e002                	sd	zero,0(sp)
     740:	2004                	fld	fs1,0(s0)
     742:	e000                	sd	s0,0(s0)
     744:	ffff                	0xffff
     746:	03ff                	0x3ff
     748:	0125                	addi	sp,sp,9
     74a:	1a05                	addi	s4,s4,-31
     74c:	18090103          	lb	sp,384(s2)
     750:	0100                	addi	s0,sp,128
     752:	0b05                	addi	s6,s6,1
     754:	18090003          	lb	zero,384(s2)
     758:	0100                	addi	s0,sp,128
     75a:	0505                	addi	a0,a0,1
     75c:	04090103          	lb	sp,64(s2)
     760:	0100                	addi	s0,sp,128
     762:	0905                	addi	s2,s2,1
     764:	0200                	addi	s0,sp,256
     766:	0204                	addi	s1,sp,256
     768:	04090103          	lb	sp,64(s2)
     76c:	0100                	addi	s0,sp,128
     76e:	3905                	addiw	s2,s2,-31
     770:	0200                	addi	s0,sp,256
     772:	0204                	addi	s1,sp,256
     774:	0c097f03          	0xc097f03
     778:	0100                	addi	s0,sp,128
     77a:	0c05                	addi	s8,s8,1
     77c:	0200                	addi	s0,sp,256
     77e:	0104                	addi	s1,sp,128
     780:	10090003          	lb	zero,256(s2)
     784:	0100                	addi	s0,sp,128
     786:	1b05                	addi	s6,s6,-31
     788:	0200                	addi	s0,sp,256
     78a:	0104                	addi	s1,sp,128
     78c:	04090003          	lb	zero,64(s2)
     790:	0100                	addi	s0,sp,128
     792:	2705                	addiw	a4,a4,1
     794:	0200                	addi	s0,sp,256
     796:	0104                	addi	s1,sp,128
     798:	08090003          	lb	zero,128(s2)
     79c:	0100                	addi	s0,sp,128
     79e:	2405                	addiw	s0,s0,1
     7a0:	0200                	addi	s0,sp,256
     7a2:	0104                	addi	s1,sp,128
     7a4:	04090003          	lb	zero,64(s2)
     7a8:	0100                	addi	s0,sp,128
     7aa:	0105                	addi	sp,sp,1
     7ac:	04090303          	lb	t1,64(s2)
     7b0:	0100                	addi	s0,sp,128
     7b2:	1809                	addi	a6,a6,-30
     7b4:	0000                	unimp
     7b6:	0101                	addi	sp,sp,0
     7b8:	1405                	addi	s0,s0,-31
     7ba:	0900                	addi	s0,sp,144
     7bc:	6002                	0x6002
     7be:	2005                	0x2005
     7c0:	e000                	sd	s0,0(s0)
     7c2:	ffff                	0xffff
     7c4:	03ff                	0x3ff
     7c6:	012c                	addi	a1,sp,136
     7c8:	0505                	addi	a0,a0,1
     7ca:	10090103          	lb	sp,256(s2)
     7ce:	0100                	addi	s0,sp,128
     7d0:	14090103          	lb	sp,320(s2)
     7d4:	0100                	addi	s0,sp,128
     7d6:	0105                	addi	sp,sp,1
     7d8:	0c090103          	lb	sp,192(s2)
     7dc:	0100                	addi	s0,sp,128
     7de:	1409                	addi	s0,s0,-30
     7e0:	0000                	unimp
     7e2:	0101                	addi	sp,sp,0
     7e4:	00000063          	beqz	zero,7e4 <BASE_ADDR-0xffffffe0001ff81c>
     7e8:	0005                	c.nop	1
     7ea:	0008                	0x8
     7ec:	00000033          	add	zero,zero,zero
     7f0:	0101                	addi	sp,sp,0
     7f2:	fb01                	bnez	a4,702 <BASE_ADDR-0xffffffe0001ff8fe>
     7f4:	0d0e                	slli	s10,s10,0x3
     7f6:	0100                	addi	s0,sp,128
     7f8:	0101                	addi	sp,sp,0
     7fa:	0001                	nop
     7fc:	0000                	unimp
     7fe:	0001                	nop
     800:	0100                	addi	s0,sp,128
     802:	0101                	addi	sp,sp,0
     804:	021f 0000 0000      	0x21f
     80a:	006d                	c.nop	27
     80c:	0000                	unimp
     80e:	0102                	c.slli64	sp
     810:	021f 030f 00ce      	0xce030f021f
     816:	0000                	unimp
     818:	ce00                	sw	s0,24(a2)
     81a:	0000                	unimp
     81c:	0000                	unimp
     81e:	00bc                	addi	a5,sp,72
     820:	0000                	unimp
     822:	0501                	addi	a0,a0,0
     824:	0209001b          	addiw	zero,s2,32
     828:	05a4                	addi	s1,sp,712
     82a:	0020                	addi	s0,sp,8
     82c:	ffe0                	sd	s0,248(a5)
     82e:	ffff                	0xffff
     830:	0515                	addi	a0,a0,5
     832:	0305                	addi	t1,t1,1
     834:	0901                	addi	s2,s2,0
     836:	0014                	0x14
     838:	0501                	addi	a0,a0,0
     83a:	0402000b          	0x402000b
     83e:	0301                	addi	t1,t1,0
     840:	0901                	addi	s2,s2,0
     842:	0010                	0x10
     844:	0901                	addi	s2,s2,0
     846:	0004                	0x4
     848:	0100                	addi	s0,sp,128
     84a:	ff01                	bnez	a4,762 <BASE_ADDR-0xffffffe0001ff89e>
     84c:	0006                	c.slli	zero,0x1
     84e:	0500                	addi	s0,sp,640
     850:	0800                	addi	s0,sp,16
     852:	5a00                	lw	s0,48(a2)
     854:	0000                	unimp
     856:	0100                	addi	s0,sp,128
     858:	0101                	addi	sp,sp,0
     85a:	000d0efb          	0xd0efb
     85e:	0101                	addi	sp,sp,0
     860:	0101                	addi	sp,sp,0
     862:	0000                	unimp
     864:	0100                	addi	s0,sp,128
     866:	0000                	unimp
     868:	0101                	addi	sp,sp,0
     86a:	1f01                	addi	t5,t5,-32
     86c:	00000003          	lb	zero,0(zero) # 0 <BASE_ADDR-0xffffffe000200000>
     870:	3a00                	fld	fs0,48(a2)
     872:	0000                	unimp
     874:	6d00                	ld	s0,24(a0)
     876:	0000                	unimp
     878:	0200                	addi	s0,sp,256
     87a:	1f01                	addi	t5,t5,-32
     87c:	0f02                	c.slli64	t5
     87e:	d60a                	sw	sp,44(sp)
     880:	0000                	unimp
     882:	0000                	unimp
     884:	00d6                	slli	ra,ra,0x15
     886:	0000                	unimp
     888:	dd00                	sw	s0,56(a0)
     88a:	0000                	unimp
     88c:	0100                	addi	s0,sp,128
     88e:	00e2                	slli	ra,ra,0x18
     890:	0000                	unimp
     892:	e901                	bnez	a0,8a2 <BASE_ADDR-0xffffffe0001ff75e>
     894:	0000                	unimp
     896:	0100                	addi	s0,sp,128
     898:	00bc                	addi	a5,sp,72
     89a:	0000                	unimp
     89c:	f002                	sd	zero,32(sp)
     89e:	0000                	unimp
     8a0:	0200                	addi	s0,sp,256
     8a2:	00c5                	addi	ra,ra,17
     8a4:	0000                	unimp
     8a6:	b702                	fsd	ft0,424(sp)
     8a8:	0000                	unimp
     8aa:	0100                	addi	s0,sp,128
     8ac:	0000009b          	sext.w	ra,zero
     8b0:	0502                	c.slli64	a0
     8b2:	0022                	c.slli	zero,0x8
     8b4:	0209                	addi	tp,tp,2
     8b6:	05cc                	addi	a1,sp,708
     8b8:	0020                	addi	s0,sp,8
     8ba:	ffe0                	sd	s0,248(a5)
     8bc:	ffff                	0xffff
     8be:	05011303          	lh	t1,80(sp)
     8c2:	09010323          	sb	a6,134(sp)
     8c6:	0010                	0x10
     8c8:	0501                	addi	a0,a0,0
     8ca:	030d                	addi	t1,t1,3
     8cc:	0900                	addi	s0,sp,144
     8ce:	0008                	0x8
     8d0:	0501                	addi	a0,a0,0
     8d2:	0305                	addi	t1,t1,1
     8d4:	0905                	addi	s2,s2,1
     8d6:	0004                	0x4
     8d8:	0501                	addi	a0,a0,0
     8da:	030c                	addi	a1,sp,384
     8dc:	0902                	c.slli64	s2
     8de:	0014                	0x14
     8e0:	0501                	addi	a0,a0,0
     8e2:	0301                	addi	t1,t1,0
     8e4:	0901                	addi	s2,s2,0
     8e6:	0004                	0x4
     8e8:	0901                	addi	s2,s2,0
     8ea:	0014                	0x14
     8ec:	0100                	addi	s0,sp,128
     8ee:	0501                	addi	a0,a0,0
     8f0:	02090023          	sb	zero,32(s2)
     8f4:	0614                	addi	a3,sp,768
     8f6:	0020                	addi	s0,sp,8
     8f8:	ffe0                	sd	s0,248(a5)
     8fa:	ffff                	0xffff
     8fc:	05012003          	lw	zero,80(sp)
     900:	0312                	slli	t1,t1,0x4
     902:	0901                	addi	s2,s2,0
     904:	0010                	0x10
     906:	0501                	addi	a0,a0,0
     908:	030c                	addi	a1,sp,384
     90a:	0900                	addi	s0,sp,144
     90c:	0010                	0x10
     90e:	0501                	addi	a0,a0,0
     910:	0332                	slli	t1,t1,0xc
     912:	0901                	addi	s2,s2,0
     914:	001c                	0x1c
     916:	0501                	addi	a0,a0,0
     918:	0319                	addi	t1,t1,6
     91a:	0900                	addi	s0,sp,144
     91c:	0008                	0x8
     91e:	0501                	addi	a0,a0,0
     920:	030e                	slli	t1,t1,0x3
     922:	0902                	c.slli64	s2
     924:	0004                	0x4
     926:	0501                	addi	a0,a0,0
     928:	0310                	addi	a2,sp,384
     92a:	0901                	addi	s2,s2,0
     92c:	0008                	0x8
     92e:	0501                	addi	a0,a0,0
     930:	09010313          	addi	t1,sp,144
     934:	0008                	0x8
     936:	0501                	addi	a0,a0,0
     938:	0311                	addi	t1,t1,4
     93a:	0900                	addi	s0,sp,144
     93c:	0010                	0x10
     93e:	0501                	addi	a0,a0,0
     940:	030c                	addi	a1,sp,384
     942:	0901                	addi	s2,s2,0
     944:	0008                	0x8
     946:	0501                	addi	a0,a0,0
     948:	032c                	addi	a1,sp,392
     94a:	0902                	c.slli64	s2
     94c:	000c                	0xc
     94e:	0501                	addi	a0,a0,0
     950:	0316                	slli	t1,t1,0x5
     952:	0900                	addi	s0,sp,144
     954:	0008                	0x8
     956:	0501                	addi	a0,a0,0
     958:	0314                	addi	a3,sp,384
     95a:	0900                	addi	s0,sp,144
     95c:	0004                	0x4
     95e:	0501                	addi	a0,a0,0
     960:	0306                	slli	t1,t1,0x1
     962:	0901                	addi	s2,s2,0
     964:	0008                	0x8
     966:	0501                	addi	a0,a0,0
     968:	09000323          	sb	a6,134(zero) # 86 <BASE_ADDR-0xffffffe0001fff7a>
     96c:	0008                	0x8
     96e:	0501                	addi	a0,a0,0
     970:	0321                	addi	t1,t1,8
     972:	0901                	addi	s2,s2,0
     974:	0004                	0x4
     976:	0501                	addi	a0,a0,0
     978:	030d                	addi	t1,t1,3
     97a:	0900                	addi	s0,sp,144
     97c:	0008                	0x8
     97e:	0501                	addi	a0,a0,0
     980:	0900030b          	0x900030b
     984:	0004                	0x4
     986:	0501                	addi	a0,a0,0
     988:	0326                	slli	t1,t1,0x9
     98a:	0901                	addi	s2,s2,0
     98c:	0008                	0x8
     98e:	0501                	addi	a0,a0,0
     990:	0314                	addi	a3,sp,384
     992:	0900                	addi	s0,sp,144
     994:	0008                	0x8
     996:	0501                	addi	a0,a0,0
     998:	0312                	slli	t1,t1,0x4
     99a:	0900                	addi	s0,sp,144
     99c:	0004                	0x4
     99e:	0501                	addi	a0,a0,0
     9a0:	0902030b          	0x902030b
     9a4:	0008                	0x8
     9a6:	0501                	addi	a0,a0,0
     9a8:	0312                	slli	t1,t1,0x4
     9aa:	0900                	addi	s0,sp,144
     9ac:	0008                	0x8
     9ae:	0501                	addi	a0,a0,0
     9b0:	030c                	addi	a1,sp,384
     9b2:	0902                	c.slli64	s2
     9b4:	0018                	0x18
     9b6:	0501                	addi	a0,a0,0
     9b8:	0301                	addi	t1,t1,0
     9ba:	0901                	addi	s2,s2,0
     9bc:	0004                	0x4
     9be:	0901                	addi	s2,s2,0
     9c0:	0014                	0x14
     9c2:	0100                	addi	s0,sp,128
     9c4:	0501                	addi	a0,a0,0
     9c6:	001a                	c.slli	zero,0x6
     9c8:	0209                	addi	tp,tp,2
     9ca:	0710                	addi	a2,sp,896
     9cc:	0020                	addi	s0,sp,8
     9ce:	ffe0                	sd	s0,248(a5)
     9d0:	ffff                	0xffff
     9d2:	05013303          	ld	t1,80(sp)
     9d6:	031d                	addi	t1,t1,7
     9d8:	0901                	addi	s2,s2,0
     9da:	0010                	0x10
     9dc:	0501                	addi	a0,a0,0
     9de:	0314                	addi	a3,sp,384
     9e0:	0902                	c.slli64	s2
     9e2:	0008                	0x8
     9e4:	0501                	addi	a0,a0,0
     9e6:	0312                	slli	t1,t1,0x4
     9e8:	0900                	addi	s0,sp,144
     9ea:	0008                	0x8
     9ec:	0501                	addi	a0,a0,0
     9ee:	0314                	addi	a3,sp,384
     9f0:	0901                	addi	s2,s2,0
     9f2:	0008                	0x8
     9f4:	0501                	addi	a0,a0,0
     9f6:	031e                	slli	t1,t1,0x7
     9f8:	0900                	addi	s0,sp,144
     9fa:	0004                	0x4
     9fc:	0501                	addi	a0,a0,0
     9fe:	0312                	slli	t1,t1,0x4
     a00:	0900                	addi	s0,sp,144
     a02:	0008                	0x8
     a04:	0501                	addi	a0,a0,0
     a06:	0314                	addi	a3,sp,384
     a08:	0902                	c.slli64	s2
     a0a:	0008                	0x8
     a0c:	0501                	addi	a0,a0,0
     a0e:	09010317          	auipc	t1,0x9010
     a12:	0008                	0x8
     a14:	0501                	addi	a0,a0,0
     a16:	0318                	addi	a4,sp,384
     a18:	0901                	addi	s2,s2,0
     a1a:	0010                	0x10
     a1c:	0501                	addi	a0,a0,0
     a1e:	0326                	slli	t1,t1,0x9
     a20:	0902                	c.slli64	s2
     a22:	0010                	0x10
     a24:	0501                	addi	a0,a0,0
     a26:	0315                	addi	t1,t1,5
     a28:	0900                	addi	s0,sp,144
     a2a:	0008                	0x8
     a2c:	0501                	addi	a0,a0,0
     a2e:	09000313          	li	t1,144
     a32:	000c                	0xc
     a34:	0501                	addi	a0,a0,0
     a36:	030c                	addi	a1,sp,384
     a38:	0902                	c.slli64	s2
     a3a:	0008                	0x8
     a3c:	0301                	addi	t1,t1,0
     a3e:	0901                	addi	s2,s2,0
     a40:	000c                	0xc
     a42:	0301                	addi	t1,t1,0
     a44:	0901                	addi	s2,s2,0
     a46:	000c                	0xc
     a48:	0501                	addi	a0,a0,0
     a4a:	0305                	addi	t1,t1,1
     a4c:	0902                	c.slli64	s2
     a4e:	0010                	0x10
     a50:	0301                	addi	t1,t1,0
     a52:	0901                	addi	s2,s2,0
     a54:	0024                	addi	s1,sp,8
     a56:	0501                	addi	a0,a0,0
     a58:	0902030b          	0x902030b
     a5c:	0024                	addi	s1,sp,8
     a5e:	0501                	addi	a0,a0,0
     a60:	0312                	slli	t1,t1,0x4
     a62:	0900                	addi	s0,sp,144
     a64:	0008                	0x8
     a66:	0501                	addi	a0,a0,0
     a68:	0301                	addi	t1,t1,0
     a6a:	0901                	addi	s2,s2,0
     a6c:	0018                	0x18
     a6e:	0901                	addi	s2,s2,0
     a70:	0014                	0x14
     a72:	0100                	addi	s0,sp,128
     a74:	0501                	addi	a0,a0,0
     a76:	0012                	c.slli	zero,0x4
     a78:	0209                	addi	tp,tp,2
     a7a:	0834                	addi	a3,sp,24
     a7c:	0020                	addi	s0,sp,8
     a7e:	ffe0                	sd	s0,248(a5)
     a80:	ffff                	0xffff
     a82:	0100c903          	lbu	s2,16(ra) # 10 <BASE_ADDR-0xffffffe0001ffff0>
     a86:	2105                	addiw	sp,sp,1
     a88:	10090103          	lb	sp,256(s2)
     a8c:	0100                	addi	s0,sp,128
     a8e:	0c05                	addi	s8,s8,1
     a90:	08090003          	lb	zero,128(s2)
     a94:	0100                	addi	s0,sp,128
     a96:	0a05                	addi	s4,s4,1
     a98:	04090003          	lb	zero,64(s2)
     a9c:	0100                	addi	s0,sp,128
     a9e:	0905                	addi	s2,s2,1
     aa0:	0c090103          	lb	sp,192(s2)
     aa4:	0100                	addi	s0,sp,128
     aa6:	1105                	addi	sp,sp,-31
     aa8:	0c090003          	lb	zero,192(s2)
     aac:	0100                	addi	s0,sp,128
     aae:	0905                	addi	s2,s2,1
     ab0:	04090103          	lb	sp,64(s2)
     ab4:	0100                	addi	s0,sp,128
     ab6:	1305                	addi	t1,t1,-31
     ab8:	0c090003          	lb	zero,192(s2)
     abc:	0100                	addi	s0,sp,128
     abe:	0905                	addi	s2,s2,1
     ac0:	04090103          	lb	sp,64(s2)
     ac4:	0100                	addi	s0,sp,128
     ac6:	1405                	addi	s0,s0,-31
     ac8:	0c090003          	lb	zero,192(s2)
     acc:	0100                	addi	s0,sp,128
     ace:	0905                	addi	s2,s2,1
     ad0:	04090103          	lb	sp,64(s2)
     ad4:	0100                	addi	s0,sp,128
     ad6:	0f05                	addi	t5,t5,1
     ad8:	0c090003          	lb	zero,192(s2)
     adc:	0100                	addi	s0,sp,128
     ade:	1705                	addi	a4,a4,-31
     ae0:	04090103          	lb	sp,64(s2)
     ae4:	0100                	addi	s0,sp,128
     ae6:	1305                	addi	t1,t1,-31
     ae8:	18090003          	lb	zero,384(s2)
     aec:	0100                	addi	s0,sp,128
     aee:	0d05                	addi	s10,s10,1
     af0:	0c090003          	lb	zero,192(s2)
     af4:	0100                	addi	s0,sp,128
     af6:	0e05                	addi	t3,t3,1
     af8:	0c090203          	lb	tp,192(s2)
     afc:	0100                	addi	s0,sp,128
     afe:	0505                	addi	a0,a0,1
     b00:	08090003          	lb	zero,128(s2)
     b04:	0100                	addi	s0,sp,128
     b06:	3005                	0x3005
     b08:	0200                	addi	s0,sp,256
     b0a:	0304                	addi	s1,sp,384
     b0c:	04090003          	lb	zero,64(s2)
     b10:	0100                	addi	s0,sp,128
     b12:	2305                	addiw	t1,t1,1
     b14:	0200                	addi	s0,sp,256
     b16:	0304                	addi	s1,sp,384
     b18:	18090003          	lb	zero,384(s2)
     b1c:	0100                	addi	s0,sp,128
     b1e:	1705                	addi	a4,a4,-31
     b20:	0200                	addi	s0,sp,256
     b22:	0104                	addi	s1,sp,128
     b24:	0c090003          	lb	zero,192(s2)
     b28:	0100                	addi	s0,sp,128
     b2a:	0505                	addi	a0,a0,1
     b2c:	10090203          	lb	tp,256(s2)
     b30:	0100                	addi	s0,sp,128
     b32:	04090203          	lb	tp,64(s2)
     b36:	0100                	addi	s0,sp,128
     b38:	0105                	addi	sp,sp,1
     b3a:	0c090103          	lb	sp,192(s2)
     b3e:	0100                	addi	s0,sp,128
     b40:	1409                	addi	s0,s0,-30
     b42:	0000                	unimp
     b44:	0101                	addi	sp,sp,0
     b46:	0e05                	addi	t3,t3,1
     b48:	0900                	addi	s0,sp,144
     b4a:	3002                	fld	ft0,32(sp)
     b4c:	2009                	0x2009
     b4e:	e000                	sd	s0,0(s0)
     b50:	ffff                	0xffff
     b52:	03ff                	0x3ff
     b54:	00da                	slli	ra,ra,0x16
     b56:	0501                	addi	a0,a0,0
     b58:	030c                	addi	a1,sp,384
     b5a:	0901                	addi	s2,s2,0
     b5c:	0010                	0x10
     b5e:	0301                	addi	t1,t1,0
     b60:	0901                	addi	s2,s2,0
     b62:	000c                	0xc
     b64:	0301                	addi	t1,t1,0
     b66:	0901                	addi	s2,s2,0
     b68:	0004                	0x4
     b6a:	0301                	addi	t1,t1,0
     b6c:	0902                	c.slli64	s2
     b6e:	0008                	0x8
     b70:	0501                	addi	a0,a0,0
     b72:	0038                	addi	a4,sp,8
     b74:	0402                	c.slli64	s0
     b76:	0301                	addi	t1,t1,0
     b78:	0900                	addi	s0,sp,144
     b7a:	000c                	0xc
     b7c:	0501                	addi	a0,a0,0
     b7e:	001f 0402 0301      	0x3010402001f
     b84:	0900                	addi	s0,sp,144
     b86:	0010                	0x10
     b88:	0501                	addi	a0,a0,0
     b8a:	0322                	slli	t1,t1,0x8
     b8c:	0901                	addi	s2,s2,0
     b8e:	0008                	0x8
     b90:	0501                	addi	a0,a0,0
     b92:	0319                	addi	t1,t1,6
     b94:	0900                	addi	s0,sp,144
     b96:	000c                	0xc
     b98:	0501                	addi	a0,a0,0
     b9a:	031c                	addi	a5,sp,384
     b9c:	0901                	addi	s2,s2,0
     b9e:	0008                	0x8
     ba0:	0501                	addi	a0,a0,0
     ba2:	09000313          	li	t1,144
     ba6:	0008                	0x8
     ba8:	0501                	addi	a0,a0,0
     baa:	0341                	addi	t1,t1,16
     bac:	0901                	addi	s2,s2,0
     bae:	000c                	0xc
     bb0:	0501                	addi	a0,a0,0
     bb2:	030d                	addi	t1,t1,3
     bb4:	0900                	addi	s0,sp,144
     bb6:	000c                	0xc
     bb8:	0501                	addi	a0,a0,0
     bba:	030c                	addi	a1,sp,384
     bbc:	097d                	addi	s2,s2,31
     bbe:	0018                	0x18
     bc0:	0901                	addi	s2,s2,0
     bc2:	0004                	0x4
     bc4:	0100                	addi	s0,sp,128
     bc6:	0501                	addi	a0,a0,0
     bc8:	002a                	c.slli	zero,0xa
     bca:	0209                	addi	tp,tp,2
     bcc:	09cc                	addi	a1,sp,212
     bce:	0020                	addi	s0,sp,8
     bd0:	ffe0                	sd	s0,248(a5)
     bd2:	ffff                	0xffff
     bd4:	0100e703          	lwu	a4,16(ra)
     bd8:	1105                	addi	sp,sp,-31
     bda:	14090103          	lb	sp,320(s2)
     bde:	0100                	addi	s0,sp,128
     be0:	0805                	addi	a6,a6,1
     be2:	0c090003          	lb	zero,192(s2)
     be6:	0100                	addi	s0,sp,128
     be8:	1d05                	addi	s10,s10,-31
     bea:	08090103          	lb	sp,128(s2)
     bee:	0100                	addi	s0,sp,128
     bf0:	1105                	addi	sp,sp,-31
     bf2:	10090103          	lb	sp,256(s2)
     bf6:	0100                	addi	s0,sp,128
     bf8:	0905                	addi	s2,s2,1
     bfa:	10090103          	lb	sp,256(s2)
     bfe:	0100                	addi	s0,sp,128
     c00:	2c090103          	lb	sp,704(s2)
     c04:	0100                	addi	s0,sp,128
     c06:	0105                	addi	sp,sp,1
     c08:	0c090203          	lb	tp,192(s2)
     c0c:	0100                	addi	s0,sp,128
     c0e:	1409                	addi	s0,s0,-30
     c10:	0000                	unimp
     c12:	0101                	addi	sp,sp,0
     c14:	1105                	addi	sp,sp,-31
     c16:	0900                	addi	s0,sp,144
     c18:	6002                	0x6002
     c1a:	200a                	fld	ft0,128(sp)
     c1c:	e000                	sd	s0,0(s0)
     c1e:	ffff                	0xffff
     c20:	03ff                	0x3ff
     c22:	00f0                	addi	a2,sp,76
     c24:	0301                	addi	t1,t1,0
     c26:	0901                	addi	s2,s2,0
     c28:	0010                	0x10
     c2a:	0501                	addi	a0,a0,0
     c2c:	0308                	addi	a0,sp,384
     c2e:	0900                	addi	s0,sp,144
     c30:	0018                	0x18
     c32:	0501                	addi	a0,a0,0
     c34:	0025                	c.nop	9
     c36:	0402                	c.slli64	s0
     c38:	0301                	addi	t1,t1,0
     c3a:	0900                	addi	s0,sp,144
     c3c:	0004                	0x4
     c3e:	0501                	addi	a0,a0,0
     c40:	001c                	0x1c
     c42:	0402                	c.slli64	s0
     c44:	0301                	addi	t1,t1,0
     c46:	0900                	addi	s0,sp,144
     c48:	0010                	0x10
     c4a:	0501                	addi	a0,a0,0
     c4c:	0019                	c.nop	6
     c4e:	0402                	c.slli64	s0
     c50:	0301                	addi	t1,t1,0
     c52:	0900                	addi	s0,sp,144
     c54:	0004                	0x4
     c56:	0501                	addi	a0,a0,0
     c58:	0025                	c.nop	9
     c5a:	0402                	c.slli64	s0
     c5c:	0301                	addi	t1,t1,0
     c5e:	0900                	addi	s0,sp,144
     c60:	0004                	0x4
     c62:	0501                	addi	a0,a0,0
     c64:	0019                	c.nop	6
     c66:	0402                	c.slli64	s0
     c68:	0301                	addi	t1,t1,0
     c6a:	0900                	addi	s0,sp,144
     c6c:	0004                	0x4
     c6e:	0501                	addi	a0,a0,0
     c70:	0309                	addi	t1,t1,2
     c72:	0901                	addi	s2,s2,0
     c74:	0004                	0x4
     c76:	0501                	addi	a0,a0,0
     c78:	0301                	addi	t1,t1,0
     c7a:	0902                	c.slli64	s2
     c7c:	0004                	0x4
     c7e:	0901                	addi	s2,s2,0
     c80:	0014                	0x14
     c82:	0100                	addi	s0,sp,128
     c84:	0501                	addi	a0,a0,0
     c86:	02090017          	auipc	zero,0x2090
     c8a:	0ac4                	addi	s1,sp,340
     c8c:	0020                	addi	s0,sp,8
     c8e:	ffe0                	sd	s0,248(a5)
     c90:	ffff                	0xffff
     c92:	0100f903          	0x100f903
     c96:	0c05                	addi	s8,s8,1
     c98:	14090103          	lb	sp,320(s2)
     c9c:	0100                	addi	s0,sp,128
     c9e:	1c05                	addi	s8,s8,-31
     ca0:	04090003          	lb	zero,64(s2)
     ca4:	0100                	addi	s0,sp,128
     ca6:	0e05                	addi	t3,t3,1
     ca8:	04090103          	lb	sp,64(s2)
     cac:	0100                	addi	s0,sp,128
     cae:	0505                	addi	a0,a0,1
     cb0:	08090003          	lb	zero,128(s2)
     cb4:	0100                	addi	s0,sp,128
     cb6:	3005                	0x3005
     cb8:	0200                	addi	s0,sp,256
     cba:	0404                	addi	s1,sp,512
     cbc:	04090003          	lb	zero,64(s2)
     cc0:	0100                	addi	s0,sp,128
     cc2:	2b05                	addiw	s6,s6,1
     cc4:	0200                	addi	s0,sp,256
     cc6:	0404                	addi	s1,sp,512
     cc8:	18090003          	lb	zero,384(s2)
     ccc:	0100                	addi	s0,sp,128
     cce:	1105                	addi	sp,sp,-31
     cd0:	04090103          	lb	sp,64(s2)
     cd4:	0100                	addi	s0,sp,128
     cd6:	1405                	addi	s0,s0,-31
     cd8:	18090003          	lb	zero,384(s2)
     cdc:	0100                	addi	s0,sp,128
     cde:	0c05                	addi	s8,s8,1
     ce0:	04090003          	lb	zero,64(s2)
     ce4:	0100                	addi	s0,sp,128
     ce6:	1005                	c.nop	-31
     ce8:	04090103          	lb	sp,64(s2)
     cec:	0100                	addi	s0,sp,128
     cee:	2805                	addiw	a6,a6,1
     cf0:	0200                	addi	s0,sp,256
     cf2:	0104                	addi	s1,sp,128
     cf4:	08090003          	lb	zero,128(s2)
     cf8:	0100                	addi	s0,sp,128
     cfa:	2b05                	addiw	s6,s6,1
     cfc:	0200                	addi	s0,sp,256
     cfe:	0104                	addi	s1,sp,128
     d00:	18090003          	lb	zero,384(s2)
     d04:	0100                	addi	s0,sp,128
     d06:	2105                	addiw	sp,sp,1
     d08:	0200                	addi	s0,sp,256
     d0a:	0104                	addi	s1,sp,128
     d0c:	04090003          	lb	zero,64(s2)
     d10:	0100                	addi	s0,sp,128
     d12:	2205                	addiw	tp,tp,1
     d14:	08090103          	lb	sp,128(s2)
     d18:	0100                	addi	s0,sp,128
     d1a:	1c05                	addi	s8,s8,-31
     d1c:	18090003          	lb	zero,384(s2)
     d20:	0100                	addi	s0,sp,128
     d22:	1405                	addi	s0,s0,-31
     d24:	08090103          	lb	sp,128(s2)
     d28:	0100                	addi	s0,sp,128
     d2a:	2305                	addiw	t1,t1,1
     d2c:	0200                	addi	s0,sp,256
     d2e:	0204                	addi	s1,sp,256
     d30:	08097c03          	0x8097c03
     d34:	0100                	addi	s0,sp,128
     d36:	1705                	addi	a4,a4,-31
     d38:	0200                	addi	s0,sp,256
     d3a:	0304                	addi	s1,sp,384
     d3c:	0c090003          	lb	zero,192(s2)
     d40:	0100                	addi	s0,sp,128
     d42:	0805                	addi	a6,a6,1
     d44:	10090803          	lb	a6,256(s2)
     d48:	0100                	addi	s0,sp,128
     d4a:	2105                	addiw	sp,sp,1
     d4c:	0200                	addi	s0,sp,256
     d4e:	0104                	addi	s1,sp,128
     d50:	08090003          	lb	zero,128(s2)
     d54:	0100                	addi	s0,sp,128
     d56:	0e05                	addi	t3,t3,1
     d58:	08090403          	lb	s0,128(s2)
     d5c:	0100                	addi	s0,sp,128
     d5e:	0505                	addi	a0,a0,1
     d60:	08090003          	lb	zero,128(s2)
     d64:	0100                	addi	s0,sp,128
     d66:	3005                	0x3005
     d68:	0200                	addi	s0,sp,256
     d6a:	0404                	addi	s1,sp,512
     d6c:	04090003          	lb	zero,64(s2)
     d70:	0100                	addi	s0,sp,128
     d72:	2b05                	addiw	s6,s6,1
     d74:	0200                	addi	s0,sp,256
     d76:	0404                	addi	s1,sp,512
     d78:	18090003          	lb	zero,384(s2)
     d7c:	0100                	addi	s0,sp,128
     d7e:	0d05                	addi	s10,s10,1
     d80:	04090103          	lb	sp,64(s2)
     d84:	0100                	addi	s0,sp,128
     d86:	1c05                	addi	s8,s8,-31
     d88:	18090003          	lb	zero,384(s2)
     d8c:	0100                	addi	s0,sp,128
     d8e:	1a05                	addi	s4,s4,-31
     d90:	10090003          	lb	zero,256(s2)
     d94:	0100                	addi	s0,sp,128
     d96:	4b05                	li	s6,1
     d98:	04090103          	lb	sp,64(s2)
     d9c:	0100                	addi	s0,sp,128
     d9e:	0905                	addi	s2,s2,1
     da0:	18090003          	lb	zero,384(s2)
     da4:	0100                	addi	s0,sp,128
     da6:	5e05                	li	t3,-31
     da8:	04090003          	lb	zero,64(s2)
     dac:	0100                	addi	s0,sp,128
     dae:	0905                	addi	s2,s2,1
     db0:	18090003          	lb	zero,384(s2)
     db4:	0100                	addi	s0,sp,128
     db6:	2305                	addiw	t1,t1,1
     db8:	0200                	addi	s0,sp,256
     dba:	0204                	addi	s1,sp,256
     dbc:	1c097e03          	0x1c097e03
     dc0:	0100                	addi	s0,sp,128
     dc2:	1705                	addi	a4,a4,-31
     dc4:	0200                	addi	s0,sp,256
     dc6:	0304                	addi	s1,sp,384
     dc8:	0c090003          	lb	zero,192(s2)
     dcc:	0100                	addi	s0,sp,128
     dce:	0c05                	addi	s8,s8,1
     dd0:	10090403          	lb	s0,256(s2)
     dd4:	0100                	addi	s0,sp,128
     dd6:	0105                	addi	sp,sp,1
     dd8:	08090103          	lb	sp,128(s2)
     ddc:	0100                	addi	s0,sp,128
     dde:	1809                	addi	a6,a6,-30
     de0:	0000                	unimp
     de2:	0101                	addi	sp,sp,0
     de4:	1c05                	addi	s8,s8,-31
     de6:	0900                	addi	s0,sp,144
     de8:	8802                	jr	a6
     dea:	200c                	fld	fa1,0(s0)
     dec:	e000                	sd	s0,0(s0)
     dee:	ffff                	0xffff
     df0:	03ff                	0x3ff
     df2:	018e                	slli	gp,gp,0x3
     df4:	0501                	addi	a0,a0,0
     df6:	030c                	addi	a1,sp,384
     df8:	0901                	addi	s2,s2,0
     dfa:	0010                	0x10
     dfc:	0501                	addi	a0,a0,0
     dfe:	031c                	addi	a5,sp,384
     e00:	0900                	addi	s0,sp,144
     e02:	0004                	0x4
     e04:	0501                	addi	a0,a0,0
     e06:	030e                	slli	t1,t1,0x3
     e08:	0901                	addi	s2,s2,0
     e0a:	0004                	0x4
     e0c:	0501                	addi	a0,a0,0
     e0e:	0305                	addi	t1,t1,1
     e10:	0900                	addi	s0,sp,144
     e12:	0008                	0x8
     e14:	0501                	addi	a0,a0,0
     e16:	0030                	addi	a2,sp,8
     e18:	0402                	c.slli64	s0
     e1a:	0304                	addi	s1,sp,384
     e1c:	0900                	addi	s0,sp,144
     e1e:	0004                	0x4
     e20:	0501                	addi	a0,a0,0
     e22:	0402002b          	0x402002b
     e26:	0304                	addi	s1,sp,384
     e28:	0900                	addi	s0,sp,144
     e2a:	0018                	0x18
     e2c:	0501                	addi	a0,a0,0
     e2e:	0311                	addi	t1,t1,4
     e30:	0901                	addi	s2,s2,0
     e32:	0004                	0x4
     e34:	0501                	addi	a0,a0,0
     e36:	0314                	addi	a3,sp,384
     e38:	0900                	addi	s0,sp,144
     e3a:	0018                	0x18
     e3c:	0501                	addi	a0,a0,0
     e3e:	030c                	addi	a1,sp,384
     e40:	0900                	addi	s0,sp,144
     e42:	0004                	0x4
     e44:	0501                	addi	a0,a0,0
     e46:	031e                	slli	t1,t1,0x7
     e48:	0901                	addi	s2,s2,0
     e4a:	0008                	0x8
     e4c:	0501                	addi	a0,a0,0
     e4e:	0318                	addi	a4,sp,384
     e50:	0900                	addi	s0,sp,144
     e52:	0018                	0x18
     e54:	0501                	addi	a0,a0,0
     e56:	0310                	addi	a2,sp,384
     e58:	0901                	addi	s2,s2,0
     e5a:	0008                	0x8
     e5c:	0501                	addi	a0,a0,0
     e5e:	04020023          	sb	zero,64(tp) # 40 <BASE_ADDR-0xffffffe0001fffc0>
     e62:	0302                	c.slli64	t1
     e64:	097d                	addi	s2,s2,31
     e66:	0008                	0x8
     e68:	0501                	addi	a0,a0,0
     e6a:	04020017          	auipc	zero,0x4020
     e6e:	09000303          	lb	t1,144(zero) # 90 <BASE_ADDR-0xffffffe0001fff70>
     e72:	000c                	0xc
     e74:	0501                	addi	a0,a0,0
     e76:	0308                	addi	a0,sp,384
     e78:	0906                	slli	s2,s2,0x1
     e7a:	0010                	0x10
     e7c:	0501                	addi	a0,a0,0
     e7e:	0021                	c.nop	8
     e80:	0402                	c.slli64	s0
     e82:	0301                	addi	t1,t1,0
     e84:	0900                	addi	s0,sp,144
     e86:	0008                	0x8
     e88:	0501                	addi	a0,a0,0
     e8a:	030e                	slli	t1,t1,0x3
     e8c:	0905                	addi	s2,s2,1
     e8e:	0008                	0x8
     e90:	0501                	addi	a0,a0,0
     e92:	0305                	addi	t1,t1,1
     e94:	0900                	addi	s0,sp,144
     e96:	0008                	0x8
     e98:	0501                	addi	a0,a0,0
     e9a:	0030                	addi	a2,sp,8
     e9c:	0402                	c.slli64	s0
     e9e:	0304                	addi	s1,sp,384
     ea0:	0900                	addi	s0,sp,144
     ea2:	0004                	0x4
     ea4:	0501                	addi	a0,a0,0
     ea6:	0402002b          	0x402002b
     eaa:	0304                	addi	s1,sp,384
     eac:	0900                	addi	s0,sp,144
     eae:	0018                	0x18
     eb0:	0501                	addi	a0,a0,0
     eb2:	0320                	addi	s0,sp,392
     eb4:	0901                	addi	s2,s2,0
     eb6:	0004                	0x4
     eb8:	0501                	addi	a0,a0,0
     eba:	030d                	addi	t1,t1,3
     ebc:	0900                	addi	s0,sp,144
     ebe:	0018                	0x18
     ec0:	0501                	addi	a0,a0,0
     ec2:	09000323          	sb	a6,134(zero) # 86 <BASE_ADDR-0xffffffe0001fff7a>
     ec6:	0018                	0x18
     ec8:	0501                	addi	a0,a0,0
     eca:	031a                	slli	t1,t1,0x6
     ecc:	0900                	addi	s0,sp,144
     ece:	0004                	0x4
     ed0:	0501                	addi	a0,a0,0
     ed2:	0901034b          	fnmsub.s	ft6,ft2,fa6,ft1,rne
     ed6:	0004                	0x4
     ed8:	0501                	addi	a0,a0,0
     eda:	0309                	addi	t1,t1,2
     edc:	0900                	addi	s0,sp,144
     ede:	0018                	0x18
     ee0:	0501                	addi	a0,a0,0
     ee2:	035e                	slli	t1,t1,0x17
     ee4:	0900                	addi	s0,sp,144
     ee6:	0004                	0x4
     ee8:	0501                	addi	a0,a0,0
     eea:	0309                	addi	t1,t1,2
     eec:	0900                	addi	s0,sp,144
     eee:	0018                	0x18
     ef0:	0501                	addi	a0,a0,0
     ef2:	04020023          	sb	zero,64(tp) # 40 <BASE_ADDR-0xffffffe0001fffc0>
     ef6:	0302                	c.slli64	t1
     ef8:	097e                	slli	s2,s2,0x1f
     efa:	001c                	0x1c
     efc:	0501                	addi	a0,a0,0
     efe:	04020017          	auipc	zero,0x4020
     f02:	09000303          	lb	t1,144(zero) # 90 <BASE_ADDR-0xffffffe0001fff70>
     f06:	000c                	0xc
     f08:	0501                	addi	a0,a0,0
     f0a:	030c                	addi	a1,sp,384
     f0c:	0904                	addi	s1,sp,144
     f0e:	0010                	0x10
     f10:	0501                	addi	a0,a0,0
     f12:	0301                	addi	t1,t1,0
     f14:	0901                	addi	s2,s2,0
     f16:	0008                	0x8
     f18:	0901                	addi	s2,s2,0
     f1a:	0014                	0x14
     f1c:	0100                	addi	s0,sp,128
     f1e:	0501                	addi	a0,a0,0
     f20:	0011                	c.nop	4
     f22:	0209                	addi	tp,tp,2
     f24:	0e28                	addi	a0,sp,792
     f26:	0020                	addi	s0,sp,8
     f28:	ffe0                	sd	s0,248(a5)
     f2a:	ffff                	0xffff
     f2c:	0101ac03          	lw	s8,16(gp)
     f30:	1505                	addi	a0,a0,-31
     f32:	10090103          	lb	sp,256(s2)
     f36:	0100                	addi	s0,sp,128
     f38:	0505                	addi	a0,a0,1
     f3a:	08090103          	lb	sp,128(s2)
     f3e:	0100                	addi	s0,sp,128
     f40:	0105                	addi	sp,sp,1
     f42:	20090103          	lb	sp,512(s2)
     f46:	0100                	addi	s0,sp,128
     f48:	1409                	addi	s0,s0,-30
     f4a:	0000                	unimp
     f4c:	0101                	addi	sp,sp,0
     f4e:	0070                	addi	a2,sp,12
     f50:	0000                	unimp
     f52:	0005                	c.nop	1
     f54:	0008                	0x8
     f56:	003c                	addi	a5,sp,8
     f58:	0000                	unimp
     f5a:	0101                	addi	sp,sp,0
     f5c:	fb01                	bnez	a4,e6c <BASE_ADDR-0xffffffe0001ff194>
     f5e:	0d0e                	slli	s10,s10,0x3
     f60:	0100                	addi	s0,sp,128
     f62:	0101                	addi	sp,sp,0
     f64:	0001                	nop
     f66:	0000                	unimp
     f68:	0001                	nop
     f6a:	0100                	addi	s0,sp,128
     f6c:	0101                	addi	sp,sp,0
     f6e:	031f 0000 0000      	0x31f
     f74:	003a                	c.slli	zero,0xe
     f76:	0000                	unimp
     f78:	006d                	c.nop	27
     f7a:	0000                	unimp
     f7c:	0102                	c.slli64	sp
     f7e:	021f 040f 00f7      	0xf7040f021f
     f84:	0000                	unimp
     f86:	f700                	sd	s0,40(a4)
     f88:	0000                	unimp
     f8a:	0000                	unimp
     f8c:	0095                	addi	ra,ra,5
     f8e:	0000                	unimp
     f90:	9b01                	andi	a4,a4,-32
     f92:	0000                	unimp
     f94:	0200                	addi	s0,sp,256
     f96:	0105                	addi	sp,sp,1
     f98:	0900                	addi	s0,sp,144
     f9a:	7402                	ld	s0,32(sp)
     f9c:	200e                	fld	ft0,192(sp)
     f9e:	e000                	sd	s0,0(s0)
     fa0:	ffff                	0xffff
     fa2:	1aff                	0x1aff
     fa4:	0505                	addi	a0,a0,1
     fa6:	34090203          	lb	tp,832(s2)
     faa:	0100                	addi	s0,sp,128
     fac:	0c05                	addi	s8,s8,1
     fae:	2c091303          	lh	t1,704(s2)
     fb2:	0100                	addi	s0,sp,128
     fb4:	0105                	addi	sp,sp,1
     fb6:	28090103          	lb	sp,640(s2)
     fba:	0100                	addi	s0,sp,128
     fbc:	1409                	addi	s0,s0,-30
     fbe:	0000                	unimp
     fc0:	0101                	addi	sp,sp,0
     fc2:	0419                	addi	s0,s0,6
     fc4:	0000                	unimp
     fc6:	0005                	c.nop	1
     fc8:	0008                	0x8
     fca:	0059                	c.nop	22
     fcc:	0000                	unimp
     fce:	0101                	addi	sp,sp,0
     fd0:	fb01                	bnez	a4,ee0 <BASE_ADDR-0xffffffe0001ff120>
     fd2:	0d0e                	slli	s10,s10,0x3
     fd4:	0100                	addi	s0,sp,128
     fd6:	0101                	addi	sp,sp,0
     fd8:	0001                	nop
     fda:	0000                	unimp
     fdc:	0001                	nop
     fde:	0100                	addi	s0,sp,128
     fe0:	0101                	addi	sp,sp,0
     fe2:	041f 0000 0000      	0x41f
     fe8:	00000107          	0x107
     fec:	006d                	c.nop	27
     fee:	0000                	unimp
     ff0:	003a                	c.slli	zero,0xe
     ff2:	0000                	unimp
     ff4:	0102                	c.slli64	sp
     ff6:	021f 090f 00fd      	0xfd090f021f
     ffc:	0000                	unimp
     ffe:	fd00                	sd	s0,56(a0)
    1000:	0000                	unimp
    1002:	0000                	unimp
    1004:	00e2                	slli	ra,ra,0x18
    1006:	0000                	unimp
    1008:	dd01                	beqz	a0,f20 <BASE_ADDR-0xffffffe0001ff0e0>
    100a:	0000                	unimp
    100c:	0100                	addi	s0,sp,128
    100e:	00e9                	addi	ra,ra,26
    1010:	0000                	unimp
    1012:	c501                	beqz	a0,101a <BASE_ADDR-0xffffffe0001fefe6>
    1014:	0000                	unimp
    1016:	0200                	addi	s0,sp,256
    1018:	000000b7          	lui	ra,0x0
    101c:	0000bc03          	ld	s8,0(ra) # 0 <BASE_ADDR-0xffffffe000200000>
    1020:	0200                	addi	s0,sp,256
    1022:	0000009b          	sext.w	ra,zero
    1026:	0502                	c.slli64	a0
    1028:	0024                	addi	s1,sp,8
    102a:	0209                	addi	tp,tp,2
    102c:	0f10                	addi	a2,sp,912
    102e:	0020                	addi	s0,sp,8
    1030:	ffe0                	sd	s0,248(a5)
    1032:	ffff                	0xffff
    1034:	05010b03          	lb	s6,80(sp)
    1038:	030c                	addi	a1,sp,384
    103a:	0901                	addi	s2,s2,0
    103c:	0014                	0x14
    103e:	0501                	addi	a0,a0,0
    1040:	0305                	addi	t1,t1,1
    1042:	0901                	addi	s2,s2,0
    1044:	000c                	0xc
    1046:	0501                	addi	a0,a0,0
    1048:	0301                	addi	t1,t1,0
    104a:	0030090b          	0x30090b
    104e:	0501                	addi	a0,a0,0
    1050:	030d                	addi	t1,t1,3
    1052:	00040977          	0x40977
    1056:	0301                	addi	t1,t1,0
    1058:	0901                	addi	s2,s2,0
    105a:	0008                	0x8
    105c:	0301                	addi	t1,t1,0
    105e:	0902                	c.slli64	s2
    1060:	0004                	0x4
    1062:	0301                	addi	t1,t1,0
    1064:	0901                	addi	s2,s2,0
    1066:	0008                	0x8
    1068:	0301                	addi	t1,t1,0
    106a:	0902                	c.slli64	s2
    106c:	0004                	0x4
    106e:	0301                	addi	t1,t1,0
    1070:	0901                	addi	s2,s2,0
    1072:	0008                	0x8
    1074:	0501                	addi	a0,a0,0
    1076:	0301                	addi	t1,t1,0
    1078:	0902                	c.slli64	s2
    107a:	0004                	0x4
    107c:	0901                	addi	s2,s2,0
    107e:	0014                	0x14
    1080:	0100                	addi	s0,sp,128
    1082:	0501                	addi	a0,a0,0
    1084:	02090027          	0x2090027
    1088:	0f9c                	addi	a5,sp,976
    108a:	0020                	addi	s0,sp,8
    108c:	ffe0                	sd	s0,248(a5)
    108e:	ffff                	0xffff
    1090:	05011a03          	lh	s4,80(sp)
    1094:	031a                	slli	t1,t1,0x6
    1096:	0901                	addi	s2,s2,0
    1098:	0010                	0x10
    109a:	0501                	addi	a0,a0,0
    109c:	0311                	addi	t1,t1,4
    109e:	0900                	addi	s0,sp,144
    10a0:	0010                	0x10
    10a2:	0501                	addi	a0,a0,0
    10a4:	0301                	addi	t1,t1,0
    10a6:	0901                	addi	s2,s2,0
    10a8:	0008                	0x8
    10aa:	0901                	addi	s2,s2,0
    10ac:	0010                	0x10
    10ae:	0100                	addi	s0,sp,128
    10b0:	0501                	addi	a0,a0,0
    10b2:	0026                	c.slli	zero,0x9
    10b4:	0209                	addi	tp,tp,2
    10b6:	0fd4                	addi	a3,sp,980
    10b8:	0020                	addi	s0,sp,8
    10ba:	ffe0                	sd	s0,248(a5)
    10bc:	ffff                	0xffff
    10be:	05011e03          	lh	t3,80(sp)
    10c2:	030c                	addi	a1,sp,384
    10c4:	0901                	addi	s2,s2,0
    10c6:	0014                	0x14
    10c8:	0501                	addi	a0,a0,0
    10ca:	032a                	slli	t1,t1,0xa
    10cc:	0901                	addi	s2,s2,0
    10ce:	000c                	0xc
    10d0:	0501                	addi	a0,a0,0
    10d2:	0311                	addi	t1,t1,4
    10d4:	0900                	addi	s0,sp,144
    10d6:	0008                	0x8
    10d8:	0501                	addi	a0,a0,0
    10da:	030c                	addi	a1,sp,384
    10dc:	0901                	addi	s2,s2,0
    10de:	0004                	0x4
    10e0:	0501                	addi	a0,a0,0
    10e2:	0311                	addi	t1,t1,4
    10e4:	0901                	addi	s2,s2,0
    10e6:	000c                	0xc
    10e8:	0501                	addi	a0,a0,0
    10ea:	0305                	addi	t1,t1,1
    10ec:	0900                	addi	s0,sp,144
    10ee:	0008                	0x8
    10f0:	0501                	addi	a0,a0,0
    10f2:	0024                	addi	s1,sp,8
    10f4:	0402                	c.slli64	s0
    10f6:	09000303          	lb	t1,144(zero) # 90 <BASE_ADDR-0xffffffe0001fff70>
    10fa:	0004                	0x4
    10fc:	0501                	addi	a0,a0,0
    10fe:	001f 0402 0303      	0x3030402001f
    1104:	0900                	addi	s0,sp,144
    1106:	0010                	0x10
    1108:	0501                	addi	a0,a0,0
    110a:	0402001b          	addiw	zero,tp,64
    110e:	0301                	addi	t1,t1,0
    1110:	0900                	addi	s0,sp,144
    1112:	000c                	0xc
    1114:	0501                	addi	a0,a0,0
    1116:	001a                	c.slli	zero,0x6
    1118:	0402                	c.slli64	s0
    111a:	0301                	addi	t1,t1,0
    111c:	0900                	addi	s0,sp,144
    111e:	000c                	0xc
    1120:	0501                	addi	a0,a0,0
    1122:	0311                	addi	t1,t1,4
    1124:	0901                	addi	s2,s2,0
    1126:	0004                	0x4
    1128:	0501                	addi	a0,a0,0
    112a:	0301                	addi	t1,t1,0
    112c:	0901                	addi	s2,s2,0
    112e:	000c                	0xc
    1130:	0901                	addi	s2,s2,0
    1132:	0014                	0x14
    1134:	0100                	addi	s0,sp,128
    1136:	0501                	addi	a0,a0,0
    1138:	001d                	c.nop	7
    113a:	0209                	addi	tp,tp,2
    113c:	1064                	addi	s1,sp,44
    113e:	0020                	addi	s0,sp,8
    1140:	ffe0                	sd	s0,248(a5)
    1142:	ffff                	0xffff
    1144:	05012603          	lw	a2,80(sp)
    1148:	0322                	slli	t1,t1,0x8
    114a:	0901                	addi	s2,s2,0
    114c:	0010                	0x10
    114e:	0501                	addi	a0,a0,0
    1150:	0305                	addi	t1,t1,1
    1152:	0900                	addi	s0,sp,144
    1154:	000c                	0xc
    1156:	0501                	addi	a0,a0,0
    1158:	0301                	addi	t1,t1,0
    115a:	0901                	addi	s2,s2,0
    115c:	000c                	0xc
    115e:	0901                	addi	s2,s2,0
    1160:	0014                	0x14
    1162:	0100                	addi	s0,sp,128
    1164:	0501                	addi	a0,a0,0
    1166:	02090027          	0x2090027
    116a:	10a0                	addi	s0,sp,104
    116c:	0020                	addi	s0,sp,8
    116e:	ffe0                	sd	s0,248(a5)
    1170:	ffff                	0xffff
    1172:	05012a03          	lw	s4,80(sp)
    1176:	0321                	addi	t1,t1,8
    1178:	0901                	addi	s2,s2,0
    117a:	0018                	0x18
    117c:	0501                	addi	a0,a0,0
    117e:	031a                	slli	t1,t1,0x6
    1180:	0904                	addi	s1,sp,144
    1182:	0008                	0x8
    1184:	0501                	addi	a0,a0,0
    1186:	0900030f          	0x900030f
    118a:	0008                	0x8
    118c:	0501                	addi	a0,a0,0
    118e:	0309                	addi	t1,t1,2
    1190:	0901                	addi	s2,s2,0
    1192:	0004                	0x4
    1194:	0501                	addi	a0,a0,0
    1196:	032d                	addi	t1,t1,11
    1198:	0901                	addi	s2,s2,0
    119a:	0018                	0x18
    119c:	0501                	addi	a0,a0,0
    119e:	030e                	slli	t1,t1,0x3
    11a0:	0900                	addi	s0,sp,144
    11a2:	0004                	0x4
    11a4:	0501                	addi	a0,a0,0
    11a6:	032d                	addi	t1,t1,11
    11a8:	0900                	addi	s0,sp,144
    11aa:	0008                	0x8
    11ac:	0501                	addi	a0,a0,0
    11ae:	0900032b          	0x900032b
    11b2:	000c                	0xc
    11b4:	0501                	addi	a0,a0,0
    11b6:	0318                	addi	a4,sp,384
    11b8:	0904                	addi	s1,sp,144
    11ba:	0004                	0x4
    11bc:	0501                	addi	a0,a0,0
    11be:	0316                	slli	t1,t1,0x5
    11c0:	0900                	addi	s0,sp,144
    11c2:	0008                	0x8
    11c4:	0501                	addi	a0,a0,0
    11c6:	0318                	addi	a4,sp,384
    11c8:	0901                	addi	s2,s2,0
    11ca:	0008                	0x8
    11cc:	0501                	addi	a0,a0,0
    11ce:	0326                	slli	t1,t1,0x9
    11d0:	0900                	addi	s0,sp,144
    11d2:	0004                	0x4
    11d4:	0501                	addi	a0,a0,0
    11d6:	0316                	slli	t1,t1,0x5
    11d8:	0900                	addi	s0,sp,144
    11da:	0008                	0x8
    11dc:	0501                	addi	a0,a0,0
    11de:	0324                	addi	s1,sp,392
    11e0:	00080903          	lb	s2,0(a6)
    11e4:	0501                	addi	a0,a0,0
    11e6:	032c                	addi	a1,sp,392
    11e8:	0900                	addi	s0,sp,144
    11ea:	000c                	0xc
    11ec:	0501                	addi	a0,a0,0
    11ee:	0900031b          	addiw	t1,zero,144
    11f2:	0004                	0x4
    11f4:	0501                	addi	a0,a0,0
    11f6:	032a                	slli	t1,t1,0xa
    11f8:	00080903          	lb	s2,0(a6)
    11fc:	0501                	addi	a0,a0,0
    11fe:	0319                	addi	t1,t1,6
    1200:	0900                	addi	s0,sp,144
    1202:	0008                	0x8
    1204:	0501                	addi	a0,a0,0
    1206:	09000317          	auipc	t1,0x9000
    120a:	000c                	0xc
    120c:	0501                	addi	a0,a0,0
    120e:	0904032b          	0x904032b
    1212:	0008                	0x8
    1214:	0501                	addi	a0,a0,0
    1216:	0320                	addi	s0,sp,392
    1218:	0900                	addi	s0,sp,144
    121a:	0010                	0x10
    121c:	0501                	addi	a0,a0,0
    121e:	030c                	addi	a1,sp,384
    1220:	0901                	addi	s2,s2,0
    1222:	0008                	0x8
    1224:	0501                	addi	a0,a0,0
    1226:	001d                	c.nop	7
    1228:	0402                	c.slli64	s0
    122a:	0301                	addi	t1,t1,0
    122c:	0900                	addi	s0,sp,144
    122e:	0008                	0x8
    1230:	0501                	addi	a0,a0,0
    1232:	0028                	addi	a0,sp,8
    1234:	0402                	c.slli64	s0
    1236:	0301                	addi	t1,t1,0
    1238:	0900                	addi	s0,sp,144
    123a:	0008                	0x8
    123c:	0501                	addi	a0,a0,0
    123e:	0341                	addi	t1,t1,16
    1240:	0901                	addi	s2,s2,0
    1242:	0008                	0x8
    1244:	0501                	addi	a0,a0,0
    1246:	0324                	addi	s1,sp,392
    1248:	0900                	addi	s0,sp,144
    124a:	0008                	0x8
    124c:	0501                	addi	a0,a0,0
    124e:	0312                	slli	t1,t1,0x4
    1250:	0901                	addi	s2,s2,0
    1252:	0004                	0x4
    1254:	0501                	addi	a0,a0,0
    1256:	031d                	addi	t1,t1,7
    1258:	0900                	addi	s0,sp,144
    125a:	0008                	0x8
    125c:	0301                	addi	t1,t1,0
    125e:	0901                	addi	s2,s2,0
    1260:	0008                	0x8
    1262:	0501                	addi	a0,a0,0
    1264:	0316                	slli	t1,t1,0x5
    1266:	0900                	addi	s0,sp,144
    1268:	0008                	0x8
    126a:	0501                	addi	a0,a0,0
    126c:	031c                	addi	a5,sp,384
    126e:	0901                	addi	s2,s2,0
    1270:	0008                	0x8
    1272:	0501                	addi	a0,a0,0
    1274:	0319                	addi	t1,t1,6
    1276:	0900                	addi	s0,sp,144
    1278:	0008                	0x8
    127a:	0501                	addi	a0,a0,0
    127c:	031a                	slli	t1,t1,0x6
    127e:	0901                	addi	s2,s2,0
    1280:	0008                	0x8
    1282:	0501                	addi	a0,a0,0
    1284:	09000317          	auipc	t1,0x9000
    1288:	0008                	0x8
    128a:	0501                	addi	a0,a0,0
    128c:	0325                	addi	t1,t1,9
    128e:	0901                	addi	s2,s2,0
    1290:	0008                	0x8
    1292:	0501                	addi	a0,a0,0
    1294:	0900031b          	addiw	t1,zero,144
    1298:	0008                	0x8
    129a:	0501                	addi	a0,a0,0
    129c:	0318                	addi	a4,sp,384
    129e:	0900                	addi	s0,sp,144
    12a0:	0008                	0x8
    12a2:	0501                	addi	a0,a0,0
    12a4:	031c                	addi	a5,sp,384
    12a6:	0901                	addi	s2,s2,0
    12a8:	0008                	0x8
    12aa:	0501                	addi	a0,a0,0
    12ac:	0319                	addi	t1,t1,6
    12ae:	0900                	addi	s0,sp,144
    12b0:	0008                	0x8
    12b2:	0501                	addi	a0,a0,0
    12b4:	0314                	addi	a3,sp,384
    12b6:	0901                	addi	s2,s2,0
    12b8:	0008                	0x8
    12ba:	0501                	addi	a0,a0,0
    12bc:	030d                	addi	t1,t1,3
    12be:	0900                	addi	s0,sp,144
    12c0:	000c                	0xc
    12c2:	0501                	addi	a0,a0,0
    12c4:	0045                	c.nop	17
    12c6:	0402                	c.slli64	s0
    12c8:	09010303          	lb	t1,144(sp)
    12cc:	0004                	0x4
    12ce:	0501                	addi	a0,a0,0
    12d0:	0028                	addi	a0,sp,8
    12d2:	0402                	c.slli64	s0
    12d4:	09000303          	lb	t1,144(zero) # 90 <BASE_ADDR-0xffffffe0001fff70>
    12d8:	0008                	0x8
    12da:	0501                	addi	a0,a0,0
    12dc:	0021                	c.nop	8
    12de:	0402                	c.slli64	s0
    12e0:	09010303          	lb	t1,144(sp)
    12e4:	0004                	0x4
    12e6:	0501                	addi	a0,a0,0
    12e8:	001a                	c.slli	zero,0x6
    12ea:	0402                	c.slli64	s0
    12ec:	09000303          	lb	t1,144(zero) # 90 <BASE_ADDR-0xffffffe0001fff70>
    12f0:	0008                	0x8
    12f2:	0501                	addi	a0,a0,0
    12f4:	0020                	addi	s0,sp,8
    12f6:	0402                	c.slli64	s0
    12f8:	09010303          	lb	t1,144(sp)
    12fc:	0008                	0x8
    12fe:	0501                	addi	a0,a0,0
    1300:	001d                	c.nop	7
    1302:	0402                	c.slli64	s0
    1304:	09000303          	lb	t1,144(zero) # 90 <BASE_ADDR-0xffffffe0001fff70>
    1308:	0008                	0x8
    130a:	0501                	addi	a0,a0,0
    130c:	001e                	c.slli	zero,0x7
    130e:	0402                	c.slli64	s0
    1310:	09010303          	lb	t1,144(sp)
    1314:	0008                	0x8
    1316:	0501                	addi	a0,a0,0
    1318:	0402001b          	addiw	zero,tp,64
    131c:	09000303          	lb	t1,144(zero) # 90 <BASE_ADDR-0xffffffe0001fff70>
    1320:	0008                	0x8
    1322:	0501                	addi	a0,a0,0
    1324:	001c                	0x1c
    1326:	0402                	c.slli64	s0
    1328:	09010303          	lb	t1,144(sp)
    132c:	0008                	0x8
    132e:	0001                	nop
    1330:	0402                	c.slli64	s0
    1332:	09010303          	lb	t1,144(sp)
    1336:	0008                	0x8
    1338:	0501                	addi	a0,a0,0
    133a:	0020                	addi	s0,sp,8
    133c:	0402                	c.slli64	s0
    133e:	09010303          	lb	t1,144(sp)
    1342:	000c                	0xc
    1344:	0501                	addi	a0,a0,0
    1346:	001d                	c.nop	7
    1348:	0402                	c.slli64	s0
    134a:	09000303          	lb	t1,144(zero) # 90 <BASE_ADDR-0xffffffe0001fff70>
    134e:	0008                	0x8
    1350:	0501                	addi	a0,a0,0
    1352:	001c                	0x1c
    1354:	0402                	c.slli64	s0
    1356:	09010303          	lb	t1,144(sp)
    135a:	0008                	0x8
    135c:	0501                	addi	a0,a0,0
    135e:	04020013          	addi	zero,tp,64 # 40 <BASE_ADDR-0xffffffe0001fffc0>
    1362:	09010303          	lb	t1,144(sp)
    1366:	000c                	0xc
    1368:	0501                	addi	a0,a0,0
    136a:	04020027          	0x4020027
    136e:	09770303          	lb	t1,151(a4) # fffffffffffe0097 <_ebss+0x1fffdd60f7>
    1372:	0008                	0x8
    1374:	0501                	addi	a0,a0,0
    1376:	0022                	c.slli	zero,0x8
    1378:	0402                	c.slli64	s0
    137a:	0301                	addi	t1,t1,0
    137c:	0900                	addi	s0,sp,144
    137e:	000c                	0xc
    1380:	0501                	addi	a0,a0,0
    1382:	030c                	addi	a1,sp,384
    1384:	0008090f          	0x8090f
    1388:	0501                	addi	a0,a0,0
    138a:	0319                	addi	t1,t1,6
    138c:	0900                	addi	s0,sp,144
    138e:	0008                	0x8
    1390:	0501                	addi	a0,a0,0
    1392:	030a                	slli	t1,t1,0x2
    1394:	0901                	addi	s2,s2,0
    1396:	001c                	0x1c
    1398:	0501                	addi	a0,a0,0
    139a:	031d                	addi	t1,t1,7
    139c:	0900                	addi	s0,sp,144
    139e:	0008                	0x8
    13a0:	0501                	addi	a0,a0,0
    13a2:	0322                	slli	t1,t1,0x8
    13a4:	0901                	addi	s2,s2,0
    13a6:	0004                	0x4
    13a8:	0501                	addi	a0,a0,0
    13aa:	030a                	slli	t1,t1,0x2
    13ac:	0900                	addi	s0,sp,144
    13ae:	0008                	0x8
    13b0:	0501                	addi	a0,a0,0
    13b2:	0329                	addi	t1,t1,10
    13b4:	0900                	addi	s0,sp,144
    13b6:	0008                	0x8
    13b8:	0501                	addi	a0,a0,0
    13ba:	031c                	addi	a5,sp,384
    13bc:	0900                	addi	s0,sp,144
    13be:	0004                	0x4
    13c0:	0501                	addi	a0,a0,0
    13c2:	0318                	addi	a4,sp,384
    13c4:	0902                	c.slli64	s2
    13c6:	0004                	0x4
    13c8:	0501                	addi	a0,a0,0
    13ca:	0311                	addi	t1,t1,4
    13cc:	0900                	addi	s0,sp,144
    13ce:	0008                	0x8
    13d0:	0501                	addi	a0,a0,0
    13d2:	0301                	addi	t1,t1,0
    13d4:	0901                	addi	s2,s2,0
    13d6:	0008                	0x8
    13d8:	0901                	addi	s2,s2,0
    13da:	0018                	0x18
    13dc:	0100                	addi	s0,sp,128
    13de:	5e01                	li	t3,-32
    13e0:	05000003          	lb	zero,80(zero) # 50 <BASE_ADDR-0xffffffe0001fffb0>
    13e4:	0800                	addi	s0,sp,16
    13e6:	6300                	ld	s0,0(a4)
    13e8:	0000                	unimp
    13ea:	0100                	addi	s0,sp,128
    13ec:	0101                	addi	sp,sp,0
    13ee:	000d0efb          	0xd0efb
    13f2:	0101                	addi	sp,sp,0
    13f4:	0101                	addi	sp,sp,0
    13f6:	0000                	unimp
    13f8:	0100                	addi	s0,sp,128
    13fa:	0000                	unimp
    13fc:	0101                	addi	sp,sp,0
    13fe:	1f01                	addi	t5,t5,-32
    1400:	0004                	0x4
    1402:	0000                	unimp
    1404:	3a00                	fld	fs0,48(a2)
    1406:	0000                	unimp
    1408:	0700                	addi	s0,sp,896
    140a:	0001                	nop
    140c:	6d00                	ld	s0,24(a0)
    140e:	0000                	unimp
    1410:	0200                	addi	s0,sp,256
    1412:	1f01                	addi	t5,t5,-32
    1414:	0f02                	c.slli64	t5
    1416:	0001120b          	0x1120b
    141a:	0000                	unimp
    141c:	0112                	slli	sp,sp,0x4
    141e:	0000                	unimp
    1420:	dd00                	sw	s0,56(a0)
    1422:	0000                	unimp
    1424:	0100                	addi	s0,sp,128
    1426:	00e2                	slli	ra,ra,0x18
    1428:	0000                	unimp
    142a:	e901                	bnez	a0,143a <BASE_ADDR-0xffffffe0001febc6>
    142c:	0000                	unimp
    142e:	0100                	addi	s0,sp,128
    1430:	0119                	addi	sp,sp,6
    1432:	0000                	unimp
    1434:	2101                	sext.w	sp,sp
    1436:	0001                	nop
    1438:	0200                	addi	s0,sp,256
    143a:	00bc                	addi	a5,sp,72
    143c:	0000                	unimp
    143e:	0000b703          	ld	a4,0(ra)
    1442:	0100                	addi	s0,sp,128
    1444:	0000012b          	0x12b
    1448:	9b01                	andi	a4,a4,-32
    144a:	0000                	unimp
    144c:	0300                	addi	s0,sp,384
    144e:	3a05                	addiw	s4,s4,-31
    1450:	0900                	addi	s0,sp,144
    1452:	0402                	c.slli64	s0
    1454:	e0002013          	slti	zero,zero,-512
    1458:	ffff                	0xffff
    145a:	03ff                	0x3ff
    145c:	0119                	addi	sp,sp,6
    145e:	0505                	addi	a0,a0,1
    1460:	10090103          	lb	sp,256(s2)
    1464:	0100                	addi	s0,sp,128
    1466:	1405                	addi	s0,s0,-31
    1468:	34090203          	lb	tp,832(s2)
    146c:	0100                	addi	s0,sp,128
    146e:	08090203          	lb	tp,128(s2)
    1472:	0100                	addi	s0,sp,128
    1474:	08090203          	lb	tp,128(s2)
    1478:	0100                	addi	s0,sp,128
    147a:	08090203          	lb	tp,128(s2)
    147e:	0100                	addi	s0,sp,128
    1480:	0105                	addi	sp,sp,1
    1482:	04090203          	lb	tp,64(s2)
    1486:	0100                	addi	s0,sp,128
    1488:	1009                	c.nop	-30
    148a:	0000                	unimp
    148c:	0101                	addi	sp,sp,0
    148e:	4505                	li	a0,1
    1490:	0900                	addi	s0,sp,144
    1492:	7402                	ld	s0,32(sp)
    1494:	e0002013          	slti	zero,zero,-512
    1498:	ffff                	0xffff
    149a:	03ff                	0x3ff
    149c:	0126                	slli	sp,sp,0x9
    149e:	0c05                	addi	s8,s8,1
    14a0:	24090103          	lb	sp,576(s2)
    14a4:	0100                	addi	s0,sp,128
    14a6:	3005                	0x3005
    14a8:	0c090103          	lb	sp,192(s2)
    14ac:	0100                	addi	s0,sp,128
    14ae:	2005                	0x2005
    14b0:	0c090003          	lb	zero,192(s2)
    14b4:	0100                	addi	s0,sp,128
    14b6:	0805                	addi	a6,a6,1
    14b8:	14090103          	lb	sp,320(s2)
    14bc:	0100                	addi	s0,sp,128
    14be:	0905                	addi	s2,s2,1
    14c0:	08090103          	lb	sp,128(s2)
    14c4:	0100                	addi	s0,sp,128
    14c6:	1005                	c.nop	-31
    14c8:	0c090203          	lb	tp,192(s2)
    14cc:	0100                	addi	s0,sp,128
    14ce:	0f05                	addi	t5,t5,1
    14d0:	0c090103          	lb	sp,192(s2)
    14d4:	0100                	addi	s0,sp,128
    14d6:	0c05                	addi	s8,s8,1
    14d8:	08090003          	lb	zero,128(s2)
    14dc:	0100                	addi	s0,sp,128
    14de:	0805                	addi	a6,a6,1
    14e0:	08090003          	lb	zero,128(s2)
    14e4:	0100                	addi	s0,sp,128
    14e6:	0905                	addi	s2,s2,1
    14e8:	08090103          	lb	sp,128(s2)
    14ec:	0100                	addi	s0,sp,128
    14ee:	0c05                	addi	s8,s8,1
    14f0:	0c090303          	lb	t1,192(s2)
    14f4:	0100                	addi	s0,sp,128
    14f6:	1d05                	addi	s10,s10,-31
    14f8:	04090103          	lb	sp,64(s2)
    14fc:	0100                	addi	s0,sp,128
    14fe:	3005                	0x3005
    1500:	08090003          	lb	zero,128(s2)
    1504:	0100                	addi	s0,sp,128
    1506:	2e05                	addiw	t3,t3,1
    1508:	08090003          	lb	zero,128(s2)
    150c:	0100                	addi	s0,sp,128
    150e:	0805                	addi	a6,a6,1
    1510:	04090003          	lb	zero,64(s2)
    1514:	0100                	addi	s0,sp,128
    1516:	1205                	addi	tp,tp,-31
    1518:	08090103          	lb	sp,128(s2)
    151c:	0100                	addi	s0,sp,128
    151e:	1905                	addi	s2,s2,-31
    1520:	18090203          	lb	tp,384(s2)
    1524:	0100                	addi	s0,sp,128
    1526:	1005                	c.nop	-31
    1528:	10090003          	lb	zero,256(s2)
    152c:	0100                	addi	s0,sp,128
    152e:	0c05                	addi	s8,s8,1
    1530:	08090103          	lb	sp,128(s2)
    1534:	0100                	addi	s0,sp,128
    1536:	1f05                	addi	t5,t5,-31
    1538:	0200                	addi	s0,sp,256
    153a:	0104                	addi	s1,sp,128
    153c:	08090003          	lb	zero,128(s2)
    1540:	0100                	addi	s0,sp,128
    1542:	2805                	addiw	a6,a6,1
    1544:	14090203          	lb	tp,320(s2)
    1548:	0100                	addi	s0,sp,128
    154a:	1805                	addi	a6,a6,-31
    154c:	0c090003          	lb	zero,192(s2)
    1550:	0100                	addi	s0,sp,128
    1552:	0505                	addi	a0,a0,1
    1554:	10090003          	lb	zero,256(s2)
    1558:	0100                	addi	s0,sp,128
    155a:	5705                	li	a4,-31
    155c:	14090003          	lb	zero,320(s2)
    1560:	0100                	addi	s0,sp,128
    1562:	0505                	addi	a0,a0,1
    1564:	14090003          	lb	zero,320(s2)
    1568:	0100                	addi	s0,sp,128
    156a:	0105                	addi	sp,sp,1
    156c:	1c090103          	lb	sp,448(s2)
    1570:	0100                	addi	s0,sp,128
    1572:	2009                	0x2009
    1574:	0000                	unimp
    1576:	0101                	addi	sp,sp,0
    1578:	2905                	addiw	s2,s2,1
    157a:	0900                	addi	s0,sp,144
    157c:	f402                	sd	zero,40(sp)
    157e:	2014                	fld	fa3,0(s0)
    1580:	e000                	sd	s0,0(s0)
    1582:	ffff                	0xffff
    1584:	03ff                	0x3ff
    1586:	1105013b          	0x1105013b
    158a:	18090103          	lb	sp,384(s2)
    158e:	0100                	addi	s0,sp,128
    1590:	0805                	addi	a6,a6,1
    1592:	0c090103          	lb	sp,192(s2)
    1596:	0100                	addi	s0,sp,128
    1598:	0d05                	addi	s10,s10,1
    159a:	0200                	addi	s0,sp,256
    159c:	0104                	addi	s1,sp,128
    159e:	08090003          	lb	zero,128(s2)
    15a2:	0100                	addi	s0,sp,128
    15a4:	3505                	addiw	a0,a0,-31
    15a6:	0200                	addi	s0,sp,256
    15a8:	0204                	addi	s1,sp,256
    15aa:	0c090003          	lb	zero,192(s2)
    15ae:	0100                	addi	s0,sp,128
    15b0:	0805                	addi	a6,a6,1
    15b2:	0c090103          	lb	sp,192(s2)
    15b6:	0100                	addi	s0,sp,128
    15b8:	0e05                	addi	t3,t3,1
    15ba:	0200                	addi	s0,sp,256
    15bc:	0104                	addi	s1,sp,128
    15be:	08090003          	lb	zero,128(s2)
    15c2:	0100                	addi	s0,sp,128
    15c4:	3205                	addiw	tp,tp,-31
    15c6:	0200                	addi	s0,sp,256
    15c8:	0204                	addi	s1,sp,256
    15ca:	0c090003          	lb	zero,192(s2)
    15ce:	0100                	addi	s0,sp,128
    15d0:	0805                	addi	a6,a6,1
    15d2:	0c090103          	lb	sp,192(s2)
    15d6:	0100                	addi	s0,sp,128
    15d8:	0e05                	addi	t3,t3,1
    15da:	0200                	addi	s0,sp,256
    15dc:	0104                	addi	s1,sp,128
    15de:	08090003          	lb	zero,128(s2)
    15e2:	0100                	addi	s0,sp,128
    15e4:	2b05                	addiw	s6,s6,1
    15e6:	0200                	addi	s0,sp,256
    15e8:	0204                	addi	s1,sp,256
    15ea:	0c090003          	lb	zero,192(s2)
    15ee:	0100                	addi	s0,sp,128
    15f0:	0805                	addi	a6,a6,1
    15f2:	0c090103          	lb	sp,192(s2)
    15f6:	0100                	addi	s0,sp,128
    15f8:	0e05                	addi	t3,t3,1
    15fa:	0200                	addi	s0,sp,256
    15fc:	0104                	addi	s1,sp,128
    15fe:	08090003          	lb	zero,128(s2)
    1602:	0100                	addi	s0,sp,128
    1604:	2c05                	addiw	s8,s8,1
    1606:	0200                	addi	s0,sp,256
    1608:	0204                	addi	s1,sp,256
    160a:	0c090003          	lb	zero,192(s2)
    160e:	0100                	addi	s0,sp,128
    1610:	0805                	addi	a6,a6,1
    1612:	0c090103          	lb	sp,192(s2)
    1616:	0100                	addi	s0,sp,128
    1618:	0e05                	addi	t3,t3,1
    161a:	0200                	addi	s0,sp,256
    161c:	0104                	addi	s1,sp,128
    161e:	08090003          	lb	zero,128(s2)
    1622:	0100                	addi	s0,sp,128
    1624:	2d05                	addiw	s10,s10,1
    1626:	0200                	addi	s0,sp,256
    1628:	0204                	addi	s1,sp,256
    162a:	0c090003          	lb	zero,192(s2)
    162e:	0100                	addi	s0,sp,128
    1630:	0505                	addi	a0,a0,1
    1632:	0c090103          	lb	sp,192(s2)
    1636:	0100                	addi	s0,sp,128
    1638:	0105                	addi	sp,sp,1
    163a:	10090103          	lb	sp,256(s2)
    163e:	0100                	addi	s0,sp,128
    1640:	1409                	addi	s0,s0,-30
    1642:	0000                	unimp
    1644:	0101                	addi	sp,sp,0
    1646:	3805                	addiw	a6,a6,-31
    1648:	0900                	addi	s0,sp,144
    164a:	dc02                	sw	zero,56(sp)
    164c:	2015                	0x2015
    164e:	e000                	sd	s0,0(s0)
    1650:	ffff                	0xffff
    1652:	03ff                	0x3ff
    1654:	00c5                	addi	ra,ra,17
    1656:	0501                	addi	a0,a0,0
    1658:	030c                	addi	a1,sp,384
    165a:	0901                	addi	s2,s2,0
    165c:	0018                	0x18
    165e:	0301                	addi	t1,t1,0
    1660:	0901                	addi	s2,s2,0
    1662:	000c                	0xc
    1664:	0501                	addi	a0,a0,0
    1666:	0305                	addi	t1,t1,1
    1668:	0901                	addi	s2,s2,0
    166a:	000c                	0xc
    166c:	0501                	addi	a0,a0,0
    166e:	0308                	addi	a0,sp,384
    1670:	0901                	addi	s2,s2,0
    1672:	000c                	0xc
    1674:	0501                	addi	a0,a0,0
    1676:	04020017          	auipc	zero,0x4020
    167a:	0301                	addi	t1,t1,0
    167c:	0900                	addi	s0,sp,144
    167e:	0008                	0x8
    1680:	0501                	addi	a0,a0,0
    1682:	0046                	c.slli	zero,0x11
    1684:	0402                	c.slli64	s0
    1686:	0302                	c.slli64	t1
    1688:	0900                	addi	s0,sp,144
    168a:	000c                	0xc
    168c:	0501                	addi	a0,a0,0
    168e:	04020043          	0x4020043
    1692:	0302                	c.slli64	t1
    1694:	0900                	addi	s0,sp,144
    1696:	000c                	0xc
    1698:	0501                	addi	a0,a0,0
    169a:	0309                	addi	t1,t1,2
    169c:	00040903          	lb	s2,0(s0) # 300370a <BASE_ADDR-0xffffffdffd1fc8f6>
    16a0:	0501                	addi	a0,a0,0
    16a2:	0314                	addi	a3,sp,384
    16a4:	0901                	addi	s2,s2,0
    16a6:	0018                	0x18
    16a8:	0501                	addi	a0,a0,0
    16aa:	031a                	slli	t1,t1,0x6
    16ac:	0901                	addi	s2,s2,0
    16ae:	001c                	0x1c
    16b0:	0501                	addi	a0,a0,0
    16b2:	0309                	addi	t1,t1,2
    16b4:	0901                	addi	s2,s2,0
    16b6:	0010                	0x10
    16b8:	0501                	addi	a0,a0,0
    16ba:	0308                	addi	a0,sp,384
    16bc:	0905                	addi	s2,s2,1
    16be:	0004                	0x4
    16c0:	0501                	addi	a0,a0,0
    16c2:	0016                	c.slli	zero,0x5
    16c4:	0402                	c.slli64	s0
    16c6:	0301                	addi	t1,t1,0
    16c8:	0900                	addi	s0,sp,144
    16ca:	0008                	0x8
    16cc:	0501                	addi	a0,a0,0
    16ce:	0309                	addi	t1,t1,2
    16d0:	0901                	addi	s2,s2,0
    16d2:	000c                	0xc
    16d4:	0301                	addi	t1,t1,0
    16d6:	0901                	addi	s2,s2,0
    16d8:	0004                	0x4
    16da:	0501                	addi	a0,a0,0
    16dc:	0308                	addi	a0,sp,384
    16de:	0902                	c.slli64	s2
    16e0:	0004                	0x4
    16e2:	0501                	addi	a0,a0,0
    16e4:	04020017          	auipc	zero,0x4020
    16e8:	0301                	addi	t1,t1,0
    16ea:	0900                	addi	s0,sp,144
    16ec:	0008                	0x8
    16ee:	0501                	addi	a0,a0,0
    16f0:	0044                	addi	s1,sp,4
    16f2:	0402                	c.slli64	s0
    16f4:	0302                	c.slli64	t1
    16f6:	0900                	addi	s0,sp,144
    16f8:	000c                	0xc
    16fa:	0501                	addi	a0,a0,0
    16fc:	0069                	c.nop	26
    16fe:	0402                	c.slli64	s0
    1700:	09000303          	lb	t1,144(zero) # 90 <BASE_ADDR-0xffffffe0001fff70>
    1704:	000c                	0xc
    1706:	0501                	addi	a0,a0,0
    1708:	0309                	addi	t1,t1,2
    170a:	0901                	addi	s2,s2,0
    170c:	000c                	0xc
    170e:	0501                	addi	a0,a0,0
    1710:	0308                	addi	a0,sp,384
    1712:	0902                	c.slli64	s2
    1714:	000c                	0xc
    1716:	0501                	addi	a0,a0,0
    1718:	04020017          	auipc	zero,0x4020
    171c:	0301                	addi	t1,t1,0
    171e:	0900                	addi	s0,sp,144
    1720:	0008                	0x8
    1722:	0501                	addi	a0,a0,0
    1724:	0309                	addi	t1,t1,2
    1726:	0909                	addi	s2,s2,2
    1728:	000c                	0xc
    172a:	0501                	addi	a0,a0,0
    172c:	0314                	addi	a3,sp,384
    172e:	0901                	addi	s2,s2,0
    1730:	0008                	0x8
    1732:	0501                	addi	a0,a0,0
    1734:	0301                	addi	t1,t1,0
    1736:	0902                	c.slli64	s2
    1738:	0014                	0x14
    173a:	0901                	addi	s2,s2,0
    173c:	0010                	0x10
    173e:	0100                	addi	s0,sp,128
    1740:	a501                	j	1d40 <BASE_ADDR-0xffffffe0001fe2c0>
    1742:	0006                	c.slli	zero,0x1
    1744:	0500                	addi	s0,sp,640
    1746:	0800                	addi	s0,sp,16
    1748:	4b00                	lw	s0,16(a4)
    174a:	0000                	unimp
    174c:	0100                	addi	s0,sp,128
    174e:	0101                	addi	sp,sp,0
    1750:	000d0efb          	0xd0efb
    1754:	0101                	addi	sp,sp,0
    1756:	0101                	addi	sp,sp,0
    1758:	0000                	unimp
    175a:	0100                	addi	s0,sp,128
    175c:	0000                	unimp
    175e:	0101                	addi	sp,sp,0
    1760:	1f01                	addi	t5,t5,-32
    1762:	00000003          	lb	zero,0(zero) # 0 <BASE_ADDR-0xffffffe000200000>
    1766:	3a00                	fld	fs0,48(a2)
    1768:	0000                	unimp
    176a:	6d00                	ld	s0,24(a0)
    176c:	0000                	unimp
    176e:	0200                	addi	s0,sp,256
    1770:	1f01                	addi	t5,t5,-32
    1772:	0f02                	c.slli64	t5
    1774:	00013307          	fld	ft6,0(sp)
    1778:	0000                	unimp
    177a:	00000133          	add	sp,zero,zero
    177e:	dd00                	sw	s0,56(a0)
    1780:	0000                	unimp
    1782:	0100                	addi	s0,sp,128
    1784:	00c5                	addi	ra,ra,17
    1786:	0000                	unimp
    1788:	bc02                	fsd	ft0,56(sp)
    178a:	0000                	unimp
    178c:	0200                	addi	s0,sp,256
    178e:	0000009b          	sext.w	ra,zero
    1792:	b702                	fsd	ft0,424(sp)
    1794:	0000                	unimp
    1796:	0100                	addi	s0,sp,128
    1798:	4405                	li	s0,1
    179a:	0900                	addi	s0,sp,144
    179c:	1802                	slli	a6,a6,0x20
    179e:	e0002017          	auipc	zero,0xe0002
    17a2:	ffff                	0xffff
    17a4:	03ff                	0x3ff
    17a6:	010a                	slli	sp,sp,0x2
    17a8:	1c05                	addi	s8,s8,-31
    17aa:	14090103          	lb	sp,320(s2)
    17ae:	0100                	addi	s0,sp,128
    17b0:	0b05                	addi	s6,s6,1
    17b2:	0c090103          	lb	sp,192(s2)
    17b6:	0100                	addi	s0,sp,128
    17b8:	0e05                	addi	t3,t3,1
    17ba:	04090103          	lb	sp,64(s2)
    17be:	0100                	addi	s0,sp,128
    17c0:	0c05                	addi	s8,s8,1
    17c2:	08090003          	lb	zero,128(s2)
    17c6:	0100                	addi	s0,sp,128
    17c8:	2c05                	addiw	s8,s8,1
    17ca:	0200                	addi	s0,sp,256
    17cc:	0104                	addi	s1,sp,128
    17ce:	08090003          	lb	zero,128(s2)
    17d2:	0100                	addi	s0,sp,128
    17d4:	2105                	addiw	sp,sp,1
    17d6:	0200                	addi	s0,sp,256
    17d8:	0104                	addi	s1,sp,128
    17da:	08090003          	lb	zero,128(s2)
    17de:	0100                	addi	s0,sp,128
    17e0:	0b05                	addi	s6,s6,1
    17e2:	08090103          	lb	sp,128(s2)
    17e6:	0100                	addi	s0,sp,128
    17e8:	0c05                	addi	s8,s8,1
    17ea:	0c097e03          	0xc097e03
    17ee:	0100                	addi	s0,sp,128
    17f0:	3605                	addiw	a2,a2,-31
    17f2:	0c090103          	lb	sp,192(s2)
    17f6:	0100                	addi	s0,sp,128
    17f8:	0c05                	addi	s8,s8,1
    17fa:	04090303          	lb	t1,64(s2)
    17fe:	0100                	addi	s0,sp,128
    1800:	0105                	addi	sp,sp,1
    1802:	04090103          	lb	sp,64(s2)
    1806:	0100                	addi	s0,sp,128
    1808:	1009                	c.nop	-30
    180a:	0000                	unimp
    180c:	0101                	addi	sp,sp,0
    180e:	3905                	addiw	s2,s2,-31
    1810:	0900                	addi	s0,sp,144
    1812:	8c02                	jr	s8
    1814:	e0002017          	auipc	zero,0xe0002
    1818:	ffff                	0xffff
    181a:	03ff                	0x3ff
    181c:	1c050113          	addi	sp,a0,448 # fffffffffffe31c0 <_ebss+0x1fffdd9220>
    1820:	18090103          	lb	sp,384(s2)
    1824:	0100                	addi	s0,sp,128
    1826:	0505                	addi	a0,a0,1
    1828:	0c090103          	lb	sp,192(s2)
    182c:	0100                	addi	s0,sp,128
    182e:	1505                	addi	a0,a0,-31
    1830:	04090103          	lb	sp,64(s2)
    1834:	0100                	addi	s0,sp,128
    1836:	0c05                	addi	s8,s8,1
    1838:	08090003          	lb	zero,128(s2)
    183c:	0100                	addi	s0,sp,128
    183e:	2405                	addiw	s0,s0,1
    1840:	0200                	addi	s0,sp,256
    1842:	0104                	addi	s1,sp,128
    1844:	08090003          	lb	zero,128(s2)
    1848:	0100                	addi	s0,sp,128
    184a:	0d05                	addi	s10,s10,1
    184c:	0200                	addi	s0,sp,256
    184e:	0104                	addi	s1,sp,128
    1850:	08090003          	lb	zero,128(s2)
    1854:	0100                	addi	s0,sp,128
    1856:	3b05                	addiw	s6,s6,-31
    1858:	0200                	addi	s0,sp,256
    185a:	0204                	addi	s1,sp,256
    185c:	08090003          	lb	zero,128(s2)
    1860:	0100                	addi	s0,sp,128
    1862:	1105                	addi	sp,sp,-31
    1864:	08097f03          	0x8097f03
    1868:	0100                	addi	s0,sp,128
    186a:	0c05                	addi	s8,s8,1
    186c:	0200                	addi	s0,sp,256
    186e:	0104                	addi	s1,sp,128
    1870:	0c090003          	lb	zero,192(s2)
    1874:	0100                	addi	s0,sp,128
    1876:	08090303          	lb	t1,128(s2)
    187a:	0100                	addi	s0,sp,128
    187c:	0105                	addi	sp,sp,1
    187e:	04090103          	lb	sp,64(s2)
    1882:	0100                	addi	s0,sp,128
    1884:	1009                	c.nop	-30
    1886:	0000                	unimp
    1888:	0101                	addi	sp,sp,0
    188a:	3d05                	addiw	s10,s10,-31
    188c:	0900                	addi	s0,sp,144
    188e:	0402                	c.slli64	s0
    1890:	2018                	fld	fa4,0(s0)
    1892:	e000                	sd	s0,0(s0)
    1894:	ffff                	0xffff
    1896:	03ff                	0x3ff
    1898:	0b05011b          	addiw	sp,a0,176
    189c:	14090103          	lb	sp,320(s2)
    18a0:	0100                	addi	s0,sp,128
    18a2:	0805                	addi	a6,a6,1
    18a4:	08090003          	lb	zero,128(s2)
    18a8:	0100                	addi	s0,sp,128
    18aa:	1205                	addi	tp,tp,-31
    18ac:	04090103          	lb	sp,64(s2)
    18b0:	0100                	addi	s0,sp,128
    18b2:	2105                	addiw	sp,sp,1
    18b4:	0c090103          	lb	sp,192(s2)
    18b8:	0100                	addi	s0,sp,128
    18ba:	1705                	addi	a4,a4,-31
    18bc:	08090003          	lb	zero,128(s2)
    18c0:	0100                	addi	s0,sp,128
    18c2:	1405                	addi	s0,s0,-31
    18c4:	08090003          	lb	zero,128(s2)
    18c8:	0100                	addi	s0,sp,128
    18ca:	0905                	addi	s2,s2,1
    18cc:	08090103          	lb	sp,128(s2)
    18d0:	0100                	addi	s0,sp,128
    18d2:	1c05                	addi	s8,s8,-31
    18d4:	04090203          	lb	tp,64(s2)
    18d8:	0100                	addi	s0,sp,128
    18da:	0b05                	addi	s6,s6,1
    18dc:	0c090103          	lb	sp,192(s2)
    18e0:	0100                	addi	s0,sp,128
    18e2:	1a05                	addi	s4,s4,-31
    18e4:	0200                	addi	s0,sp,256
    18e6:	0204                	addi	s1,sp,256
    18e8:	04090003          	lb	zero,64(s2)
    18ec:	0100                	addi	s0,sp,128
    18ee:	0d05                	addi	s10,s10,1
    18f0:	0200                	addi	s0,sp,256
    18f2:	0104                	addi	s1,sp,128
    18f4:	0c090003          	lb	zero,192(s2)
    18f8:	0100                	addi	s0,sp,128
    18fa:	0c05                	addi	s8,s8,1
    18fc:	0200                	addi	s0,sp,256
    18fe:	0104                	addi	s1,sp,128
    1900:	08090003          	lb	zero,128(s2)
    1904:	0100                	addi	s0,sp,128
    1906:	1005                	c.nop	-31
    1908:	04090103          	lb	sp,64(s2)
    190c:	0100                	addi	s0,sp,128
    190e:	0c090103          	lb	sp,192(s2)
    1912:	0100                	addi	s0,sp,128
    1914:	0c090103          	lb	sp,192(s2)
    1918:	0100                	addi	s0,sp,128
    191a:	0105                	addi	sp,sp,1
    191c:	08090103          	lb	sp,128(s2)
    1920:	0100                	addi	s0,sp,128
    1922:	0c09                	addi	s8,s8,2
    1924:	0000                	unimp
    1926:	0101                	addi	sp,sp,0
    1928:	4c05                	li	s8,1
    192a:	0900                	addi	s0,sp,144
    192c:	a002                	fsd	ft0,0(sp)
    192e:	2018                	fld	fa4,0(s0)
    1930:	e000                	sd	s0,0(s0)
    1932:	ffff                	0xffff
    1934:	03ff                	0x3ff
    1936:	0128                	addi	a0,sp,136
    1938:	0505                	addi	a0,a0,1
    193a:	24090103          	lb	sp,576(s2)
    193e:	0100                	addi	s0,sp,128
    1940:	0905                	addi	s2,s2,1
    1942:	14090103          	lb	sp,320(s2)
    1946:	0100                	addi	s0,sp,128
    1948:	0805                	addi	a6,a6,1
    194a:	20090003          	lb	zero,512(s2)
    194e:	0100                	addi	s0,sp,128
    1950:	3405                	addiw	s0,s0,-31
    1952:	0200                	addi	s0,sp,256
    1954:	0104                	addi	s1,sp,128
    1956:	04090003          	lb	zero,64(s2)
    195a:	0100                	addi	s0,sp,128
    195c:	3905                	addiw	s2,s2,-31
    195e:	10090103          	lb	sp,256(s2)
    1962:	0100                	addi	s0,sp,128
    1964:	1c05                	addi	s8,s8,-31
    1966:	08090003          	lb	zero,128(s2)
    196a:	0100                	addi	s0,sp,128
    196c:	1105                	addi	sp,sp,-31
    196e:	04090103          	lb	sp,64(s2)
    1972:	0100                	addi	s0,sp,128
    1974:	1605                	addi	a2,a2,-31
    1976:	0c090103          	lb	sp,192(s2)
    197a:	0100                	addi	s0,sp,128
    197c:	0f05                	addi	t5,t5,1
    197e:	0c090003          	lb	zero,192(s2)
    1982:	0100                	addi	s0,sp,128
    1984:	1105                	addi	sp,sp,-31
    1986:	08090103          	lb	sp,128(s2)
    198a:	0100                	addi	s0,sp,128
    198c:	0e05                	addi	t3,t3,1
    198e:	0c090103          	lb	sp,192(s2)
    1992:	0100                	addi	s0,sp,128
    1994:	0505                	addi	a0,a0,1
    1996:	0c090103          	lb	sp,192(s2)
    199a:	0100                	addi	s0,sp,128
    199c:	0105                	addi	sp,sp,1
    199e:	0c090103          	lb	sp,192(s2)
    19a2:	0100                	addi	s0,sp,128
    19a4:	1809                	addi	a6,a6,-30
    19a6:	0000                	unimp
    19a8:	0101                	addi	sp,sp,0
    19aa:	3f05                	addiw	t5,t5,-31
    19ac:	0900                	addi	s0,sp,144
    19ae:	7402                	ld	s0,32(sp)
    19b0:	2019                	0x2019
    19b2:	e000                	sd	s0,0(s0)
    19b4:	ffff                	0xffff
    19b6:	03ff                	0x3ff
    19b8:	0c050133          	0xc050133
    19bc:	18090103          	lb	sp,384(s2)
    19c0:	0100                	addi	s0,sp,128
    19c2:	0505                	addi	a0,a0,1
    19c4:	04090103          	lb	sp,64(s2)
    19c8:	0100                	addi	s0,sp,128
    19ca:	2c05                	addiw	s8,s8,1
    19cc:	0200                	addi	s0,sp,256
    19ce:	0204                	addi	s1,sp,256
    19d0:	04090003          	lb	zero,64(s2)
    19d4:	0100                	addi	s0,sp,128
    19d6:	0c05                	addi	s8,s8,1
    19d8:	0200                	addi	s0,sp,256
    19da:	0104                	addi	s1,sp,128
    19dc:	10090003          	lb	zero,256(s2)
    19e0:	0100                	addi	s0,sp,128
    19e2:	24090103          	lb	sp,576(s2)
    19e6:	0100                	addi	s0,sp,128
    19e8:	0105                	addi	sp,sp,1
    19ea:	04090103          	lb	sp,64(s2)
    19ee:	0100                	addi	s0,sp,128
    19f0:	1409                	addi	s0,s0,-30
    19f2:	0000                	unimp
    19f4:	0101                	addi	sp,sp,0
    19f6:	1c05                	addi	s8,s8,-31
    19f8:	0900                	addi	s0,sp,144
    19fa:	e002                	sd	zero,0(sp)
    19fc:	2019                	0x2019
    19fe:	e000                	sd	s0,0(s0)
    1a00:	ffff                	0xffff
    1a02:	03ff                	0x3ff
    1a04:	00c1                	addi	ra,ra,16
    1a06:	0501                	addi	a0,a0,0
    1a08:	030c                	addi	a1,sp,384
    1a0a:	0901                	addi	s2,s2,0
    1a0c:	0010                	0x10
    1a0e:	0501                	addi	a0,a0,0
    1a10:	0301                	addi	t1,t1,0
    1a12:	0901                	addi	s2,s2,0
    1a14:	0010                	0x10
    1a16:	0901                	addi	s2,s2,0
    1a18:	0010                	0x10
    1a1a:	0100                	addi	s0,sp,128
    1a1c:	0501                	addi	a0,a0,0
    1a1e:	001c                	0x1c
    1a20:	0209                	addi	tp,tp,2
    1a22:	1a10                	addi	a2,sp,304
    1a24:	0020                	addi	s0,sp,8
    1a26:	ffe0                	sd	s0,248(a5)
    1a28:	ffff                	0xffff
    1a2a:	0100c503          	lbu	a0,16(ra)
    1a2e:	0c05                	addi	s8,s8,1
    1a30:	10090103          	lb	sp,256(s2)
    1a34:	0100                	addi	s0,sp,128
    1a36:	0105                	addi	sp,sp,1
    1a38:	10090103          	lb	sp,256(s2)
    1a3c:	0100                	addi	s0,sp,128
    1a3e:	1009                	c.nop	-30
    1a40:	0000                	unimp
    1a42:	0101                	addi	sp,sp,0
    1a44:	2f05                	addiw	t5,t5,1
    1a46:	0900                	addi	s0,sp,144
    1a48:	4002                	0x4002
    1a4a:	201a                	fld	ft0,384(sp)
    1a4c:	e000                	sd	s0,0(s0)
    1a4e:	ffff                	0xffff
    1a50:	03ff                	0x3ff
    1a52:	00c9                	addi	ra,ra,18
    1a54:	0501                	addi	a0,a0,0
    1a56:	030c                	addi	a1,sp,384
    1a58:	0901                	addi	s2,s2,0
    1a5a:	0010                	0x10
    1a5c:	0501                	addi	a0,a0,0
    1a5e:	0312                	slli	t1,t1,0x4
    1a60:	0901                	addi	s2,s2,0
    1a62:	0004                	0x4
    1a64:	0501                	addi	a0,a0,0
    1a66:	0308                	addi	a0,sp,384
    1a68:	0900                	addi	s0,sp,144
    1a6a:	0008                	0x8
    1a6c:	0501                	addi	a0,a0,0
    1a6e:	0021                	c.nop	8
    1a70:	0402                	c.slli64	s0
    1a72:	0301                	addi	t1,t1,0
    1a74:	0900                	addi	s0,sp,144
    1a76:	0004                	0x4
    1a78:	0501                	addi	a0,a0,0
    1a7a:	0312                	slli	t1,t1,0x4
    1a7c:	0901                	addi	s2,s2,0
    1a7e:	000c                	0xc
    1a80:	0501                	addi	a0,a0,0
    1a82:	0308                	addi	a0,sp,384
    1a84:	0900                	addi	s0,sp,144
    1a86:	0008                	0x8
    1a88:	0501                	addi	a0,a0,0
    1a8a:	0022                	c.slli	zero,0x8
    1a8c:	0402                	c.slli64	s0
    1a8e:	0301                	addi	t1,t1,0
    1a90:	0900                	addi	s0,sp,144
    1a92:	0004                	0x4
    1a94:	0501                	addi	a0,a0,0
    1a96:	0312                	slli	t1,t1,0x4
    1a98:	0901                	addi	s2,s2,0
    1a9a:	000c                	0xc
    1a9c:	0501                	addi	a0,a0,0
    1a9e:	0308                	addi	a0,sp,384
    1aa0:	0900                	addi	s0,sp,144
    1aa2:	0008                	0x8
    1aa4:	0501                	addi	a0,a0,0
    1aa6:	0021                	c.nop	8
    1aa8:	0402                	c.slli64	s0
    1aaa:	0301                	addi	t1,t1,0
    1aac:	0900                	addi	s0,sp,144
    1aae:	0004                	0x4
    1ab0:	0501                	addi	a0,a0,0
    1ab2:	030c                	addi	a1,sp,384
    1ab4:	0901                	addi	s2,s2,0
    1ab6:	000c                	0xc
    1ab8:	0501                	addi	a0,a0,0
    1aba:	0301                	addi	t1,t1,0
    1abc:	0901                	addi	s2,s2,0
    1abe:	0004                	0x4
    1ac0:	0901                	addi	s2,s2,0
    1ac2:	0010                	0x10
    1ac4:	0100                	addi	s0,sp,128
    1ac6:	0501                	addi	a0,a0,0
    1ac8:	0025                	c.nop	9
    1aca:	0209                	addi	tp,tp,2
    1acc:	1ab0                	addi	a2,sp,376
    1ace:	0020                	addi	s0,sp,8
    1ad0:	ffe0                	sd	s0,248(a5)
    1ad2:	ffff                	0xffff
    1ad4:	0100d103          	lhu	sp,16(ra)
    1ad8:	0f05                	addi	t5,t5,1
    1ada:	10090103          	lb	sp,256(s2)
    1ade:	0100                	addi	s0,sp,128
    1ae0:	2a05                	addiw	s4,s4,1
    1ae2:	08090003          	lb	zero,128(s2)
    1ae6:	0100                	addi	s0,sp,128
    1ae8:	0105                	addi	sp,sp,1
    1aea:	10090103          	lb	sp,256(s2)
    1aee:	0100                	addi	s0,sp,128
    1af0:	1009                	c.nop	-30
    1af2:	0000                	unimp
    1af4:	0101                	addi	sp,sp,0
    1af6:	2505                	addiw	a0,a0,1
    1af8:	0900                	addi	s0,sp,144
    1afa:	e802                	sd	zero,16(sp)
    1afc:	201a                	fld	ft0,384(sp)
    1afe:	e000                	sd	s0,0(s0)
    1b00:	ffff                	0xffff
    1b02:	03ff                	0x3ff
    1b04:	00d5                	addi	ra,ra,21
    1b06:	0501                	addi	a0,a0,0
    1b08:	0309                	addi	t1,t1,2
    1b0a:	0901                	addi	s2,s2,0
    1b0c:	0014                	0x14
    1b0e:	0501                	addi	a0,a0,0
    1b10:	0301                	addi	t1,t1,0
    1b12:	0901                	addi	s2,s2,0
    1b14:	0018                	0x18
    1b16:	0901                	addi	s2,s2,0
    1b18:	0014                	0x14
    1b1a:	0100                	addi	s0,sp,128
    1b1c:	0501                	addi	a0,a0,0
    1b1e:	0034                	addi	a3,sp,8
    1b20:	0209                	addi	tp,tp,2
    1b22:	1b28                	addi	a0,sp,440
    1b24:	0020                	addi	s0,sp,8
    1b26:	ffe0                	sd	s0,248(a5)
    1b28:	ffff                	0xffff
    1b2a:	0100d903          	lhu	s2,16(ra)
    1b2e:	2705                	addiw	a4,a4,1
    1b30:	14090103          	lb	sp,320(s2)
    1b34:	0100                	addi	s0,sp,128
    1b36:	0905                	addi	s2,s2,1
    1b38:	08090003          	lb	zero,128(s2)
    1b3c:	0100                	addi	s0,sp,128
    1b3e:	0e05                	addi	t3,t3,1
    1b40:	10090103          	lb	sp,256(s2)
    1b44:	0100                	addi	s0,sp,128
    1b46:	1505                	addi	a0,a0,-31
    1b48:	08090003          	lb	zero,128(s2)
    1b4c:	0100                	addi	s0,sp,128
    1b4e:	0105                	addi	sp,sp,1
    1b50:	08090103          	lb	sp,128(s2)
    1b54:	0100                	addi	s0,sp,128
    1b56:	1009                	c.nop	-30
    1b58:	0000                	unimp
    1b5a:	0101                	addi	sp,sp,0
    1b5c:	3b05                	addiw	s6,s6,-31
    1b5e:	0900                	addi	s0,sp,144
    1b60:	7402                	ld	s0,32(sp)
    1b62:	e000201b          	0xe000201b
    1b66:	ffff                	0xffff
    1b68:	03ff                	0x3ff
    1b6a:	00de                	slli	ra,ra,0x17
    1b6c:	0501                	addi	a0,a0,0
    1b6e:	0312                	slli	t1,t1,0x4
    1b70:	0901                	addi	s2,s2,0
    1b72:	001c                	0x1c
    1b74:	0501                	addi	a0,a0,0
    1b76:	09010317          	auipc	t1,0x9010
    1b7a:	0018                	0x18
    1b7c:	0501                	addi	a0,a0,0
    1b7e:	031e                	slli	t1,t1,0x7
    1b80:	0900                	addi	s0,sp,144
    1b82:	0008                	0x8
    1b84:	0501                	addi	a0,a0,0
    1b86:	0331                	addi	t1,t1,12
    1b88:	0900                	addi	s0,sp,144
    1b8a:	0004                	0x4
    1b8c:	0501                	addi	a0,a0,0
    1b8e:	0301                	addi	t1,t1,0
    1b90:	0901                	addi	s2,s2,0
    1b92:	0018                	0x18
    1b94:	0901                	addi	s2,s2,0
    1b96:	0014                	0x14
    1b98:	0100                	addi	s0,sp,128
    1b9a:	0501                	addi	a0,a0,0
    1b9c:	02090017          	auipc	zero,0x2090
    1ba0:	1be0                	addi	s0,sp,508
    1ba2:	0020                	addi	s0,sp,8
    1ba4:	ffe0                	sd	s0,248(a5)
    1ba6:	ffff                	0xffff
    1ba8:	0100e303          	lwu	t1,16(ra)
    1bac:	0205                	addi	tp,tp,1
    1bae:	10090103          	lb	sp,256(s2)
    1bb2:	0100                	addi	s0,sp,128
    1bb4:	0905                	addi	s2,s2,1
    1bb6:	14090103          	lb	sp,320(s2)
    1bba:	0100                	addi	s0,sp,128
    1bbc:	0c090103          	lb	sp,192(s2)
    1bc0:	0100                	addi	s0,sp,128
    1bc2:	0205                	addi	tp,tp,1
    1bc4:	0c090103          	lb	sp,192(s2)
    1bc8:	0100                	addi	s0,sp,128
    1bca:	0105                	addi	sp,sp,1
    1bcc:	10090103          	lb	sp,256(s2)
    1bd0:	0100                	addi	s0,sp,128
    1bd2:	1409                	addi	s0,s0,-30
    1bd4:	0000                	unimp
    1bd6:	0101                	addi	sp,sp,0
    1bd8:	4705                	li	a4,1
    1bda:	0900                	addi	s0,sp,144
    1bdc:	4002                	0x4002
    1bde:	201c                	fld	fa5,0(s0)
    1be0:	e000                	sd	s0,0(s0)
    1be2:	ffff                	0xffff
    1be4:	03ff                	0x3ff
    1be6:	00ea                	slli	ra,ra,0x1a
    1be8:	0501                	addi	a0,a0,0
    1bea:	0901030b          	0x901030b
    1bee:	0018                	0x18
    1bf0:	0501                	addi	a0,a0,0
    1bf2:	0311                	addi	t1,t1,4
    1bf4:	0900                	addi	s0,sp,144
    1bf6:	0014                	0x14
    1bf8:	0501                	addi	a0,a0,0
    1bfa:	0305                	addi	t1,t1,1
    1bfc:	0900                	addi	s0,sp,144
    1bfe:	0004                	0x4
    1c00:	0501                	addi	a0,a0,0
    1c02:	0026                	c.slli	zero,0x9
    1c04:	0402                	c.slli64	s0
    1c06:	0301                	addi	t1,t1,0
    1c08:	0900                	addi	s0,sp,144
    1c0a:	0004                	0x4
    1c0c:	0501                	addi	a0,a0,0
    1c0e:	030e                	slli	t1,t1,0x3
    1c10:	00180903          	lb	s2,1(a6)
    1c14:	0501                	addi	a0,a0,0
    1c16:	031d                	addi	t1,t1,7
    1c18:	0900                	addi	s0,sp,144
    1c1a:	0008                	0x8
    1c1c:	0501                	addi	a0,a0,0
    1c1e:	0901030f          	0x901030f
    1c22:	000c                	0xc
    1c24:	0501                	addi	a0,a0,0
    1c26:	09010307          	0x9010307
    1c2a:	0010                	0x10
    1c2c:	0501                	addi	a0,a0,0
    1c2e:	030d                	addi	t1,t1,3
    1c30:	0900                	addi	s0,sp,144
    1c32:	0010                	0x10
    1c34:	0501                	addi	a0,a0,0
    1c36:	0309                	addi	t1,t1,2
    1c38:	0901                	addi	s2,s2,0
    1c3a:	0008                	0x8
    1c3c:	0501                	addi	a0,a0,0
    1c3e:	0301                	addi	t1,t1,0
    1c40:	0901                	addi	s2,s2,0
    1c42:	0004                	0x4
    1c44:	0901                	addi	s2,s2,0
    1c46:	0014                	0x14
    1c48:	0100                	addi	s0,sp,128
    1c4a:	0501                	addi	a0,a0,0
    1c4c:	005d                	c.nop	23
    1c4e:	0209                	addi	tp,tp,2
    1c50:	1ce0                	addi	s0,sp,636
    1c52:	0020                	addi	s0,sp,8
    1c54:	ffe0                	sd	s0,248(a5)
    1c56:	ffff                	0xffff
    1c58:	0100fe03          	0x100fe03
    1c5c:	0205                	addi	tp,tp,1
    1c5e:	28090203          	lb	tp,640(s2)
    1c62:	0100                	addi	s0,sp,128
    1c64:	1205                	addi	tp,tp,-31
    1c66:	04090103          	lb	sp,64(s2)
    1c6a:	0100                	addi	s0,sp,128
    1c6c:	0b05                	addi	s6,s6,1
    1c6e:	0c090103          	lb	sp,192(s2)
    1c72:	0100                	addi	s0,sp,128
    1c74:	0c05                	addi	s8,s8,1
    1c76:	08090103          	lb	sp,128(s2)
    1c7a:	0100                	addi	s0,sp,128
    1c7c:	0305                	addi	t1,t1,1
    1c7e:	04090003          	lb	zero,64(s2)
    1c82:	0100                	addi	s0,sp,128
    1c84:	3705                	addiw	a4,a4,-31
    1c86:	0200                	addi	s0,sp,256
    1c88:	0304                	addi	s1,sp,384
    1c8a:	04090003          	lb	zero,64(s2)
    1c8e:	0100                	addi	s0,sp,128
    1c90:	3105                	addiw	sp,sp,-31
    1c92:	0200                	addi	s0,sp,256
    1c94:	0304                	addi	s1,sp,384
    1c96:	08090003          	lb	zero,128(s2)
    1c9a:	0100                	addi	s0,sp,128
    1c9c:	1a05                	addi	s4,s4,-31
    1c9e:	0200                	addi	s0,sp,256
    1ca0:	0304                	addi	s1,sp,384
    1ca2:	14090003          	lb	zero,320(s2)
    1ca6:	0100                	addi	s0,sp,128
    1ca8:	2305                	addiw	t1,t1,1
    1caa:	0200                	addi	s0,sp,256
    1cac:	0304                	addi	s1,sp,384
    1cae:	0c090003          	lb	zero,192(s2)
    1cb2:	0100                	addi	s0,sp,128
    1cb4:	1505                	addi	a0,a0,-31
    1cb6:	0200                	addi	s0,sp,256
    1cb8:	0104                	addi	s1,sp,128
    1cba:	0c090003          	lb	zero,192(s2)
    1cbe:	0100                	addi	s0,sp,128
    1cc0:	0c05                	addi	s8,s8,1
    1cc2:	10090103          	lb	sp,256(s2)
    1cc6:	0100                	addi	s0,sp,128
    1cc8:	0305                	addi	t1,t1,1
    1cca:	08090003          	lb	zero,128(s2)
    1cce:	0100                	addi	s0,sp,128
    1cd0:	1105                	addi	sp,sp,-31
    1cd2:	0200                	addi	s0,sp,256
    1cd4:	0304                	addi	s1,sp,384
    1cd6:	04090103          	lb	sp,64(s2)
    1cda:	0100                	addi	s0,sp,128
    1cdc:	1505                	addi	a0,a0,-31
    1cde:	0200                	addi	s0,sp,256
    1ce0:	0304                	addi	s1,sp,384
    1ce2:	24090103          	lb	sp,576(s2)
    1ce6:	0100                	addi	s0,sp,128
    1ce8:	0a05                	addi	s4,s4,1
    1cea:	0200                	addi	s0,sp,256
    1cec:	0304                	addi	s1,sp,384
    1cee:	0c090003          	lb	zero,192(s2)
    1cf2:	0100                	addi	s0,sp,128
    1cf4:	1a05                	addi	s4,s4,-31
    1cf6:	0200                	addi	s0,sp,256
    1cf8:	0304                	addi	s1,sp,384
    1cfa:	04097e03          	0x4097e03
    1cfe:	0100                	addi	s0,sp,128
    1d00:	1505                	addi	a0,a0,-31
    1d02:	0200                	addi	s0,sp,256
    1d04:	0104                	addi	s1,sp,128
    1d06:	0c090003          	lb	zero,192(s2)
    1d0a:	0100                	addi	s0,sp,128
    1d0c:	1305                	addi	t1,t1,-31
    1d0e:	0c090403          	lb	s0,192(s2)
    1d12:	0100                	addi	s0,sp,128
    1d14:	0c05                	addi	s8,s8,1
    1d16:	08090003          	lb	zero,128(s2)
    1d1a:	0100                	addi	s0,sp,128
    1d1c:	0805                	addi	a6,a6,1
    1d1e:	04090003          	lb	zero,64(s2)
    1d22:	0100                	addi	s0,sp,128
    1d24:	1305                	addi	t1,t1,-31
    1d26:	0c090003          	lb	zero,192(s2)
    1d2a:	0100                	addi	s0,sp,128
    1d2c:	1105                	addi	sp,sp,-31
    1d2e:	10090003          	lb	zero,256(s2)
    1d32:	0100                	addi	s0,sp,128
    1d34:	1f05                	addi	t5,t5,-31
    1d36:	04097803          	0x4097803
    1d3a:	0100                	addi	s0,sp,128
    1d3c:	3105                	addiw	sp,sp,-31
    1d3e:	10090003          	lb	zero,256(s2)
    1d42:	0100                	addi	s0,sp,128
    1d44:	1005                	c.nop	-31
    1d46:	0200                	addi	s0,sp,256
    1d48:	0104                	addi	s1,sp,128
    1d4a:	10090003          	lb	zero,256(s2)
    1d4e:	0100                	addi	s0,sp,128
    1d50:	0105                	addi	sp,sp,1
    1d52:	0c090a03          	lb	s4,192(s2)
    1d56:	0100                	addi	s0,sp,128
    1d58:	1c09                	addi	s8,s8,-30
    1d5a:	0000                	unimp
    1d5c:	0101                	addi	sp,sp,0
    1d5e:	6b05                	lui	s6,0x1
    1d60:	0900                	addi	s0,sp,144
    1d62:	3802                	fld	fa6,32(sp)
    1d64:	201e                	fld	ft0,448(sp)
    1d66:	e000                	sd	s0,0(s0)
    1d68:	ffff                	0xffff
    1d6a:	03ff                	0x3ff
    1d6c:	0191                	addi	gp,gp,4
    1d6e:	0501                	addi	a0,a0,0
    1d70:	0309                	addi	t1,t1,2
    1d72:	0901                	addi	s2,s2,0
    1d74:	0024                	addi	s1,sp,8
    1d76:	0301                	addi	t1,t1,0
    1d78:	0901                	addi	s2,s2,0
    1d7a:	0008                	0x8
    1d7c:	0301                	addi	t1,t1,0
    1d7e:	0901                	addi	s2,s2,0
    1d80:	0008                	0x8
    1d82:	0501                	addi	a0,a0,0
    1d84:	0305                	addi	t1,t1,1
    1d86:	0902                	c.slli64	s2
    1d88:	0008                	0x8
    1d8a:	0501                	addi	a0,a0,0
    1d8c:	0301                	addi	t1,t1,0
    1d8e:	0901                	addi	s2,s2,0
    1d90:	0018                	0x18
    1d92:	0901                	addi	s2,s2,0
    1d94:	0014                	0x14
    1d96:	0100                	addi	s0,sp,128
    1d98:	0501                	addi	a0,a0,0
    1d9a:	0018                	0x18
    1d9c:	0209                	addi	tp,tp,2
    1d9e:	1ea0                	addi	s0,sp,888
    1da0:	0020                	addi	s0,sp,8
    1da2:	ffe0                	sd	s0,248(a5)
    1da4:	ffff                	0xffff
    1da6:	01019903          	lh	s2,16(gp)
    1daa:	0205                	addi	tp,tp,1
    1dac:	10090103          	lb	sp,256(s2)
    1db0:	0100                	addi	s0,sp,128
    1db2:	14090203          	lb	tp,320(s2)
    1db6:	0100                	addi	s0,sp,128
    1db8:	38090103          	lb	sp,896(s2)
    1dbc:	0100                	addi	s0,sp,128
    1dbe:	38090103          	lb	sp,896(s2)
    1dc2:	0100                	addi	s0,sp,128
    1dc4:	1b05                	addi	s6,s6,-31
    1dc6:	38090203          	lb	tp,896(s2)
    1dca:	0100                	addi	s0,sp,128
    1dcc:	0c05                	addi	s8,s8,1
    1dce:	08090003          	lb	zero,128(s2)
    1dd2:	0100                	addi	s0,sp,128
    1dd4:	0205                	addi	tp,tp,1
    1dd6:	10090203          	lb	tp,256(s2)
    1dda:	0100                	addi	s0,sp,128
    1ddc:	0105                	addi	sp,sp,1
    1dde:	20090b03          	lb	s6,512(s2)
    1de2:	0100                	addi	s0,sp,128
    1de4:	1409                	addi	s0,s0,-30
    1de6:	0000                	unimp
    1de8:	0101                	addi	sp,sp,0
    1dea:	0082                	c.slli64	ra
    1dec:	0000                	unimp
    1dee:	0005                	c.nop	1
    1df0:	0008                	0x8
    1df2:	003c                	addi	a5,sp,8
    1df4:	0000                	unimp
    1df6:	0101                	addi	sp,sp,0
    1df8:	fb01                	bnez	a4,1d08 <BASE_ADDR-0xffffffe0001fe2f8>
    1dfa:	0d0e                	slli	s10,s10,0x3
    1dfc:	0100                	addi	s0,sp,128
    1dfe:	0101                	addi	sp,sp,0
    1e00:	0001                	nop
    1e02:	0000                	unimp
    1e04:	0001                	nop
    1e06:	0100                	addi	s0,sp,128
    1e08:	0101                	addi	sp,sp,0
    1e0a:	031f 0138 0000      	0x138031f
    1e10:	003a                	c.slli	zero,0xe
    1e12:	0000                	unimp
    1e14:	006d                	c.nop	27
    1e16:	0000                	unimp
    1e18:	0102                	c.slli64	sp
    1e1a:	021f 040f 015d      	0x15d040f021f
    1e20:	0000                	unimp
    1e22:	5d00                	lw	s0,56(a0)
    1e24:	0001                	nop
    1e26:	0000                	unimp
    1e28:	00e9                	addi	ra,ra,26
    1e2a:	0000                	unimp
    1e2c:	bc01                	j	183c <BASE_ADDR-0xffffffe0001fe7c4>
    1e2e:	0000                	unimp
    1e30:	0200                	addi	s0,sp,256
    1e32:	1405                	addi	s0,s0,-31
    1e34:	0900                	addi	s0,sp,144
    1e36:	b802                	fsd	ft0,48(sp)
    1e38:	201f e000 ffff      	0xffffe000201f
    1e3e:	18ff                	0x18ff
    1e40:	0505                	addi	a0,a0,1
    1e42:	10090103          	lb	sp,256(s2)
    1e46:	0100                	addi	s0,sp,128
    1e48:	10090103          	lb	sp,256(s2)
    1e4c:	0100                	addi	s0,sp,128
    1e4e:	0c090203          	lb	tp,192(s2)
    1e52:	0100                	addi	s0,sp,128
    1e54:	04090203          	lb	tp,64(s2)
    1e58:	0100                	addi	s0,sp,128
    1e5a:	0905                	addi	s2,s2,1
    1e5c:	04090203          	lb	tp,64(s2)
    1e60:	0100                	addi	s0,sp,128
    1e62:	0105                	addi	sp,sp,1
    1e64:	04090103          	lb	sp,64(s2)
    1e68:	0100                	addi	s0,sp,128
    1e6a:	1409                	addi	s0,s0,-30
    1e6c:	0000                	unimp
    1e6e:	0101                	addi	sp,sp,0
    1e70:	0052                	c.slli	zero,0x14
    1e72:	0000                	unimp
    1e74:	0005                	c.nop	1
    1e76:	0008                	0x8
    1e78:	002a                	c.slli	zero,0xa
    1e7a:	0000                	unimp
    1e7c:	0101                	addi	sp,sp,0
    1e7e:	fb01                	bnez	a4,1d8e <BASE_ADDR-0xffffffe0001fe272>
    1e80:	0d0e                	slli	s10,s10,0x3
    1e82:	0100                	addi	s0,sp,128
    1e84:	0101                	addi	sp,sp,0
    1e86:	0001                	nop
    1e88:	0000                	unimp
    1e8a:	0001                	nop
    1e8c:	0100                	addi	s0,sp,128
    1e8e:	0101                	addi	sp,sp,0
    1e90:	011f 0138 0000      	0x138011f
    1e96:	0102                	c.slli64	sp
    1e98:	021f 020f 0164      	0x164020f021f
    1e9e:	0000                	unimp
    1ea0:	6400                	ld	s0,8(s0)
    1ea2:	0001                	nop
    1ea4:	0000                	unimp
    1ea6:	0c05                	addi	s8,s8,1
    1ea8:	0900                	addi	s0,sp,144
    1eaa:	0402                	c.slli64	s0
    1eac:	2020                	fld	fs0,64(s0)
    1eae:	e000                	sd	s0,0(s0)
    1eb0:	ffff                	0xffff
    1eb2:	18ff                	0x18ff
    1eb4:	0b05                	addi	s6,s6,1
    1eb6:	0200                	addi	s0,sp,256
    1eb8:	0104                	addi	s1,sp,128
    1eba:	0c090103          	lb	sp,192(s2)
    1ebe:	0100                	addi	s0,sp,128
    1ec0:	0409                	addi	s0,s0,2
    1ec2:	0000                	unimp
    1ec4:	0101                	addi	sp,sp,0
    1ec6:	04de                	slli	s1,s1,0x17
    1ec8:	0000                	unimp
    1eca:	0005                	c.nop	1
    1ecc:	0008                	0x8
    1ece:	0041                	c.nop	16
    1ed0:	0000                	unimp
    1ed2:	0101                	addi	sp,sp,0
    1ed4:	fb01                	bnez	a4,1de4 <BASE_ADDR-0xffffffe0001fe21c>
    1ed6:	0d0e                	slli	s10,s10,0x3
    1ed8:	0100                	addi	s0,sp,128
    1eda:	0101                	addi	sp,sp,0
    1edc:	0001                	nop
    1ede:	0000                	unimp
    1ee0:	0001                	nop
    1ee2:	0100                	addi	s0,sp,128
    1ee4:	0101                	addi	sp,sp,0
    1ee6:	031f 016b 0000      	0x16b031f
    1eec:	006d                	c.nop	27
    1eee:	0000                	unimp
    1ef0:	003a                	c.slli	zero,0xe
    1ef2:	0000                	unimp
    1ef4:	0102                	c.slli64	sp
    1ef6:	021f 050f 018f      	0x18f050f021f
    1efc:	0000                	unimp
    1efe:	8f00                	0x8f00
    1f00:	0001                	nop
    1f02:	0000                	unimp
    1f04:	0198                	addi	a4,sp,192
    1f06:	0000                	unimp
    1f08:	9b01                	andi	a4,a4,-32
    1f0a:	0000                	unimp
    1f0c:	0100                	addi	s0,sp,128
    1f0e:	0095                	addi	ra,ra,5
    1f10:	0000                	unimp
    1f12:	0502                	c.slli64	a0
    1f14:	02090013          	addi	zero,s2,32
    1f18:	2014                	fld	fa3,0(s0)
    1f1a:	0020                	addi	s0,sp,8
    1f1c:	ffe0                	sd	s0,248(a5)
    1f1e:	ffff                	0xffff
    1f20:	0515                	addi	a0,a0,5
    1f22:	09010303          	lb	t1,144(sp)
    1f26:	0018                	0x18
    1f28:	0501                	addi	a0,a0,0
    1f2a:	0301                	addi	t1,t1,0
    1f2c:	0901                	addi	s2,s2,0
    1f2e:	0024                	addi	s1,sp,8
    1f30:	0901                	addi	s2,s2,0
    1f32:	0014                	0x14
    1f34:	0100                	addi	s0,sp,128
    1f36:	0501                	addi	a0,a0,0
    1f38:	02090047          	fmsub.d	ft0,fs2,ft0,ft0,rne
    1f3c:	2064                	fld	fs1,192(s0)
    1f3e:	0020                	addi	s0,sp,8
    1f40:	ffe0                	sd	s0,248(a5)
    1f42:	ffff                	0xffff
    1f44:	0519                	addi	a0,a0,6
    1f46:	0309                	addi	t1,t1,2
    1f48:	0901                	addi	s2,s2,0
    1f4a:	001c                	0x1c
    1f4c:	0501                	addi	a0,a0,0
    1f4e:	0318                	addi	a4,sp,384
    1f50:	0900                	addi	s0,sp,144
    1f52:	0004                	0x4
    1f54:	0501                	addi	a0,a0,0
    1f56:	030c                	addi	a1,sp,384
    1f58:	0901                	addi	s2,s2,0
    1f5a:	0004                	0x4
    1f5c:	0501                	addi	a0,a0,0
    1f5e:	0305                	addi	t1,t1,1
    1f60:	0901                	addi	s2,s2,0
    1f62:	0004                	0x4
    1f64:	0501                	addi	a0,a0,0
    1f66:	030c                	addi	a1,sp,384
    1f68:	0901                	addi	s2,s2,0
    1f6a:	0004                	0x4
    1f6c:	0501                	addi	a0,a0,0
    1f6e:	0314                	addi	a3,sp,384
    1f70:	0901                	addi	s2,s2,0
    1f72:	000c                	0xc
    1f74:	0501                	addi	a0,a0,0
    1f76:	030d                	addi	t1,t1,3
    1f78:	0900                	addi	s0,sp,144
    1f7a:	000c                	0xc
    1f7c:	0501                	addi	a0,a0,0
    1f7e:	031d                	addi	t1,t1,7
    1f80:	0902                	c.slli64	s2
    1f82:	0040                	addi	s0,sp,4
    1f84:	0501                	addi	a0,a0,0
    1f86:	0315                	addi	t1,t1,5
    1f88:	0901                	addi	s2,s2,0
    1f8a:	0008                	0x8
    1f8c:	0501                	addi	a0,a0,0
    1f8e:	0904033b          	add.uw	t1,s0,a6
    1f92:	0004                	0x4
    1f94:	0501                	addi	a0,a0,0
    1f96:	033d                	addi	t1,t1,15
    1f98:	0900                	addi	s0,sp,144
    1f9a:	0020                	addi	s0,sp,8
    1f9c:	0501                	addi	a0,a0,0
    1f9e:	001a                	c.slli	zero,0x6
    1fa0:	0402                	c.slli64	s0
    1fa2:	0304                	addi	s1,sp,384
    1fa4:	0900                	addi	s0,sp,144
    1fa6:	0010                	0x10
    1fa8:	0501                	addi	a0,a0,0
    1faa:	0019                	c.nop	6
    1fac:	0402                	c.slli64	s0
    1fae:	0304                	addi	s1,sp,384
    1fb0:	0902                	c.slli64	s2
    1fb2:	0004                	0x4
    1fb4:	0001                	nop
    1fb6:	0402                	c.slli64	s0
    1fb8:	0601                	addi	a2,a2,0
    1fba:	0c090003          	lb	zero,192(s2)
    1fbe:	0100                	addi	s0,sp,128
    1fc0:	0200                	addi	s0,sp,256
    1fc2:	0204                	addi	s1,sp,256
    1fc4:	08090003          	lb	zero,128(s2)
    1fc8:	0100                	addi	s0,sp,128
    1fca:	0200                	addi	s0,sp,256
    1fcc:	0404                	addi	s1,sp,512
    1fce:	04090003          	lb	zero,64(s2)
    1fd2:	0100                	addi	s0,sp,128
    1fd4:	1d05                	addi	s10,s10,-31
    1fd6:	0200                	addi	s0,sp,256
    1fd8:	0404                	addi	s1,sp,512
    1fda:	0306                	slli	t1,t1,0x1
    1fdc:	0901                	addi	s2,s2,0
    1fde:	0004                	0x4
    1fe0:	0501                	addi	a0,a0,0
    1fe2:	0015                	c.nop	5
    1fe4:	0402                	c.slli64	s0
    1fe6:	0304                	addi	s1,sp,384
    1fe8:	0900                	addi	s0,sp,144
    1fea:	0008                	0x8
    1fec:	0501                	addi	a0,a0,0
    1fee:	032d                	addi	t1,t1,11
    1ff0:	0901                	addi	s2,s2,0
    1ff2:	0004                	0x4
    1ff4:	0501                	addi	a0,a0,0
    1ff6:	0328                	addi	a0,sp,392
    1ff8:	0900                	addi	s0,sp,144
    1ffa:	000c                	0xc
    1ffc:	0501                	addi	a0,a0,0
    1ffe:	0339                	addi	t1,t1,14
    2000:	0900                	addi	s0,sp,144
    2002:	0008                	0x8
    2004:	0501                	addi	a0,a0,0
    2006:	031d                	addi	t1,t1,7
    2008:	0900                	addi	s0,sp,144
    200a:	0004                	0x4
    200c:	0501                	addi	a0,a0,0
    200e:	031e                	slli	t1,t1,0x7
    2010:	0901                	addi	s2,s2,0
    2012:	0008                	0x8
    2014:	0501                	addi	a0,a0,0
    2016:	0038                	addi	a4,sp,8
    2018:	0402                	c.slli64	s0
    201a:	0301                	addi	t1,t1,0
    201c:	0900                	addi	s0,sp,144
    201e:	0010                	0x10
    2020:	0501                	addi	a0,a0,0
    2022:	001e                	c.slli	zero,0x7
    2024:	0402                	c.slli64	s0
    2026:	0301                	addi	t1,t1,0
    2028:	0900                	addi	s0,sp,144
    202a:	0008                	0x8
    202c:	0501                	addi	a0,a0,0
    202e:	004a                	c.slli	zero,0x12
    2030:	0402                	c.slli64	s0
    2032:	0302                	c.slli64	t1
    2034:	0900                	addi	s0,sp,144
    2036:	000c                	0xc
    2038:	0501                	addi	a0,a0,0
    203a:	001e                	c.slli	zero,0x7
    203c:	0402                	c.slli64	s0
    203e:	0302                	c.slli64	t1
    2040:	0900                	addi	s0,sp,144
    2042:	0008                	0x8
    2044:	0001                	nop
    2046:	0402                	c.slli64	s0
    2048:	0604                	addi	s1,sp,768
    204a:	08090003          	lb	zero,128(s2)
    204e:	0100                	addi	s0,sp,128
    2050:	1905                	addi	s2,s2,-31
    2052:	0200                	addi	s0,sp,256
    2054:	0404                	addi	s1,sp,512
    2056:	0306                	slli	t1,t1,0x1
    2058:	0901                	addi	s2,s2,0
    205a:	0004                	0x4
    205c:	0501                	addi	a0,a0,0
    205e:	001c                	0x1c
    2060:	0402                	c.slli64	s0
    2062:	0304                	addi	s1,sp,384
    2064:	0901                	addi	s2,s2,0
    2066:	0010                	0x10
    2068:	0501                	addi	a0,a0,0
    206a:	004a                	c.slli	zero,0x12
    206c:	0402                	c.slli64	s0
    206e:	0304                	addi	s1,sp,384
    2070:	097c                	addi	a5,sp,156
    2072:	000c                	0xc
    2074:	0501                	addi	a0,a0,0
    2076:	003c                	addi	a5,sp,8
    2078:	0402                	c.slli64	s0
    207a:	0302                	c.slli64	t1
    207c:	0900                	addi	s0,sp,144
    207e:	000c                	0xc
    2080:	0501                	addi	a0,a0,0
    2082:	031d                	addi	t1,t1,7
    2084:	0906                	slli	s2,s2,0x1
    2086:	000c                	0xc
    2088:	0501                	addi	a0,a0,0
    208a:	032c                	addi	a1,sp,392
    208c:	0900                	addi	s0,sp,144
    208e:	0004                	0x4
    2090:	0501                	addi	a0,a0,0
    2092:	0315                	addi	t1,t1,5
    2094:	0901                	addi	s2,s2,0
    2096:	0004                	0x4
    2098:	0501                	addi	a0,a0,0
    209a:	0904033b          	add.uw	t1,s0,a6
    209e:	0004                	0x4
    20a0:	0501                	addi	a0,a0,0
    20a2:	033d                	addi	t1,t1,15
    20a4:	0900                	addi	s0,sp,144
    20a6:	0020                	addi	s0,sp,8
    20a8:	0501                	addi	a0,a0,0
    20aa:	001a                	c.slli	zero,0x6
    20ac:	0402                	c.slli64	s0
    20ae:	0304                	addi	s1,sp,384
    20b0:	0900                	addi	s0,sp,144
    20b2:	0010                	0x10
    20b4:	0501                	addi	a0,a0,0
    20b6:	0018                	0x18
    20b8:	0402                	c.slli64	s0
    20ba:	0304                	addi	s1,sp,384
    20bc:	0901                	addi	s2,s2,0
    20be:	0004                	0x4
    20c0:	0501                	addi	a0,a0,0
    20c2:	031d                	addi	t1,t1,7
    20c4:	0901                	addi	s2,s2,0
    20c6:	0008                	0x8
    20c8:	0501                	addi	a0,a0,0
    20ca:	0325                	addi	t1,t1,9
    20cc:	0900                	addi	s0,sp,144
    20ce:	000c                	0xc
    20d0:	0501                	addi	a0,a0,0
    20d2:	031c                	addi	a5,sp,384
    20d4:	0901                	addi	s2,s2,0
    20d6:	000c                	0xc
    20d8:	0501                	addi	a0,a0,0
    20da:	0319                	addi	t1,t1,6
    20dc:	0902                	c.slli64	s2
    20de:	000c                	0xc
    20e0:	0501                	addi	a0,a0,0
    20e2:	031a                	slli	t1,t1,0x6
    20e4:	0901                	addi	s2,s2,0
    20e6:	0004                	0x4
    20e8:	0501                	addi	a0,a0,0
    20ea:	031f 0901 0014      	0x140901031f
    20f0:	0501                	addi	a0,a0,0
    20f2:	0315                	addi	t1,t1,5
    20f4:	0900                	addi	s0,sp,144
    20f6:	0008                	0x8
    20f8:	0501                	addi	a0,a0,0
    20fa:	002e                	c.slli	zero,0xb
    20fc:	0402                	c.slli64	s0
    20fe:	09010303          	lb	t1,144(sp)
    2102:	0004                	0x4
    2104:	0501                	addi	a0,a0,0
    2106:	0034                	addi	a3,sp,8
    2108:	0402                	c.slli64	s0
    210a:	09000303          	lb	t1,144(zero) # 90 <BASE_ADDR-0xffffffe0001fff70>
    210e:	000c                	0xc
    2110:	0501                	addi	a0,a0,0
    2112:	04020027          	0x4020027
    2116:	09000303          	lb	t1,144(zero) # 90 <BASE_ADDR-0xffffffe0001fff70>
    211a:	000c                	0xc
    211c:	0501                	addi	a0,a0,0
    211e:	001d                	c.nop	7
    2120:	0402                	c.slli64	s0
    2122:	09010303          	lb	t1,144(sp)
    2126:	0010                	0x10
    2128:	0501                	addi	a0,a0,0
    212a:	04020033          	0x4020033
    212e:	097e0303          	lb	t1,151(t3) # 1a097 <BASE_ADDR-0xffffffe0001e5f69>
    2132:	0010                	0x10
    2134:	0501                	addi	a0,a0,0
    2136:	002a                	c.slli	zero,0xa
    2138:	0402                	c.slli64	s0
    213a:	0301                	addi	t1,t1,0
    213c:	0900                	addi	s0,sp,144
    213e:	000c                	0xc
    2140:	0501                	addi	a0,a0,0
    2142:	031e                	slli	t1,t1,0x7
    2144:	0905                	addi	s2,s2,1
    2146:	0008                	0x8
    2148:	0501                	addi	a0,a0,0
    214a:	0315                	addi	t1,t1,5
    214c:	0900                	addi	s0,sp,144
    214e:	0008                	0x8
    2150:	0501                	addi	a0,a0,0
    2152:	0019                	c.nop	6
    2154:	0402                	c.slli64	s0
    2156:	09010303          	lb	t1,144(sp)
    215a:	0004                	0x4
    215c:	0501                	addi	a0,a0,0
    215e:	0031                	c.nop	12
    2160:	0402                	c.slli64	s0
    2162:	097f0303          	lb	t1,151(t5)
    2166:	001c                	0x1c
    2168:	0501                	addi	a0,a0,0
    216a:	002a                	c.slli	zero,0xa
    216c:	0402                	c.slli64	s0
    216e:	0301                	addi	t1,t1,0
    2170:	0900                	addi	s0,sp,144
    2172:	000c                	0xc
    2174:	0501                	addi	a0,a0,0
    2176:	0321                	addi	t1,t1,8
    2178:	000c0903          	lb	s2,0(s8)
    217c:	0501                	addi	a0,a0,0
    217e:	0319                	addi	t1,t1,6
    2180:	0900                	addi	s0,sp,144
    2182:	0010                	0x10
    2184:	0501                	addi	a0,a0,0
    2186:	031d                	addi	t1,t1,7
    2188:	0901                	addi	s2,s2,0
    218a:	000c                	0xc
    218c:	0501                	addi	a0,a0,0
    218e:	032c                	addi	a1,sp,392
    2190:	0900                	addi	s0,sp,144
    2192:	0004                	0x4
    2194:	0501                	addi	a0,a0,0
    2196:	0315                	addi	t1,t1,5
    2198:	0901                	addi	s2,s2,0
    219a:	0004                	0x4
    219c:	0501                	addi	a0,a0,0
    219e:	0344                	addi	s1,sp,388
    21a0:	0904                	addi	s1,sp,144
    21a2:	0004                	0x4
    21a4:	0501                	addi	a0,a0,0
    21a6:	09000333          	0x9000333
    21aa:	000c                	0xc
    21ac:	0501                	addi	a0,a0,0
    21ae:	0346                	slli	t1,t1,0x11
    21b0:	0900                	addi	s0,sp,144
    21b2:	0014                	0x14
    21b4:	0501                	addi	a0,a0,0
    21b6:	04020023          	sb	zero,64(tp) # 40 <BASE_ADDR-0xffffffe0001fffc0>
    21ba:	0304                	addi	s1,sp,384
    21bc:	0900                	addi	s0,sp,144
    21be:	0010                	0x10
    21c0:	0501                	addi	a0,a0,0
    21c2:	0019                	c.nop	6
    21c4:	0402                	c.slli64	s0
    21c6:	0304                	addi	s1,sp,384
    21c8:	0901                	addi	s2,s2,0
    21ca:	0004                	0x4
    21cc:	0501                	addi	a0,a0,0
    21ce:	001a                	c.slli	zero,0x6
    21d0:	0402                	c.slli64	s0
    21d2:	0304                	addi	s1,sp,384
    21d4:	0901                	addi	s2,s2,0
    21d6:	0004                	0x4
    21d8:	0501                	addi	a0,a0,0
    21da:	001f 0402 0304      	0x3040402001f
    21e0:	0901                	addi	s2,s2,0
    21e2:	0014                	0x14
    21e4:	0501                	addi	a0,a0,0
    21e6:	0015                	c.nop	5
    21e8:	0402                	c.slli64	s0
    21ea:	0304                	addi	s1,sp,384
    21ec:	0900                	addi	s0,sp,144
    21ee:	0008                	0x8
    21f0:	0501                	addi	a0,a0,0
    21f2:	002e                	c.slli	zero,0xb
    21f4:	0402                	c.slli64	s0
    21f6:	09010303          	lb	t1,144(sp)
    21fa:	0004                	0x4
    21fc:	0501                	addi	a0,a0,0
    21fe:	0034                	addi	a3,sp,8
    2200:	0402                	c.slli64	s0
    2202:	09000303          	lb	t1,144(zero) # 90 <BASE_ADDR-0xffffffe0001fff70>
    2206:	000c                	0xc
    2208:	0501                	addi	a0,a0,0
    220a:	04020027          	0x4020027
    220e:	09000303          	lb	t1,144(zero) # 90 <BASE_ADDR-0xffffffe0001fff70>
    2212:	000c                	0xc
    2214:	0501                	addi	a0,a0,0
    2216:	001d                	c.nop	7
    2218:	0402                	c.slli64	s0
    221a:	09010303          	lb	t1,144(sp)
    221e:	0010                	0x10
    2220:	0501                	addi	a0,a0,0
    2222:	04020033          	0x4020033
    2226:	097e0303          	lb	t1,151(t3)
    222a:	0010                	0x10
    222c:	0501                	addi	a0,a0,0
    222e:	002a                	c.slli	zero,0xa
    2230:	0402                	c.slli64	s0
    2232:	0301                	addi	t1,t1,0
    2234:	0900                	addi	s0,sp,144
    2236:	000c                	0xc
    2238:	0501                	addi	a0,a0,0
    223a:	031e                	slli	t1,t1,0x7
    223c:	0905                	addi	s2,s2,1
    223e:	0008                	0x8
    2240:	0501                	addi	a0,a0,0
    2242:	0315                	addi	t1,t1,5
    2244:	0900                	addi	s0,sp,144
    2246:	0008                	0x8
    2248:	0501                	addi	a0,a0,0
    224a:	0019                	c.nop	6
    224c:	0402                	c.slli64	s0
    224e:	09010303          	lb	t1,144(sp)
    2252:	0004                	0x4
    2254:	0501                	addi	a0,a0,0
    2256:	0031                	c.nop	12
    2258:	0402                	c.slli64	s0
    225a:	097f0303          	lb	t1,151(t5)
    225e:	001c                	0x1c
    2260:	0501                	addi	a0,a0,0
    2262:	002a                	c.slli	zero,0xa
    2264:	0402                	c.slli64	s0
    2266:	0301                	addi	t1,t1,0
    2268:	0900                	addi	s0,sp,144
    226a:	000c                	0xc
    226c:	0501                	addi	a0,a0,0
    226e:	0321                	addi	t1,t1,8
    2270:	000c0903          	lb	s2,0(s8)
    2274:	0501                	addi	a0,a0,0
    2276:	0319                	addi	t1,t1,6
    2278:	0900                	addi	s0,sp,144
    227a:	0010                	0x10
    227c:	0501                	addi	a0,a0,0
    227e:	031d                	addi	t1,t1,7
    2280:	0901                	addi	s2,s2,0
    2282:	000c                	0xc
    2284:	0501                	addi	a0,a0,0
    2286:	032c                	addi	a1,sp,392
    2288:	0900                	addi	s0,sp,144
    228a:	0004                	0x4
    228c:	0501                	addi	a0,a0,0
    228e:	0315                	addi	t1,t1,5
    2290:	0901                	addi	s2,s2,0
    2292:	0004                	0x4
    2294:	0501                	addi	a0,a0,0
    2296:	0321                	addi	t1,t1,8
    2298:	0904                	addi	s1,sp,144
    229a:	0004                	0x4
    229c:	0501                	addi	a0,a0,0
    229e:	0901031b          	addiw	t1,sp,144
    22a2:	0014                	0x14
    22a4:	0501                	addi	a0,a0,0
    22a6:	0319                	addi	t1,t1,6
    22a8:	0901                	addi	s2,s2,0
    22aa:	0004                	0x4
    22ac:	0501                	addi	a0,a0,0
    22ae:	031c                	addi	a5,sp,384
    22b0:	0901                	addi	s2,s2,0
    22b2:	0014                	0x14
    22b4:	0301                	addi	t1,t1,0
    22b6:	0901                	addi	s2,s2,0
    22b8:	000c                	0xc
    22ba:	0301                	addi	t1,t1,0
    22bc:	097d                	addi	s2,s2,31
    22be:	000c                	0xc
    22c0:	0501                	addi	a0,a0,0
    22c2:	031d                	addi	t1,t1,7
    22c4:	0905                	addi	s2,s2,1
    22c6:	000c                	0xc
    22c8:	0501                	addi	a0,a0,0
    22ca:	032c                	addi	a1,sp,392
    22cc:	0900                	addi	s0,sp,144
    22ce:	0004                	0x4
    22d0:	0501                	addi	a0,a0,0
    22d2:	0315                	addi	t1,t1,5
    22d4:	0901                	addi	s2,s2,0
    22d6:	0004                	0x4
    22d8:	0501                	addi	a0,a0,0
    22da:	0325                	addi	t1,t1,9
    22dc:	0904                	addi	s1,sp,144
    22de:	0004                	0x4
    22e0:	0501                	addi	a0,a0,0
    22e2:	031a                	slli	t1,t1,0x6
    22e4:	0900                	addi	s0,sp,144
    22e6:	0010                	0x10
    22e8:	0501                	addi	a0,a0,0
    22ea:	0315                	addi	t1,t1,5
    22ec:	0901                	addi	s2,s2,0
    22ee:	0004                	0x4
    22f0:	0501                	addi	a0,a0,0
    22f2:	0318                	addi	a4,sp,384
    22f4:	0901                	addi	s2,s2,0
    22f6:	0010                	0x10
    22f8:	0501                	addi	a0,a0,0
    22fa:	031d                	addi	t1,t1,7
    22fc:	0901                	addi	s2,s2,0
    22fe:	000c                	0xc
    2300:	0501                	addi	a0,a0,0
    2302:	032c                	addi	a1,sp,392
    2304:	0900                	addi	s0,sp,144
    2306:	0004                	0x4
    2308:	0501                	addi	a0,a0,0
    230a:	0315                	addi	t1,t1,5
    230c:	0901                	addi	s2,s2,0
    230e:	0004                	0x4
    2310:	0501                	addi	a0,a0,0
    2312:	0311                	addi	t1,t1,4
    2314:	0906                	slli	s2,s2,0x1
    2316:	0004                	0x4
    2318:	0501                	addi	a0,a0,0
    231a:	0310                	addi	a2,sp,384
    231c:	0900                	addi	s0,sp,144
    231e:	0008                	0x8
    2320:	0501                	addi	a0,a0,0
    2322:	0315                	addi	t1,t1,5
    2324:	0901                	addi	s2,s2,0
    2326:	000c                	0xc
    2328:	0501                	addi	a0,a0,0
    232a:	030d                	addi	t1,t1,3
    232c:	000c0903          	lb	s2,0(s8)
    2330:	0501                	addi	a0,a0,0
    2332:	0310                	addi	a2,sp,384
    2334:	0901                	addi	s2,s2,0
    2336:	0014                	0x14
    2338:	0501                	addi	a0,a0,0
    233a:	0315                	addi	t1,t1,5
    233c:	0978                	addi	a4,sp,156
    233e:	0010                	0x10
    2340:	0301                	addi	t1,t1,0
    2342:	7fb1                	lui	t6,0xfffec
    2344:	0409                	addi	s0,s0,2
    2346:	0100                	addi	s0,sp,128
    2348:	0c05                	addi	s8,s8,1
    234a:	0200                	addi	s0,sp,256
    234c:	0104                	addi	s1,sp,128
    234e:	0c090003          	lb	zero,192(s2)
    2352:	0100                	addi	s0,sp,128
    2354:	0900da03          	lhu	s4,144(ra)
    2358:	000c                	0xc
    235a:	0501                	addi	a0,a0,0
    235c:	0301                	addi	t1,t1,0
    235e:	0901                	addi	s2,s2,0
    2360:	0008                	0x8
    2362:	0901                	addi	s2,s2,0
    2364:	0014                	0x14
    2366:	0100                	addi	s0,sp,128
    2368:	0501                	addi	a0,a0,0
    236a:	0020                	addi	s0,sp,8
    236c:	0209                	addi	tp,tp,2
    236e:	2540                	fld	fs0,136(a0)
    2370:	0020                	addi	s0,sp,8
    2372:	ffe0                	sd	s0,248(a5)
    2374:	ffff                	0xffff
    2376:	0100e903          	lwu	s2,16(ra)
    237a:	0905                	addi	s2,s2,1
    237c:	30090103          	lb	sp,768(s2)
    2380:	0100                	addi	s0,sp,128
    2382:	0505                	addi	a0,a0,1
    2384:	04090203          	lb	tp,64(s2)
    2388:	0100                	addi	s0,sp,128
    238a:	0b05                	addi	s6,s6,1
    238c:	14090103          	lb	sp,320(s2)
    2390:	0100                	addi	s0,sp,128
    2392:	0c05                	addi	s8,s8,1
    2394:	20090203          	lb	tp,512(s2)
    2398:	0100                	addi	s0,sp,128
    239a:	0105                	addi	sp,sp,1
    239c:	04090103          	lb	sp,64(s2)
    23a0:	0100                	addi	s0,sp,128
    23a2:	1409                	addi	s0,s0,-30
    23a4:	0000                	unimp
    23a6:	0101                	addi	sp,sp,0
    23a8:	023d                	addi	tp,tp,15
    23aa:	0000                	unimp
    23ac:	0005                	c.nop	1
    23ae:	0008                	0x8
    23b0:	00000033          	add	zero,zero,zero
    23b4:	0101                	addi	sp,sp,0
    23b6:	fb01                	bnez	a4,22c6 <BASE_ADDR-0xffffffe0001fdd3a>
    23b8:	0d0e                	slli	s10,s10,0x3
    23ba:	0100                	addi	s0,sp,128
    23bc:	0101                	addi	sp,sp,0
    23be:	0001                	nop
    23c0:	0000                	unimp
    23c2:	0001                	nop
    23c4:	0100                	addi	s0,sp,128
    23c6:	0101                	addi	sp,sp,0
    23c8:	021f 016b 0000      	0x16b021f
    23ce:	006d                	c.nop	27
    23d0:	0000                	unimp
    23d2:	0102                	c.slli64	sp
    23d4:	021f 030f 01a1      	0x1a1030f021f
    23da:	0000                	unimp
    23dc:	a100                	fsd	fs0,0(a0)
    23de:	0001                	nop
    23e0:	0000                	unimp
    23e2:	0000009b          	sext.w	ra,zero
    23e6:	0501                	addi	a0,a0,0
    23e8:	0209000f          	0x209000f
    23ec:	25c0                	fld	fs0,136(a1)
    23ee:	0020                	addi	s0,sp,8
    23f0:	ffe0                	sd	s0,248(a5)
    23f2:	ffff                	0xffff
    23f4:	0518                	addi	a4,sp,640
    23f6:	0314                	addi	a3,sp,384
    23f8:	000c0903          	lb	s2,0(s8)
    23fc:	0501                	addi	a0,a0,0
    23fe:	0308                	addi	a0,sp,384
    2400:	0900                	addi	s0,sp,144
    2402:	000c                	0xc
    2404:	0501                	addi	a0,a0,0
    2406:	030e                	slli	t1,t1,0x3
    2408:	0901                	addi	s2,s2,0
    240a:	0004                	0x4
    240c:	0501                	addi	a0,a0,0
    240e:	0310                	addi	a2,sp,384
    2410:	0901                	addi	s2,s2,0
    2412:	0010                	0x10
    2414:	0501                	addi	a0,a0,0
    2416:	0309                	addi	t1,t1,2
    2418:	0900                	addi	s0,sp,144
    241a:	0008                	0x8
    241c:	0501                	addi	a0,a0,0
    241e:	09010323          	sb	a6,134(sp)
    2422:	0004                	0x4
    2424:	0501                	addi	a0,a0,0
    2426:	0320                	addi	s0,sp,392
    2428:	0900                	addi	s0,sp,144
    242a:	000c                	0xc
    242c:	0501                	addi	a0,a0,0
    242e:	031d                	addi	t1,t1,7
    2430:	0900                	addi	s0,sp,144
    2432:	0018                	0x18
    2434:	0501                	addi	a0,a0,0
    2436:	0329                	addi	t1,t1,10
    2438:	0900                	addi	s0,sp,144
    243a:	000c                	0xc
    243c:	0501                	addi	a0,a0,0
    243e:	0312                	slli	t1,t1,0x4
    2440:	0900                	addi	s0,sp,144
    2442:	000c                	0xc
    2444:	0301                	addi	t1,t1,0
    2446:	0901                	addi	s2,s2,0
    2448:	001c                	0x1c
    244a:	0501                	addi	a0,a0,0
    244c:	0310                	addi	a2,sp,384
    244e:	0900                	addi	s0,sp,144
    2450:	0018                	0x18
    2452:	0501                	addi	a0,a0,0
    2454:	0316                	slli	t1,t1,0x5
    2456:	0901                	addi	s2,s2,0
    2458:	0004                	0x4
    245a:	0501                	addi	a0,a0,0
    245c:	001e                	c.slli	zero,0x7
    245e:	0402                	c.slli64	s0
    2460:	0302                	c.slli64	t1
    2462:	097d                	addi	s2,s2,31
    2464:	0040                	addi	s0,sp,4
    2466:	0501                	addi	a0,a0,0
    2468:	04020017          	auipc	zero,0x4020
    246c:	0301                	addi	t1,t1,0
    246e:	0900                	addi	s0,sp,144
    2470:	000c                	0xc
    2472:	0501                	addi	a0,a0,0
    2474:	0310                	addi	a2,sp,384
    2476:	0906                	slli	s2,s2,0x1
    2478:	0010                	0x10
    247a:	0501                	addi	a0,a0,0
    247c:	0309                	addi	t1,t1,2
    247e:	0900                	addi	s0,sp,144
    2480:	0008                	0x8
    2482:	0501                	addi	a0,a0,0
    2484:	0018                	0x18
    2486:	0402                	c.slli64	s0
    2488:	09010303          	lb	t1,144(sp)
    248c:	0004                	0x4
    248e:	0501                	addi	a0,a0,0
    2490:	0015                	c.nop	5
    2492:	0402                	c.slli64	s0
    2494:	09000303          	lb	t1,144(zero) # 90 <BASE_ADDR-0xffffffe0001fff70>
    2498:	000c                	0xc
    249a:	0501                	addi	a0,a0,0
    249c:	0012                	c.slli	zero,0x4
    249e:	0402                	c.slli64	s0
    24a0:	09000303          	lb	t1,144(zero) # 90 <BASE_ADDR-0xffffffe0001fff70>
    24a4:	0014                	0x14
    24a6:	0501                	addi	a0,a0,0
    24a8:	001f 0402 0303      	0x3030402001f
    24ae:	097f                	0x97f
    24b0:	0018                	0x18
    24b2:	0501                	addi	a0,a0,0
    24b4:	0018                	0x18
    24b6:	0402                	c.slli64	s0
    24b8:	0301                	addi	t1,t1,0
    24ba:	0900                	addi	s0,sp,144
    24bc:	000c                	0xc
    24be:	0501                	addi	a0,a0,0
    24c0:	0310                	addi	a2,sp,384
    24c2:	00100903          	lb	s2,1(zero) # 1 <BASE_ADDR-0xffffffe0001fffff>
    24c6:	0501                	addi	a0,a0,0
    24c8:	0309                	addi	t1,t1,2
    24ca:	0900                	addi	s0,sp,144
    24cc:	0008                	0x8
    24ce:	0501                	addi	a0,a0,0
    24d0:	0018                	0x18
    24d2:	0402                	c.slli64	s0
    24d4:	09010303          	lb	t1,144(sp)
    24d8:	0004                	0x4
    24da:	0501                	addi	a0,a0,0
    24dc:	0015                	c.nop	5
    24de:	0402                	c.slli64	s0
    24e0:	09000303          	lb	t1,144(zero) # 90 <BASE_ADDR-0xffffffe0001fff70>
    24e4:	000c                	0xc
    24e6:	0501                	addi	a0,a0,0
    24e8:	0024                	addi	s1,sp,8
    24ea:	0402                	c.slli64	s0
    24ec:	09000303          	lb	t1,144(zero) # 90 <BASE_ADDR-0xffffffe0001fff70>
    24f0:	0014                	0x14
    24f2:	0501                	addi	a0,a0,0
    24f4:	0021                	c.nop	8
    24f6:	0402                	c.slli64	s0
    24f8:	09000303          	lb	t1,144(zero) # 90 <BASE_ADDR-0xffffffe0001fff70>
    24fc:	000c                	0xc
    24fe:	0501                	addi	a0,a0,0
    2500:	001e                	c.slli	zero,0x7
    2502:	0402                	c.slli64	s0
    2504:	09000303          	lb	t1,144(zero) # 90 <BASE_ADDR-0xffffffe0001fff70>
    2508:	0014                	0x14
    250a:	0501                	addi	a0,a0,0
    250c:	0012                	c.slli	zero,0x4
    250e:	0402                	c.slli64	s0
    2510:	09000303          	lb	t1,144(zero) # 90 <BASE_ADDR-0xffffffe0001fff70>
    2514:	0008                	0x8
    2516:	0501                	addi	a0,a0,0
    2518:	0020                	addi	s0,sp,8
    251a:	0402                	c.slli64	s0
    251c:	097f0303          	lb	t1,151(t5)
    2520:	0018                	0x18
    2522:	0501                	addi	a0,a0,0
    2524:	0018                	0x18
    2526:	0402                	c.slli64	s0
    2528:	0301                	addi	t1,t1,0
    252a:	0900                	addi	s0,sp,144
    252c:	000c                	0xc
    252e:	0501                	addi	a0,a0,0
    2530:	030e                	slli	t1,t1,0x3
    2532:	0904                	addi	s1,sp,144
    2534:	0010                	0x10
    2536:	0501                	addi	a0,a0,0
    2538:	0308                	addi	a0,sp,384
    253a:	00100903          	lb	s2,1(zero) # 1 <BASE_ADDR-0xffffffe0001fffff>
    253e:	0501                	addi	a0,a0,0
    2540:	0304                	addi	s1,sp,384
    2542:	0900                	addi	s0,sp,144
    2544:	001c                	0x1c
    2546:	0501                	addi	a0,a0,0
    2548:	031c                	addi	a5,sp,384
    254a:	0902                	c.slli64	s2
    254c:	000c                	0xc
    254e:	0501                	addi	a0,a0,0
    2550:	09000313          	li	t1,144
    2554:	0014                	0x14
    2556:	0501                	addi	a0,a0,0
    2558:	032e                	slli	t1,t1,0xb
    255a:	0900                	addi	s0,sp,144
    255c:	0014                	0x14
    255e:	0501                	addi	a0,a0,0
    2560:	0325                	addi	t1,t1,9
    2562:	0900                	addi	s0,sp,144
    2564:	0014                	0x14
    2566:	0501                	addi	a0,a0,0
    2568:	0309                	addi	t1,t1,2
    256a:	0900                	addi	s0,sp,144
    256c:	0014                	0x14
    256e:	0501                	addi	a0,a0,0
    2570:	0322                	slli	t1,t1,0x8
    2572:	0900                	addi	s0,sp,144
    2574:	0014                	0x14
    2576:	0501                	addi	a0,a0,0
    2578:	0310                	addi	a2,sp,384
    257a:	0900                	addi	s0,sp,144
    257c:	0008                	0x8
    257e:	0501                	addi	a0,a0,0
    2580:	09020303          	lb	t1,144(tp) # 90 <BASE_ADDR-0xffffffe0001fff70>
    2584:	0014                	0x14
    2586:	0501                	addi	a0,a0,0
    2588:	031c                	addi	a5,sp,384
    258a:	0902                	c.slli64	s2
    258c:	0020                	addi	s0,sp,8
    258e:	0501                	addi	a0,a0,0
    2590:	0315                	addi	t1,t1,5
    2592:	0900                	addi	s0,sp,144
    2594:	0014                	0x14
    2596:	0501                	addi	a0,a0,0
    2598:	0301                	addi	t1,t1,0
    259a:	0901                	addi	s2,s2,0
    259c:	0014                	0x14
    259e:	0901                	addi	s2,s2,0
    25a0:	0010                	0x10
    25a2:	0100                	addi	s0,sp,128
    25a4:	0501                	addi	a0,a0,0
    25a6:	02090027          	0x2090027
    25aa:	28c0                	fld	fs0,144(s1)
    25ac:	0020                	addi	s0,sp,8
    25ae:	ffe0                	sd	s0,248(a5)
    25b0:	ffff                	0xffff
    25b2:	05012403          	lw	s0,80(sp)
    25b6:	0314                	addi	a3,sp,384
    25b8:	0901                	addi	s2,s2,0
    25ba:	0018                	0x18
    25bc:	0501                	addi	a0,a0,0
    25be:	030c                	addi	a1,sp,384
    25c0:	0900                	addi	s0,sp,144
    25c2:	000c                	0xc
    25c4:	0301                	addi	t1,t1,0
    25c6:	0901                	addi	s2,s2,0
    25c8:	0008                	0x8
    25ca:	0501                	addi	a0,a0,0
    25cc:	09000313          	li	t1,144
    25d0:	0008                	0x8
    25d2:	0501                	addi	a0,a0,0
    25d4:	0319                	addi	t1,t1,6
    25d6:	0900                	addi	s0,sp,144
    25d8:	0008                	0x8
    25da:	0501                	addi	a0,a0,0
    25dc:	0301                	addi	t1,t1,0
    25de:	0901                	addi	s2,s2,0
    25e0:	0008                	0x8
    25e2:	0901                	addi	s2,s2,0
    25e4:	0014                	0x14
    25e6:	0100                	addi	s0,sp,128
    25e8:	1301                	addi	t1,t1,-32
    25ea:	0001                	nop
    25ec:	0500                	addi	s0,sp,640
    25ee:	0800                	addi	s0,sp,16
    25f0:	3300                	fld	fs0,32(a4)
    25f2:	0000                	unimp
    25f4:	0100                	addi	s0,sp,128
    25f6:	0101                	addi	sp,sp,0
    25f8:	000d0efb          	0xd0efb
    25fc:	0101                	addi	sp,sp,0
    25fe:	0101                	addi	sp,sp,0
    2600:	0000                	unimp
    2602:	0100                	addi	s0,sp,128
    2604:	0000                	unimp
    2606:	0101                	addi	sp,sp,0
    2608:	1f01                	addi	t5,t5,-32
    260a:	6b02                	ld	s6,0(sp)
    260c:	0001                	nop
    260e:	6d00                	ld	s0,24(a0)
    2610:	0000                	unimp
    2612:	0200                	addi	s0,sp,256
    2614:	1f01                	addi	t5,t5,-32
    2616:	0f02                	c.slli64	t5
    2618:	0001a803          	lw	a6,0(gp)
    261c:	0000                	unimp
    261e:	01a8                	addi	a0,sp,200
    2620:	0000                	unimp
    2622:	9b00                	0x9b00
    2624:	0000                	unimp
    2626:	0100                	addi	s0,sp,128
    2628:	2b05                	addiw	s6,s6,1
    262a:	0900                	addi	s0,sp,144
    262c:	1802                	slli	a6,a6,0x20
    262e:	2029                	0x2029
    2630:	e000                	sd	s0,0(s0)
    2632:	ffff                	0xffff
    2634:	15ff                	0x15ff
    2636:	0b05                	addi	s6,s6,1
    2638:	1c090103          	lb	sp,448(s2)
    263c:	0100                	addi	s0,sp,128
    263e:	1105                	addi	sp,sp,-31
    2640:	08090103          	lb	sp,128(s2)
    2644:	0100                	addi	s0,sp,128
    2646:	0505                	addi	a0,a0,1
    2648:	04090003          	lb	zero,64(s2)
    264c:	0100                	addi	s0,sp,128
    264e:	0d05                	addi	s10,s10,1
    2650:	0200                	addi	s0,sp,256
    2652:	0304                	addi	s1,sp,384
    2654:	04090103          	lb	sp,64(s2)
    2658:	0100                	addi	s0,sp,128
    265a:	1105                	addi	sp,sp,-31
    265c:	0200                	addi	s0,sp,256
    265e:	0304                	addi	s1,sp,384
    2660:	0c090003          	lb	zero,192(s2)
    2664:	0100                	addi	s0,sp,128
    2666:	1f05                	addi	t5,t5,-31
    2668:	0200                	addi	s0,sp,256
    266a:	0304                	addi	s1,sp,384
    266c:	08097f03          	0x8097f03
    2670:	0100                	addi	s0,sp,128
    2672:	1a05                	addi	s4,s4,-31
    2674:	0200                	addi	s0,sp,256
    2676:	0104                	addi	s1,sp,128
    2678:	0c090003          	lb	zero,192(s2)
    267c:	0100                	addi	s0,sp,128
    267e:	0c05                	addi	s8,s8,1
    2680:	0c090303          	lb	t1,192(s2)
    2684:	0100                	addi	s0,sp,128
    2686:	0105                	addi	sp,sp,1
    2688:	04090103          	lb	sp,64(s2)
    268c:	0100                	addi	s0,sp,128
    268e:	1009                	c.nop	-30
    2690:	0000                	unimp
    2692:	0101                	addi	sp,sp,0
    2694:	3405                	addiw	s0,s0,-31
    2696:	0900                	addi	s0,sp,144
    2698:	8402                	jr	s0
    269a:	2029                	0x2029
    269c:	e000                	sd	s0,0(s0)
    269e:	ffff                	0xffff
    26a0:	03ff                	0x3ff
    26a2:	0b05010b          	0xb05010b
    26a6:	18090103          	lb	sp,384(s2)
    26aa:	0100                	addi	s0,sp,128
    26ac:	1105                	addi	sp,sp,-31
    26ae:	08090103          	lb	sp,128(s2)
    26b2:	0100                	addi	s0,sp,128
    26b4:	0b05                	addi	s6,s6,1
    26b6:	08090203          	lb	tp,128(s2)
    26ba:	0100                	addi	s0,sp,128
    26bc:	1105                	addi	sp,sp,-31
    26be:	04090103          	lb	sp,64(s2)
    26c2:	0100                	addi	s0,sp,128
    26c4:	0f05                	addi	t5,t5,1
    26c6:	08090003          	lb	zero,128(s2)
    26ca:	0100                	addi	s0,sp,128
    26cc:	0905                	addi	s2,s2,1
    26ce:	08090103          	lb	sp,128(s2)
    26d2:	0100                	addi	s0,sp,128
    26d4:	1105                	addi	sp,sp,-31
    26d6:	0c090003          	lb	zero,192(s2)
    26da:	0100                	addi	s0,sp,128
    26dc:	0d05                	addi	s10,s10,1
    26de:	0c097e03          	0xc097e03
    26e2:	0100                	addi	s0,sp,128
    26e4:	0c05                	addi	s8,s8,1
    26e6:	0c090003          	lb	zero,192(s2)
    26ea:	0100                	addi	s0,sp,128
    26ec:	04090503          	lb	a0,64(s2)
    26f0:	0100                	addi	s0,sp,128
    26f2:	0105                	addi	sp,sp,1
    26f4:	04090103          	lb	sp,64(s2)
    26f8:	0100                	addi	s0,sp,128
    26fa:	1009                	c.nop	-30
    26fc:	0000                	unimp
    26fe:	0101                	addi	sp,sp,0

Disassembly of section .debug_str:

0000000000000000 <.debug_str>:
   0:	6f6c                	ld	a1,216(a4)
   2:	676e                	ld	a4,216(sp)
   4:	7520                	ld	s0,104(a0)
   6:	736e                	ld	t1,248(sp)
   8:	6769                	lui	a4,0x1a
   a:	656e                	ld	a0,216(sp)
   c:	2064                	fld	fs1,192(s0)
   e:	6e69                	lui	t3,0x1a
  10:	0074                	addi	a3,sp,12
  12:	6f6c                	ld	a1,216(a4)
  14:	676e                	ld	a4,216(sp)
  16:	6920                	ld	s0,80(a0)
  18:	746e                	ld	s0,248(sp)
  1a:	7300                	ld	s0,32(a4)
  1c:	6962                	ld	s2,24(sp)
  1e:	655f 6163 6c6c      	0x6c6c6163655f
  24:	4700                	lw	s0,8(a4)
  26:	554e                	lw	a0,240(sp)
  28:	4320                	lw	s0,64(a4)
  2a:	3731                	addiw	a4,a4,-20
  2c:	3120                	fld	fs0,96(a0)
  2e:	2e31                	addiw	t3,t3,12
  30:	2e31                	addiw	t3,t3,12
  32:	2030                	fld	fa2,64(s0)
  34:	6d2d                	lui	s10,0xb
  36:	7261                	lui	tp,0xffff8
  38:	723d6863          	bltu	s10,gp,768 <BASE_ADDR-0xffffffe0001ff898>
  3c:	3676                	fld	fa2,376(sp)
  3e:	6934                	ld	a3,80(a0)
  40:	616d                	addi	sp,sp,240
  42:	6466                	ld	s0,88(sp)
  44:	2d20                	fld	fs0,88(a0)
  46:	616d                	addi	sp,sp,240
  48:	6962                	ld	s2,24(sp)
  4a:	6c3d                	lui	s8,0xf
  4c:	3670                	fld	fa2,232(a2)
  4e:	2034                	fld	fa3,64(s0)
  50:	6d2d                	lui	s10,0xb
  52:	646f6d63          	bltu	t5,t1,6ac <BASE_ADDR-0xffffffe0001ff954>
  56:	6c65                	lui	s8,0x19
  58:	6d3d                	lui	s10,0xf
  5a:	6465                	lui	s0,0x19
  5c:	6e61                	lui	t3,0x18
  5e:	2079                	0x2079
  60:	6d2d                	lui	s10,0xb
  62:	7574                	ld	a3,232(a0)
  64:	656e                	ld	a0,216(sp)
  66:	723d                	lui	tp,0xfffef
  68:	656b636f          	jal	t1,b66be <BASE_ADDR-0xffffffe000149942>
  6c:	2074                	fld	fa3,192(s0)
  6e:	6d2d                	lui	s10,0xb
  70:	7261                	lui	tp,0xffff8
  72:	723d6863          	bltu	s10,gp,7a2 <BASE_ADDR-0xffffffe0001ff85e>
  76:	3676                	fld	fa2,376(sp)
  78:	6934                	ld	a3,80(a0)
  7a:	616d                	addi	sp,sp,240
  7c:	6466                	ld	s0,88(sp)
  7e:	2d20                	fld	fs0,88(a0)
  80:	662d2067          	0x662d2067
  84:	6f6e                	ld	t5,216(sp)
  86:	622d                	lui	tp,0xb
  88:	6975                	lui	s2,0x1d
  8a:	746c                	ld	a1,232(s0)
  8c:	6e69                	lui	t3,0x1a
  8e:	2d20                	fld	fs0,88(a0)
  90:	6666                	ld	a2,88(sp)
  92:	6e75                	lui	t3,0x1d
  94:	6f697463          	bgeu	s2,s6,77c <BASE_ADDR-0xffffffe0001ff884>
  98:	2d6e                	fld	fs10,216(sp)
  9a:	74636573          	csrrsi	a0,0x746,6
  9e:	6f69                	lui	t5,0x1a
  a0:	736e                	ld	t1,248(sp)
  a2:	2d20                	fld	fs0,88(a0)
  a4:	6466                	ld	s0,88(sp)
  a6:	7461                	lui	s0,0xffff8
  a8:	2d61                	addiw	s10,s10,24
  aa:	74636573          	csrrsi	a0,0x746,6
  ae:	6f69                	lui	t5,0x1a
  b0:	736e                	ld	t1,248(sp)
  b2:	7600                	ld	s0,40(a2)
  b4:	6c61                	lui	s8,0x18
  b6:	6575                	lui	a0,0x1d
  b8:	7500                	ld	s0,40(a0)
  ba:	6e69                	lui	t3,0x1a
  bc:	3674                	fld	fa3,232(a2)
  be:	0034                	addi	a3,sp,8
  c0:	7265                	lui	tp,0xffff9
  c2:	6f72                	ld	t5,280(sp)
  c4:	0072                	c.slli	zero,0x1c
  c6:	5f746567          	0x5f746567
  ca:	6974                	ld	a3,208(a0)
  cc:	656d                	lui	a0,0x1b
  ce:	0072                	c.slli	zero,0x1c
  d0:	4954                	lw	a3,20(a0)
  d2:	454d                	li	a0,19
  d4:	434f4c43          	fmadd.d	fs8,ft10,fs4,fs0,rmm
  d8:	6c63004b          	0x6c63004b
  dc:	5f6b636f          	jal	t1,b66d2 <BASE_ADDR-0xffffffe00014992e>
  e0:	5f746573          	csrrsi	a0,0x5f7,8
  e4:	656e                	ld	a0,216(sp)
  e6:	7478                	ld	a4,232(s0)
  e8:	655f 6576 746e      	0x746e6576655f
  ee:	7300                	ld	s0,32(a4)
  f0:	6962                	ld	s2,24(sp)
  f2:	6572                	ld	a0,280(sp)
  f4:	0074                	addi	a3,sp,12
  f6:	6e65                	lui	t3,0x19
  f8:	7274                	ld	a3,224(a2)
  fa:	2e79                	addiw	t3,t3,30
  fc:	722f0053          	0x722f0053
 100:	2f746f6f          	jal	t5,46bf6 <BASE_ADDR-0xffffffe0001b940a>
 104:	33737973          	csrrci	s2,mhpmevent23,6
 108:	616c                	ld	a1,192(a0)
 10a:	2d62                	fld	fs10,24(sp)
 10c:	3032                	fld	ft0,296(sp)
 10e:	3232                	fld	ft4,296(sp)
 110:	732d                	lui	t1,0xfffeb
 112:	7574                	ld	a3,232(a0)
 114:	6372732f          	0x6372732f
 118:	62616c2f          	0x62616c2f
 11c:	2f35                	addiw	t5,t5,13
 11e:	7261                	lui	tp,0xffff8
 120:	722f6863          	bltu	t5,sp,850 <BASE_ADDR-0xffffffe0001ff7b0>
 124:	7369                	lui	t1,0xffffa
 126:	6b2f7663          	bgeu	t5,s2,7d2 <BASE_ADDR-0xffffffe0001ff82e>
 12a:	7265                	lui	tp,0xffff9
 12c:	656e                	ld	a0,216(sp)
 12e:	006c                	addi	a1,sp,12
 130:	20554e47          	fmsub.s	ft8,fa0,ft5,ft4,rmm
 134:	5341                	li	t1,-16
 136:	3220                	fld	fs0,96(a2)
 138:	332e                	fld	ft6,232(sp)
 13a:	65680037          	lui	zero,0x65680
 13e:	6461                	lui	s0,0x18
 140:	532e                	lw	t1,232(sp)
 142:	6b00                	ld	s0,16(a4)
 144:	6c61                	lui	s8,0x18
 146:	6f6c                	ld	a1,216(a4)
 148:	6d6b0063          	beq	s6,s6,808 <BASE_ADDR-0xffffffe0001ff7f8>
 14c:	6d65                	lui	s10,0x19
 14e:	5f00                	lw	s0,56(a4)
 150:	6b65                	lui	s6,0x19
 152:	7265                	lui	tp,0xffff9
 154:	656e                	ld	a0,216(sp)
 156:	006c                	addi	a1,sp,12
 158:	6461                	lui	s0,0x18
 15a:	7264                	ld	s1,224(a2)
 15c:	6b00                	ld	s0,16(a4)
 15e:	7266                	ld	tp,120(sp)
 160:	6565                	lui	a0,0x19
 162:	6172                	ld	sp,280(sp)
 164:	676e                	ld	a4,216(sp)
 166:	0065                	c.nop	25
 168:	7266                	ld	tp,120(sp)
 16a:	6565                	lui	a0,0x19
 16c:	696c                	ld	a1,208(a0)
 16e:	6b007473          	csrrci	s0,0x6b0,0
 172:	7266                	ld	tp,120(sp)
 174:	6565                	lui	a0,0x19
 176:	6d00                	ld	s0,24(a0)
 178:	5f6d                	li	t5,-5
 17a:	6e69                	lui	t3,0x1a
 17c:	7469                	lui	s0,0xffffa
 17e:	7000                	ld	s0,32(s0)
 180:	6972                	ld	s2,280(sp)
 182:	746e                	ld	s0,248(sp)
 184:	656d006b          	0x656d006b
 188:	736d                	lui	t1,0xffffb
 18a:	7465                	lui	s0,0xffff9
 18c:	7000                	ld	s0,32(s0)
 18e:	6e61                	lui	t3,0x18
 190:	6369                	lui	t1,0x1a
 192:	7600                	ld	s0,40(a2)
 194:	5f6d                	li	t5,-5
 196:	6e65                	lui	t3,0x19
 198:	0064                	addi	s1,sp,12
 19a:	6176                	ld	sp,344(sp)
 19c:	745f 5f6f 6170      	0x61705f6f745f
 1a2:	6300                	ld	s0,0(a4)
 1a4:	746e756f          	jal	a0,e78ea <BASE_ADDR-0xffffffe000118716>
 1a8:	7265                	lui	tp,0xffff9
 1aa:	6d5f 0069 7473      	0x747300696d5f
 1b0:	7461                	lui	s0,0xffff8
 1b2:	0065                	c.nop	25
 1b4:	61657263          	bgeu	a0,s6,7b8 <BASE_ADDR-0xffffffe0001ff848>
 1b8:	6574                	ld	a3,200(a0)
 1ba:	755f 6573 5f72      	0x5f726573755f
 1c0:	6170                	ld	a2,192(a0)
 1c2:	745f6567          	0x745f6567
 1c6:	6261                	lui	tp,0x18
 1c8:	656c                	ld	a1,200(a0)
 1ca:	5f00                	lw	s0,56(a4)
 1cc:	645f 6d75 796d      	0x796d6d75645f
 1d2:	7300                	ld	s0,32(a4)
 1d4:	64656863          	bltu	a0,t1,824 <BASE_ADDR-0xffffffe0001ff7dc>
 1d8:	6c75                	lui	s8,0x1d
 1da:	5f65                	li	t5,-7
 1dc:	7270                	ld	a2,224(a2)
 1de:	6f69                	lui	t5,0x1a
 1e0:	6972                	ld	s2,280(sp)
 1e2:	7974                	ld	a3,240(a0)
 1e4:	7400                	ld	s0,40(s0)
 1e6:	6172                	ld	sp,280(sp)
 1e8:	6670                	ld	a2,200(a2)
 1ea:	6172                	ld	sp,280(sp)
 1ec:	656d                	lui	a0,0x1b
 1ee:	7400                	ld	s0,40(s0)
 1f0:	7361                	lui	t1,0xffff8
 1f2:	6e695f6b          	0x6e695f6b
 1f6:	7469                	lui	s0,0xffffa
 1f8:	6900                	ld	s0,16(a0)
 1fa:	6c64                	ld	s1,216(s0)
 1fc:	0065                	c.nop	25
 1fe:	65686373          	csrrsi	t1,0x656,16
 202:	7564                	ld	s1,232(a0)
 204:	656c                	ld	a1,200(a0)
 206:	735f 666a 7300      	0x7300666a735f
 20c:	64656863          	bltu	a0,t1,85c <BASE_ADDR-0xffffffe0001ff7a4>
 210:	6c75                	lui	s8,0x1d
 212:	0065                	c.nop	25
 214:	6f74                	ld	a3,216(a4)
 216:	5f74                	lw	a3,124(a4)
 218:	6174                	ld	a3,192(a0)
 21a:	64006b73          	csrrsi	s6,0x640,0
 21e:	6d6d5f6f          	jal	t5,d58f4 <BASE_ADDR-0xffffffe00012a70c>
 222:	7061                	c.lui	zero,0xffff8
 224:	6d00                	ld	s0,24(a0)
 226:	5f6d                	li	t5,-5
 228:	75727473          	csrrci	s0,0x757,4
 22c:	76007463          	bgeu	zero,zero,994 <BASE_ADDR-0xffffffe0001ff66c>
 230:	5f6d                	li	t5,-5
 232:	72617473          	csrrci	s0,0x726,2
 236:	0074                	addi	a3,sp,12
 238:	6d76                	ld	s10,344(sp)
 23a:	615f 6572 5f61      	0x5f616572615f
 240:	75727473          	csrrci	s0,0x757,4
 244:	6c007463          	bgeu	zero,zero,90c <BASE_ADDR-0xffffffe0001ff6f4>
 248:	635f7473          	csrrci	s0,0x635,30
 24c:	746e756f          	jal	a0,e7992 <BASE_ADDR-0xffffffe00011866e>
 250:	7265                	lui	tp,0xffff9
 252:	6300                	ld	s0,0(a4)
 254:	7275                	lui	tp,0xffffd
 256:	6572                	ld	a0,280(sp)
 258:	746e                	ld	s0,248(sp)
 25a:	7000                	ld	s0,32(s0)
 25c:	5f74                	lw	a3,124(a4)
 25e:	6572                	ld	a0,280(sp)
 260:	73007367          	0x73007367
 264:	7674                	ld	a3,232(a2)
 266:	6c61                	lui	s8,0x18
 268:	7300                	ld	s0,32(a4)
 26a:	74617473          	csrrci	s0,0x746,2
 26e:	7375                	lui	t1,0xffffd
 270:	5f00                	lw	s0,56(a4)
 272:	6175                	addi	sp,sp,368
 274:	7070                	ld	a2,224(s0)
 276:	6c5f 6e65 6900      	0x69006e656c5f
 27c:	636e                	ld	t1,216(sp)
 27e:	7265                	lui	tp,0xffff9
 280:	6300                	ld	s0,0(a4)
 282:	746e756f          	jal	a0,e79c8 <BASE_ADDR-0xffffffe000118638>
 286:	7265                	lui	tp,0xffff9
 288:	6d5f 0078 7375      	0x737500786d5f
 28e:	7265                	lui	tp,0xffff9
 290:	735f 6174 6b63      	0x6b636174735f
 296:	705f 0061 6874      	0x68740061705f
 29c:	6572                	ld	a0,280(sp)
 29e:	6461                	lui	s0,0x18
 2a0:	695f 666e 006f      	0x6f666e695f
 2a6:	63706573          	csrrsi	a0,0x637,0
 2aa:	7400                	ld	s0,40(s0)
 2ac:	7361                	lui	t1,0xffff8
 2ae:	74735f6b          	0x74735f6b
 2b2:	7572                	ld	a0,312(sp)
 2b4:	63007463          	bgeu	zero,a6,8dc <BASE_ADDR-0xffffffe0001ff724>
 2b8:	6572                	ld	a0,280(sp)
 2ba:	7461                	lui	s0,0xffff8
 2bc:	5f65                	li	t5,-7
 2be:	6966                	ld	s2,88(sp)
 2c0:	7372                	ld	t1,312(sp)
 2c2:	5f74                	lw	a3,124(a4)
 2c4:	6174                	ld	a3,192(a0)
 2c6:	5f006b73          	csrrsi	s6,0x5f0,0
 2ca:	6175                	addi	sp,sp,368
 2cc:	7070                	ld	a2,224(s0)
 2ce:	655f 646e 7400      	0x7400646e655f
 2d4:	7268                	ld	a0,224(a2)
 2d6:	6165                	addi	sp,sp,112
 2d8:	0064                	addi	s1,sp,12
 2da:	656d                	lui	a0,0x1b
 2dc:	636d                	lui	t1,0x1b
 2de:	7970                	ld	a2,240(a0)
 2e0:	7400                	ld	s0,40(s0)
 2e2:	7268                	ld	a0,224(a2)
 2e4:	6165                	addi	sp,sp,112
 2e6:	5f64                	lw	s1,124(a4)
 2e8:	75727473          	csrrci	s0,0x757,4
 2ec:	76007463          	bgeu	zero,zero,a54 <BASE_ADDR-0xffffffe0001ff5ac>
 2f0:	5f6d                	li	t5,-5
 2f2:	7270                	ld	a2,224(a2)
 2f4:	7665                	lui	a2,0xffff9
 2f6:	5f00                	lw	s0,56(a4)
 2f8:	6175                	addi	sp,sp,368
 2fa:	7070                	ld	a2,224(s0)
 2fc:	735f 6174 7472      	0x74726174735f
 302:	7300                	ld	s0,32(a4)
 304:	6365                	lui	t1,0x19
 306:	5f646e6f          	jal	t3,468fc <BASE_ADDR-0xffffffe0001b9704>
 30a:	6170                	ld	a2,192(a0)
 30c:	745f6567          	0x745f6567
 310:	6261                	lui	tp,0x18
 312:	656c                	ld	a1,200(a0)
 314:	7600                	ld	s0,40(a2)
 316:	5f6d                	li	t5,-5
 318:	656e                	ld	a0,216(sp)
 31a:	7478                	ld	a4,232(s0)
 31c:	6400                	ld	s0,8(s0)
 31e:	69745f6f          	jal	t5,461b4 <BASE_ADDR-0xffffffe0001b9e4c>
 322:	656d                	lui	a0,0x1b
 324:	0072                	c.slli	zero,0x1c
 326:	786e                	ld	a6,248(sp)
 328:	5f74                	lw	a3,124(a4)
 32a:	6469                	lui	s0,0x1a
 32c:	6300                	ld	s0,0(a4)
 32e:	6572                	ld	a0,280(sp)
 330:	7461                	lui	s0,0xffff8
 332:	5f65                	li	t5,-7
 334:	6174                	ld	a3,192(a0)
 336:	72006b73          	csrrsi	s6,0x720,0
 33a:	5f746f6f          	jal	t5,47130 <BASE_ADDR-0xffffffe0001b8ed0>
 33e:	6174                	ld	a3,192(a0)
 340:	6c62                	ld	s8,24(sp)
 342:	0065                	c.nop	25
 344:	6172                	ld	sp,280(sp)
 346:	646e                	ld	s0,216(sp)
 348:	725f 6e61 6567      	0x65676e61725f
 34e:	5f00                	lw	s0,56(a4)
 350:	735f 6977 6374      	0x63746977735f
 356:	5f68                	lw	a0,124(a4)
 358:	6f74                	ld	a3,216(a4)
 35a:	7300                	ld	s0,32(a4)
 35c:	61726373          	csrrsi	t1,0x617,4
 360:	6374                	ld	a3,192(a4)
 362:	0068                	addi	a0,sp,12
 364:	6d76                	ld	s10,344(sp)
 366:	6d5f 006d 7261      	0x7261006d6d5f
 36c:	61003167          	0x61003167
 370:	6772                	ld	a4,280(sp)
 372:	0030                	addi	a2,sp,8
 374:	7261                	lui	tp,0xffff8
 376:	61003267          	0x61003267
 37a:	6772                	ld	a4,280(sp)
 37c:	72610033          	0x72610033
 380:	61003467          	0x61003467
 384:	6772                	ld	a4,280(sp)
 386:	0035                	c.nop	13
 388:	63737973          	csrrci	s2,0x637,6
 38c:	6c61                	lui	s8,0x18
 38e:	006c                	addi	a1,sp,12
 390:	7570                	ld	a2,232(a0)
 392:	6374                	ld	a3,192(a4)
 394:	7300                	ld	s0,32(a4)
 396:	7379                	lui	t1,0xffffe
 398:	775f 6972 6574      	0x65746972775f
 39e:	5f00                	lw	s0,56(a4)
 3a0:	6c696863          	bltu	s2,t1,a70 <BASE_ADDR-0xffffffe0001ff590>
 3a4:	5f64                	lw	s1,124(a4)
 3a6:	6572                	ld	a0,280(sp)
 3a8:	5f74                	lw	a3,124(a4)
 3aa:	7266                	ld	tp,120(sp)
 3ac:	635f6d6f          	jal	s10,f71e0 <BASE_ADDR-0xffffffe000108e20>
 3b0:	6f6c                	ld	a1,216(a4)
 3b2:	656e                	ld	a0,216(sp)
 3b4:	6300                	ld	s0,0(a4)
 3b6:	6968                	ld	a0,208(a0)
 3b8:	646c                	ld	a1,200(s0)
 3ba:	7300                	ld	s0,32(a4)
 3bc:	7379                	lui	t1,0xffffe
 3be:	6c6c6163          	bltu	s8,t1,a80 <BASE_ADDR-0xffffffe0001ff580>
 3c2:	6e5f 6d75 7300      	0x73006d756e5f
 3c8:	7379                	lui	t1,0xffffe
 3ca:	675f 7465 6970      	0x69707465675f
 3d0:	0064                	addi	s1,sp,12
 3d2:	5f737973          	csrrci	s2,0x5f7,6
 3d6:	6e6f6c63          	bltu	t5,t1,ace <BASE_ADDR-0xffffffe0001ff532>
 3da:	0065                	c.nop	25
 3dc:	6966                	ld	s2,88(sp)
 3de:	7372                	ld	t1,312(sp)
 3e0:	5f74                	lw	a3,124(a4)
 3e2:	6170                	ld	a2,192(a0)
 3e4:	665f6567          	0x665f6567
 3e8:	7561                	lui	a0,0xffff8
 3ea:	746c                	ld	a1,232(s0)
 3ec:	6500                	ld	s0,8(a0)
 3ee:	6378                	ld	a4,192(a4)
 3f0:	7065                	c.lui	zero,0xffff9
 3f2:	6974                	ld	a3,208(a0)
 3f4:	635f6e6f          	jal	t3,f7228 <BASE_ADDR-0xffffffe000108dd8>
 3f8:	5f65646f          	jal	s0,569ee <BASE_ADDR-0xffffffe0001a9612>
 3fc:	6f74                	ld	a3,216(a4)
 3fe:	765f 5f6d 6c66      	0x6c665f6d765f
 404:	6761                	lui	a4,0x18
 406:	63730073          	0x63730073
 40a:	7561                	lui	a0,0xffff8
 40c:	69006573          	csrrsi	a0,0x690,0
 410:	6e695f73          	csrrwi	t5,0x6e6,18
 414:	6574                	ld	a3,200(a0)
 416:	7272                	ld	tp,312(sp)
 418:	7075                	c.lui	zero,0xffffd
 41a:	0074                	addi	a3,sp,12
 41c:	6170                	ld	a2,192(a0)
 41e:	745f 5f6f 6176      	0x61765f6f745f
 424:	6500                	ld	s0,8(a0)
 426:	6378                	ld	a4,192(a4)
 428:	7065                	c.lui	zero,0xffff9
 42a:	6974                	ld	a3,208(a0)
 42c:	635f6e6f          	jal	t3,f7260 <BASE_ADDR-0xffffffe000108da0>
 430:	0065646f          	jal	s0,56436 <BASE_ADDR-0xffffffe0001a9bca>
 434:	6d76                	ld	s10,344(sp)
 436:	665f 616c 7367      	0x7367616c665f
 43c:	745f 5f6f 7470      	0x74705f6f745f
 442:	5f65                	li	t5,-7
 444:	6c66                	ld	s8,88(sp)
 446:	6761                	lui	a4,0x18
 448:	72740073          	0x72740073
 44c:	7061                	c.lui	zero,0xffff8
 44e:	685f 6e61 6c64      	0x6c646e61685f
 454:	7265                	lui	tp,0xffff9
 456:	6800                	ld	s0,16(s0)
 458:	6e61                	lui	t3,0x18
 45a:	6c64                	ld	s1,216(s0)
 45c:	5f65                	li	t5,-7
 45e:	6170                	ld	a2,192(a0)
 460:	665f6567          	0x665f6567
 464:	7561                	lui	a0,0xffff8
 466:	746c                	ld	a1,232(s0)
 468:	6600                	ld	s0,8(a2)
 46a:	6e69                	lui	t3,0x1a
 46c:	5f64                	lw	s1,124(a4)
 46e:	6d76                	ld	s10,344(sp)
 470:	0061                	c.nop	24
 472:	7270                	ld	a2,224(a2)
 474:	6e69                	lui	t3,0x1a
 476:	5f74                	lw	a3,124(a4)
 478:	7274                	ld	a3,224(a2)
 47a:	7061                	c.lui	zero,0xffff8
 47c:	5f00                	lw	s0,56(a4)
 47e:	74616473          	csrrsi	s0,0x746,2
 482:	0061                	c.nop	24
 484:	7470                	ld	a2,232(s0)
 486:	5f65                	li	t5,-7
 488:	6f74                	ld	a3,216(a4)
 48a:	765f 0061 735f      	0x735f0061765f
 490:	6574                	ld	a3,200(a0)
 492:	7478                	ld	a4,232(s0)
 494:	6300                	ld	s0,0(a4)
 496:	6f706d6f          	jal	s10,738c <BASE_ADDR-0xffffffe0001f8c74>
 49a:	705f6573          	csrrsi	a0,0x705,30
 49e:	6574                	ld	a3,200(a0)
 4a0:	6600                	ld	s0,8(a2)
 4a2:	7269                	lui	tp,0xffffa
 4a4:	6d5f7473          	csrrci	s0,0x6d5,30
 4a8:	7061                	c.lui	zero,0xffff8
 4aa:	5f00                	lw	s0,56(a4)
 4ac:	7376                	ld	t1,376(sp)
 4ae:	6174                	ld	a3,192(a0)
 4b0:	7472                	ld	s0,312(sp)
 4b2:	7300                	ld	s0,32(a4)
 4b4:	6365                	lui	t1,0x19
 4b6:	745f 6261 656c      	0x656c6261745f
 4bc:	705f 0061 705f      	0x705f0061705f
 4c2:	72617473          	csrrci	s0,0x726,2
 4c6:	0074                	addi	a3,sp,12
 4c8:	5f746567          	0x5f746567
 4cc:	635f726f          	jal	tp,f8300 <BASE_ADDR-0xffffffe000107d00>
 4d0:	6572                	ld	a0,280(sp)
 4d2:	7461                	lui	s0,0xffff8
 4d4:	5f65                	li	t5,-7
 4d6:	6e69                	lui	t3,0x1a
 4d8:	6574                	ld	a3,200(a0)
 4da:	6e72                	ld	t3,280(sp)
 4dc:	6c61                	lui	s8,0x18
 4de:	655f 746e 7972      	0x7972746e655f
 4e4:	5f00                	lw	s0,56(a4)
 4e6:	7265                	lui	tp,0xffff9
 4e8:	7461646f          	jal	s0,16c2e <BASE_ADDR-0xffffffe0001e93d2>
 4ec:	0061                	c.nop	24
 4ee:	75746573          	csrrsi	a0,0x757,8
 4f2:	5f70                	lw	a2,124(a4)
 4f4:	6d76                	ld	s10,344(sp)
 4f6:	665f 7269 7473      	0x74737269665f
 4fc:	7000                	ld	s0,32(s0)
 4fe:	6f72                	ld	t5,280(sp)
 500:	0074                	addi	a3,sp,12
 502:	5f746567          	0x5f746567
 506:	6e75                	lui	t3,0x1d
 508:	616d                	addi	sp,sp,240
 50a:	7070                	ld	a2,224(s0)
 50c:	6465                	lui	s0,0x19
 50e:	615f 6572 0061      	0x616572615f
 514:	735f 6f72 6164      	0x61646f72735f
 51a:	6174                	ld	a3,192(a0)
 51c:	6900                	ld	s0,16(a0)
 51e:	736e                	ld	t1,248(sp)
 520:	7265                	lui	tp,0xffff9
 522:	0074                	addi	a3,sp,12
 524:	655f 6574 7478      	0x74786574655f
 52a:	6600                	ld	s0,8(a2)
 52c:	7269                	lui	tp,0xffffa
 52e:	705f7473          	csrrci	s0,0x705,30
 532:	6761                	lui	a4,0x18
 534:	5f65                	li	t5,-7
 536:	6174                	ld	a3,192(a0)
 538:	6c62                	ld	s8,24(sp)
 53a:	0065                	c.nop	25
 53c:	6e69                	lui	t3,0x1a
 53e:	6574                	ld	a3,200(a0)
 540:	7372                	ld	t1,312(sp)
 542:	6365                	lui	t1,0x19
 544:	0074                	addi	a3,sp,12
 546:	75746573          	csrrsi	a0,0x757,8
 54a:	5f70                	lw	a2,124(a4)
 54c:	6d76                	ld	s10,344(sp)
 54e:	735f 6365 6e6f      	0x6e6f6365735f
 554:	0064                	addi	s1,sp,12
 556:	7470                	ld	a2,232(s0)
 558:	5f65                	li	t5,-7
 55a:	6f74                	ld	a3,216(a4)
 55c:	705f 0061 6573      	0x65730061705f
 562:	646e6f63          	bltu	t3,t1,bc0 <BASE_ADDR-0xffffffe0001ff440>
 566:	6d5f 7061 725f      	0x725f70616d5f
 56c:	6e61                	lui	t3,0x18
 56e:	5f006567          	0x5f006567
 572:	6576                	ld	a0,344(sp)
 574:	646e                	ld	s0,216(sp)
 576:	6c00                	ld	s0,24(s0)
 578:	6e65                	lui	t3,0x19
 57a:	00687467          	0x687467
 57e:	72617473          	csrrci	s0,0x726,2
 582:	5f74                	lw	a3,124(a4)
 584:	6e72656b          	0x6e72656b
 588:	6c65                	lui	s8,0x19
 58a:	7400                	ld	s0,40(s0)
 58c:	7365                	lui	t1,0xffff9
 58e:	0074                	addi	a3,sp,12
 590:	6568                	ld	a0,200(a0)
 592:	6478                	ld	a4,200(s0)
 594:	6769                	lui	a4,0x1a
 596:	7469                	lui	s0,0xffffa
 598:	69730073          	0x69730073
 59c:	657a                	ld	a0,408(sp)
 59e:	745f 7000 7475      	0x74757000745f
 5a4:	5f006863          	bltu	zero,a6,b94 <BASE_ADDR-0xffffffe0001ff46c>
 5a8:	625f 6975 746c      	0x746c6975625f
 5ae:	6e69                	lui	t3,0x1a
 5b0:	765f 5f61 696c      	0x696c5f61765f
 5b6:	76007473          	csrrci	s0,0x760,0
 5ba:	7270                	ld	a2,224(a2)
 5bc:	6e69                	lui	t3,0x1a
 5be:	6674                	ld	a3,200(a2)
 5c0:	746d                	lui	s0,0xffffb
 5c2:	6800                	ld	s0,16(s0)
 5c4:	6c61                	lui	s8,0x18
 5c6:	6266                	ld	tp,88(sp)
 5c8:	7479                	lui	s0,0xffffe
 5ca:	0065                	c.nop	25
 5cc:	6e69                	lui	t3,0x1a
 5ce:	665f 726f 616d      	0x616d726f665f
 5d4:	0074                	addi	a3,sp,12
 5d6:	6568                	ld	a0,200(a0)
 5d8:	6378                	ld	a4,192(a4)
 5da:	6168                	ld	a0,192(a0)
 5dc:	0072                	c.slli	zero,0x1c
 5de:	6f6c                	ld	a1,216(a4)
 5e0:	676e                	ld	a4,216(sp)
 5e2:	7261                	lui	tp,0xffff8
 5e4:	65640067          	jr	1622(s0) # ffffffffffffe656 <_ebss+0x1fffdf46b6>
 5e8:	61686363          	bltu	a6,s6,bee <BASE_ADDR-0xffffffe0001ff412>
 5ec:	0072                	c.slli	zero,0x1c
 5ee:	6962                	ld	s2,24(sp)
 5f0:	7374                	ld	a3,224(a4)
 5f2:	7200                	ld	s0,32(a2)
 5f4:	6e61                	lui	t3,0x18
 5f6:	0064                	addi	s1,sp,12
 5f8:	6e69                	lui	t3,0x1a
 5fa:	7469                	lui	s0,0xffffa
 5fc:	6169                	addi	sp,sp,208
 5fe:	696c                	ld	a1,208(a0)
 600:	657a                	ld	a0,408(sp)
 602:	6300                	ld	s0,0(a4)
 604:	00637273          	csrrci	tp,0x6,6
 608:	74736463          	bltu	t1,t2,d50 <BASE_ADDR-0xffffffe0001ff2b0>
	...

Disassembly of section .debug_line_str:

0000000000000000 <.debug_line_str>:
   0:	6f6f722f          	0x6f6f722f
   4:	2f74                	fld	fa3,216(a4)
   6:	33737973          	csrrci	s2,mhpmevent23,6
   a:	616c                	ld	a1,192(a0)
   c:	2d62                	fld	fs10,24(sp)
   e:	3032                	fld	ft0,296(sp)
  10:	3232                	fld	ft4,296(sp)
  12:	732d                	lui	t1,0xfffeb
  14:	7574                	ld	a3,232(a0)
  16:	6372732f          	0x6372732f
  1a:	62616c2f          	0x62616c2f
  1e:	2f35                	addiw	t5,t5,13
  20:	7261                	lui	tp,0xffff8
  22:	722f6863          	bltu	t5,sp,752 <BASE_ADDR-0xffffffe0001ff8ae>
  26:	7369                	lui	t1,0xffffa
  28:	6b2f7663          	bgeu	t5,s2,6d4 <BASE_ADDR-0xffffffe0001ff92c>
  2c:	7265                	lui	tp,0xffff9
  2e:	656e                	ld	a0,216(sp)
  30:	006c                	addi	a1,sp,12
  32:	636f6c63          	bltu	t5,s6,66a <BASE_ADDR-0xffffffe0001ff996>
  36:	00632e6b          	0x632e6b
  3a:	6f6f722f          	0x6f6f722f
  3e:	2f74                	fld	fa3,216(a4)
  40:	33737973          	csrrci	s2,mhpmevent23,6
  44:	616c                	ld	a1,192(a0)
  46:	2d62                	fld	fs10,24(sp)
  48:	3032                	fld	ft0,296(sp)
  4a:	3232                	fld	ft4,296(sp)
  4c:	732d                	lui	t1,0xfffeb
  4e:	7574                	ld	a3,232(a0)
  50:	6372732f          	0x6372732f
  54:	62616c2f          	0x62616c2f
  58:	2f35                	addiw	t5,t5,13
  5a:	7261                	lui	tp,0xffff8
  5c:	722f6863          	bltu	t5,sp,78c <BASE_ADDR-0xffffffe0001ff874>
  60:	7369                	lui	t1,0xffffa
  62:	692f7663          	bgeu	t5,s2,6ee <BASE_ADDR-0xffffffe0001ff912>
  66:	636e                	ld	t1,216(sp)
  68:	756c                	ld	a1,232(a0)
  6a:	6564                	ld	s1,200(a0)
  6c:	2f00                	fld	fs0,24(a4)
  6e:	6f72                	ld	t5,280(sp)
  70:	732f746f          	jal	s0,f77a2 <BASE_ADDR-0xffffffe00010885e>
  74:	7379                	lui	t1,0xffffe
  76:	62616c33          	0x62616c33
  7a:	322d                	addiw	tp,tp,-21
  7c:	3230                	fld	fa2,96(a2)
  7e:	2d32                	fld	fs10,264(sp)
  80:	2f757473          	csrrci	s0,0x2f7,10
  84:	2f637273          	csrrci	tp,0x2f6,6
  88:	616c                	ld	a1,192(a0)
  8a:	3562                	fld	fa0,56(sp)
  8c:	636e692f          	0x636e692f
  90:	756c                	ld	a1,232(a0)
  92:	6564                	ld	s1,200(a0)
  94:	7300                	ld	s0,32(a4)
  96:	6962                	ld	s2,24(sp)
  98:	682e                	ld	a6,200(sp)
  9a:	7400                	ld	s0,40(s0)
  9c:	7079                	c.lui	zero,0xffffe
  9e:	7365                	lui	t1,0xffff9
  a0:	682e                	ld	a6,200(sp)
  a2:	6500                	ld	s0,8(a0)
  a4:	746e                	ld	s0,248(sp)
  a6:	7972                	ld	s2,312(sp)
  a8:	532e                	lw	t1,232(sp)
  aa:	6800                	ld	s0,16(s0)
  ac:	6165                	addi	sp,sp,112
  ae:	2e64                	fld	fs1,216(a2)
  b0:	6d6d0053          	0x6d6d0053
  b4:	632e                	ld	t1,200(sp)
  b6:	6d00                	ld	s0,24(a0)
  b8:	2e6d                	addiw	t3,t3,27
  ba:	0068                	addi	a0,sp,12
  bc:	7270                	ld	a2,224(a2)
  be:	6e69                	lui	t3,0x1a
  c0:	6b74                	ld	a3,208(a4)
  c2:	682e                	ld	a6,200(sp)
  c4:	7300                	ld	s0,32(a4)
  c6:	7274                	ld	a3,224(a2)
  c8:	6e69                	lui	t3,0x1a
  ca:	00682e67          	0x682e67
  ce:	6170                	ld	a2,192(a0)
  d0:	696e                	ld	s2,216(sp)
  d2:	00632e63          	0x632e63
  d6:	7270                	ld	a2,224(a2)
  d8:	632e636f          	jal	t1,e670a <BASE_ADDR-0xffffffe0001198f6>
  dc:	7600                	ld	s0,40(a2)
  de:	2e6d                	addiw	t3,t3,27
  e0:	0068                	addi	a0,sp,12
  e2:	7274                	ld	a3,224(a2)
  e4:	7061                	c.lui	zero,0xffff8
  e6:	682e                	ld	a6,200(sp)
  e8:	7000                	ld	s0,32(s0)
  ea:	6f72                	ld	t5,280(sp)
  ec:	00682e63          	0x682e63
  f0:	6172                	ld	sp,280(sp)
  f2:	646e                	ld	s0,216(sp)
  f4:	682e                	ld	a6,200(sp)
  f6:	7300                	ld	s0,32(a4)
  f8:	6962                	ld	s2,24(sp)
  fa:	632e                	ld	t1,200(sp)
  fc:	7300                	ld	s0,32(a4)
  fe:	7379                	lui	t1,0xffffe
 100:	6c6c6163          	bltu	s8,t1,7c2 <BASE_ADDR-0xffffffe0001ff83e>
 104:	632e                	ld	t1,200(sp)
 106:	2e00                	fld	fs0,24(a2)
 108:	2f2e                	fld	ft10,200(sp)
 10a:	6e69                	lui	t3,0x1a
 10c:	64756c63          	bltu	a0,t2,764 <BASE_ADDR-0xffffffe0001ff89c>
 110:	0065                	c.nop	25
 112:	7274                	ld	a3,224(a2)
 114:	7061                	c.lui	zero,0xffff8
 116:	632e                	ld	t1,200(sp)
 118:	6300                	ld	s0,0(a4)
 11a:	6f6c                	ld	a1,216(a4)
 11c:	682e6b63          	bltu	t3,sp,7b2 <BASE_ADDR-0xffffffe0001ff84e>
 120:	7300                	ld	s0,32(a4)
 122:	7379                	lui	t1,0xffffe
 124:	6c6c6163          	bltu	s8,t1,7e6 <BASE_ADDR-0xffffffe0001ff81a>
 128:	682e                	ld	a6,200(sp)
 12a:	7000                	ld	s0,32(s0)
 12c:	6e61                	lui	t3,0x18
 12e:	6369                	lui	t1,0x1a
 130:	682e                	ld	a6,200(sp)
 132:	7600                	ld	s0,40(a2)
 134:	2e6d                	addiw	t3,t3,27
 136:	722f0063          	beq	t5,sp,856 <BASE_ADDR-0xffffffe0001ff7aa>
 13a:	2f746f6f          	jal	t5,46c30 <BASE_ADDR-0xffffffe0001b93d0>
 13e:	33737973          	csrrci	s2,mhpmevent23,6
 142:	616c                	ld	a1,192(a0)
 144:	2d62                	fld	fs10,24(sp)
 146:	3032                	fld	ft0,296(sp)
 148:	3232                	fld	ft4,296(sp)
 14a:	732d                	lui	t1,0xfffeb
 14c:	7574                	ld	a3,232(a0)
 14e:	6372732f          	0x6372732f
 152:	62616c2f          	0x62616c2f
 156:	2f35                	addiw	t5,t5,13
 158:	6e69                	lui	t3,0x1a
 15a:	7469                	lui	s0,0xffffa
 15c:	6d00                	ld	s0,24(a0)
 15e:	6961                	lui	s2,0x18
 160:	2e6e                	fld	ft8,216(sp)
 162:	65740063          	beq	s0,s7,7a2 <BASE_ADDR-0xffffffe0001ff85e>
 166:	632e7473          	csrrci	s0,0x632,28
 16a:	2f00                	fld	fs0,24(a4)
 16c:	6f72                	ld	t5,280(sp)
 16e:	732f746f          	jal	s0,f78a0 <BASE_ADDR-0xffffffe000108760>
 172:	7379                	lui	t1,0xffffe
 174:	62616c33          	0x62616c33
 178:	322d                	addiw	tp,tp,-21
 17a:	3230                	fld	fa2,96(a2)
 17c:	2d32                	fld	fs10,264(sp)
 17e:	2f757473          	csrrci	s0,0x2f7,10
 182:	2f637273          	csrrci	tp,0x2f6,6
 186:	616c                	ld	a1,192(a0)
 188:	3562                	fld	fa0,56(sp)
 18a:	62696c2f          	0x62696c2f
 18e:	7000                	ld	s0,32(s0)
 190:	6972                	ld	s2,280(sp)
 192:	746e                	ld	s0,248(sp)
 194:	00632e6b          	0x632e6b
 198:	64647473          	csrrci	s0,0x646,8
 19c:	6665                	lui	a2,0x19
 19e:	682e                	ld	a6,200(sp)
 1a0:	7200                	ld	s0,32(a2)
 1a2:	6e61                	lui	t3,0x18
 1a4:	2e64                	fld	fs1,216(a2)
 1a6:	74730063          	beq	t1,t2,8e6 <BASE_ADDR-0xffffffe0001ff71a>
 1aa:	6972                	ld	s2,280(sp)
 1ac:	676e                	ld	a4,216(sp)
 1ae:	632e                	ld	t1,200(sp)
	...

Disassembly of section .comment:

0000000000000000 <.comment>:
   0:	3a434347          	fmsub.d	ft6,ft6,ft4,ft7,rmm
   4:	2820                	fld	fs0,80(s0)
   6:	29554e47          	fmsub.s	ft8,fa0,fs5,ft5,rmm
   a:	3120                	fld	fs0,96(a0)
   c:	2e31                	addiw	t3,t3,12
   e:	2e31                	addiw	t3,t3,12
  10:	0030                	addi	a2,sp,8

Disassembly of section .riscv.attributes:

0000000000000000 <.riscv.attributes>:
   0:	3341                	addiw	t1,t1,-16
   2:	0000                	unimp
   4:	7200                	ld	s0,32(a2)
   6:	7369                	lui	t1,0xffffa
   8:	01007663          	bgeu	zero,a6,14 <BASE_ADDR-0xffffffe0001fffec>
   c:	0029                	c.nop	10
   e:	0000                	unimp
  10:	1004                	addi	s1,sp,32
  12:	7205                	lui	tp,0xfffe1
  14:	3676                	fld	fa2,376(sp)
  16:	6934                	ld	a3,80(a0)
  18:	7032                	0x7032
  1a:	5f30                	lw	a2,120(a4)
  1c:	326d                	addiw	tp,tp,-5
  1e:	3070                	fld	fa2,224(s0)
  20:	615f 7032 5f30      	0x5f307032615f
  26:	3266                	fld	ft4,120(sp)
  28:	3070                	fld	fa2,224(s0)
  2a:	645f 7032 0030      	0x307032645f
  30:	0108                	addi	a0,sp,128
  32:	0b0a                	slli	s6,s6,0x2

Disassembly of section .debug_frame:

0000000000000000 <.debug_frame>:
   0:	000c                	0xc
   2:	0000                	unimp
   4:	ffff                	0xffff
   6:	ffff                	0xffff
   8:	7c010003          	lb	zero,1984(sp)
   c:	0d01                	addi	s10,s10,0
   e:	0002                	c.slli64	zero
  10:	002c                	addi	a1,sp,8
  12:	0000                	unimp
  14:	0000                	unimp
  16:	0000                	unimp
  18:	0380                	addi	s0,sp,448
  1a:	0020                	addi	s0,sp,8
  1c:	ffe0                	sd	s0,248(a5)
  1e:	ffff                	0xffff
  20:	0028                	addi	a0,sp,8
  22:	0000                	unimp
  24:	0000                	unimp
  26:	0000                	unimp
  28:	0e44                	addi	s1,sp,788
  2a:	4420                	lw	s0,72(s0)
  2c:	0288                	addi	a0,sp,320
  2e:	0c44                	addi	s1,sp,532
  30:	0008                	0x8
  32:	c854                	sw	a3,20(s0)
  34:	020c                	addi	a1,sp,256
  36:	4420                	lw	s0,72(s0)
  38:	000e                	c.slli	zero,0x3
  3a:	0000                	unimp
  3c:	0000                	unimp
  3e:	0000                	unimp
  40:	002c                	addi	a1,sp,8
  42:	0000                	unimp
  44:	0000                	unimp
  46:	0000                	unimp
  48:	03a8                	addi	a0,sp,456
  4a:	0020                	addi	s0,sp,8
  4c:	ffe0                	sd	s0,248(a5)
  4e:	ffff                	0xffff
  50:	0064                	addi	s1,sp,12
  52:	0000                	unimp
  54:	0000                	unimp
  56:	0000                	unimp
  58:	0e44                	addi	s1,sp,788
  5a:	4820                	lw	s0,80(s0)
  5c:	0281                	addi	t0,t0,0
  5e:	0488                	addi	a0,sp,576
  60:	0c44                	addi	s1,sp,532
  62:	0008                	0x8
  64:	4802                	lw	a6,0(sp)
  66:	44c1                	li	s1,16
  68:	0cc8                	addi	a0,sp,596
  6a:	2002                	fld	ft0,0(sp)
  6c:	0e44                	addi	s1,sp,788
  6e:	0000                	unimp
  70:	000c                	0xc
  72:	0000                	unimp
  74:	ffff                	0xffff
  76:	ffff                	0xffff
  78:	7c010003          	lb	zero,1984(sp)
  7c:	0d01                	addi	s10,s10,0
  7e:	0002                	c.slli64	zero
  80:	002c                	addi	a1,sp,8
  82:	0000                	unimp
  84:	0070                	addi	a2,sp,12
  86:	0000                	unimp
  88:	040c                	addi	a1,sp,512
  8a:	0020                	addi	s0,sp,8
  8c:	ffe0                	sd	s0,248(a5)
  8e:	ffff                	0xffff
  90:	005c                	addi	a5,sp,4
  92:	0000                	unimp
  94:	0000                	unimp
  96:	0000                	unimp
  98:	0e44                	addi	s1,sp,788
  9a:	4820                	lw	s0,80(s0)
  9c:	0281                	addi	t0,t0,0
  9e:	0488                	addi	a0,sp,576
  a0:	0c44                	addi	s1,sp,532
  a2:	0008                	0x8
  a4:	4002                	0x4002
  a6:	44c1                	li	s1,16
  a8:	0cc8                	addi	a0,sp,596
  aa:	2002                	fld	ft0,0(sp)
  ac:	0e44                	addi	s1,sp,788
  ae:	0000                	unimp
  b0:	002c                	addi	a1,sp,8
  b2:	0000                	unimp
  b4:	0070                	addi	a2,sp,12
  b6:	0000                	unimp
  b8:	0468                	addi	a0,sp,524
  ba:	0020                	addi	s0,sp,8
  bc:	ffe0                	sd	s0,248(a5)
  be:	ffff                	0xffff
  c0:	0078                	addi	a4,sp,12
  c2:	0000                	unimp
  c4:	0000                	unimp
  c6:	0000                	unimp
  c8:	0e44                	addi	s1,sp,788
  ca:	4830                	lw	a2,80(s0)
  cc:	0281                	addi	t0,t0,0
  ce:	0488                	addi	a0,sp,576
  d0:	0c44                	addi	s1,sp,532
  d2:	0008                	0x8
  d4:	5c02                	lw	s8,32(sp)
  d6:	44c1                	li	s1,16
  d8:	0cc8                	addi	a0,sp,596
  da:	3002                	fld	ft0,32(sp)
  dc:	0e44                	addi	s1,sp,788
  de:	0000                	unimp
  e0:	002c                	addi	a1,sp,8
  e2:	0000                	unimp
  e4:	0070                	addi	a2,sp,12
  e6:	0000                	unimp
  e8:	04e0                	addi	s0,sp,588
  ea:	0020                	addi	s0,sp,8
  ec:	ffe0                	sd	s0,248(a5)
  ee:	ffff                	0xffff
  f0:	0080                	addi	s0,sp,64
  f2:	0000                	unimp
  f4:	0000                	unimp
  f6:	0000                	unimp
  f8:	0e44                	addi	s1,sp,788
  fa:	4830                	lw	a2,80(s0)
  fc:	0281                	addi	t0,t0,0
  fe:	0488                	addi	a0,sp,576
 100:	0c44                	addi	s1,sp,532
 102:	0008                	0x8
 104:	6402                	ld	s0,0(sp)
 106:	44c1                	li	s1,16
 108:	0cc8                	addi	a0,sp,596
 10a:	3002                	fld	ft0,32(sp)
 10c:	0e44                	addi	s1,sp,788
 10e:	0000                	unimp
 110:	002c                	addi	a1,sp,8
 112:	0000                	unimp
 114:	0070                	addi	a2,sp,12
 116:	0000                	unimp
 118:	0560                	addi	s0,sp,652
 11a:	0020                	addi	s0,sp,8
 11c:	ffe0                	sd	s0,248(a5)
 11e:	ffff                	0xffff
 120:	0044                	addi	s1,sp,4
 122:	0000                	unimp
 124:	0000                	unimp
 126:	0000                	unimp
 128:	0e44                	addi	s1,sp,788
 12a:	4810                	lw	a2,16(s0)
 12c:	0281                	addi	t0,t0,0
 12e:	0488                	addi	a0,sp,576
 130:	0c44                	addi	s1,sp,532
 132:	0008                	0x8
 134:	c168                	sw	a0,68(a0)
 136:	c844                	sw	s1,20(s0)
 138:	020c                	addi	a1,sp,256
 13a:	4410                	lw	a2,8(s0)
 13c:	000e                	c.slli	zero,0x3
 13e:	0000                	unimp
 140:	000c                	0xc
 142:	0000                	unimp
 144:	ffff                	0xffff
 146:	ffff                	0xffff
 148:	7c010003          	lb	zero,1984(sp)
 14c:	0d01                	addi	s10,s10,0
 14e:	0002                	c.slli64	zero
 150:	0024                	addi	s1,sp,8
 152:	0000                	unimp
 154:	0140                	addi	s0,sp,132
 156:	0000                	unimp
 158:	05a4                	addi	s1,sp,712
 15a:	0020                	addi	s0,sp,8
 15c:	ffe0                	sd	s0,248(a5)
 15e:	ffff                	0xffff
 160:	0028                	addi	a0,sp,8
 162:	0000                	unimp
 164:	0000                	unimp
 166:	0000                	unimp
 168:	0e44                	addi	s1,sp,788
 16a:	4820                	lw	s0,80(s0)
 16c:	0281                	addi	t0,t0,0
 16e:	0488                	addi	a0,sp,576
 170:	0c44                	addi	s1,sp,532
 172:	0008                	0x8
 174:	0000                	unimp
 176:	0000                	unimp
 178:	000c                	0xc
 17a:	0000                	unimp
 17c:	ffff                	0xffff
 17e:	ffff                	0xffff
 180:	7c010003          	lb	zero,1984(sp)
 184:	0d01                	addi	s10,s10,0
 186:	0002                	c.slli64	zero
 188:	002c                	addi	a1,sp,8
 18a:	0000                	unimp
 18c:	0178                	addi	a4,sp,140
 18e:	0000                	unimp
 190:	05cc                	addi	a1,sp,708
 192:	0020                	addi	s0,sp,8
 194:	ffe0                	sd	s0,248(a5)
 196:	ffff                	0xffff
 198:	0048                	addi	a0,sp,4
 19a:	0000                	unimp
 19c:	0000                	unimp
 19e:	0000                	unimp
 1a0:	0e44                	addi	s1,sp,788
 1a2:	4820                	lw	s0,80(s0)
 1a4:	0281                	addi	t0,t0,0
 1a6:	0488                	addi	a0,sp,576
 1a8:	0c44                	addi	s1,sp,532
 1aa:	0008                	0x8
 1ac:	c16c                	sw	a1,68(a0)
 1ae:	c844                	sw	s1,20(s0)
 1b0:	020c                	addi	a1,sp,256
 1b2:	4420                	lw	s0,72(s0)
 1b4:	000e                	c.slli	zero,0x3
 1b6:	0000                	unimp
 1b8:	002c                	addi	a1,sp,8
 1ba:	0000                	unimp
 1bc:	0178                	addi	a4,sp,140
 1be:	0000                	unimp
 1c0:	0614                	addi	a3,sp,768
 1c2:	0020                	addi	s0,sp,8
 1c4:	ffe0                	sd	s0,248(a5)
 1c6:	ffff                	0xffff
 1c8:	00fc                	addi	a5,sp,76
 1ca:	0000                	unimp
 1cc:	0000                	unimp
 1ce:	0000                	unimp
 1d0:	0e44                	addi	s1,sp,788
 1d2:	4820                	lw	s0,80(s0)
 1d4:	0281                	addi	t0,t0,0
 1d6:	0488                	addi	a0,sp,576
 1d8:	0c44                	addi	s1,sp,532
 1da:	0008                	0x8
 1dc:	e002                	sd	zero,0(sp)
 1de:	44c1                	li	s1,16
 1e0:	0cc8                	addi	a0,sp,596
 1e2:	2002                	fld	ft0,0(sp)
 1e4:	0e44                	addi	s1,sp,788
 1e6:	0000                	unimp
 1e8:	002c                	addi	a1,sp,8
 1ea:	0000                	unimp
 1ec:	0178                	addi	a4,sp,140
 1ee:	0000                	unimp
 1f0:	0710                	addi	a2,sp,896
 1f2:	0020                	addi	s0,sp,8
 1f4:	ffe0                	sd	s0,248(a5)
 1f6:	ffff                	0xffff
 1f8:	0124                	addi	s1,sp,136
 1fa:	0000                	unimp
 1fc:	0000                	unimp
 1fe:	0000                	unimp
 200:	0e44                	addi	s1,sp,788
 202:	4830                	lw	a2,80(s0)
 204:	0281                	addi	t0,t0,0
 206:	0488                	addi	a0,sp,576
 208:	0c44                	addi	s1,sp,532
 20a:	0008                	0x8
 20c:	c1010803          	lb	a6,-1008(sp)
 210:	c844                	sw	s1,20(s0)
 212:	020c                	addi	a1,sp,256
 214:	4430                	lw	a2,72(s0)
 216:	000e                	c.slli	zero,0x3
 218:	002c                	addi	a1,sp,8
 21a:	0000                	unimp
 21c:	0178                	addi	a4,sp,140
 21e:	0000                	unimp
 220:	0834                	addi	a3,sp,24
 222:	0020                	addi	s0,sp,8
 224:	ffe0                	sd	s0,248(a5)
 226:	ffff                	0xffff
 228:	00fc                	addi	a5,sp,76
 22a:	0000                	unimp
 22c:	0000                	unimp
 22e:	0000                	unimp
 230:	0e44                	addi	s1,sp,788
 232:	4820                	lw	s0,80(s0)
 234:	0281                	addi	t0,t0,0
 236:	0488                	addi	a0,sp,576
 238:	0c44                	addi	s1,sp,532
 23a:	0008                	0x8
 23c:	e002                	sd	zero,0(sp)
 23e:	44c1                	li	s1,16
 240:	0cc8                	addi	a0,sp,596
 242:	2002                	fld	ft0,0(sp)
 244:	0e44                	addi	s1,sp,788
 246:	0000                	unimp
 248:	0024                	addi	s1,sp,8
 24a:	0000                	unimp
 24c:	0178                	addi	a4,sp,140
 24e:	0000                	unimp
 250:	0930                	addi	a2,sp,152
 252:	0020                	addi	s0,sp,8
 254:	ffe0                	sd	s0,248(a5)
 256:	ffff                	0xffff
 258:	009c                	addi	a5,sp,64
 25a:	0000                	unimp
 25c:	0000                	unimp
 25e:	0000                	unimp
 260:	0e44                	addi	s1,sp,788
 262:	4830                	lw	a2,80(s0)
 264:	0281                	addi	t0,t0,0
 266:	0488                	addi	a0,sp,576
 268:	0c44                	addi	s1,sp,532
 26a:	0008                	0x8
 26c:	0000                	unimp
 26e:	0000                	unimp
 270:	002c                	addi	a1,sp,8
 272:	0000                	unimp
 274:	0178                	addi	a4,sp,140
 276:	0000                	unimp
 278:	09cc                	addi	a1,sp,212
 27a:	0020                	addi	s0,sp,8
 27c:	ffe0                	sd	s0,248(a5)
 27e:	ffff                	0xffff
 280:	0094                	addi	a3,sp,64
 282:	0000                	unimp
 284:	0000                	unimp
 286:	0000                	unimp
 288:	0e44                	addi	s1,sp,788
 28a:	4830                	lw	a2,80(s0)
 28c:	0281                	addi	t0,t0,0
 28e:	0488                	addi	a0,sp,576
 290:	0c44                	addi	s1,sp,532
 292:	0008                	0x8
 294:	7802                	ld	a6,32(sp)
 296:	44c1                	li	s1,16
 298:	0cc8                	addi	a0,sp,596
 29a:	3002                	fld	ft0,32(sp)
 29c:	0e44                	addi	s1,sp,788
 29e:	0000                	unimp
 2a0:	002c                	addi	a1,sp,8
 2a2:	0000                	unimp
 2a4:	0178                	addi	a4,sp,140
 2a6:	0000                	unimp
 2a8:	0a60                	addi	s0,sp,284
 2aa:	0020                	addi	s0,sp,8
 2ac:	ffe0                	sd	s0,248(a5)
 2ae:	ffff                	0xffff
 2b0:	0064                	addi	s1,sp,12
 2b2:	0000                	unimp
 2b4:	0000                	unimp
 2b6:	0000                	unimp
 2b8:	0e44                	addi	s1,sp,788
 2ba:	4810                	lw	a2,16(s0)
 2bc:	0281                	addi	t0,t0,0
 2be:	0488                	addi	a0,sp,576
 2c0:	0c44                	addi	s1,sp,532
 2c2:	0008                	0x8
 2c4:	4802                	lw	a6,0(sp)
 2c6:	44c1                	li	s1,16
 2c8:	0cc8                	addi	a0,sp,596
 2ca:	1002                	c.slli	zero,0x20
 2cc:	0e44                	addi	s1,sp,788
 2ce:	0000                	unimp
 2d0:	0034                	addi	a3,sp,8
 2d2:	0000                	unimp
 2d4:	0178                	addi	a4,sp,140
 2d6:	0000                	unimp
 2d8:	0ac4                	addi	s1,sp,340
 2da:	0020                	addi	s0,sp,8
 2dc:	ffe0                	sd	s0,248(a5)
 2de:	ffff                	0xffff
 2e0:	01c4                	addi	s1,sp,196
 2e2:	0000                	unimp
 2e4:	0000                	unimp
 2e6:	0000                	unimp
 2e8:	0e44                	addi	s1,sp,788
 2ea:	4c40                	lw	s0,28(s0)
 2ec:	0281                	addi	t0,t0,0
 2ee:	0488                	addi	a0,sp,576
 2f0:	0689                	addi	a3,a3,2
 2f2:	0c44                	addi	s1,sp,532
 2f4:	0008                	0x8
 2f6:	c101a003          	lw	zero,-1008(gp)
 2fa:	c844                	sw	s1,20(s0)
 2fc:	020c                	addi	a1,sp,256
 2fe:	4440                	lw	s0,12(s0)
 300:	44c9                	li	s1,18
 302:	000e                	c.slli	zero,0x3
 304:	0000                	unimp
 306:	0000                	unimp
 308:	002c                	addi	a1,sp,8
 30a:	0000                	unimp
 30c:	0178                	addi	a4,sp,140
 30e:	0000                	unimp
 310:	0c88                	addi	a0,sp,592
 312:	0020                	addi	s0,sp,8
 314:	ffe0                	sd	s0,248(a5)
 316:	ffff                	0xffff
 318:	01a0                	addi	s0,sp,200
 31a:	0000                	unimp
 31c:	0000                	unimp
 31e:	0000                	unimp
 320:	0e44                	addi	s1,sp,788
 322:	4830                	lw	a2,80(s0)
 324:	0281                	addi	t0,t0,0
 326:	0488                	addi	a0,sp,576
 328:	0c44                	addi	s1,sp,532
 32a:	0008                	0x8
 32c:	c1018403          	lb	s0,-1008(gp)
 330:	c844                	sw	s1,20(s0)
 332:	020c                	addi	a1,sp,256
 334:	4430                	lw	a2,72(s0)
 336:	000e                	c.slli	zero,0x3
 338:	002c                	addi	a1,sp,8
 33a:	0000                	unimp
 33c:	0178                	addi	a4,sp,140
 33e:	0000                	unimp
 340:	0e28                	addi	a0,sp,792
 342:	0020                	addi	s0,sp,8
 344:	ffe0                	sd	s0,248(a5)
 346:	ffff                	0xffff
 348:	004c                	addi	a1,sp,4
 34a:	0000                	unimp
 34c:	0000                	unimp
 34e:	0000                	unimp
 350:	0e44                	addi	s1,sp,788
 352:	4820                	lw	s0,80(s0)
 354:	0281                	addi	t0,t0,0
 356:	0488                	addi	a0,sp,576
 358:	0c44                	addi	s1,sp,532
 35a:	0008                	0x8
 35c:	c170                	sw	a2,68(a0)
 35e:	c844                	sw	s1,20(s0)
 360:	020c                	addi	a1,sp,256
 362:	4420                	lw	s0,72(s0)
 364:	000e                	c.slli	zero,0x3
 366:	0000                	unimp
 368:	000c                	0xc
 36a:	0000                	unimp
 36c:	ffff                	0xffff
 36e:	ffff                	0xffff
 370:	7c010003          	lb	zero,1984(sp)
 374:	0d01                	addi	s10,s10,0
 376:	0002                	c.slli64	zero
 378:	002c                	addi	a1,sp,8
 37a:	0000                	unimp
 37c:	0368                	addi	a0,sp,396
 37e:	0000                	unimp
 380:	0e74                	addi	a3,sp,796
 382:	0020                	addi	s0,sp,8
 384:	ffe0                	sd	s0,248(a5)
 386:	ffff                	0xffff
 388:	009c                	addi	a5,sp,64
 38a:	0000                	unimp
 38c:	0000                	unimp
 38e:	0000                	unimp
 390:	0e44                	addi	s1,sp,788
 392:	4470                	lw	a2,76(s0)
 394:	0288                	addi	a0,sp,320
 396:	0c44                	addi	s1,sp,532
 398:	0008                	0x8
 39a:	8802                	jr	a6
 39c:	0cc8                	addi	a0,sp,596
 39e:	7002                	0x7002
 3a0:	0e44                	addi	s1,sp,788
 3a2:	0000                	unimp
 3a4:	0000                	unimp
 3a6:	0000                	unimp
 3a8:	000c                	0xc
 3aa:	0000                	unimp
 3ac:	ffff                	0xffff
 3ae:	ffff                	0xffff
 3b0:	7c010003          	lb	zero,1984(sp)
 3b4:	0d01                	addi	s10,s10,0
 3b6:	0002                	c.slli64	zero
 3b8:	002c                	addi	a1,sp,8
 3ba:	0000                	unimp
 3bc:	03a8                	addi	a0,sp,456
 3be:	0000                	unimp
 3c0:	0f10                	addi	a2,sp,912
 3c2:	0020                	addi	s0,sp,8
 3c4:	ffe0                	sd	s0,248(a5)
 3c6:	ffff                	0xffff
 3c8:	008c                	addi	a1,sp,64
 3ca:	0000                	unimp
 3cc:	0000                	unimp
 3ce:	0000                	unimp
 3d0:	0e44                	addi	s1,sp,788
 3d2:	4830                	lw	a2,80(s0)
 3d4:	0281                	addi	t0,t0,0
 3d6:	0488                	addi	a0,sp,576
 3d8:	0c44                	addi	s1,sp,532
 3da:	0008                	0x8
 3dc:	7002                	0x7002
 3de:	44c1                	li	s1,16
 3e0:	0cc8                	addi	a0,sp,596
 3e2:	3002                	fld	ft0,32(sp)
 3e4:	0e44                	addi	s1,sp,788
 3e6:	0000                	unimp
 3e8:	002c                	addi	a1,sp,8
 3ea:	0000                	unimp
 3ec:	03a8                	addi	a0,sp,456
 3ee:	0000                	unimp
 3f0:	0f9c                	addi	a5,sp,976
 3f2:	0020                	addi	s0,sp,8
 3f4:	ffe0                	sd	s0,248(a5)
 3f6:	ffff                	0xffff
 3f8:	0038                	addi	a4,sp,8
 3fa:	0000                	unimp
 3fc:	0000                	unimp
 3fe:	0000                	unimp
 400:	0e44                	addi	s1,sp,788
 402:	4420                	lw	s0,72(s0)
 404:	0288                	addi	a0,sp,320
 406:	0c44                	addi	s1,sp,532
 408:	0008                	0x8
 40a:	c864                	sw	s1,84(s0)
 40c:	020c                	addi	a1,sp,256
 40e:	4420                	lw	s0,72(s0)
 410:	000e                	c.slli	zero,0x3
 412:	0000                	unimp
 414:	0000                	unimp
 416:	0000                	unimp
 418:	002c                	addi	a1,sp,8
 41a:	0000                	unimp
 41c:	03a8                	addi	a0,sp,456
 41e:	0000                	unimp
 420:	0fd4                	addi	a3,sp,980
 422:	0020                	addi	s0,sp,8
 424:	ffe0                	sd	s0,248(a5)
 426:	ffff                	0xffff
 428:	0090                	addi	a2,sp,64
 42a:	0000                	unimp
 42c:	0000                	unimp
 42e:	0000                	unimp
 430:	0e44                	addi	s1,sp,788
 432:	4840                	lw	s0,20(s0)
 434:	0281                	addi	t0,t0,0
 436:	0488                	addi	a0,sp,576
 438:	0c44                	addi	s1,sp,532
 43a:	0008                	0x8
 43c:	7402                	ld	s0,32(sp)
 43e:	44c1                	li	s1,16
 440:	0cc8                	addi	a0,sp,596
 442:	4002                	0x4002
 444:	0e44                	addi	s1,sp,788
 446:	0000                	unimp
 448:	002c                	addi	a1,sp,8
 44a:	0000                	unimp
 44c:	03a8                	addi	a0,sp,456
 44e:	0000                	unimp
 450:	1064                	addi	s1,sp,44
 452:	0020                	addi	s0,sp,8
 454:	ffe0                	sd	s0,248(a5)
 456:	ffff                	0xffff
 458:	003c                	addi	a5,sp,8
 45a:	0000                	unimp
 45c:	0000                	unimp
 45e:	0000                	unimp
 460:	0e44                	addi	s1,sp,788
 462:	4810                	lw	a2,16(s0)
 464:	0281                	addi	t0,t0,0
 466:	0488                	addi	a0,sp,576
 468:	0c44                	addi	s1,sp,532
 46a:	0008                	0x8
 46c:	c160                	sw	s0,68(a0)
 46e:	c844                	sw	s1,20(s0)
 470:	020c                	addi	a1,sp,256
 472:	4410                	lw	a2,8(s0)
 474:	000e                	c.slli	zero,0x3
 476:	0000                	unimp
 478:	0034                	addi	a3,sp,8
 47a:	0000                	unimp
 47c:	03a8                	addi	a0,sp,456
 47e:	0000                	unimp
 480:	10a0                	addi	s0,sp,104
 482:	0020                	addi	s0,sp,8
 484:	ffe0                	sd	s0,248(a5)
 486:	ffff                	0xffff
 488:	0264                	addi	s1,sp,268
 48a:	0000                	unimp
 48c:	0000                	unimp
 48e:	0000                	unimp
 490:	0e44                	addi	s1,sp,788
 492:	4c60                	lw	s0,92(s0)
 494:	0281                	addi	t0,t0,0
 496:	0488                	addi	a0,sp,576
 498:	0689                	addi	a3,a3,2
 49a:	0c44                	addi	s1,sp,532
 49c:	0008                	0x8
 49e:	c1024003          	lbu	zero,-1008(tp) # fffffffffffe0c10 <_ebss+0x1fffdd6c70>
 4a2:	c844                	sw	s1,20(s0)
 4a4:	020c                	addi	a1,sp,256
 4a6:	4460                	lw	s0,76(s0)
 4a8:	44c9                	li	s1,18
 4aa:	000e                	c.slli	zero,0x3
 4ac:	0000                	unimp
 4ae:	0000                	unimp
 4b0:	000c                	0xc
 4b2:	0000                	unimp
 4b4:	ffff                	0xffff
 4b6:	ffff                	0xffff
 4b8:	7c010003          	lb	zero,1984(sp)
 4bc:	0d01                	addi	s10,s10,0
 4be:	0002                	c.slli64	zero
 4c0:	002c                	addi	a1,sp,8
 4c2:	0000                	unimp
 4c4:	04b0                	addi	a2,sp,584
 4c6:	0000                	unimp
 4c8:	1304                	addi	s1,sp,416
 4ca:	0020                	addi	s0,sp,8
 4cc:	ffe0                	sd	s0,248(a5)
 4ce:	ffff                	0xffff
 4d0:	0070                	addi	a2,sp,12
 4d2:	0000                	unimp
 4d4:	0000                	unimp
 4d6:	0000                	unimp
 4d8:	0e44                	addi	s1,sp,788
 4da:	4420                	lw	s0,72(s0)
 4dc:	0288                	addi	a0,sp,320
 4de:	0c44                	addi	s1,sp,532
 4e0:	0008                	0x8
 4e2:	5c02                	lw	s8,32(sp)
 4e4:	0cc8                	addi	a0,sp,596
 4e6:	2002                	fld	ft0,0(sp)
 4e8:	0e44                	addi	s1,sp,788
 4ea:	0000                	unimp
 4ec:	0000                	unimp
 4ee:	0000                	unimp
 4f0:	003c                	addi	a5,sp,8
 4f2:	0000                	unimp
 4f4:	04b0                	addi	a2,sp,584
 4f6:	0000                	unimp
 4f8:	1374                	addi	a3,sp,428
 4fa:	0020                	addi	s0,sp,8
 4fc:	ffe0                	sd	s0,248(a5)
 4fe:	ffff                	0xffff
 500:	0180                	addi	s0,sp,192
 502:	0000                	unimp
 504:	0000                	unimp
 506:	0000                	unimp
 508:	0e44                	addi	s1,sp,788
 50a:	5460                	lw	s0,108(s0)
 50c:	0281                	addi	t0,t0,0
 50e:	0488                	addi	a0,sp,576
 510:	0689                	addi	a3,a3,2
 512:	0892                	slli	a7,a7,0x4
 514:	0c440a93          	addi	s5,s0,196 # ffffffffffffa0c4 <_ebss+0x1fffdf0124>
 518:	0008                	0x8
 51a:	c1014c03          	lbu	s8,-1008(sp)
 51e:	c844                	sw	s1,20(s0)
 520:	020c                	addi	a1,sp,256
 522:	4460                	lw	s0,76(s0)
 524:	44c9                	li	s1,18
 526:	44d2                	lw	s1,20(sp)
 528:	000e44d3          	fadd.s	fs1,ft8,ft0,rmm
 52c:	0000                	unimp
 52e:	0000                	unimp
 530:	002c                	addi	a1,sp,8
 532:	0000                	unimp
 534:	04b0                	addi	a2,sp,584
 536:	0000                	unimp
 538:	14f4                	addi	a3,sp,620
 53a:	0020                	addi	s0,sp,8
 53c:	ffe0                	sd	s0,248(a5)
 53e:	ffff                	0xffff
 540:	00e8                	addi	a0,sp,76
 542:	0000                	unimp
 544:	0000                	unimp
 546:	0000                	unimp
 548:	0e44                	addi	s1,sp,788
 54a:	4830                	lw	a2,80(s0)
 54c:	0281                	addi	t0,t0,0
 54e:	0488                	addi	a0,sp,576
 550:	0c44                	addi	s1,sp,532
 552:	0008                	0x8
 554:	cc02                	sw	zero,24(sp)
 556:	44c1                	li	s1,16
 558:	0cc8                	addi	a0,sp,596
 55a:	3002                	fld	ft0,32(sp)
 55c:	0e44                	addi	s1,sp,788
 55e:	0000                	unimp
 560:	002c                	addi	a1,sp,8
 562:	0000                	unimp
 564:	04b0                	addi	a2,sp,584
 566:	0000                	unimp
 568:	15dc                	addi	a5,sp,740
 56a:	0020                	addi	s0,sp,8
 56c:	ffe0                	sd	s0,248(a5)
 56e:	ffff                	0xffff
 570:	013c                	addi	a5,sp,136
 572:	0000                	unimp
 574:	0000                	unimp
 576:	0000                	unimp
 578:	0e44                	addi	s1,sp,788
 57a:	4830                	lw	a2,80(s0)
 57c:	0281                	addi	t0,t0,0
 57e:	0488                	addi	a0,sp,576
 580:	0c44                	addi	s1,sp,532
 582:	0008                	0x8
 584:	c1012003          	lw	zero,-1008(sp)
 588:	c844                	sw	s1,20(s0)
 58a:	020c                	addi	a1,sp,256
 58c:	4430                	lw	a2,72(s0)
 58e:	000e                	c.slli	zero,0x3
 590:	000c                	0xc
 592:	0000                	unimp
 594:	ffff                	0xffff
 596:	ffff                	0xffff
 598:	7c010003          	lb	zero,1984(sp)
 59c:	0d01                	addi	s10,s10,0
 59e:	0002                	c.slli64	zero
 5a0:	002c                	addi	a1,sp,8
 5a2:	0000                	unimp
 5a4:	0590                	addi	a2,sp,704
 5a6:	0000                	unimp
 5a8:	1718                	addi	a4,sp,928
 5aa:	0020                	addi	s0,sp,8
 5ac:	ffe0                	sd	s0,248(a5)
 5ae:	ffff                	0xffff
 5b0:	0074                	addi	a3,sp,12
 5b2:	0000                	unimp
 5b4:	0000                	unimp
 5b6:	0000                	unimp
 5b8:	0e44                	addi	s1,sp,788
 5ba:	4430                	lw	a2,72(s0)
 5bc:	0288                	addi	a0,sp,320
 5be:	0c44                	addi	s1,sp,532
 5c0:	0008                	0x8
 5c2:	6002                	0x6002
 5c4:	0cc8                	addi	a0,sp,596
 5c6:	3002                	fld	ft0,32(sp)
 5c8:	0e44                	addi	s1,sp,788
 5ca:	0000                	unimp
 5cc:	0000                	unimp
 5ce:	0000                	unimp
 5d0:	002c                	addi	a1,sp,8
 5d2:	0000                	unimp
 5d4:	0590                	addi	a2,sp,704
 5d6:	0000                	unimp
 5d8:	178c                	addi	a1,sp,992
 5da:	0020                	addi	s0,sp,8
 5dc:	ffe0                	sd	s0,248(a5)
 5de:	ffff                	0xffff
 5e0:	0078                	addi	a4,sp,12
 5e2:	0000                	unimp
 5e4:	0000                	unimp
 5e6:	0000                	unimp
 5e8:	0e44                	addi	s1,sp,788
 5ea:	4440                	lw	s0,12(s0)
 5ec:	0288                	addi	a0,sp,320
 5ee:	0c44                	addi	s1,sp,532
 5f0:	0008                	0x8
 5f2:	6402                	ld	s0,0(sp)
 5f4:	0cc8                	addi	a0,sp,596
 5f6:	4002                	0x4002
 5f8:	0e44                	addi	s1,sp,788
 5fa:	0000                	unimp
 5fc:	0000                	unimp
 5fe:	0000                	unimp
 600:	002c                	addi	a1,sp,8
 602:	0000                	unimp
 604:	0590                	addi	a2,sp,704
 606:	0000                	unimp
 608:	1804                	addi	s1,sp,48
 60a:	0020                	addi	s0,sp,8
 60c:	ffe0                	sd	s0,248(a5)
 60e:	ffff                	0xffff
 610:	009c                	addi	a5,sp,64
 612:	0000                	unimp
 614:	0000                	unimp
 616:	0000                	unimp
 618:	0e44                	addi	s1,sp,788
 61a:	4430                	lw	a2,72(s0)
 61c:	0288                	addi	a0,sp,320
 61e:	0c44                	addi	s1,sp,532
 620:	0008                	0x8
 622:	8802                	jr	a6
 624:	0cc8                	addi	a0,sp,596
 626:	3002                	fld	ft0,32(sp)
 628:	0e44                	addi	s1,sp,788
 62a:	0000                	unimp
 62c:	0000                	unimp
 62e:	0000                	unimp
 630:	002c                	addi	a1,sp,8
 632:	0000                	unimp
 634:	0590                	addi	a2,sp,704
 636:	0000                	unimp
 638:	18a0                	addi	s0,sp,120
 63a:	0020                	addi	s0,sp,8
 63c:	ffe0                	sd	s0,248(a5)
 63e:	ffff                	0xffff
 640:	00d4                	addi	a3,sp,68
 642:	0000                	unimp
 644:	0000                	unimp
 646:	0000                	unimp
 648:	0e44                	addi	s1,sp,788
 64a:	4840                	lw	s0,20(s0)
 64c:	0281                	addi	t0,t0,0
 64e:	0488                	addi	a0,sp,576
 650:	0c44                	addi	s1,sp,532
 652:	0008                	0x8
 654:	b802                	fsd	ft0,48(sp)
 656:	44c1                	li	s1,16
 658:	0cc8                	addi	a0,sp,596
 65a:	4002                	0x4002
 65c:	0e44                	addi	s1,sp,788
 65e:	0000                	unimp
 660:	002c                	addi	a1,sp,8
 662:	0000                	unimp
 664:	0590                	addi	a2,sp,704
 666:	0000                	unimp
 668:	1974                	addi	a3,sp,188
 66a:	0020                	addi	s0,sp,8
 66c:	ffe0                	sd	s0,248(a5)
 66e:	ffff                	0xffff
 670:	006c                	addi	a1,sp,12
 672:	0000                	unimp
 674:	0000                	unimp
 676:	0000                	unimp
 678:	0e44                	addi	s1,sp,788
 67a:	4830                	lw	a2,80(s0)
 67c:	0281                	addi	t0,t0,0
 67e:	0488                	addi	a0,sp,576
 680:	0c44                	addi	s1,sp,532
 682:	0008                	0x8
 684:	5002                	0x5002
 686:	44c1                	li	s1,16
 688:	0cc8                	addi	a0,sp,596
 68a:	3002                	fld	ft0,32(sp)
 68c:	0e44                	addi	s1,sp,788
 68e:	0000                	unimp
 690:	002c                	addi	a1,sp,8
 692:	0000                	unimp
 694:	0590                	addi	a2,sp,704
 696:	0000                	unimp
 698:	19e0                	addi	s0,sp,252
 69a:	0020                	addi	s0,sp,8
 69c:	ffe0                	sd	s0,248(a5)
 69e:	ffff                	0xffff
 6a0:	0030                	addi	a2,sp,8
 6a2:	0000                	unimp
 6a4:	0000                	unimp
 6a6:	0000                	unimp
 6a8:	0e44                	addi	s1,sp,788
 6aa:	4420                	lw	s0,72(s0)
 6ac:	0288                	addi	a0,sp,320
 6ae:	0c44                	addi	s1,sp,532
 6b0:	0008                	0x8
 6b2:	c85c                	sw	a5,20(s0)
 6b4:	020c                	addi	a1,sp,256
 6b6:	4420                	lw	s0,72(s0)
 6b8:	000e                	c.slli	zero,0x3
 6ba:	0000                	unimp
 6bc:	0000                	unimp
 6be:	0000                	unimp
 6c0:	002c                	addi	a1,sp,8
 6c2:	0000                	unimp
 6c4:	0590                	addi	a2,sp,704
 6c6:	0000                	unimp
 6c8:	1a10                	addi	a2,sp,304
 6ca:	0020                	addi	s0,sp,8
 6cc:	ffe0                	sd	s0,248(a5)
 6ce:	ffff                	0xffff
 6d0:	0030                	addi	a2,sp,8
 6d2:	0000                	unimp
 6d4:	0000                	unimp
 6d6:	0000                	unimp
 6d8:	0e44                	addi	s1,sp,788
 6da:	4420                	lw	s0,72(s0)
 6dc:	0288                	addi	a0,sp,320
 6de:	0c44                	addi	s1,sp,532
 6e0:	0008                	0x8
 6e2:	c85c                	sw	a5,20(s0)
 6e4:	020c                	addi	a1,sp,256
 6e6:	4420                	lw	s0,72(s0)
 6e8:	000e                	c.slli	zero,0x3
 6ea:	0000                	unimp
 6ec:	0000                	unimp
 6ee:	0000                	unimp
 6f0:	002c                	addi	a1,sp,8
 6f2:	0000                	unimp
 6f4:	0590                	addi	a2,sp,704
 6f6:	0000                	unimp
 6f8:	1a40                	addi	s0,sp,308
 6fa:	0020                	addi	s0,sp,8
 6fc:	ffe0                	sd	s0,248(a5)
 6fe:	ffff                	0xffff
 700:	0070                	addi	a2,sp,12
 702:	0000                	unimp
 704:	0000                	unimp
 706:	0000                	unimp
 708:	0e44                	addi	s1,sp,788
 70a:	4430                	lw	a2,72(s0)
 70c:	0288                	addi	a0,sp,320
 70e:	0c44                	addi	s1,sp,532
 710:	0008                	0x8
 712:	5c02                	lw	s8,32(sp)
 714:	0cc8                	addi	a0,sp,596
 716:	3002                	fld	ft0,32(sp)
 718:	0e44                	addi	s1,sp,788
 71a:	0000                	unimp
 71c:	0000                	unimp
 71e:	0000                	unimp
 720:	002c                	addi	a1,sp,8
 722:	0000                	unimp
 724:	0590                	addi	a2,sp,704
 726:	0000                	unimp
 728:	1ab0                	addi	a2,sp,376
 72a:	0020                	addi	s0,sp,8
 72c:	ffe0                	sd	s0,248(a5)
 72e:	ffff                	0xffff
 730:	0038                	addi	a4,sp,8
 732:	0000                	unimp
 734:	0000                	unimp
 736:	0000                	unimp
 738:	0e44                	addi	s1,sp,788
 73a:	4420                	lw	s0,72(s0)
 73c:	0288                	addi	a0,sp,320
 73e:	0c44                	addi	s1,sp,532
 740:	0008                	0x8
 742:	c864                	sw	s1,84(s0)
 744:	020c                	addi	a1,sp,256
 746:	4420                	lw	s0,72(s0)
 748:	000e                	c.slli	zero,0x3
 74a:	0000                	unimp
 74c:	0000                	unimp
 74e:	0000                	unimp
 750:	002c                	addi	a1,sp,8
 752:	0000                	unimp
 754:	0590                	addi	a2,sp,704
 756:	0000                	unimp
 758:	1ae8                	addi	a0,sp,380
 75a:	0020                	addi	s0,sp,8
 75c:	ffe0                	sd	s0,248(a5)
 75e:	ffff                	0xffff
 760:	0040                	addi	s0,sp,4
 762:	0000                	unimp
 764:	0000                	unimp
 766:	0000                	unimp
 768:	0e44                	addi	s1,sp,788
 76a:	4820                	lw	s0,80(s0)
 76c:	0281                	addi	t0,t0,0
 76e:	0488                	addi	a0,sp,576
 770:	0c44                	addi	s1,sp,532
 772:	0008                	0x8
 774:	c164                	sw	s1,68(a0)
 776:	c844                	sw	s1,20(s0)
 778:	020c                	addi	a1,sp,256
 77a:	4420                	lw	s0,72(s0)
 77c:	000e                	c.slli	zero,0x3
 77e:	0000                	unimp
 780:	002c                	addi	a1,sp,8
 782:	0000                	unimp
 784:	0590                	addi	a2,sp,704
 786:	0000                	unimp
 788:	1b28                	addi	a0,sp,440
 78a:	0020                	addi	s0,sp,8
 78c:	ffe0                	sd	s0,248(a5)
 78e:	ffff                	0xffff
 790:	004c                	addi	a1,sp,4
 792:	0000                	unimp
 794:	0000                	unimp
 796:	0000                	unimp
 798:	0e44                	addi	s1,sp,788
 79a:	4430                	lw	a2,72(s0)
 79c:	0288                	addi	a0,sp,320
 79e:	0c44                	addi	s1,sp,532
 7a0:	0008                	0x8
 7a2:	c878                	sw	a4,84(s0)
 7a4:	020c                	addi	a1,sp,256
 7a6:	4430                	lw	a2,72(s0)
 7a8:	000e                	c.slli	zero,0x3
 7aa:	0000                	unimp
 7ac:	0000                	unimp
 7ae:	0000                	unimp
 7b0:	002c                	addi	a1,sp,8
 7b2:	0000                	unimp
 7b4:	0590                	addi	a2,sp,704
 7b6:	0000                	unimp
 7b8:	1b74                	addi	a3,sp,444
 7ba:	0020                	addi	s0,sp,8
 7bc:	ffe0                	sd	s0,248(a5)
 7be:	ffff                	0xffff
 7c0:	006c                	addi	a1,sp,12
 7c2:	0000                	unimp
 7c4:	0000                	unimp
 7c6:	0000                	unimp
 7c8:	0e44                	addi	s1,sp,788
 7ca:	4840                	lw	s0,20(s0)
 7cc:	0281                	addi	t0,t0,0
 7ce:	0488                	addi	a0,sp,576
 7d0:	0c44                	addi	s1,sp,532
 7d2:	0008                	0x8
 7d4:	5002                	0x5002
 7d6:	44c1                	li	s1,16
 7d8:	0cc8                	addi	a0,sp,596
 7da:	4002                	0x4002
 7dc:	0e44                	addi	s1,sp,788
 7de:	0000                	unimp
 7e0:	002c                	addi	a1,sp,8
 7e2:	0000                	unimp
 7e4:	0590                	addi	a2,sp,704
 7e6:	0000                	unimp
 7e8:	1be0                	addi	s0,sp,508
 7ea:	0020                	addi	s0,sp,8
 7ec:	ffe0                	sd	s0,248(a5)
 7ee:	ffff                	0xffff
 7f0:	0060                	addi	s0,sp,12
 7f2:	0000                	unimp
 7f4:	0000                	unimp
 7f6:	0000                	unimp
 7f8:	0e44                	addi	s1,sp,788
 7fa:	4820                	lw	s0,80(s0)
 7fc:	0281                	addi	t0,t0,0
 7fe:	0488                	addi	a0,sp,576
 800:	0c44                	addi	s1,sp,532
 802:	0008                	0x8
 804:	4402                	lw	s0,0(sp)
 806:	44c1                	li	s1,16
 808:	0cc8                	addi	a0,sp,596
 80a:	2002                	fld	ft0,0(sp)
 80c:	0e44                	addi	s1,sp,788
 80e:	0000                	unimp
 810:	002c                	addi	a1,sp,8
 812:	0000                	unimp
 814:	0590                	addi	a2,sp,704
 816:	0000                	unimp
 818:	1c40                	addi	s0,sp,564
 81a:	0020                	addi	s0,sp,8
 81c:	ffe0                	sd	s0,248(a5)
 81e:	ffff                	0xffff
 820:	00a0                	addi	s0,sp,72
 822:	0000                	unimp
 824:	0000                	unimp
 826:	0000                	unimp
 828:	0e44                	addi	s1,sp,788
 82a:	4840                	lw	s0,20(s0)
 82c:	0281                	addi	t0,t0,0
 82e:	0488                	addi	a0,sp,576
 830:	0c44                	addi	s1,sp,532
 832:	0008                	0x8
 834:	8402                	jr	s0
 836:	44c1                	li	s1,16
 838:	0cc8                	addi	a0,sp,596
 83a:	4002                	0x4002
 83c:	0e44                	addi	s1,sp,788
 83e:	0000                	unimp
 840:	0034                	addi	a3,sp,8
 842:	0000                	unimp
 844:	0590                	addi	a2,sp,704
 846:	0000                	unimp
 848:	1ce0                	addi	s0,sp,636
 84a:	0020                	addi	s0,sp,8
 84c:	ffe0                	sd	s0,248(a5)
 84e:	ffff                	0xffff
 850:	0158                	addi	a4,sp,132
 852:	0000                	unimp
 854:	0000                	unimp
 856:	0000                	unimp
 858:	0e44                	addi	s1,sp,788
 85a:	0190                	addi	a2,sp,192
 85c:	814c                	0x814c
 85e:	8802                	jr	a6
 860:	8904                	0x8904
 862:	4406                	lw	s0,64(sp)
 864:	080c                	addi	a1,sp,16
 866:	0300                	addi	s0,sp,384
 868:	0134                	addi	a3,sp,136
 86a:	44c1                	li	s1,16
 86c:	0cc8                	addi	a0,sp,596
 86e:	9002                	ebreak
 870:	4401                	li	s0,0
 872:	44c9                	li	s1,18
 874:	000e                	c.slli	zero,0x3
 876:	0000                	unimp
 878:	002c                	addi	a1,sp,8
 87a:	0000                	unimp
 87c:	0590                	addi	a2,sp,704
 87e:	0000                	unimp
 880:	1e38                	addi	a4,sp,824
 882:	0020                	addi	s0,sp,8
 884:	ffe0                	sd	s0,248(a5)
 886:	ffff                	0xffff
 888:	0068                	addi	a0,sp,12
 88a:	0000                	unimp
 88c:	0000                	unimp
 88e:	0000                	unimp
 890:	0e44                	addi	s1,sp,788
 892:	4860                	lw	s0,84(s0)
 894:	0281                	addi	t0,t0,0
 896:	0488                	addi	a0,sp,576
 898:	0c44                	addi	s1,sp,532
 89a:	0008                	0x8
 89c:	4c02                	lw	s8,0(sp)
 89e:	44c1                	li	s1,16
 8a0:	0cc8                	addi	a0,sp,596
 8a2:	6002                	0x6002
 8a4:	0e44                	addi	s1,sp,788
 8a6:	0000                	unimp
 8a8:	002c                	addi	a1,sp,8
 8aa:	0000                	unimp
 8ac:	0590                	addi	a2,sp,704
 8ae:	0000                	unimp
 8b0:	1ea0                	addi	s0,sp,888
 8b2:	0020                	addi	s0,sp,8
 8b4:	ffe0                	sd	s0,248(a5)
 8b6:	ffff                	0xffff
 8b8:	0118                	addi	a4,sp,128
 8ba:	0000                	unimp
 8bc:	0000                	unimp
 8be:	0000                	unimp
 8c0:	0e44                	addi	s1,sp,788
 8c2:	4820                	lw	s0,80(s0)
 8c4:	0281                	addi	t0,t0,0
 8c6:	0488                	addi	a0,sp,576
 8c8:	0c44                	addi	s1,sp,532
 8ca:	0008                	0x8
 8cc:	c100fc03          	0xc100fc03
 8d0:	c844                	sw	s1,20(s0)
 8d2:	020c                	addi	a1,sp,256
 8d4:	4420                	lw	s0,72(s0)
 8d6:	000e                	c.slli	zero,0x3
 8d8:	000c                	0xc
 8da:	0000                	unimp
 8dc:	ffff                	0xffff
 8de:	ffff                	0xffff
 8e0:	7c010003          	lb	zero,1984(sp)
 8e4:	0d01                	addi	s10,s10,0
 8e6:	0002                	c.slli64	zero
 8e8:	002c                	addi	a1,sp,8
 8ea:	0000                	unimp
 8ec:	08d8                	addi	a4,sp,84
 8ee:	0000                	unimp
 8f0:	1fb8                	addi	a4,sp,1016
 8f2:	0020                	addi	s0,sp,8
 8f4:	ffe0                	sd	s0,248(a5)
 8f6:	ffff                	0xffff
 8f8:	004c                	addi	a1,sp,4
 8fa:	0000                	unimp
 8fc:	0000                	unimp
 8fe:	0000                	unimp
 900:	0e44                	addi	s1,sp,788
 902:	4810                	lw	a2,16(s0)
 904:	0281                	addi	t0,t0,0
 906:	0488                	addi	a0,sp,576
 908:	0c44                	addi	s1,sp,532
 90a:	0008                	0x8
 90c:	3002                	fld	ft0,32(sp)
 90e:	44c1                	li	s1,16
 910:	0cc8                	addi	a0,sp,596
 912:	1002                	c.slli	zero,0x20
 914:	0e44                	addi	s1,sp,788
 916:	0000                	unimp
 918:	000c                	0xc
 91a:	0000                	unimp
 91c:	ffff                	0xffff
 91e:	ffff                	0xffff
 920:	7c010003          	lb	zero,1984(sp)
 924:	0d01                	addi	s10,s10,0
 926:	0002                	c.slli64	zero
 928:	0024                	addi	s1,sp,8
 92a:	0000                	unimp
 92c:	0918                	addi	a4,sp,144
 92e:	0000                	unimp
 930:	2004                	fld	fs1,0(s0)
 932:	0020                	addi	s0,sp,8
 934:	ffe0                	sd	s0,248(a5)
 936:	ffff                	0xffff
 938:	0010                	0x10
 93a:	0000                	unimp
 93c:	0000                	unimp
 93e:	0000                	unimp
 940:	0e44                	addi	s1,sp,788
 942:	4410                	lw	a2,8(s0)
 944:	0288                	addi	a0,sp,320
 946:	0c44                	addi	s1,sp,532
 948:	0008                	0x8
 94a:	0000                	unimp
 94c:	0000                	unimp
 94e:	0000                	unimp
 950:	000c                	0xc
 952:	0000                	unimp
 954:	ffff                	0xffff
 956:	ffff                	0xffff
 958:	7c010003          	lb	zero,1984(sp)
 95c:	0d01                	addi	s10,s10,0
 95e:	0002                	c.slli64	zero
 960:	002c                	addi	a1,sp,8
 962:	0000                	unimp
 964:	0950                	addi	a2,sp,148
 966:	0000                	unimp
 968:	2014                	fld	fa3,0(s0)
 96a:	0020                	addi	s0,sp,8
 96c:	ffe0                	sd	s0,248(a5)
 96e:	ffff                	0xffff
 970:	0050                	addi	a2,sp,4
 972:	0000                	unimp
 974:	0000                	unimp
 976:	0000                	unimp
 978:	0e44                	addi	s1,sp,788
 97a:	4820                	lw	s0,80(s0)
 97c:	0281                	addi	t0,t0,0
 97e:	0488                	addi	a0,sp,576
 980:	0c44                	addi	s1,sp,532
 982:	0008                	0x8
 984:	c174                	sw	a3,68(a0)
 986:	c844                	sw	s1,20(s0)
 988:	020c                	addi	a1,sp,256
 98a:	4420                	lw	s0,72(s0)
 98c:	000e                	c.slli	zero,0x3
 98e:	0000                	unimp
 990:	0034                	addi	a3,sp,8
 992:	0000                	unimp
 994:	0950                	addi	a2,sp,148
 996:	0000                	unimp
 998:	2064                	fld	fs1,192(s0)
 99a:	0020                	addi	s0,sp,8
 99c:	ffe0                	sd	s0,248(a5)
 99e:	ffff                	0xffff
 9a0:	04dc                	addi	a5,sp,580
 9a2:	0000                	unimp
 9a4:	0000                	unimp
 9a6:	0000                	unimp
 9a8:	0e44                	addi	s1,sp,788
 9aa:	01e0                	addi	s0,sp,204
 9ac:	8148                	0x8148
 9ae:	8802                	jr	a6
 9b0:	4404                	lw	s1,8(s0)
 9b2:	080c                	addi	a1,sp,16
 9b4:	0300                	addi	s0,sp,384
 9b6:	04c0                	addi	s0,sp,580
 9b8:	44c1                	li	s1,16
 9ba:	0cc8                	addi	a0,sp,596
 9bc:	e002                	sd	zero,0(sp)
 9be:	4401                	li	s0,0
 9c0:	000e                	c.slli	zero,0x3
 9c2:	0000                	unimp
 9c4:	0000                	unimp
 9c6:	0000                	unimp
 9c8:	002c                	addi	a1,sp,8
 9ca:	0000                	unimp
 9cc:	0950                	addi	a2,sp,148
 9ce:	0000                	unimp
 9d0:	2540                	fld	fs0,136(a0)
 9d2:	0020                	addi	s0,sp,8
 9d4:	ffe0                	sd	s0,248(a5)
 9d6:	ffff                	0xffff
 9d8:	0080                	addi	s0,sp,64
 9da:	0000                	unimp
 9dc:	0000                	unimp
 9de:	0000                	unimp
 9e0:	0e44                	addi	s1,sp,788
 9e2:	4870                	lw	a2,84(s0)
 9e4:	1281                	addi	t0,t0,-32
 9e6:	1488                	addi	a0,sp,608
 9e8:	0c44                	addi	s1,sp,532
 9ea:	4008                	lw	a0,0(s0)
 9ec:	6402                	ld	s0,0(sp)
 9ee:	44c1                	li	s1,16
 9f0:	0cc8                	addi	a0,sp,596
 9f2:	7002                	0x7002
 9f4:	0e44                	addi	s1,sp,788
 9f6:	0000                	unimp
 9f8:	000c                	0xc
 9fa:	0000                	unimp
 9fc:	ffff                	0xffff
 9fe:	ffff                	0xffff
 a00:	7c010003          	lb	zero,1984(sp)
 a04:	0d01                	addi	s10,s10,0
 a06:	0002                	c.slli64	zero
 a08:	002c                	addi	a1,sp,8
 a0a:	0000                	unimp
 a0c:	09f8                	addi	a4,sp,220
 a0e:	0000                	unimp
 a10:	25c0                	fld	fs0,136(a1)
 a12:	0020                	addi	s0,sp,8
 a14:	ffe0                	sd	s0,248(a5)
 a16:	ffff                	0xffff
 a18:	0300                	addi	s0,sp,384
 a1a:	0000                	unimp
 a1c:	0000                	unimp
 a1e:	0000                	unimp
 a20:	0e44                	addi	s1,sp,788
 a22:	4420                	lw	s0,72(s0)
 a24:	0288                	addi	a0,sp,320
 a26:	0c44                	addi	s1,sp,532
 a28:	0008                	0x8
 a2a:	c802ec03          	lwu	s8,-896(t0) # fffffffffffffc80 <_ebss+0x1fffdf5ce0>
 a2e:	020c                	addi	a1,sp,256
 a30:	4420                	lw	s0,72(s0)
 a32:	000e                	c.slli	zero,0x3
 a34:	0000                	unimp
 a36:	0000                	unimp
 a38:	002c                	addi	a1,sp,8
 a3a:	0000                	unimp
 a3c:	09f8                	addi	a4,sp,220
 a3e:	0000                	unimp
 a40:	28c0                	fld	fs0,144(s1)
 a42:	0020                	addi	s0,sp,8
 a44:	ffe0                	sd	s0,248(a5)
 a46:	ffff                	0xffff
 a48:	0058                	addi	a4,sp,4
 a4a:	0000                	unimp
 a4c:	0000                	unimp
 a4e:	0000                	unimp
 a50:	0e44                	addi	s1,sp,788
 a52:	4830                	lw	a2,80(s0)
 a54:	0281                	addi	t0,t0,0
 a56:	0488                	addi	a0,sp,576
 a58:	0c44                	addi	s1,sp,532
 a5a:	0008                	0x8
 a5c:	3c02                	fld	fs8,32(sp)
 a5e:	44c1                	li	s1,16
 a60:	0cc8                	addi	a0,sp,596
 a62:	3002                	fld	ft0,32(sp)
 a64:	0e44                	addi	s1,sp,788
 a66:	0000                	unimp
 a68:	000c                	0xc
 a6a:	0000                	unimp
 a6c:	ffff                	0xffff
 a6e:	ffff                	0xffff
 a70:	7c010003          	lb	zero,1984(sp)
 a74:	0d01                	addi	s10,s10,0
 a76:	0002                	c.slli64	zero
 a78:	002c                	addi	a1,sp,8
 a7a:	0000                	unimp
 a7c:	0a68                	addi	a0,sp,284
 a7e:	0000                	unimp
 a80:	2918                	fld	fa4,16(a0)
 a82:	0020                	addi	s0,sp,8
 a84:	ffe0                	sd	s0,248(a5)
 a86:	ffff                	0xffff
 a88:	006c                	addi	a1,sp,12
 a8a:	0000                	unimp
 a8c:	0000                	unimp
 a8e:	0000                	unimp
 a90:	0e44                	addi	s1,sp,788
 a92:	4440                	lw	s0,12(s0)
 a94:	0288                	addi	a0,sp,320
 a96:	0c44                	addi	s1,sp,532
 a98:	0008                	0x8
 a9a:	5802                	lw	a6,32(sp)
 a9c:	0cc8                	addi	a0,sp,596
 a9e:	4002                	0x4002
 aa0:	0e44                	addi	s1,sp,788
 aa2:	0000                	unimp
 aa4:	0000                	unimp
 aa6:	0000                	unimp
 aa8:	002c                	addi	a1,sp,8
 aaa:	0000                	unimp
 aac:	0a68                	addi	a0,sp,284
 aae:	0000                	unimp
 ab0:	2984                	fld	fs1,16(a1)
 ab2:	0020                	addi	s0,sp,8
 ab4:	ffe0                	sd	s0,248(a5)
 ab6:	ffff                	0xffff
 ab8:	0078                	addi	a4,sp,12
 aba:	0000                	unimp
 abc:	0000                	unimp
 abe:	0000                	unimp
 ac0:	0e44                	addi	s1,sp,788
 ac2:	4440                	lw	s0,12(s0)
 ac4:	0288                	addi	a0,sp,320
 ac6:	0c44                	addi	s1,sp,532
 ac8:	0008                	0x8
 aca:	6402                	ld	s0,0(sp)
 acc:	0cc8                	addi	a0,sp,596
 ace:	4002                	0x4002
 ad0:	0e44                	addi	s1,sp,788
 ad2:	0000                	unimp
 ad4:	0000                	unimp
	...
