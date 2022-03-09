CREATE TABLE IF NOT EXISTS network (
    uuid uuid,
    variantNum int,
    id text,
    fictitious boolean,
    properties text,
    aliasesWithoutType text,
    aliasByType text,
    idByAlias text,
    caseDate timestamp,
    forecastDistance int,
    sourceFormat text,
    connectedComponentsValid boolean,
    synchronousComponentsValid boolean,
    cgmesSvMetadata text,
    cgmesSshMetadata text,
    cimCharacteristics text,
    cgmesControlAreas text,
    cgmesIidmMapping text,
    variantId text,
    PRIMARY KEY (uuid, variantNum)
);

CREATE TABLE IF NOT EXISTS substation (
    networkUuid uuid,
    variantNum int,
    id text,
    name text,
    fictitious boolean,
    properties text,
    aliasesWithoutType text,
    aliasByType text,
    country text,
    tso text,
    entsoeArea text,
    geographicalTags text,
    PRIMARY KEY (networkUuid, variantNum, id)
);

CREATE TABLE IF NOT EXISTS voltageLevel (
    networkUuid uuid,
    variantNum int,
    id text,
    substationId text,
    name text,
    fictitious boolean,
    properties text,
    aliasesWithoutType text,
    aliasByType text,
    nominalV double precision,
    lowVoltageLimit double precision,
    highVoltageLimit double precision,
    topologyKind text,
    internalConnections text,
    calculatedBusesForBusView text,
    nodeToCalculatedBusForBusView text,
    busToCalculatedBusForBusView text,
    calculatedBusesForBusBreakerView text,
    nodeToCalculatedBusForBusBreakerView text,
    busToCalculatedBusForBusBreakerView text,
    calculatedBusesValid boolean,
    slackTerminal text,
    PRIMARY KEY (networkUuid, variantNum, id, substationId)
);
create index on voltageLevel (networkUuid, variantNum, substationId);

CREATE TABLE IF NOT EXISTS generator (
    networkUuid uuid,
    variantNum int,
    id text,
    voltageLevelId text,
    name text,
    fictitious boolean,
    properties text,
    aliasesWithoutType text,
    aliasByType text,
    node int,
    energySource text,
    minP double precision,
    maxP double precision,
    voltageRegulatorOn boolean,
    targetP double precision,
    targetQ double precision,
    targetV double precision,
    ratedS double precision,
    p double precision,
    q double precision,
    position text,
    minMaxReactiveLimits text,
    reactiveCapabilityCurve text,
    bus text,
    connectableBus text,
    activePowerControl text,
    regulatingTerminal text,
    coordinatedReactiveControl text,
    remoteReactivePowerControl text,
    PRIMARY KEY (networkUuid, variantNum, id, voltageLevelId)
);
create index on generator (networkUuid, variantNum, voltageLevelId);

CREATE TABLE IF NOT EXISTS battery (
    networkUuid uuid,
    variantNum int,
    id text,
    voltageLevelId text,
    name text,
    fictitious boolean,
    properties text,
    aliasesWithoutType text,
    aliasByType text,
    node int,
    minP double precision,
    maxP double precision,
    p0 double precision,
    q0 double precision,
    p double precision,
    q double precision,
    position text,
    minMaxReactiveLimits text,
    reactiveCapabilityCurve text,
    bus text,
    connectableBus text,
    activePowerControl text,
    PRIMARY KEY (networkUuid, variantNum, id, voltageLevelId)
);
create index on battery (networkUuid, variantNum, voltageLevelId);

CREATE TABLE IF NOT EXISTS load (
    networkUuid uuid,
    variantNum int,
    id text,
    voltageLevelId text,
    name text,
    fictitious boolean,
    properties text,
    aliasesWithoutType text,
    aliasByType text,
    node int,
    loadType text,
    p0 double precision,
    q0 double precision,
    p double precision,
    q double precision,
    position text,
    bus text,
    connectableBus text,
    loadDetail text,
    PRIMARY KEY (networkUuid, variantNum, id, voltageLevelId)
);
create index on load (networkUuid, variantNum, voltageLevelId);

CREATE TABLE IF NOT EXISTS shuntCompensator (
    networkUuid uuid,
    variantNum int,
    id text,
    voltageLevelId text,
    name text,
    fictitious boolean,
    properties text,
    aliasesWithoutType text,
    aliasByType text,
    node int,
    linearModel text,
    nonLinearModel text,
    sectionCount int,
    p double precision,
    q double precision,
    position text,
    bus text,
    connectableBus text,
    regulatingTerminal text,
    voltageRegulatorOn boolean,
    targetV double precision,
    targetDeadband double precision,
    PRIMARY KEY (networkUuid, variantNum, id, voltageLevelId)
);
create index on shuntCompensator (networkUuid, variantNum, voltageLevelId);

CREATE TABLE IF NOT EXISTS vscConverterStation (
    networkUuid uuid,
    variantNum int,
    id text,
    voltageLevelId text,
    name text,
    fictitious boolean,
    properties text,
    aliasesWithoutType text,
    aliasByType text,
    node int,
    lossFactor float,
    voltageRegulatorOn boolean,
    reactivePowerSetPoint double precision,
    voltageSetPoint double precision,
    minMaxReactiveLimits text,
    reactiveCapabilityCurve text,
    p double precision,
    q double precision,
    position text,
    bus text,
    connectableBus text,
    PRIMARY KEY (networkUuid, variantNum, id, voltageLevelId)
);
create index on vscConverterStation (networkUuid, variantNum, voltageLevelId);

CREATE TABLE IF NOT EXISTS lccConverterStation (
    networkUuid uuid,
    variantNum int,
    id text,
    voltageLevelId text,
    name text,
    fictitious boolean,
    properties text,
    aliasesWithoutType text,
    aliasByType text,
    node int,
    powerFactor float,
    lossFactor float,
    p double precision,
    q double precision,
    position text,
    bus text,
    connectableBus text,
    PRIMARY KEY (networkUuid, variantNum, id, voltageLevelId)
);
create index on lccConverterStation (networkUuid, variantNum, voltageLevelId);

CREATE TABLE IF NOT EXISTS staticVarCompensator (
    networkUuid uuid,
    variantNum int,
    id text,
    voltageLevelId text,
    name text,
    fictitious boolean,
    properties text,
    aliasesWithoutType text,
    aliasByType text,
    node int,
    bMin double precision,
    bMax double precision,
    voltageSetPoint double precision,
    reactivePowerSetPoint double precision,
    regulationMode text,
    p double precision,
    q double precision,
    position text,
    bus text,
    connectableBus text,
    regulatingTerminal text,
    voltagePerReactivePowerControl text,
    PRIMARY KEY (networkUuid, variantNum, id, voltageLevelId)
);
create index on staticVarCompensator (networkUuid, variantNum, voltageLevelId);

CREATE TABLE IF NOT EXISTS busbarSection (
    networkUuid uuid,
    variantNum int,
    id text,
    voltageLevelId text,
    name text,
    fictitious boolean,
    properties text,
    aliasesWithoutType text,
    aliasByType text,
    node int,
    position text,
    PRIMARY KEY (networkUuid, variantNum, id, voltageLevelId)
);
create index on busbarSection (networkUuid, variantNum, voltageLevelId);

CREATE TABLE IF NOT EXISTS switch (
    networkUuid uuid,
    variantNum int,
    id text,
    voltageLevelId text,
    name text,
    properties text,
    aliasesWithoutType text,
    aliasByType text,
    kind text,
    node1 int,
    node2 int,
    open boolean,
    retained boolean,
    fictitious boolean,
    bus1 text,
    bus2 text,
    PRIMARY KEY (networkUuid, variantNum, id, voltageLevelId)
);
create index on switch (networkUuid, variantNum, voltageLevelId);

CREATE TABLE IF NOT EXISTS twoWindingsTransformer (
    networkUuid uuid,
    variantNum int,
    id text,
    voltageLevelId1 text,
    voltageLevelId2 text,
    name text,
    fictitious boolean,
    properties text,
    aliasesWithoutType text,
    aliasByType text,
    node1 int,
    node2 int,
    r double precision,
    x double precision,
    g double precision,
    b double precision,
    ratedU1 double precision,
    ratedU2 double precision,
    ratedS double precision,
    p1 double precision,
    q1 double precision,
    p2 double precision,
    q2 double precision,
    position1 text,
    position2 text,
    phaseTapChanger text,
    ratioTapChanger text,
    bus1 text,
    bus2 text,
    connectableBus1 text,
    connectableBus2 text,
    currentLimits1 text,
    currentLimits2 text,
    activePowerLimits1 text,
    activePowerLimits2 text,
    apparentPowerLimits1 text,
    apparentPowerLimits2 text,
    phaseAngleClock text,
    branchStatus text,
    cgmesTapChangers text,
    PRIMARY KEY (networkUuid, variantNum, id)
);
create index on twoWindingsTransformer (networkUuid, variantNum, voltageLevelId1);
create index on twoWindingsTransformer (networkUuid, variantNum, voltageLevelId2);


CREATE TABLE IF NOT EXISTS threeWindingsTransformer (
    networkUuid uuid,
    variantNum int,
    id text,
    voltageLevelId1 text,
    voltageLevelId2 text,
    voltageLevelId3 text,
    node1 int,
    node2 int,
    node3 int,
    name text,
    fictitious boolean,
    properties text,
    aliasesWithoutType text,
    aliasByType text,
    ratedU0 double precision,
    p1 double precision,
    q1 double precision,
    r1 double precision,
    x1 double precision,
    g1 double precision,
    b1 double precision,
    ratedU1 double precision,
    ratedS1 double precision,
    phaseTapChanger1 text,
    ratioTapChanger1 text,
    p2 double precision,
    q2 double precision,
    r2 double precision,
    x2 double precision,
    g2 double precision,
    b2 double precision,
    ratedU2 double precision,
    ratedS2 double precision,
    phaseTapChanger2 text,
    ratioTapChanger2 text,
    p3 double precision,
    q3 double precision,
    r3 double precision,
    x3 double precision,
    g3 double precision,
    b3 double precision,
    ratedU3 double precision,
    ratedS3 double precision,
    phaseTapChanger3 text,
    ratioTapChanger3 text,
    position1 text,
    position2 text,
    position3 text,
    currentLimits1 text,
    currentLimits2 text,
    currentLimits3 text,
    activePowerLimits1 text,
    activePowerLimits2 text,
    activePowerLimits3 text,
    apparentPowerLimits1 text,
    apparentPowerLimits2 text,
    apparentPowerLimits3 text,
    bus1 text,
    connectableBus1 text,
    bus2 text,
    connectableBus2 text,
    bus3 text,
    connectableBus3 text,
    phaseAngleClock text,
    branchStatus text,
    cgmesTapChangers text,
    PRIMARY KEY (networkUuid, variantNum, id)
);
create index on threeWindingsTransformer (networkUuid, variantNum, voltageLevelId1);
create index on threeWindingsTransformer (networkUuid, variantNum, voltageLevelId2);
create index on threeWindingsTransformer (networkUuid, variantNum, voltageLevelId3);


CREATE TABLE IF NOT EXISTS line (
    networkUuid uuid,
    variantNum int,
    id text,
    voltageLevelId1 text,
    voltageLevelId2 text,
    name text,
    fictitious boolean,
    properties text,
    aliasesWithoutType text,
    aliasByType text,
    node1 int,
    node2 int,
    r double precision,
    x double precision,
    g1 double precision,
    b1 double precision,
    g2 double precision,
    b2 double precision,
    p1 double precision,
    q1 double precision,
    p2 double precision,
    q2 double precision,
    position1 text,
    position2 text,
    bus1 text,
    bus2 text,
    connectableBus1 text,
    connectableBus2 text,
    mergedXnode text,
    currentLimits1 text,
    currentLimits2 text,
    activePowerLimits1 text,
    activePowerLimits2 text,
    apparentPowerLimits1 text,
    apparentPowerLimits2 text,
    branchStatus text,
    PRIMARY KEY (networkUuid, variantNum, id)
);
create index on line (networkUuid, variantNum, voltageLevelId1);
create index on line (networkUuid, variantNum, voltageLevelId2);

CREATE TABLE IF NOT EXISTS hvdcLine (
    networkUuid uuid,
    variantNum int,
    id text,
    name text,
    fictitious boolean,
    properties text,
    aliasesWithoutType text,
    aliasByType text,
    r double precision,
    convertersMode text,
    nominalV double precision,
    activePowerSetpoint double precision,
    maxP double precision,
    converterStationId1 text,
    converterStationId2 text,
    hvdcAngleDroopActivePowerControl text,
    hvdcOperatorActivePowerRange text,
    PRIMARY KEY (networkUuid, variantNum, id)
);

CREATE TABLE IF NOT EXISTS danglingLine (
    networkUuid uuid,
    variantNum int,
    id text,
    voltageLevelId text,
    name text,
    fictitious boolean,
    properties text,
    aliasesWithoutType text,
    aliasByType text,
    node int,
    p0 double precision,
    q0 double precision,
    r double precision,
    x double precision,
    g double precision,
    b double precision,
    generation text,
    ucteXNodeCode text,
    currentLimits text,
    activePowerLimits text,
    apparentPowerLimits text,
    p double precision,
    q double precision,
    position text,
    bus text,
    connectableBus text,
    PRIMARY KEY (networkUuid, variantNum, id, voltageLevelId)
);
create index on danglingLine (networkUuid, variantNum, voltageLevelId);

CREATE TABLE IF NOT EXISTS configuredBus (
    networkUuid uuid,
    variantNum int,
    id text,
    voltageLevelId text,
    name text,
    fictitious boolean,
    properties text,
    aliasesWithoutType text,
    aliasByType text,
    v double precision,
    angle double precision,
    PRIMARY KEY (networkUuid, variantNum, id, voltageLevelId)
);
create index on configuredBus (networkUuid, variantNum, voltageLevelId);


