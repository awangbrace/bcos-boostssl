/*
 *  Copyright (C) 2021 FISCO BCOS.
 *  SPDX-License-Identifier: Apache-2.0
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 *
 * @file WsFactory.h
 * @author: octopus
 * @date 2021-09-29
 */
#pragma once

#include <bcos-boostssl/websocket/WsConfig.h>
#include <bcos-boostssl/websocket/WsService.h>

namespace bcos
{
namespace boostssl
{
namespace ws
{
class WsFactory
{
public:
    using Ptr = std::shared_ptr<WsFactory>;
    using ConstPtr = std::shared_ptr<const WsFactory>;

public:
    std::shared_ptr<bcos::boostssl::ws::WsService> buildWsService();

public:
    std::shared_ptr<bcos::boostssl::ws::WsConfig> config() const { return m_config; }
    void setConfig(std::shared_ptr<bcos::boostssl::ws::WsConfig> _config) { m_config = _config; }

private:
    std::shared_ptr<bcos::boostssl::ws::WsConfig> m_config;
};
}  // namespace ws
}  // namespace boostssl
}  // namespace bcos