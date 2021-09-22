/**
 * Copyright (c) 2020, RTE (http://www.rte-france.com)
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */
package com.powsybl.network.store.model;

import com.powsybl.iidm.network.ReactiveLimitsKind;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Nicolas Noir <nicolas.noir at rte-france.com>
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Schema(description = "Min max reactive limits attributes")
public class MinMaxReactiveLimitsAttributes implements ReactiveLimitsAttributes {

    @Schema(description = "Kind of reactive limit")
    private final ReactiveLimitsKind kind = ReactiveLimitsKind.MIN_MAX;

    @Schema(description = "Reactive power minimum value")
    private double minQ;

    @Schema(description = "Reactive power maximum value")
    private double maxQ;

}
