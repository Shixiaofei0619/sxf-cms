package com.sxf.cms.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sxf.common.utils.StringUtil;
import com.sxf.cms.dao.LinksMapper;
import com.sxf.cms.domain.Links;
import com.sxf.cms.service.LinksService;
import com.sxf.cms.utils.CMSAjaxException;
import com.sxf.cms.utils.PageUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class LinksServiceImpl implements LinksService {

	@Resource
	private LinksMapper linksMapper;

	@Override
	public boolean insert(Links links) {
		// 调用工具类判断是否是有效URL
		if (!StringUtil.isHttpUrl(links.getUrl()))
			throw new CMSAjaxException(1, "不是有效的url");
		links.setCreated(new Date());
		linksMapper.insert(links);

		return true;

	}

	@Override
	public PageInfo<Links> selects(Integer page, Integer pageSize) {
		PageHelper.startPage(page, pageSize);
		List<Links> list = linksMapper.selects();
		return new PageInfo<Links>(list);
	}

}
