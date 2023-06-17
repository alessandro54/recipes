import Controller from '@/support/controller';

export default class extends Controller {
  static targets = ['input', 'recipe'];
  declare readonly recipeTargets: HTMLAnchorElement[];

  static values = { count: Number };
  declare readonly countValue: number;

  public change (e: KeyboardEvent): void {
    const element = e.currentTarget as HTMLInputElement;
    const inputValue = element.value;
    const regex : RegExp = /[^A-Za-z.!\s]/g;

    // Remove characters that are not letters, dots, or exclamation marks
    const modifiedValue = inputValue.replace(regex, '');

    // Update the input value with the modified value
    element.value = modifiedValue;

    // Instead of match use regex.test which returns a boolean if a match exists
    if (regex.test(modifiedValue)) {
      this.filterRecipes(modifiedValue);
    }
  }

  private filterRecipes (query: string) {
    let filteredCount = 0;

    for(const recipe of this.recipeTargets) {
      if (recipe.dataset.title!.toLowerCase().includes(query.toLowerCase())){
        this.show(recipe, 'flex');
        filteredCount += 1;
      } else {
        this.hide(recipe, 'flex')
      }
    }
    if (filteredCount === 0) {
      console.log('No recipes found')
    }
  }
}
