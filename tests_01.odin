package test

import "core:fmt"
print :: fmt.println

main :: proc() {
	nums_01 := [][]int{{1, 2}, {2, 3}, {4, 5}}
	nums_02 := [][]int{{1, 4}, {3, 2}, {4, 1}}
	print(mergeArrays(nums_01, nums_02))

	nums_03 := [][]int{{2, 4}, {3, 6}, {5, 5}}
	nums_04 := [][]int{{1, 3}, {4, 3}}
	print(mergeArrays(nums_03, nums_04))

	free_all(context.temp_allocator)
}

// Leetcode 2570. Merge Two 2D Arrays by Summing Values
mergeArrays :: proc(nums1 : [][]int, nums2 : [][]int) -> [dynamic][2]int {
	local_dict := make(map[int]int, context.temp_allocator)
	local_array := make([dynamic][2]int, context.temp_allocator)
	key, value := 0, 0

	for val in nums1 {
		if val[0] not_in local_dict {
			local_dict[val[0]] = val[1]
		} else if val[0] in local_dict {
			local_dict[val[0]] += val[1]
		}
	}

	for val in nums2 {
		if val[0] not_in local_dict {
			local_dict[val[0]] = val[1]
		} else if val[0] in local_dict {
			local_dict[val[0]] += val[1]
		}
	}

	len_local_dict := len(local_dict)
	for _ in 0 ..< len_local_dict {
		key, value := dict_find_lowest_key_and_return_key_value_pair(local_dict)
		append(&local_array, [2]int{key, value})
		delete_key(&local_dict, key)
	}

	return local_array
}


dict_find_lowest_key_and_return_key_value_pair :: proc(local_dict : map[int]int) -> (int, int) {
	min_key := INT_MAX

	for key, _ in local_dict {
		if key < min_key {
			min_key = key
		}
	}
	return min_key, local_dict[min_key]
}