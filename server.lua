Groups = {
    --[[
    [groupId] = {
        invitationCode = "ABC"
        members[memberId] = {
            {role = "Owner"}
        }
    }
    ]]--
}

GroupId = 0

local function getGroups()
    return Groups
end

local function createGroup()
    GroupId = GroupId + 1
    local groupId = tostring(GroupId)

    Groups[groupId] = {
        members = {}
    }

    return groupId
end

local function removeGroup(groupId)
    if Groups[groupId] then
        Groups[groupId] = nil
        return true
    end

    return false
end

local function getGroup(groupId)
    if Groups[groupId] then
        return true, Groups[groupId]
    end

    return false
end

local function setGroupState(group, key, value)
    local group = Groups[groupId]
    if (group) then
        group[key] = value
        return true
    end

    return false
end

local function getGroupState(group, key)
    local group = Groups[groupId]
    if (group) then
        return true, group[key]
    end

    return false
end

local function addMemberToGroup(groupId, memberId)
    local group = Groups[groupId]
    if (group) then
        group.members[tostring(memberId)] = {}
        return true
    end

    return false
end

local function removeMemberFromGroup(group, memberId)
    local group = Groups[groupId]
    if (group) then
        group.members[tostring(memberId)] = nil
        return true
    end

    return false
end

local function getMemberFromGroup(group, memberId)
    local group = Groups[groupId]
    if (group) then
        return true, group.members[tostring(memberId)]
    end

    return false
end

local function getMemberState(group, memberId, key)
    local group = Groups[groupId]
    if (group) then
        local member = group.members[tostring(memberId)]
        if (member) then
            return true, member[key]
        end
    end

    return false
end

local function setMemberState(group, memberId, key, value)
    local group = Groups[groupId]
    if (group) then
        local member = group.members[tostring(memberId)]
        if (member) then
            member[key] = value
            return true
        end
    end

    return false
end

local function getGroupsFromMember(memberId)
    local groups = {}
    
    for groupId, group in pairs(Groups) do
        if (group.members[tostring(memberId)]) then
            table.insert(groups, groupId)
        end
    end

    return groups
end

exports("getGroups", getGroups)
exports("getGroup", getGroup)
exports("createGroup", createGroup)
exports("removeGroup", removeGroup)
exports("getGroupState", getGroupState)
exports("setGroupState", setGroupState)
exports("getMemberFromGroup", getMemberFromGroup)
exports("addMemberToGroup", addMemberToGroup)
exports("removeMemberFromGroup", removeMemberFromGroup)
exports("getMemberState", getMemberState)
exports("setMemberState", setMemberState)

exports("getGroupsFromMember", getGroupsFromMember)