package com.ruoyi.data.mapper;

import java.util.List;
import com.ruoyi.data.domain.AccountTitle;

/**
 * 会计科目Mapper接口
 *
 * @author ruoyi
 * @date 2023-11-13
 */
public interface AccountTitleMapper
{
    /**
     * 查询会计科目
     *
     * @param id 会计科目主键
     * @return 会计科目
     */
    public AccountTitle selectAccountTitleById(Long id);

    /**
     * 查询会计科目列表
     *
     * @param accountTitle 会计科目
     * @return 会计科目集合
     */
    public List<AccountTitle> selectAccountTitleList(AccountTitle accountTitle);

    /**
     * 新增会计科目
     *
     * @param accountTitle 会计科目
     * @return 结果
     */
    public int insertAccountTitle(AccountTitle accountTitle);

    /**
     * 修改会计科目
     *
     * @param accountTitle 会计科目
     * @return 结果
     */
    public int updateAccountTitle(AccountTitle accountTitle);

    /**
     * 删除会计科目
     *
     * @param id 会计科目主键
     * @return 结果
     */
    public int deleteAccountTitleById(Long id);

    /**
     * 批量删除会计科目
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteAccountTitleByIds(Long[] ids);
}
