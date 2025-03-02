class Solution:
    def mergeArrays(self, nums1: List[List[int]], nums2: List[List[int]]) -> List[List[int]]:
        local_dict = dict()
        local_array = []

        for val in nums1:
            if val[0] not in local_dict:
                local_dict[val[0]] = val[1]
            elif val[0] in local_dict:
                local_dict[val[0]] += val[1]

        for val in nums2:
            if val[0] not in local_dict:
                local_dict[val[0]] = val[1]
            elif val[0] in local_dict:
                local_dict[val[0]] += val[1]

        for key in local_dict:
            local_array.append([key, local_dict[key]])

        local_array.sort()
        return local_array
