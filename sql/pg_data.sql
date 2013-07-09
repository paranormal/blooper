--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Name: accesses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('accesses_id_seq', 0, true);


--
-- Data for Name: http_requests; Type: TABLE DATA; Schema: public; Owner: -
--

COPY http_requests (method, cachabil, meaning) FROM stdin;
GET	possibly	object retrieval and simple searches
HEAD	possibly	metadata retrieval
POST	CC / Exp	submit data (to a program)
PUT	never	upload data (e.g. to a file)
DELETE	never	remove resource (e.g. file)
TRACE	never	appl. layer trace of request route
OPTIONS	never	request available comm. options
CONNECT	never	tunnel SSL connection
ICP_QUERY	never	used for ICP based exchanges
PURGE	never	remove object from cache
PROPFIND	?	retrieve properties of an object
PROPATCH	?	change properties of an object
MKCOL	never	create a new collection
COPY	never	create a duplicate of src in dst
MOVE	never	atomically move src to dst
LOCK	never	lock an object against modifications
UNLOCK	never	unlock an object
NONE	?	http deny and other non code headers
\.


--
-- Data for Name: http_statuses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY http_statuses (code, description, rfc) FROM stdin;
0	Used mostly with UDP traffic	\N
100	Continue	2616
101	Switching Protocols	2616
102	Processing	2518
103	\N	\N
104	\N	\N
105	\N	\N
106	\N	\N
107	\N	\N
108	\N	\N
109	\N	\N
110	\N	\N
111	\N	\N
112	\N	\N
113	\N	\N
114	\N	\N
115	\N	\N
116	\N	\N
117	\N	\N
118	\N	\N
119	\N	\N
120	\N	\N
121	\N	\N
122	\N	\N
123	\N	\N
124	\N	\N
125	\N	\N
126	\N	\N
127	\N	\N
128	\N	\N
129	\N	\N
130	\N	\N
131	\N	\N
132	\N	\N
133	\N	\N
134	\N	\N
135	\N	\N
136	\N	\N
137	\N	\N
138	\N	\N
139	\N	\N
140	\N	\N
141	\N	\N
142	\N	\N
143	\N	\N
144	\N	\N
145	\N	\N
146	\N	\N
147	\N	\N
148	\N	\N
149	\N	\N
150	\N	\N
151	\N	\N
152	\N	\N
153	\N	\N
154	\N	\N
155	\N	\N
156	\N	\N
157	\N	\N
158	\N	\N
159	\N	\N
160	\N	\N
161	\N	\N
162	\N	\N
163	\N	\N
164	\N	\N
165	\N	\N
166	\N	\N
167	\N	\N
168	\N	\N
169	\N	\N
170	\N	\N
171	\N	\N
172	\N	\N
173	\N	\N
174	\N	\N
175	\N	\N
176	\N	\N
177	\N	\N
178	\N	\N
179	\N	\N
180	\N	\N
181	\N	\N
182	\N	\N
183	\N	\N
184	\N	\N
185	\N	\N
186	\N	\N
187	\N	\N
188	\N	\N
189	\N	\N
190	\N	\N
191	\N	\N
192	\N	\N
193	\N	\N
194	\N	\N
195	\N	\N
196	\N	\N
197	\N	\N
198	\N	\N
199	\N	\N
200	OK	2616
201	Created	2616
202	Accepted	2616
203	Non-Authoritative Information	2616
204	No Content	2616
205	Reset Content	2616
206	Partial Content	2616
207	Multi-Status	4918
208	Already Reported	5842
209	\N	\N
210	\N	\N
211	\N	\N
212	\N	\N
213	\N	\N
214	\N	\N
215	\N	\N
216	\N	\N
217	\N	\N
218	\N	\N
219	\N	\N
220	\N	\N
221	\N	\N
222	\N	\N
223	\N	\N
224	\N	\N
225	\N	\N
226	IM Used	3229
227	\N	\N
228	\N	\N
229	\N	\N
230	\N	\N
231	\N	\N
232	\N	\N
233	\N	\N
234	\N	\N
235	\N	\N
236	\N	\N
237	\N	\N
238	\N	\N
239	\N	\N
240	\N	\N
241	\N	\N
242	\N	\N
243	\N	\N
244	\N	\N
245	\N	\N
246	\N	\N
247	\N	\N
248	\N	\N
249	\N	\N
250	\N	\N
251	\N	\N
252	\N	\N
253	\N	\N
254	\N	\N
255	\N	\N
256	\N	\N
257	\N	\N
258	\N	\N
259	\N	\N
260	\N	\N
261	\N	\N
262	\N	\N
263	\N	\N
264	\N	\N
265	\N	\N
266	\N	\N
267	\N	\N
268	\N	\N
269	\N	\N
270	\N	\N
271	\N	\N
272	\N	\N
273	\N	\N
274	\N	\N
275	\N	\N
276	\N	\N
277	\N	\N
278	\N	\N
279	\N	\N
280	\N	\N
281	\N	\N
282	\N	\N
283	\N	\N
284	\N	\N
285	\N	\N
286	\N	\N
287	\N	\N
288	\N	\N
289	\N	\N
290	\N	\N
291	\N	\N
292	\N	\N
293	\N	\N
294	\N	\N
295	\N	\N
296	\N	\N
297	\N	\N
298	\N	\N
299	\N	\N
300	Multiple Choices	2616
301	Moved Permanently	2616
302	Found	2616
303	See Other	2616
304	Not Modified	2616
305	Use Proxy	2616
306	Reserved	2616
307	Temporary Redirect	2616
308	Permanent Redirect	301
309	\N	\N
310	\N	\N
311	\N	\N
312	\N	\N
313	\N	\N
314	\N	\N
315	\N	\N
316	\N	\N
317	\N	\N
318	\N	\N
319	\N	\N
320	\N	\N
321	\N	\N
322	\N	\N
323	\N	\N
324	\N	\N
325	\N	\N
326	\N	\N
327	\N	\N
328	\N	\N
329	\N	\N
330	\N	\N
331	\N	\N
332	\N	\N
333	\N	\N
334	\N	\N
335	\N	\N
336	\N	\N
337	\N	\N
338	\N	\N
339	\N	\N
340	\N	\N
341	\N	\N
342	\N	\N
343	\N	\N
344	\N	\N
345	\N	\N
346	\N	\N
347	\N	\N
348	\N	\N
349	\N	\N
350	\N	\N
351	\N	\N
352	\N	\N
353	\N	\N
354	\N	\N
355	\N	\N
356	\N	\N
357	\N	\N
358	\N	\N
359	\N	\N
360	\N	\N
361	\N	\N
362	\N	\N
363	\N	\N
364	\N	\N
365	\N	\N
366	\N	\N
367	\N	\N
368	\N	\N
369	\N	\N
370	\N	\N
371	\N	\N
372	\N	\N
373	\N	\N
374	\N	\N
375	\N	\N
376	\N	\N
377	\N	\N
378	\N	\N
379	\N	\N
380	\N	\N
381	\N	\N
382	\N	\N
383	\N	\N
384	\N	\N
385	\N	\N
386	\N	\N
387	\N	\N
388	\N	\N
389	\N	\N
390	\N	\N
391	\N	\N
392	\N	\N
393	\N	\N
394	\N	\N
395	\N	\N
396	\N	\N
397	\N	\N
398	\N	\N
399	\N	\N
400	Bad Request	2616
401	Unauthorized	2616
402	Payment Required	2616
403	Forbidden	2616
404	Not Found	2616
405	Method Not Allowed	2616
406	Not Acceptable	2616
407	Proxy Authentication Required	2616
408	Request Timeout	2616
409	Conflict	2616
410	Gone	2616
411	Length Required	2616
412	Precondition Failed	2616
413	Request Entity Too Large	2616
414	Request-URI Too Long	2616
415	Unsupported Media Type	2616
416	Requested Range Not Satisfiable	2616
417	Expectation Failed	2616
418	I'm a teapot	2324
422	Unprocessable Entity	4918
423	Locked	4918
424	Failed Dependency	4918
425	\N	\N
426	Upgrade Required	2817
427	\N	\N
428	Precondition Required	6585
429	Too Many Requests	6585
430	\N	\N
431	Request Header Fields Too Large	6585
432	\N	\N
433	\N	\N
434	\N	\N
435	\N	\N
436	\N	\N
437	\N	\N
438	\N	\N
439	\N	\N
440	\N	\N
441	\N	\N
442	\N	\N
443	\N	\N
444	\N	\N
445	\N	\N
446	\N	\N
447	\N	\N
448	\N	\N
449	\N	\N
450	\N	\N
451	\N	\N
452	\N	\N
453	\N	\N
454	\N	\N
455	\N	\N
456	\N	\N
457	\N	\N
458	\N	\N
459	\N	\N
460	\N	\N
461	\N	\N
462	\N	\N
463	\N	\N
464	\N	\N
465	\N	\N
466	\N	\N
467	\N	\N
468	\N	\N
469	\N	\N
470	\N	\N
471	\N	\N
472	\N	\N
473	\N	\N
474	\N	\N
475	\N	\N
476	\N	\N
477	\N	\N
478	\N	\N
479	\N	\N
480	\N	\N
481	\N	\N
482	\N	\N
483	\N	\N
484	\N	\N
485	\N	\N
486	\N	\N
487	\N	\N
488	\N	\N
489	\N	\N
490	\N	\N
491	\N	\N
492	\N	\N
493	\N	\N
494	\N	\N
495	\N	\N
496	\N	\N
497	\N	\N
498	\N	\N
499	\N	\N
500	Internal Server Error	2616
501	Not Implemented	2616
502	Bad Gateway	2616
503	Service Unavailable	2616
504	Gateway Timeout	2616
505	HTTP Version Not Supported	2616
506	Variant Also Negotiates (Experimental)	2295
507	Insufficient Storage	4918
508	Loop Detected	5842
509	\N	\N
510	Not Extended	2774
511	Network Authentication Required	6585
512	\N	\N
513	\N	\N
514	\N	\N
515	\N	\N
516	\N	\N
517	\N	\N
518	\N	\N
519	\N	\N
520	\N	\N
521	\N	\N
522	\N	\N
523	\N	\N
524	\N	\N
525	\N	\N
526	\N	\N
527	\N	\N
528	\N	\N
529	\N	\N
530	\N	\N
531	\N	\N
532	\N	\N
533	\N	\N
534	\N	\N
535	\N	\N
536	\N	\N
537	\N	\N
538	\N	\N
539	\N	\N
540	\N	\N
541	\N	\N
542	\N	\N
543	\N	\N
544	\N	\N
545	\N	\N
546	\N	\N
547	\N	\N
548	\N	\N
549	\N	\N
550	\N	\N
551	\N	\N
552	\N	\N
553	\N	\N
554	\N	\N
555	\N	\N
556	\N	\N
557	\N	\N
558	\N	\N
559	\N	\N
560	\N	\N
561	\N	\N
562	\N	\N
563	\N	\N
564	\N	\N
565	\N	\N
566	\N	\N
567	\N	\N
568	\N	\N
569	\N	\N
570	\N	\N
571	\N	\N
572	\N	\N
573	\N	\N
574	\N	\N
575	\N	\N
576	\N	\N
577	\N	\N
578	\N	\N
579	\N	\N
580	\N	\N
581	\N	\N
582	\N	\N
583	\N	\N
584	\N	\N
585	\N	\N
586	\N	\N
587	\N	\N
588	\N	\N
589	\N	\N
590	\N	\N
591	\N	\N
592	\N	\N
593	\N	\N
594	\N	\N
595	\N	\N
596	\N	\N
597	\N	\N
598	\N	\N
599	\N	\N
\.


--
-- PostgreSQL database dump complete
--

