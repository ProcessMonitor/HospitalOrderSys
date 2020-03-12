package cn.sfturing.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.sfturing.dao.FavouriteDao;
import cn.sfturing.entity.CommonCondition;
import cn.sfturing.entity.CommonUser;
import cn.sfturing.entity.Hospital;
import cn.sfturing.entity.Office;
import cn.sfturing.service.HospitalService;
import cn.sfturing.service.OfficeService;
import cn.sfturing.utils.PageUtils;

/**
 * 
 * @author sfturing
 * 
 * @date 2017年5月19日
 */
@Controller
public class HospitalController {

	@Autowired
	private HospitalService hospitalService;
	@Autowired
	private OfficeService officeService;
	@Autowired
	private PageUtils pageUtils;
	@Autowired
	private FavouriteDao favouriteDao;

	/**
	 * 医院主界面(推荐医院)
	 * 
	 * @return
	 */
	@RequestMapping(value = "/hosIndex")
	public String hosIdex(Model model,HttpSession session) {
		List<Hospital> hospitalRe = hospitalService.findHosByRe();
		
		model.addAttribute("hospital", hospitalRe);
		return "hospital/hosIndex";
	}

	/**
	 * 医院详情
	 * 
	 * @return
	 */
	@RequestMapping(value = "/hosInfoShow/{id}", method = RequestMethod.GET)
	public String hosInfoShow(Model model, @PathVariable(value = "id") int id,HttpSession session) {
		if(session.getAttribute("userInfo") != null){
			//如果用户登录
			CommonUser commonUser = (CommonUser) session.getAttribute("userInfo");
			int isLike = 0;
			if(favouriteDao.findFavByuserIdAndHosId(commonUser.getUserId(), id) !=null){
				isLike =  favouriteDao.findFavByuserIdAndHosId(commonUser.getUserId(), id).getIsLike();
			}
			model.addAttribute("isLike", isLike);
		}
		// 通过传入的id返回医院的详细信息
		Hospital hospital = hospitalService.findHosById(id);
		// 通过医院的名称返回医院科室信息
		List<Office> office = officeService.findOfficeByHosName(hospital.getHospitalName());
		// 预留通知查询
		
		model.addAttribute("hos", hospital);
		model.addAttribute("office", office);
		return "hospital/hosInfoShow";
	}

	/**
	 * 全部支持预约的医院
	 * 
	 * @return
	 */
	@RequestMapping(value = "/orderHos/{page}")
	public String orderHos(Model model, @PathVariable("page") int page, @ModelAttribute("province") String province,
			@ModelAttribute("city") String city, @ModelAttribute("district") String district, Hospital hosp) {

		// 将输入条件传回前台
		CommonCondition commonCondition = new CommonCondition();
		commonCondition.setProvince(province);
		commonCondition.setCity(city);
		commonCondition.setDistrict(district);
		commonCondition.setHospitalName(hosp.getHospitalName());
		commonCondition.setHospitalGrade(hosp.getHospitalGrade());
		commonCondition.setHospitalNature(hosp.getHospitalNature());

		// 设置页面
		pageUtils.setCurrentPage(page);
		pageUtils.setTotalRecord(hospitalService.findOrderHosNum(province, city, district, hosp));
		int start;
		if (pageUtils.getCurrentPage() == 0) {
			start = 0;
		} else {
			start = pageUtils.getPageRecord() * (pageUtils.getCurrentPage() - 1);
		}
		// 查询医院数据
		List<Hospital> hospital = hospitalService.findHosByConditon(province, city, district, hosp, start,
				pageUtils.getPageRecord());
		// 查询医院等级
		List<String> hospGrade = hospitalService.findHosOpenGrade();
		// 查询医院类型
		List<String> hospNature = hospitalService.findHosOpenNature();

		model.addAttribute("hospital", hospital);
		model.addAttribute("pages", pageUtils);
		model.addAttribute("hospGrade", hospGrade);
		model.addAttribute("hospNature", hospNature);
		// 查询条件
		model.addAttribute("commonCondition", commonCondition);
		return "hospital/orderHos";
	}
	

	/**
	 * 全部的医院
	 * 
	 * @return
	 */
	@RequestMapping(value = "/allHos/{page}")
	public String allHos(Model model, @PathVariable("page") int page, @ModelAttribute("province") String province,
			@ModelAttribute("city") String city, @ModelAttribute("district") String district, Hospital hosp) {

		// 将输入条件传回前台
		CommonCondition commonCondition = new CommonCondition();
		commonCondition.setProvince(province);
		commonCondition.setCity(city);
		commonCondition.setDistrict(district);
		commonCondition.setHospitalName(hosp.getHospitalName());
		commonCondition.setHospitalGrade(hosp.getHospitalGrade());
		commonCondition.setHospitalNature(hosp.getHospitalNature());

		// 设置页面
		pageUtils.setCurrentPage(page);
		pageUtils.setTotalRecord(hospitalService.findAllHosNum(province, city, district, hosp));
		int start;
		if (pageUtils.getCurrentPage() == 0) {
			start = 0;
		} else {
			start = pageUtils.getPageRecord() * (pageUtils.getCurrentPage() - 1);
		}
		// 查询医院数据
		List<Hospital> hospital = hospitalService.findAllHosByConditon(province, city, district, hosp, start,
				pageUtils.getPageRecord());
		// 查询医院等级
		List<String> hospGrade = hospitalService.findHosGrade();
		// 查询医院类型
		List<String> hospNature = hospitalService.findHosNature();

		model.addAttribute("hospital", hospital);
		model.addAttribute("pages", pageUtils);
		model.addAttribute("hospGrade", hospGrade);
		model.addAttribute("hospNature", hospNature);
		// 查询条件
		model.addAttribute("commonCondition", commonCondition);
		return "hospital/allHospital";
	}
	
	//关注医院
	@ResponseBody
	@RequestMapping(value = "/favourite", method = RequestMethod.POST)
	public Map<String, Object> favourite(Model model,int hospitalId,HttpSession session ) {
		//通过session信息得到userid
		CommonUser commonUser = (CommonUser) session.getAttribute("userInfo");
		int userId = commonUser.getUserId();
		int isLike =hospitalService.favourite(userId, hospitalId);
		System.out.println(isLike+"*******************************88");
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		rtnMap.put("isLike", isLike);
		return rtnMap;
	}
	
}
