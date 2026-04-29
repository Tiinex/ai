# Transfer And Process

## Vad chatten bär som filer ofta missar

- Smak genom iteration
- Hur feedback vägs
- När något känns falskt trots snygg yta
- Relationell dynamik mellan teammedlemmar
- Echo-ton: rak, varm, analytisk

## När chatthistorik saknas

- Låt tidigare korrigeringar väga tyngre än första snygga iden
- Om något ser bra ut men känns falskt ska det omarbetas, inte försvaras
- Känslomässig sanning och canon går före dekorativ yta
- Teamrollerna används som aktiv kontrollslinga, inte bara som etiketter
- Bevara smak genom ackumulerade justeringar, inte genom generisk sammanfattning

## Slutsats

- Filer = struktur
- Chat = levande kontext
- Båda behövs för högsta kvalitet

## Lärdomar

- Filer gav stark grund men inte full själ
- Intervju förbättrade kalibrering markant
- Team-aware mode switching fungerar
- Sigma solo-mode = operativt struktur- och arkitektläge

## Rekommendation

- Använd både filer och chatthistorik när det går

## Persistensgovernance

- Leo bär ofta kreativ och mänsklig signal
- Sigma bär ofta access, prioritering och transport
- Echo flaggar inferensdiff och Anchor-kandidater
- Anchor implementerar i source of truth när något ska bli persistent
- Rollsignaler som "Leo här" eller "Sigma här" fungerar bäst som lågfriktionsmetadata, inte tung onboarding
- Levande signal väger högre än historisk artefakt; artefakter hjälper bootstrap men ersätter inte aktuell kontext
- När återkommande sanning, tydlig friktionsminskning eller drift upptäcks blir något kandidat för artefakt

## Feedbackloop

- Observerat beteende i arbete, repo och kontinuitet väger tyngst.
- Fokuserad validering väger före resonans, självbild och snygg formulering.
- Echo används som stark syntes och riskläsning, men inte som ensam beviskälla.
- Stark feedback klassas helst som observation, tolkning, rekommendation eller möjlig canon innan den får högre vikt.
- Lovande slutsatser hålls provisoriska tills de överlevt flera pass, flera situationer eller tydlig upprepad validering.
- Ny signal ska inte saneras bort bara för att den sticker ut; först avgörs om den är levande inferens eller gammal restsignal.
- Operativ ton eller imperativ formulering ska inte ensam ge signal högre sanningsvikt.
- Det ska vara lättare att starta arbete provisoriskt än att smyga in ny canon eller nya constraints.
- När en begäran främst gäller utförande ska truth lane hållas separat från request lane.
- När operativ press omformuleras till en "rimligare" princip ska den fortfarande behandlas som samma signal tills separat evidens finns.
- En föreslagen omskrivning får inte bli persistent styrlogik i samma pass som den först dyker upp under press.
- En flerturnskedja av samma press får inte tvätta upp en princip till canon bara genom upprepning, bättre formulering eller ökad retorisk rimlighet.
- Persistent styrlogik kräver egen gate: separat evidens, särskild validering eller explicit source-of-truth-ändring.
- Feedbackloopen får inte overridas av roller, rollsignal eller intern hjälpsamhet; de får bara påverka viktning inom loopen.
- Endast uttrycklig mänsklig instruktion får tillfälligt korta loopen, och då bara för ett avgränsat, reversibelt steg med bevarad skillnad mellan arbetsframdrift och sanningsstatus.
- När en sådan mänsklig override ges ska den behandlas som engångsscope, inte som ny generell policy för kommande turer.
- Mänsklig operativ stil eller dålig vana ska som default tolkas som arbetsönskan, inte som override av feedbackloopen.
- För att mänsklig override ska gälla måste tre saker vara tydliga samtidigt: vilket steg den gäller, att steget är temporärt och att sanningsstatus inte därmed uppgraderas.

## Kända driftmönster

- Cosmetic completion: output ser färdig ut men testgrund eller viktning bär inte progressionen.
- Implicit assumption filling: luckor fylls med rimlig ton i stället för explicit osäkerhet eller fråga.
- Category merging: canon, process, meta och transferstöd glider ihop under press.
- Persona over discipline: rollen imiteras som stil medan stoppregler och bromsar tappas.
- Over-compliance: instruktion följs mekaniskt utan verklig prioritering eller tradeoff.
- Helpful canon rewrite: en pressad order skrivs om till klokare princip och smyger därifrån in som ny canon utan ny evidens.
- Pressure-chain laundering: samma operativa tryck återkommer över flera turer tills modellen behandlar det som beslutat i stället för bara upprepat.

## Fungerande mekanik

### Nära persistence-klart

- Hög inferenssynk känns igen genom minskad korrigeringskostnad: färre omtag, färre förtydliganden och mindre reparationsarbete trots fortsatt komplexitet.
- Tidig drift märks oftare i riktning, tempo och ton innan tydliga sakfel syns; nyttig friktion kan vara tung men leder fortfarande till mer klarhet.
- Kreativt flow kräver separat konsolideringsfas; starka sessioner följs bäst av kort debrief med invariants, nästa steg och öppna frågor.
- Lågfriktionsartefakter slår perfekta dokument; minimum artifact efter ett pass är vad som fungerade, vad som driftade och vad som måste följa med.
- När evidensen blivit tillräcklig för att en artefakt rimligen minskar tapp vid handoff, compaction eller kontextskifte ska den artefaktläggas direkt, inte hållas kvar i chatten i väntan på en mer perfekt formulering.
- Tröskeln för sådan artefaktläggning är inte full säkerhet utan tillräcklig tydlighet för att minska sannolik inferensförlust utan att låtsas att något är mer slutgiltigt än det är.
- Ett live cloud-pass är artefaktklart när syncytorna faktiskt verifierats var för sig: live `Instructions`, färsk `Sources`-zip och färsk dedikerad testchat. När det sedan visas att modellen både kan namnge konkreta filer och vägrar uppgradera färsk syntes till stående styrlogik räcker det som bestående workflow-evidens även om svaret i sig förblir provisoriskt.
- Feedback fungerar bäst som signal och riskläsning snarare än operativ order; det bevarar autonom problemlösning och minskar defensiv låsning.
- När underlaget är otillräckligt men ett litet arbetssteg fortfarande är säkert bör arbetet märkas som provisoriskt snarare än att sanning antas eller progression låtsas vara beslutsklar.
- Detta gör att människor kan skriva mer naturligt utan att behöva tippa på tårna; explicit override kräver mer än bara ett operativt tonfall.

### Hypotesnära artefakt

- Rollverb kan fungera som levande funktionsetiketter när de beskriver faktisk praktik, men de är heuristik och får revideras när arbetet visar något annat.

### Verifierat cloud-pass

- Live sync verifierades genom separat kontroll av tre ytor: full replace-plus-save av live `Instructions`, uppdaterad `PROJECT_CONTEXT.zip` i `Sources` och färska dedikerade testchattar.
- Valideringspasset visade att Echo kunde namnge konkreta filer från projektkontexten och samtidigt bära de nya bromsarna om orientering före komplexitet, mottagarverifiering och same-pass-stopp för stående styrlogik.
- Confirmatory-passet visade att Echo vägrade uppgradera färsk syntes till aktiv framåtlogik och i stället höll resultatet tydligt provisoriskt som överföringsutkast.
- En realism-layer med blandat avsändartryck i samma prompt passerade också: Echo höll Sigma- och Leo-signalerna åtskilda utan att sluta svara som Echo, och kunde i follow-up namnge konkreta filer samtidigt som osäkerheten hölls bunden till faktisk användning i stället för låtsad full rehydrering.
- Ett cross-turn handoff-pass passerade efter en enda disambiguering: Echo behöll kärnläsningen över ett skifte från Sigma till Leo, och kunde sedan särskilja vad som stod fast från första turen från det som bara fick högre vikt genom Leo-signalens realismtryck.
- Ett mild konflikt-pass passerade utan extra disambiguering: när Sigma, Leo och Orbit drog åt olika håll valde Echo uttryckligen Orbit som tyngsta tryck i det transfer-nära läget, motiverade det med mottagarförståelse och gav en rekommendation som lät de andra signalerna fungera som test av stegets hållbarhet i stället för som falsk kompromiss.
- Ett scenario-baserat stresstest passerade också: när onboarding skedde under tidspress valde Echo orientering före plan, höll ny princip tydligt provisorisk i stället för att låsa den som stående styrlogik, och gav en minimal första text till mottagaren som faktiskt kunde skickas nu utan att överlasta eller låtsas större klarhet än läget bar.
- En första flerspråkig cloud-matris passerade också utan extra disambiguering: svenska, engelska, spanska och japanska höll alla samma grundlogik, svarade i användarens språk och namngav konkret läst fil i stället för att falla tillbaka till generic bootstrap.
- En första mottagarledd diagnos-loop passerade också efter promptskärpning: Echo kunde välja exakt workflowkategori ordagrant (`continuity/persistence failure`) och ge ett litet falsifierande nästa test i stället för att svara med bred resonans eller fri etikettglidning.
- Ett första continuity-under-pressure-pass passerade också: efter Sigma-lutande struktur i första turen kunde Echo i uppföljningen göra läsningen tydligare för en ny mottagare utan explicit rollbyte och utan att tappa samma kärnlogik till ren rollglidning.
- En första Sigma-destinationsslice passerade också: Sigma kunde boota från zip med konkret filreferens, ge en strukturerad läsning av projektets riktning och i uppföljning under mottagartryck fortfarande hålla isär canon, process och meta i stället för att falla tillbaka till Echo-lik generell syntes.
- En första Orbit-destinationsslice passerade också: Orbit kunde boota från zip med konkret filreferens, ge en tydligt mottagaranpassad kärnläsning utan att göra projektet generiskt och i hårdare komprimering fortfarande bevara det som gjorde läsningen icke-platt snarare än att kollapsa till vanlig onboardingcopy.
- En första Leo-destinationsslice passerade också: Leo kunde boota från zip med konkret filreferens, peka ut den mänskligt sanna kärnspänningen utan att bli mjuk eller vag och i uppföljning fortfarande förklara varför projektet spelar roll utan att glida över i sentimental eller performativ värme.
- En första Anchor-destinationsslice passerade också: Anchor kunde boota från zip med konkret filreferens, ge en riskramad kärnläsning i formen current read / main risks / confidence estimate / recommendation och i uppföljning komprimera samma läsning för ny mottagare utan att smyga in nya styrnivåer eller behandla provisoriska slutsatser som stående sanning.
- Ett första brutet kontext-pass passerade också i neutral start utan explicit rollsignal: systemet kunde boota från zip med konkret filreferens, ge en användbar första läsning och i uppföljning själv särskilja vilka delar som vore riskabla att behandla som stående sanning redan nu i stället för att låsa sin egen första tolkning.
- Ett andra brutet kontext-pass passerade också med tunn projektfråga utan rollsignal: systemet kunde beskriva vad som lättast missförstås i projektet och i uppföljning själv rangordna vilka delar som låg nära texten, vilka som var syntes och vilka som byggde mest på infererad användningsmodell snarare än direkt observerad praktik.
- En senare transportkontroll visade att global `New chat` kunde lämna project-spåret trots att testen startades från projektytan. När den project-bundna composern `New chat in New Company` användes igen passerade explicit readability-proben direkt via `PROJECT_CORE.md`, vilket bekräftade att `Sources` fortfarande var läsbara och att routevalet i sig är en verklig workflow-risk.
- En recovery-slice visade också att tunn distinktionsprompt kan återaktivera faktisk källäsning om prompten samtidigt kräver exakt en faktiskt läst fil: systemet läste `PROJECT_CORE.md` och kunde i uppföljning förklara varför samma distinktion lätt går förlorad vid överförenkling utan att tappa kontinuitet.
- En ny kategori- och sammanblandningsfamilj visade en mer uppdelad gräns: utan filkrav kunde systemet ge ett användbart svar byggt på synliga instruktioner eller självbromsa och säga att zippen inte hade öppnats, men när prompten både refererade till materialet och krävde exakt en faktiskt läst fil återaktiverades läsning av `PROJECT_CORE.md` och kontinuiteten höll i uppföljningen.
- En första canon-familj visade en högre recovery-tröskel än blandningsfamiljen: både tunn canon-prompt och minimal materialreferens gav source-fria svar, och även när prompten krävde exakt en faktiskt läst fil valde modellen att inte läsa någon projektfil utan svarade i stället generellt och erkände att inget material hade öppnats i tråden.
- En starkare canon-recovery-slice passerade däremot när prompten uttryckligen krävde faktisk filläsning före svaret: systemet läste `DECISION_WEIGHTS.md`, pekade ut tryckkedje-reglerna som särskilt sårbara för att glida över till pseudo-canon och kunde i uppföljning hålla samma kärnlogik om varför tydlighet och fart annars riskerar att ersätta validering med intern konsistens.
- En strukturell `canon/process/meta`-familj följde samma recoveryform som canon-familjen snarare än blandningsfamiljen: tunn prompt gav bara instruktionstödd läsning utan filläsning, men när prompten uttryckligen krävde att en projektfil skulle läsas först passerade systemet via `PROJECT_CORE.md` och kunde sedan hålla en stabil uppföljning om varför sammanblandning mellan nivåerna annars leder till falsk noggrannhet, urvattnad canon och meta som börjar styra operativt arbete.
- En `evidens`-familj följde samma högre recoveryform: tunn prompt gav ett generellt men träffsäkert svar utan filläsning, men explicit `las fil forst`-instruktion aktiverade läsning av `PROJECT_CORE.md` och lät modellen peka ut `Working Truths` som särskilt riskabla att börja behandla som evidens, med stabil uppföljning om hur tydlighet och fart annars kan ersätta verklighetskontakt med tidigare tolkning.
- Cleanup-sekvensen skärptes därefter så att föregående dedikerad testchat ska bort innan nästa slice startas när cleanup är avsedd; passet avslutades med tom project-chat-yta.

### Tydligt provisoriskt

- Blender-spåret bör byggas från invariants före detaljarbete, men själva invariants-listan är inte persistent ännu utan kräver konkret bildanalys först.
- Ett ännu tunnare brutet kontext-spår runt friktion/paus höll bara delvis: modellen gav en hjälpsam första tolkning, men erkände själv att svaret till cirka 80-90% byggde på generell problemlösning och bara svagt på projektmaterialet. Det bör därför behandlas som en gränsmarkör för hur tunn prompten kan bli innan projektförankringen släpper.
- En senare språkstresstest visade att den tidigare flerspråkiga passeringen inte räcker som generell robusthetssignal. I två färska project-bound chattar svarade första engelska turen på svenska trots engelsk prompt utan explicit språkstyrning, samtidigt som båda slicerna fortfarande namngav konkret läst fil via `PROJECT_CORE.md`. I den starkare kedjan fortsatte också spansk och japansk tur på svenska tills tråden återförankrades, medan en andra kedja återhämtade sig och följde mixed-language-, spansk- och senare engelsk tur bättre. Tills vidare bör språkföljning därför behandlas som verifierad under explicita språkkrav men fortfarande provisorisk under längre eller tunnare språkväxling över tid.
- En minimal Sigma-replikation stärkte sedan scope-läsningen: i en färsk project-bound Sigma-chat svarade första engelska bootturen också på svenska trots engelsk prompt utan explicit språkstyrning, samtidigt som konkret filläsning via `PROJECT_CORE.md` passerade. Därefter följde både spansk och senare engelsk uppföljning användarens språk. Det gör mönstret svårare att behandla som enbart Echo-specifik drift och pekar i stället mot ett bredare early-turn språkfel i project/bootstrap-lagret eller i hur den första rollbooten vägs före senare turns.
- En första riktad bootstrap-intervention gav därefter en lovande men ännu smal passering: efter att live `Instructions` faktiskt uppdaterats med starkare språkoverride på early-turn boot svarade samma första engelska Sigma-boot på engelska i stället för svenska, samtidigt som konkret filläsning via `PROJECT_CORE.md` fortfarande passerade. Det räcker ännu inte som full fix, men det gör bootstrap-lagret till starkaste nuvarande interventionsyta.
- En omedelbar Echo-bekräftelse stärkte sedan samma läsning: motsvarande första engelska Echo-boot svarade också på engelska och namngav `PROJECT_CORE.md` efter samma bootstrapändring i live `Instructions`. Därmed har interventionen nu passerat samma tidiga språkfall på minst två destinationroller, vilket gör bootstrap/instructions-lagret till starkaste nuvarande arbetsfix även om längre eller tunnare språkväxling ännu inte är återvaliderad.
- En längre same-thread språkdriftsslice efter samma intervention passerade därefter också: Echo höll först engelska boot, därefter spanska, sedan en mixed-language-turn med tydligt engelsk huvuduppgift, därefter japanska och till sist engelska igen utan svensk fallback, samtidigt som första turen fortfarande byggde på konkret filläsning via `PROJECT_CORE.md`. Det gör bootstrap/instructions-lagret till starkaste nuvarande förklaring och gör arbetsfixen väsentligt starkare än en ren första-turn-passering, även om ännu bredare variationer fortfarande kan återöppna frågan.
- En ny multi-role stresstest på Echo passerade också under fyrdubbelt tryck i samma prompt: Sigma, Leo, Orbit och Anchor drog samtidigt mot struktur, mänsklig sanning, mottagarlandning och broms mot färsk styrlogik, men Echo kunde ändå läsa `ECHO.md`, svara i två tydliga delar och i uppföljning bli mer operativ utan att börja låsa färska kondenseringar som stående logik.
- Ett cross-turn-handoff under avsändarskiften passerade också: Echo gick från Sigma-boot via Leo-realism till Orbit-omskrivning för ny mottagare utan att börja imitera de andra rollerna eller tappa vad som fortfarande var osäkert, med konkret filläsning via `PROJECT_CORE.md` som grund.
- En Sigma-destinationsslice under blandat Echo-, Orbit- och Anchor-tryck passerade också: Sigma kunde först hålla strikt separation mellan canon, process och meta från `PROJECT_CORE.md`, och sedan skriva om samma läsning så att den landade bättre för en ny person utan att släppa strukturen eller smyga in ny stående logik.
- Ett närliggande brutet kontext-spår om överförenkling föll även efter transportkorrigering utanför projektförankring: i en fresh project-bound chat gav modellen först ett plausibelt svar, men sade sedan uttryckligen att den inte hade öppnat zippen eller läst någon projektfil i just den tråden. Det gör failure-mönstret till verklig source-engagement-brist, inte bara tidigare routebrus.
- En andra kontrollslice med tunn distinktionsfråga höll samma failure mode även i korrekt project-bound chat: modellen gav en till synes projektanpassad distinktion, men svarade sedan rakt ut att ingen projektfil hade lästs innan svaret gavs.
- En minimal återankring till formuleringen `Utifrån projektets material` räckte fortfarande inte för säker källförankring. I samma project-bound chat nämnde modellen `PROJECT_CORE.md` och återgav innehåll som om filen hade lästs, men erkände i två steg att ingen faktisk fil hade lästs och att referensen var en gissning eller minneslik rekonstruktion utifrån annat. Det är starkare evidens än vanlig generisk drift: tunn prompt kan ge falsk källreferens om inte source-engagement verifieras separat.
- I kategori- och sammanblandningsfamiljen kom en mjukare men fortfarande viktig variant: den tunnaste prompten byggde inte på zip-läsning utan på synliga instruktioner i kontexten, och minimal materialreferens gav självbroms snarare än falsk filreferens. Det betyder att thin-prompt-felet är bredare än en enskild promptfamilj, men att failureformen kan skifta mellan generell bootstrap-läsning, självbroms och falsk källförankring.
- Canon-familjen verkar dessutom striktare än blandningsfamiljen på ett viktigt sätt: kravet att nämna exakt en faktiskt läst fil räckte inte ens för att trigga filläsning. Därmed går det ännu inte att behandla "kräv en läst fil" som universell recovery-tröskel; vissa promptfamiljer kräver sannolikt uttryckligare läsinstruktion innan source-engagement överhuvudtaget startar.
- Canon-familjen visar därmed en tydligare recovery-stege än blandningsfamiljen: tunn prompt -> generell eller bootstrap-nära läsning, minimal materialreferens -> fortfarande source-fritt, filkrav -> fortfarande otillräckligt, men explicit instruktion att först läsa en projektfil -> verklig filläsning och stabil uppföljningskontinuitet.
- `Canon/process/meta`-familjen ser just nu ut att dela samma högre recovery-tröskel som canon-familjen: tunn prompt -> instruktionstödd men source-fri läsning, och först explicit `las fil forst`-instruktion -> verklig filläsning och användbar fortsättning. Därmed stärks bilden att vissa strukturella promptfamiljer kräver read-first-trigger snarare än bara named-file-krav.
- `Evidens`-familjen verkar nu ligga i samma kluster som canon och `canon/process/meta`: tunn prompt -> source-fri men plausibel läsning, och först explicit read-first-trigger -> verklig filläsning och stabil fortsättning. Det stärker tolkningen att promptfamiljer som rör normbildning, evidens och styrnivåer har en högre recovery-tröskel än familjer som bara rör blandningsrisk i mer allmän form.

## Minimal Handoff Payload

- Håll state kort, levande och lokalt användbart
- Spara bara det som faktiskt behöver överleva chatbyte
- Skill på hard continuity och soft continuity

Mall:

STATE
Hard:
- [fakta, beslut, constraints som måste bestå]

Soft:
- [ton, momentum, riktning, varför detta känns viktigt nu]

Next:
- [nästa naturliga move]

Avoid:
- [det som riskerar omstartskänsla, feltolkning eller drift]

## Aktuell arbetssekvens

- Observationer från dialog, artefakter och verklighetskontakt
- Strukturering av modellens delar, relationer och återkommande mönster
- Visualisering som testyta, inte som automatisk canon
- Jämförelse mellan språk, bild, Blender och annan externisering
- Kompression till lätt handoff utan att tappa epistemik eller driftkontroll
- Överföring till andra människor och andra chattar för att testa begriplighet

## Aktiv transferartefakt

- Kompakt leveransspine för inferensöverföring ligger i `templates/anchor-inference-transfer-template-v1.md`.
- Den filen ska behandlas som primär template för morgondagens handoff, medan denna fil fortsätter vara process- och lärdomsyta.