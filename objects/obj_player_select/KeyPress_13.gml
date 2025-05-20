switch (x) {
	case 144:
		switch (y) {
			case 128:
				global.player = "blue"
				break
			case 160:
				global.player = "pink"
				break
		}
		break
	case 176:
		switch (y) {
			case 128:
				global.player = "green"
				break
			case 160:
				global.player = "purple"
				break
		}
		break
	case 208:
		switch (y) {
			case 128:
				global.player = "orange"
				break
			case 160:
				global.player = "red"
				break
		}
		break
}

room_goto(rm_01)