class ChangeServicesState < ActiveRecord::Migration[5.1]
  def	change
    reversible	do	|dir|
      change_table	:services	do	|t|
        dir.up			{	t.change	:state,	:string	}
        dir.down	{	t.change	:state,	:integer	}
      end
    end
  end
end
