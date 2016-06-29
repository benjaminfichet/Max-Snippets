fn quatAimController self target root = (
	
	r_ctrl = self.rotation.controller
	p_ctrl = self.pos.controller
	
	clsr = classof r_ctrl
	clsp = classof p_ctrl
	
	if clsr == Rotation_List and clsp == Position_List then (
		
		scpt = Rotation_Script()
		r_ctrl.available.controller = scpt
		r_ctrl.available.controller = Euler_XYZ()
		r_ctrl.setActive 4
		
		scpt.addObject "posTargetCtrl" target.pos.controller
		scpt.addObject "nodeParent" target.pos.controller
		
		
		

		script = "this = refs.dependentNodes this firstOnly:true
		thisPosCtrl = this.pos.controller
		thisRotCtrl = this.rotation.controller[1]

		posThis=thisPosCtrl.value*inverse nodeParent.transform

		posTarget=posTargetCtrl.value*inverse nodeParent.transform
		vector=posTarget-posThis
		axis=normalize (cross vector [1,0,0])

		angle=acos (normalize vector).x

		(quat thisRotCtrl[1].value [1,0,0])*(quat angle axis)*nodeParent.transform.rotation
		"
		
		
		
		scpt.script = script
	)
)

quatAimController selection[1] selection[2] selection[3]