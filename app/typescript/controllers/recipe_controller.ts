import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['input', 'recipe'];

  declare readonly inputTargets: HTMLInputElement[];
  declare readonly recipeTargets: HTMLAnchorElement[];

  readonly regex: RegExp = /[^A-Za-z.!\s]/g;

  public change(e: KeyboardEvent): void {
    const element = e.currentTarget as HTMLInputElement;
    const inputValue = element.value;

    // Remove characters that are not letters, dots, or exclamation marks
    const modifiedValue = inputValue.replace(this.regex, '');

    // Update the input value with the modified value
    element.value = modifiedValue;

    // Update other input targets with the modified value
    this.inputTargets.forEach((input) => (input.value = modifiedValue));

    // Instead of match use regex.test which returns a boolean if a match exists
    if (!this.regex.test(modifiedValue)) {
        this.filterRecipes(modifiedValue);
    }
}

  private filterRecipes(query: string) {
    console.log('firing');
    this.recipeTargets.forEach((recipe) => {
      const { title } = recipe.dataset;

      if (title?.toLowerCase().includes(query.toLowerCase()))
        recipe.classList.replace('hidden', 'flex');
      else recipe.classList.replace('flex', 'hidden');
    });
  }
}
