package com.sxf.cms.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sxf.cms.dao.ArticleMapper;
import com.sxf.cms.domain.Article;
import com.sxf.cms.domain.ArticleWithBLOBs;
import com.sxf.cms.service.ArticleService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class ArticleServiceImpl implements ArticleService {
	@Resource
	
	private ArticleMapper articleMapper;

	public PageInfo<Article> selects(Article article, Integer page, Integer pageSize) {
		PageHelper.startPage(page, pageSize);
		List<Article> articles = articleMapper.selects(article);
		
		return new PageInfo<Article>(articles);
	}

	public boolean update(ArticleWithBLOBs article) {
		try {
			
			return articleMapper.updateByPrimaryKeySelective(article)>0;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("修改失败");
		}
	}

	public ArticleWithBLOBs selectByPrimaryKey(Integer id) {
		articleMapper.updateHits(id);
		return articleMapper.selectByPrimaryKey(id);
	}

	public boolean insertSelective(ArticleWithBLOBs record) {
		try {
			
			return articleMapper.insertSelective(record)>0;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("发布失败");
		}
	}


}
